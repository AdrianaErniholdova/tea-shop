package main

import (
	"database/sql"
	"encoding/json"
	"log"
	"net/http"
	"time"
)

func ProductsHandler(db *sql.DB) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		enableCORS(w, r)
		if r.Method == http.MethodOptions {
			return
		}
		if r.Method != http.MethodGet {
			http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
			return
		}

		rows, err := db.Query(`
			SELECT ts.id, ts.name, ts.slug, ts.subtitle, ts.price, ts.image_url, ts.stock, ts.description, ts.caffeine_level, t.name, t.slug, o.name, o.slug
			FROM teas ts
			JOIN types t ON ts.type_id = t.id
			JOIN origins o ON ts.origin_id = o.id
		`)
		if err != nil {
			log.Println("DB query failed:", err)
			http.Error(w, "DB error", http.StatusInternalServerError)
			return
		}
		defer rows.Close()

		var products []Product
		for rows.Next() {
			var p Product
			if err := rows.Scan(
				&p.ID,
				&p.Name,
				&p.Slug,
				&p.Subtitle,
				&p.Price,
				&p.Image,
				&p.Stock,
				&p.Description,
				&p.CaffeineLevel,
				&p.TypeName,
				&p.TypeSlug,
				&p.OriginName,
				&p.OriginSlug,
			); err != nil {
				http.Error(w, "Scan error", http.StatusInternalServerError)
				return
			}
			products = append(products, p)
		}

		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(products)
	}
}

func OrdersHandler(db *sql.DB) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		enableCORS(w, r)
		if r.Method == http.MethodOptions {
			return
		}
		if r.Method != http.MethodPost {
			http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
			return
		}

		var payload OrderReq
		if err := json.NewDecoder(r.Body).Decode(&payload); err != nil {
			http.Error(w, "Invalid payload", http.StatusBadRequest)
			return
		}

		tx, err := db.Begin()
		if err != nil {
			log.Println("Failed to begin transaction:", err)
			http.Error(w, "DB error", http.StatusInternalServerError)
			return
		}

		var orderID int
		err = tx.QueryRow(`
            INSERT INTO orders (customer_name, customer_email, total, created_at)
            VALUES ($1, $2, $3, $4) RETURNING id
        `, payload.CustomerName, payload.CustomerEmail, payload.Total, time.Now()).Scan(&orderID)
		if err != nil {
			tx.Rollback()
			log.Println("Failed to insert order:", err)
			http.Error(w, "DB error", http.StatusInternalServerError)
			return
		}

		for _, item := range payload.Items {
			_, err := tx.Exec(`
                INSERT INTO order_items (order_id, tea_id, quantity, price)
                VALUES ($1, $2, $3, $4)
            `, orderID, item.TeaID, item.Quantity, item.Price)
			if err != nil {
				tx.Rollback()
				log.Println("Failed to insert order item:", err)
				http.Error(w, "DB error", http.StatusInternalServerError)
				return
			}
		}

		if err := tx.Commit(); err != nil {
			log.Println("Failed to commit transaction:", err)
			http.Error(w, "DB error", http.StatusInternalServerError)
			return
		}

		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(map[string]interface{}{
			"success": true,
			"orderId": orderID,
		})
	}
}

package main

import (
	"database/sql"
	"encoding/json"
	"log"
	"net/http"
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
			SELECT id, name, slug, price, image_url, stock
			FROM teas
			ORDER BY name
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
				&p.Price,
				&p.Image,
				&p.Stock,
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

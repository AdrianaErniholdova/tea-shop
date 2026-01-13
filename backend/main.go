package main

import (
	"log"
	"net/http"
)

func main() {
	db := InitDB()
	defer db.Close()

	http.HandleFunc("/api/products", ProductsHandler(db))

	log.Println("Server runs on http://localhost:5000")
	http.ListenAndServe(":5000", nil)
}

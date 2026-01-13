package main

type Product struct {
	ID    int     `json:"id"`
	Name  string  `json:"name"`
	Slug  string  `json:"slug"`
	Price float64 `json:"price"`
	Image string  `json:"image_url"`
	Stock int     `json:"stock"`
}

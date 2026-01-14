package main

type Product struct {
	ID          int     `json:"id"`
	Name        string  `json:"name"`
	Slug        string  `json:"slug"`
	Subtitle    string  `json:"subtitle"`
	Price       float64 `json:"price"`
	Image       string  `json:"image_url"`
	Stock       int     `json:"stock"`
	Description string  `json:"description"`
}

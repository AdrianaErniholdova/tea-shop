package main

type Product struct {
	ID            int     `json:"id"`
	Name          string  `json:"name"`
	Slug          string  `json:"slug"`
	Subtitle      string  `json:"subtitle"`
	Price         float64 `json:"price"`
	Image         string  `json:"image_url"`
	Stock         int     `json:"stock"`
	Description   string  `json:"description"`
	CaffeineLevel string  `json:"caffeineLevel"`
	TypeName      string  `json:"typeName"`
	TypeSlug      string  `json:"typeSlug"`
	OriginName    string  `json:"originName"`
	OriginSlug    string  `json:"originSlug"`
}

type OrderItem struct {
	TeaID    int     `json:"teaId"`
	Quantity int     `json:"quantity"`
	Price    float64 `json:"price"`
}

type OrderReq struct {
	CustomerName  string      `json:"customerName"`
	CustomerEmail string      `json:"customerEmail"`
	Items         []OrderItem `json:"items"`
	Total         float64     `json:"total"`
}

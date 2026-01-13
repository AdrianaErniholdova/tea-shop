CREATE TABLE public.teas
(
    id serial NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    subtitle text NOT NULL,
    price numeric(10, 2) NOT NULL,
    image_url text NOT NULL,
    stock integer NOT NULL,
    caffeine_level TEXT NOT NULL
    CHECK (caffeine_level IN ('none', 'low', 'medium', 'high')),

    type_id integer NOT NULL,
    origin_id integer NOT NULL,

    description text NOT NULL,

    CONSTRAINT fk_teas_type
          FOREIGN KEY (type_id)
          REFERENCES types(id),
    CONSTRAINT fk_teas_origin
          FOREIGN KEY (origin_id)
          REFERENCES origins(id),

    PRIMARY KEY (id)
);

CREATE TABLE public.origins
(
    id serial NOT NULL,
    name text NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.types
(
    id serial NOT NULL,
    name text NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.orders
(
    id serial NOT NULL,
    customer_name text NOT NULL,
    customer_email text NOT NULL,
    total numeric(10, 2) NOT NULL,
	  created_at timestamp DEFAULT now(),
    PRIMARY KEY (id)
);

CREATE TABLE public.order_items
(
    id serial NOT NULL,
    order_id integer NOT NULL,
    tea_id integer NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,

    CONSTRAINT fk_order_items_order
          FOREIGN KEY (order_id)
          REFERENCES orders(id),
    CONSTRAINT fk_order_items_tea
          FOREIGN KEY (tea_id)
          REFERENCES teas(id),
    
    PRIMARY KEY (id)
);
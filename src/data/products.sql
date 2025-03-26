-- This file contains seed data for the products table in the e-commerce database

-- Insert initial product records
-- Format: (id, name, description, price, stock_quantity, category_id)
-- id: Unique identifier for each product
-- name: Product display name
-- description: Brief product description
-- price: Product price in GBP
-- stock_quantity: Available inventory count
-- category_id: Foreign key referencing categories table

INSERT INTO products (id, name, description, price, stock_quantity, category_id) VALUES
(1, 'Laptop', 'High performance laptop', 999.99, 50, 1),
(2, 'Smartphone', 'Latest model smartphone', 699.99, 100, 1),
(3, 'Tablet', 'Portable tablet with stylus', 399.99, 75, 1),
(4, 'Headphones', 'Noise-cancelling headphones', 199.99, 150, 2),
(5, 'Smartwatch', 'Fitness tracking smartwatch', 249.99, 80, 2),
(6, 'Camera', 'DSLR camera with lens', 899.99, 30, 3),
(7, 'Monitor', '27-inch 4K monitor', 499.99, 40, 1),
(8, 'Keyboard', 'Mechanical keyboard', 129.99, 200, 2),
(9, 'Mouse', 'Wireless ergonomic mouse', 49.99, 300, 2),
(10, 'External Hard Drive', '1TB external hard drive', 89.99, 60, 3);
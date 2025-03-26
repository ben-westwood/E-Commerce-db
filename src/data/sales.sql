-- This file contains seed data for the sales table in the e-commerce database

-- Insert initial sales records
-- Format: (id, product_id, customer_id, sale_date, quantity, total_price)
-- id: Unique identifier for each sale
-- product_id: Foreign key referencing products table
-- customer_id: Foreign key referencing customers table
-- sale_date: Date of the sale transaction
-- quantity: Number of items sold
-- total_price: Total price of the sale in GBP

INSERT INTO sales (id, product_id, customer_id, sale_date, quantity, total_price) VALUES
(1, 1, 1, '2025-01-15', 2, 39.98),
(2, 2, 2, '2025-01-16', 1, 19.99),
(3, 3, 3, '2025-01-17', 5, 149.95),
(4, 4, 1, '2025-01-18', 3, 59.97),
(5, 5, 4, '2025-01-19', 1, 29.99),
(6, 6, 5, '2025-01-20', 4, 79.96),
(7, 7, 2, '2025-01-21', 2, 49.98),
(8, 8, 3, '2025-01-22', 1, 19.99),
(9, 9, 6, '2025-01-23', 3, 89.97),
(10, 10, 7, '2025-01-24', 1, 39.99),
(11, 1, 2, '2025-01-25', 2, 39.98),
(12, 3, 4, '2025-01-26', 1, 29.99),
(13, 5, 5, '2025-01-27', 1, 29.99),
(14, 6, 1, '2025-01-28', 2, 39.98),
(15, 7, 3, '2025-01-29', 1, 24.99);

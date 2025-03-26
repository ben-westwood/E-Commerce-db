-- Test for retrieving all products
SELECT * FROM products;

-- Test for retrieving all categories
SELECT * FROM categories;

-- Test for retrieving all customers
SELECT * FROM customers;

-- Test for retrieving all sales
SELECT * FROM sales;

-- Test for analyzing product prices and stock
SELECT id, name, price, stock_quantity FROM products;

-- Test for identifying low stock products
SELECT id, name FROM products WHERE stock_quantity < 50;

-- Test for calculating total revenue
SELECT SUM(total_price * quantity) AS total_revenue FROM sales;

-- Test for listing top three best-selling products
SELECT p.name, SUM(s.quantity) AS total_sold
FROM products p
JOIN sales s ON p.id = s.product_id
GROUP BY p.id
ORDER BY total_sold DESC
LIMIT 3;

-- Test for purchases made by a specific customer (replace number with customer_id)
SELECT * FROM sales WHERE customer_id = '1';

-- Test for total number of products sold in each category
SELECT c.name AS category_name, SUM(s.quantity) AS total_sold
FROM categories c
JOIN products p ON c.id = p.category_id
JOIN sales s ON p.id = s.product_id
GROUP BY c.id;
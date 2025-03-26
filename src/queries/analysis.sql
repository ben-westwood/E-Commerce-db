-- Query to display all products with their prices and stock quantities
SELECT p.product_id, p.product_name, p.price, p.stock_quantity
FROM products p;

-- Query to identify low stock products (e.g., stock quantity less than 5)
SELECT p.product_id, p.product_name, p.stock_quantity
FROM products p
WHERE p.stock_quantity < 5;

-- Query to calculate total revenue from sales
SELECT SUM(s.total_amount) AS total_revenue
FROM sales s;

-- Query to list the top three best-selling products
SELECT p.product_id, p.product_name, SUM(s.quantity) AS total_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 3;
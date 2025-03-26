DELIMITER;

CREATE PROCEDURE GetProductDetails(IN productId INT)
BEGIN
    SELECT p.product_id, p.product_name, p.price, p.stock_quantity, c.category_name
    FROM products p
    JOIN categories c ON p.category_id = c.category_id
    WHERE p.product_id = productId;
END

CREATE PROCEDURE GetCustomerPurchases(IN customerId INT)
BEGIN
    SELECT s.sale_id, s.sale_date, p.product_name, s.quantity, s.total_price
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    WHERE s.customer_id = customerId;
END

CREATE PROCEDURE CalculateTotalRevenue()
BEGIN
    SELECT SUM(total_price) AS total_revenue
    FROM sales;
END

DELIMITER;
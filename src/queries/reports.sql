-- Report: Purchases made by a specific customer
SELECT 
    c.customer_id,
    c.name AS customer_name,
    p.product_id,
    p.name AS product_name,
    s.quantity,
    s.sale_date
FROM 
    customers c
JOIN 
    sales s ON c.customer_id = s.customer_id
JOIN 
    products p ON s.product_id = p.product_id
WHERE 
    c.customer_id = ?;  -- Replace ? with the specific customer ID

-- Report: Total number of products sold in each category
SELECT 
    cat.category_id,
    cat.name AS category_name,
    SUM(s.quantity) AS total_sold
FROM 
    categories cat
JOIN 
    products p ON cat.category_id = p.category_id
JOIN 
    sales s ON p.product_id = s.product_id
GROUP BY 
    cat.category_id, cat.name
ORDER BY 
    total_sold DESC;
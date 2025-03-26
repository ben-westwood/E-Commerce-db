-- Foreign key relationships for the e-commerce database

-- Relationship between products and categories
ALTER TABLE products
ADD CONSTRAINT fk_category
FOREIGN KEY (category_id) REFERENCES categories(id);

-- Relationship between sales and customers
ALTER TABLE sales
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id) REFERENCES customers(id);

-- Relationship between sales and products
ALTER TABLE sales
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id) REFERENCES products(id);
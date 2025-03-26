-- Categories table: Stores product categories and their descriptions
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,    -- Unique identifier for each category
    name VARCHAR(255) NOT NULL,           -- Category name (required)
    description TEXT                      -- Optional category description
);

-- Products table: Stores product information with category association
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,    -- Unique identifier for each product
    name VARCHAR(255) NOT NULL,           -- Product name (required)
    description TEXT,                     -- Optional product description
    price DECIMAL(10, 2) NOT NULL,        -- Product price with 2 decimal places (required)
    stock_quantity INT NOT NULL,          -- Current inventory count (required)
    category_id INT,                      -- Reference to categories table
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Customers table: Stores customer information and contact details
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,    -- Unique identifier for each customer
    first_name VARCHAR(255) NOT NULL,     -- Customer's first name (required)
    last_name VARCHAR(255) NOT NULL,      -- Customer's last name (required)
    email VARCHAR(255) NOT NULL UNIQUE,   -- Unique email address (required)
    phone VARCHAR(20)                     -- Optional phone number
);

-- Sales table: Records sales transactions linking products and customers
CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,    -- Unique identifier for each sale
    product_id INT,                       -- Reference to products table
    customer_id INT,                      -- Reference to customers table
    sale_date DATETIME DEFAULT CURRENT_TIMESTAMP, -- Transaction date/time
    quantity INT NOT NULL,                -- Number of items sold (required)
    total_price DECIMAL(10, 2) NOT NULL,  -- Total sale amount (required)
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
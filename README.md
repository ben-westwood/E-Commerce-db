# E-Commerce Database Project

## Overview
This project implements a MySQL database for an e-commerce store with tables for products, categories, customers, and sales, including sample data and analytical queries.

## Prerequisites
- MySQL Server 8.0+ OR Docker with Docker Compose
- Git
- MySQL Workbench (optional)

## Project Structure
```
ecommerce-db
├── src
│   ├── schema/              # Database structure
│   │   ├── tables.sql
│   │   └── relationships.sql
│   ├── data/                # Sample data
│   │   ├── products.sql
│   │   ├── categories.sql
│   │   ├── customers.sql
│   │   └── sales.sql
│   ├── queries/             # Analysis & reporting
│   │   ├── analysis.sql
│   │   └── reports.sql
│   └── procedures/
│       └── stored_procedures.sql
├── tests/
│   └── test_queries.sql
├── Dockerfile               # Docker image configuration
├── docker-compose.yml       # Docker container orchestration
└── README.md
```

## Installation Options

### Method 1: Local MySQL
1. Clone and enter directory:
   ```bash
   git clone https://github.com/ben-westwood/E-Commerce-db.git
   cd E-Commerce-db
   ```

2. Set up database:
   ```sql
   mysql -u root -p
   CREATE DATABASE ecommerce;
   USE ecommerce;
   ```

3. Load data:
   ```bash
   mysql -u root -p ecommerce < src/schema/tables.sql
   mysql -u root -p ecommerce < src/schema/relationships.sql
   mysql -u root -p ecommerce < src/data/categories.sql
   mysql -u root -p ecommerce < src/data/products.sql
   mysql -u root -p ecommerce < src/data/customers.sql
   mysql -u root -p ecommerce < src/data/sales.sql
   ```

### Method 2: Docker
1. Clone and start container:
   ```bash
   git clone https://github.com/ben-westwood/E-Commerce-db.git
   cd E-Commerce-db
   docker-compose up -d
   ```

2. Verify installation:
   ```bash
   docker ps
   docker-compose logs
   ```

## Connection Details

### Local MySQL
- Host: localhost
- Port: 3306
- Database: ecommerce
- User: root (or custom user)
- Password: your_password

### Docker
- Host: localhost
- Port: 3306
- Database: ecommerce
- User: user
- Password: password
- Root Password: rootpassword

## Usage

### Common Queries
```sql
-- View all products
SELECT * FROM products;

-- Check sales by date
SELECT sale_date, SUM(total_amount) 
FROM sales 
GROUP BY sale_date;
```

### Running Scripts
```sql
-- Analysis
source src/queries/analysis.sql

-- Reports
source src/queries/reports.sql

-- Tests
source tests/test_queries.sql
```

## Maintenance

### Backup & Restore
```bash
# Backup
docker exec ecommerce-db mysqldump -u user -ppassword ecommerce > backup.sql

# Restore
docker exec -i ecommerce-db mysql -u user -ppassword ecommerce < backup.sql
```

### Docker Management
```bash
# Stop container
docker-compose down

# Restart
docker-compose restart

# Reset completely
docker-compose down -v
docker-compose up --build -d
```

## Troubleshooting
- Container issues: `docker-compose logs`
- Permission errors: `chmod -R 644 src/`
- Connection refused: Check if service is running with `docker ps`

## Database Documentation

### Schema Design
The database schema is organized in the following SQL files:

#### Tables (`src/schema/tables.sql`)
- Creates the main database tables with appropriate data types and constraints
- Tables include:
  ```sql
  CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT
  );

  CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );

   CREATE TABLE customers (
      id INT AUTO_INCREMENT PRIMARY KEY,
      first_name VARCHAR(255) NOT NULL,
      last_name VARCHAR(255) NOT NULL,
      email VARCHAR(255) NOT NULL UNIQUE,
      phone VARCHAR(20)
   );

   CREATE TABLE sales (
      id INT AUTO_INCREMENT PRIMARY KEY,
      product_id INT,
      customer_id INT,
      sale_date DATETIME DEFAULT CURRENT_TIMESTAMP,
      quantity INT NOT NULL,
      total_price DECIMAL(10, 2) NOT NULL,
      FOREIGN KEY (product_id) REFERENCES products(id),
      FOREIGN KEY (customer_id) REFERENCES customers(id)
   );
  ```

#### Relationships (`src/schema/relationships.sql`)
- Establishes foreign key constraints between tables
- Includes indexes for performance optimisation
- Example:
  ```sql
   ALTER TABLE products
   ADD CONSTRAINT fk_category
   FOREIGN KEY (category_id) REFERENCES categories(id);
  ```

### Sample Data
Sample data files are created to demonstrate typical usage:

#### Categories (`src/data/categories.sql`)
- Contains basic product categories
- Example categories: Electronics, Clothing, Books
- Includes descriptions for each category

#### Products (`src/data/products.sql`)
- Sample products with realistic prices
- Links to appropriate categories
- Includes varied descriptions

#### Customers (`src/data/customers.sql`)
- Test customer accounts
- Includes varied address formats
- Contains sample email patterns

#### Sales (`src/data/sales.sql`)
- Sample transactions
- Various quantities and dates
- Represents different purchase patterns

### Analytical Queries (`src/queries/analysis.sql`)
Contains common business analytics:
- Sales by category
- Top selling products
- Customer purchase history
- Revenue reports

### Stored Procedures (`src/procedures/stored_procedures.sql`)
Common database operations:
```sql
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
```

### Test Queries (`tests/test_queries.sql`)
Validation queries to ensure:
- Data integrity
- Relationship constraints
- Stored procedure functionality
- Query performance

## License
This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.
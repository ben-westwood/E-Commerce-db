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

## License
This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.
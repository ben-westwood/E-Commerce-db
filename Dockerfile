FROM mysql:8.0

# Copy SQL files into docker-entrypoint-initdb.d
# Files in this directory are executed in alphabetical order
COPY src/schema/tables.sql /docker-entrypoint-initdb.d/1_tables.sql
COPY src/schema/relationships.sql /docker-entrypoint-initdb.d/2_relationships.sql
COPY src/data/categories.sql /docker-entrypoint-initdb.d/3_categories.sql
COPY src/data/products.sql /docker-entrypoint-initdb.d/4_products.sql
COPY src/data/customers.sql /docker-entrypoint-initdb.d/5_customers.sql
COPY src/data/sales.sql /docker-entrypoint-initdb.d/6_sales.sql

# Set permissions
RUN chmod 644 /docker-entrypoint-initdb.d/*.sql
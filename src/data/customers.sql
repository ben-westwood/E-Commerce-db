-- This file contains seed data for the customers table in the e-commerce database

-- Insert initial customer records
-- Format: (id, first_name, last_name, email, phone)
-- id: Unique identifier for each customer
-- first_name: Customer's given name
-- last_name: Customer's family name
-- email: Customer's contact email address
-- phone: UK format phone number

INSERT INTO customers (id, first_name, last_name, email, phone) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '020 7123 4567'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '020 7234 5678'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '020 7345 6789'),
(4, 'Bob', 'Brown', 'bob.brown@example.com', '020 7456 7890'),
(5, 'Charlie', 'Davis', 'charlie.davis@example.com', '020 7567 8901'),
(6, 'Diana', 'Evans', 'diana.evans@example.com', '020 7678 9012'),
(7, 'Ethan', 'Foster', 'ethan.foster@example.com', '020 7789 0123');
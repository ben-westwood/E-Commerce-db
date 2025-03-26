-- This file contains seed data for the categories table in the e-commerce database

-- Insert initial product categories with their descriptions
-- Format: (id, name, description)
-- id: Unique identifier for each category
-- name: Category display name
-- description: Brief explanation of items in this category
INSERT INTO categories (id, name, description) VALUES
(1, 'Electronics', 'Latest gadgets, devices, and electronic accessories'),
(2, 'Clothing', 'Fashion apparel and accessories for all ages'),
(3, 'Home & Kitchen', 'Household items, appliances, and kitchen essentials'),
(4, 'Books', 'Literature, textbooks, and publications across all genres'),
(5, 'Toys & Games', 'Entertainment items for children and adults');
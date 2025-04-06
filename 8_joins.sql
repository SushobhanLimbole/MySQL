-- JOINS

-- JOINS allows you to combine rows from two or more tables based on related columns.
-- The syntax for joining two tables is:

-- SELECT [table_names.]columns_names_or_other_information
-- FROM
-- left_table
-- INNER JOIN / LEFT JOIN / RIGHT JOIN  / CROSS JOIN
-- right_table
-- ON
-- left_table.column_name = right_table.column_name;

-- CREATE TABLE products(
--     product_id INT PRIMARY KEY AUTO_INCREMENT,
--     product_name VARCHAR(50),
--     category_id INT,
--     price INT
-- );

-- INSERT INTO products(
--     product_name,
--     category_id,
--     price
-- ) VALUES ('iPhone 14', 1, 80000),
-- ('MacBook Pro', 1, 150000),
-- ('AirPods', 1, 20000),
-- ('T-shirt', 2, 800);

-- CREATE TABLE categories(
--     category_id INT PRIMARY KEY AUTO_INCREMENT,
--     category_name VARCHAR(50)
-- );

-- INSERT INTO categories(category_name)
-- VALUES ('Electronics'),
-- ('Clothing'),
-- ('Furniture');

-- SELECT * FROM products;
-- SELECT * FROM categories;

-- INNER JOIN
-- Returns only the matching rows from both tables.
-- SELECT *
-- FROM products p
-- INNER JOIN categories c
-- ON p.category_id = c.category_id;

-- -- LEFT JOIN (or LEFT OUTER JOIN)
-- -- Returns all rows from the left table, and matched rows from the right.
-- SELECT *
-- FROM products p
-- LEFT JOIN categories c
-- ON p.category_id = c.category_id;

-- RIGHT JOIN (or RIGHT OUTER JOIN)
-- Returns all rows from the right table, and matched rows from the left.
-- SELECT p.product_name, c.category_name
-- FROM products p
-- RIGHT JOIN categories c
-- ON p.category_id = c.category_id;

-- CROSS JOIN
-- Returns the Cartesian product — every row of table A joined to every row of table B.
-- SELECT p.product_name, c.category_name
-- FROM products p
-- CROSS JOIN categories c;

-- 1.List category-wise product count.
-- SELECT COUNT(p.product_name) AS product_count, c.category_name
-- FROM products p
-- RIGHT JOIN categories c
-- ON p.category_id = c.category_id
-- GROUP BY c.category_name;

-- 2.Show the most expensive product in each category.
-- SELECT MAX(p.price), c.category_name
-- FROM products p
-- RIGHT JOIN categories c
-- ON p.category_id = c.category_id
-- GROUP BY c.category_name;

-- 3.List categories that have no products.
-- SELECT COUNT(p.product_id) AS no_of_products, c.category_name
-- FROM products p
-- RIGHT JOIN categories c 
-- ON p.category_id = c.category_id
-- GROUP BY c.category_name
-- HAVING COUNT(p.product_id) = 0;

-- 4.Get total price of products in each category.
-- SELECT SUM(p.price) AS total_price_of_products, c.category_name
-- FROM products p 
-- RIGHT JOIN categories c 
-- ON p.category_id = c.category_id
-- GROUP BY c.category_name;

-- Practice Set - 1
-- DROP TABLE products;
-- DROP TABLE categories;

-- CREATE TABLE customers(
--     customer_id INT PRIMARY KEY,
--     name VARCHAR(100),
--     email VARCHAR(255) UNIQUE   
-- );

-- INSERT INTO customers(
--     customer_id,
--     name,
--     email
-- ) VALUES (1, 'Alice', 'alice@gmail.com'),
-- (2, 'Bob', 'bob@gmail.com'),
-- (3, 'Charlie', 'charlie@gmail.com');

-- CREATE TABLE orders(
--     order_id INT PRIMARY KEY,
--     customer_id INT,
--     order_date DATE NOT NULL,
--     total_amount INT,
--     FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
-- );

-- INSERT INTO orders(
--     order_id,
--     customer_id,
--     order_date,
--     total_amount
-- ) VALUES (101, 1, '2024-12-01', 500),
-- (102, 1, '2024-12-05', 200),
-- (103, 2, '2024-12-10', 1000);

-- CREATE TABLE products(
--     product_id INT PRIMARY KEY,
--     product_name VARCHAR(100) UNIQUE,
--     price INT
-- );

-- INSERT INTO products(
--     product_id,
--     product_name,
--     price
-- ) VALUES (201, 'iPhone', 1000),
-- (202, 'AirPods', 200),
-- (203, 'MacBook', 2000),
-- (204, 'Charger', 50);

-- CREATE TABLE order_items(
--     order_id INT,
--     product_id INT,
--     quantity INT,
--     FOREIGN KEY (order_id) REFERENCES orders(order_id),
--     FOREIGN KEY (product_id) REFERENCES products(product_id)
-- );

-- INSERT INTO order_items(
--     order_id,
--     product_id,
--     quantity
-- ) VALUES (101, 201, 1),
-- (101, 204, 2),
-- (102, 202, 1),
-- (103, 203, 1),
-- (103, 204, 1);

-- 1. List all customers and their orders (if any).
-- SELECT c.name, o.order_id, order_date, total_amount
-- FROM customers c 
-- LEFT JOIN orders o 
-- ON c.customer_id = o.customer_id;

-- 2. List all orders along with product names and quantities.
-- SELECT o.order_id, p.product_name, o.quantity 
-- FROM order_items o 
-- INNER JOIN products p 
-- ON o.product_id = p.product_id
-- ORDER BY o.order_id ASC;

-- 3. Show each customer with total number of orders.
-- SELECT c.name, COUNT(o.order_id) AS no_of_orders
-- FROM customers c 
-- LEFT JOIN orders o 
-- ON c.customer_id = o.customer_id
-- GROUP BY c.customer_id;

-- 4.Find total amount spent by each customer
-- SELECT c.name, SUM(o.total_amount) AS total_amount
-- FROM customers c
-- LEFT JOIN orders o 
-- ON c.customer_id = o.customer_id
-- GROUP BY c.customer_id;

-- 5. Which products were never ordered?
-- SELECT p.product_id, p.product_name
-- FROM products p 
-- LEFT JOIN order_items oi 
-- ON p.product_id = oi.product_id
-- WHERE oi.product_id IS NULL OR oi.product_id = 0;

-- 6. List all orders and total items in each.
-- SELECT o.order_id, SUM(oi.quantity) AS total_items
-- FROM orders o 
-- LEFT JOIN order_items oi 
-- ON o.order_id = oi.order_id
-- GROUP BY o.order_id;

-- 7. List all customers who haven't placed any orders.
-- SELECT c.name
-- FROM customers c 
-- LEFT JOIN orders o 
-- ON c.customer_id = o.customer_id
-- WHERE o.order_id IS NULL;

-- 8. Show total revenue per product.
-- SELECT p.product_id, p.product_name, SUM(p.price * oi.quantity) AS total_revenue
-- FROM products p 
-- LEFT JOIN order_items oi 
-- ON p.product_id = oi.product_id 
-- GROUP BY p.product_id;

-- 9. List customers who ordered 'MacBook'.
-- SELECT c.customer_id, c.name
-- FROM customers c 
-- JOIN orders o ON c.customer_id = o.customer_id
-- JOIN order_items oi ON o.order_id = oi.order_id
-- JOIN products p ON oi.product_id = p.product_id
-- WHERE p.product_name = 'MacBook';

-- 10. Which orders include more than 2 items?
-- SELECT o.order_id, SUM(oi.quantity) AS no_of_items
-- FROM orders o 
-- JOIN order_items oi 
-- ON o.order_id = oi.order_id
-- GROUP BY o.order_id
-- HAVING no_of_items > 2;

-- 11. Get the average quantity per product ordered.
-- SELECT p.product_id, p.product_name, AVG(oi.quantity) AS avg_quantity
-- FROM products p 
-- LEFT JOIN order_items oi 
-- ON p.product_id = oi.product_id
-- GROUP BY p.product_id;

-- 12. Show all orders with their customer name and total price.
-- SELECT oi.order_id, c.name, SUM(p.price * oi.quantity) AS total_price
-- FROM customers c 
-- JOIN orders o ON c.customer_id = o.customer_id
-- JOIN order_items oi ON o.order_id = oi.order_id
-- JOIN products p ON oi.product_id = p.product_id
-- GROUP BY oi.order_id;

-- 13.Latest order for each customer
-- SELECT c.name, MAX(o.order_date) AS latest_order
-- FROM customers c 
-- LEFT JOIN orders o 
-- ON c.customer_id = o.customer_id
-- GROUP BY c.customer_id;

-- 14.Customers who ordered more than one type of product
-- SELECT c.name
-- FROM customers c 
-- JOIN orders o ON c.customer_id = o.customer_id
-- JOIN order_items oi ON o.order_id = oi.order_id
-- GROUP BY c.name
-- HAVING COUNT(DISTINCT oi.product_id) > 1;

-- 15.Top spending customer
-- SELECT c.name, SUM(oi.quantity * p.price) AS total_spent
-- FROM customers c 
-- JOIN orders o ON c.customer_id = o.customer_id
-- JOIN order_items oi ON o.order_id = oi.order_id
-- JOIN products p ON oi.product_id = p.product_id
-- GROUP BY c.customer_id
-- ORDER BY total_spent DESC
-- LIMIT 1;

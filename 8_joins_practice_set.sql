-- Drop tables if they exist
-- DROP TABLE IF EXISTS Order_Items, Orders, Products, Customers, Payments, Reviews, Categories;

-- Customers Table
-- CREATE TABLE Customers (
--     customer_id INT PRIMARY KEY,
--     name VARCHAR(100),
--     email VARCHAR(100) UNIQUE,
--     address TEXT
-- );

-- INSERT INTO Customers (customer_id, name, email, address) VALUES
-- (1, 'Alice Johnson', 'alice@example.com', 'New York, NY'),
-- (2, 'Bob Smith', 'bob@example.com', 'Chicago, IL'),
-- (3, 'Charlie Brown', 'charlie@example.com', 'Los Angeles, CA'),
-- (4, 'Diana Prince', 'diana@example.com', 'Washington, DC'),
-- (5, 'Ethan Hunt', 'ethan@example.com', 'Boston, MA'),
-- (6, 'Fiona Gallagher', 'fiona@example.com', 'Philadelphia, PA'),
-- (7, 'George King', 'george@example.com', 'San Francisco, CA');

-- Categories Table
-- CREATE TABLE Categories (
--     category_id INT PRIMARY KEY,
--     category_name VARCHAR(100)
-- );

-- INSERT INTO Categories (category_id, category_name) VALUES
-- (1, 'Electronics'),
-- (2, 'Books'),
-- (3, 'Clothing'),
-- (4, 'Home Appliances'),
-- (5, 'Beauty');

-- Products Table
-- CREATE TABLE Products (
--     product_id INT PRIMARY KEY,
--     product_name VARCHAR(100),
--     price DECIMAL(10,2),
--     category_id INT,
--     FOREIGN KEY (category_id) REFERENCES Categories(category_id)
-- );

-- INSERT INTO Products (product_id, product_name, price, category_id) VALUES
-- (101, 'iPhone 14', 999.99, 1),
-- (102, 'Washing Machine', 450.00, 4),
-- (103, 'Harry Potter Book Set', 120.00, 2),
-- (104, 'Winter Jacket', 89.99, 3),
-- (105, 'Lipstick Pack', 25.50, 5),
-- (106, 'Bluetooth Speaker', 49.99, 1),
-- (107, 'Smart Watch', 199.99, 1),
-- (108, 'Cookbook', 35.00, 2),
-- (109, 'Vacuum Cleaner', 199.00, 4),
-- (110, 'Face Serum', 30.00, 5);

-- Orders Table
-- CREATE TABLE Orders (
--     order_id INT PRIMARY KEY,
--     customer_id INT,
--     order_date DATE,
--     FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
-- );

-- INSERT INTO Orders (order_id, customer_id, order_date) VALUES
-- (201, 1, '2024-01-10'),
-- (202, 2, '2024-01-15'),
-- (203, 3, '2024-02-01'),
-- (204, 1, '2024-03-05'),
-- (205, 5, '2024-03-15'),
-- (206, 6, '2024-04-01'),
-- (207, 2, '2024-04-03'),
-- (208, 7, '2024-04-07');

-- Order_Items Table
-- CREATE TABLE Order_Items (
--     order_id INT,
--     product_id INT,
--     quantity INT,
--     FOREIGN KEY (order_id) REFERENCES Orders(order_id),
--     FOREIGN KEY (product_id) REFERENCES Products(product_id)
-- );

-- INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
-- (201, 101, 1),
-- (201, 105, 2),
-- (202, 103, 1),
-- (203, 104, 3),
-- (204, 107, 1),
-- (205, 106, 1),
-- (206, 109, 1),
-- (206, 110, 1),
-- (207, 108, 2),
-- (208, 102, 1);

-- Payments Table
-- CREATE TABLE Payments (
--     payment_id INT PRIMARY KEY,
--     order_id INT,
--     amount DECIMAL(10,2),
--     payment_date DATE,
--     payment_method VARCHAR(50),
--     FOREIGN KEY (order_id) REFERENCES Orders(order_id)
-- );

-- INSERT INTO Payments (payment_id, order_id, amount, payment_date, payment_method) VALUES
-- (301, 201, 1051.99, '2024-01-10', 'Credit Card'),
-- (302, 202, 120.00, '2024-01-15', 'PayPal'),
-- (303, 203, 269.97, '2024-02-01', 'Credit Card'),
-- (304, 204, 199.99, '2024-03-05', 'Debit Card'),
-- (305, 205, 49.99, '2024-03-15', 'UPI'),
-- (306, 206, 229.00, '2024-04-01', 'Net Banking'),
-- (307, 207, 70.00, '2024-04-03', 'Credit Card'),
-- (308, 208, 450.00, '2024-04-07', 'Debit Card');

-- Reviews Table
-- CREATE TABLE Reviews (
--     review_id INT PRIMARY KEY,
--     product_id INT,
--     customer_id INT,
--     rating INT CHECK(rating >= 1 AND rating <= 5),
--     comment TEXT,
--     FOREIGN KEY (product_id) REFERENCES Products(product_id),
--     FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
-- );

-- INSERT INTO Reviews (review_id, product_id, customer_id, rating, comment) VALUES
-- (401, 101, 1, 5, 'Excellent product!'),
-- (402, 103, 2, 4, 'Great book set'),
-- (403, 104, 3, 3, 'Good jacket but could be warmer'),
-- (404, 107, 1, 5, 'Love the features'),
-- (405, 105, 1, 4, 'Nice colors'),
-- (406, 106, 5, 4, 'Sound is good'),
-- (407, 110, 6, 5, 'Great for skin'),
-- (408, 102, 7, 2, 'Too noisy');

-- Query to test data setup
-- SELECT * FROM Customers;
-- SELECT * FROM Products;
-- SELECT * FROM Orders;
-- SELECT * FROM Order_Items;
-- SELECT * FROM Payments;
-- SELECT * FROM Reviews;

-- 🔍 Customer Insights & Orders
-- 1.Which customer has spent the most overall?
-- SELECT c.name, SUM(py.amount) AS total_amount_spent
-- FROM Customers c
-- JOIN Orders o ON c.customer_id = o.customer_id
-- JOIN Payments py ON o.order_id = py.order_id
-- GROUP BY c.customer_id
-- ORDER BY total_amount_spent DESC
-- LIMIT 1;


-- 2.List all customers who have placed more than two orders and left at least one review.
-- SELECT c.name, 
-- COUNT(DISTINCT o.order_id) AS no_of_orders,
-- COUNT(DISTINCT r.review_id) AS no_of_reviews
-- FROM Customers c 
-- JOIN Orders o ON c.customer_id = o.customer_id
-- JOIN Reviews r ON c.customer_id = r.customer_id
-- GROUP BY c.customer_id
-- HAVING COUNT(DISTINCT o.order_id) > 2
-- AND COUNT(DISTINCT r.review_id) >= 1;

-- 3.Find customers who purchased products from more than two different categories.
-- SELECT c.name, COUNT(DISTINCT p.category_id) AS no_of_categories
-- FROM Customers c 
-- JOIN Orders o ON c.customer_id = o.customer_id
-- JOIN Order_Items oi ON o.order_id = oi.order_id
-- JOIN Products p ON oi.product_id = p.product_id
-- GROUP BY c.customer_id
-- HAVING COUNT(DISTINCT p.category_id) > 2;

-- 4.Which customer placed the earliest order and what products were included in that order?
-- ❌ Incomplete Query
-- SELECT c.name, MIN(o.order_date) AS order_date, COUNT(p.product_id) as no_of_products
-- FROM Customers c 
-- JOIN Orders o ON c.customer_id = o.customer_id
-- JOIN Order_Items oi ON o.order_id = oi.order_id
-- JOIN Products p ON oi.product_id = p.product_id
-- GROUP BY c.customer_id
-- ORDER BY order_date ASC
-- LIMIT 1;

-- Step 1: Find the earliest order
-- WITH EarliestOrder AS (
--   SELECT o.order_id, o.customer_id, o.order_date
--   FROM Orders o
--   ORDER BY o.order_date ASC
--   LIMIT 1
-- )

-- Step 2: Join with other tables to get customer and product details
-- SELECT 
--   c.name AS customer_name,
--   eo.order_date,
--   p.product_name
-- FROM EarliestOrder eo
-- JOIN Customers c ON eo.customer_id = c.customer_id
-- JOIN Order_Items oi ON eo.order_id = oi.order_id
-- JOIN Products p ON oi.product_id = p.product_id;

-- In SQL, WITH ... AS is used to create what's called a Common Table Expression (CTE).
-- It's like creating a temporary result set (a named subquery) 
-- that you can refer to in your main query, just like a temporary table.
-- 🔧 Syntax:
-- WITH temp_name AS (
--    SELECT ... -- some subquery
-- )
-- SELECT ...
-- FROM temp_name
-- JOIN ...;

-- 💡 Why use WITH ... AS?
-- It helps in:
-- Breaking down complex queries into understandable parts.
-- Reusing a result set.
-- Improving readability and maintainability.
-- Avoiding nested subqueries.

-- 5.Identify customers who have made a payment but haven’t written any review.
-- SELECT c.customer_id, c.name, COUNT(DISTINCT r.review_id) AS no_of_reviews
-- FROM Customers c 
-- LEFT JOIN Orders o ON c.customer_id = o.customer_id
-- JOIN Payments py ON o.order_id = py.order_id
-- LEFT JOIN Reviews r ON c.customer_id = r.customer_id
-- GROUP BY c.customer_id
-- HAVING COUNT(DISTINCT r.review_id) = 0;

-- Another way
-- SELECT 
--     c.customer_id, 
--     c.name
-- FROM Customers c
-- JOIN Orders o ON c.customer_id = o.customer_id
-- JOIN Payments py ON o.order_id = py.order_id
-- WHERE NOT EXISTS (
--     SELECT 1 
--     FROM Reviews r 
--     WHERE r.customer_id = c.customer_id
-- )
-- GROUP BY c.customer_id;


-- 📦 Product & Inventory Analytics
-- 6.Which products have never been ordered?
-- SELECT p.product_id, p.product_name
-- FROM Products p
-- LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
-- WHERE oi.product_id IS NULL;

-- 7.List top 3 most frequently purchased products with their total quantity sold.
-- SELECT p.product_name, SUM(oi.quantity) AS total_quantity
-- FROM Products p
-- JOIN Order_Items oi ON p.product_id = oi.product_id
-- GROUP BY p.product_id
-- ORDER BY total_quantity DESC
-- LIMIT 3;

-- 8.Find the most reviewed product and calculate its average rating.
-- SELECT p.product_name, AVG(r.rating) AS avg_rating
-- FROM Products p
-- JOIN Reviews r ON p.product_id = r.product_id
-- GROUP BY p.product_id
-- ORDER BY avg_rating DESC
-- LIMIT 1;

-- 9.Which category has the highest number of different products sold?
-- SELECT ca.category_name, COUNT(DISTINCT oi.product_id) AS no_of_products
-- FROM Order_Items oi
-- JOIN Products p ON oi.product_id = p.product_id
-- JOIN Categories ca ON p.category_id = ca.category_id
-- GROUP BY ca.category_id
-- ORDER BY no_of_products DESC
-- LIMIT 1;

-- 10.List products that were purchased more than once in a single order.
-- WITH total_quantity AS (
--     SELECT product_id, quantity 
--     FROM Order_Items
--     WHERE quantity > 1
-- )
-- SELECT p.product_name, tq.quantity
-- FROM Products p 
-- JOIN total_quantity tq ON p.product_id = tq.product_id 
-- ORDER BY tq.quantity DESC;

-- 💳 Payments & Revenue
-- 11.Calculate total revenue generated from each payment method.
-- SELECT payment_method, SUM(amount) AS total_revenue
-- FROM Payments
-- GROUP BY payment_method;

-- 12.Which order generated the highest payment amount, and which products were part of it?
-- SELECT p.product_name, oi.order_id
-- FROM Products p
-- JOIN Order_Items oi ON p.product_id = oi.product_id
-- WHERE oi.order_id = (
--     SELECT order_id
--     FROM Payments
--     ORDER BY amount DESC
--     LIMIT 1
-- );

-- 13.Find the average order amount per customer.
-- SELECT c.name, AVG(pa.amount) AS avg_order_amount
-- FROM Customers c 
-- JOIN Orders o ON c.customer_id = o.customer_id
-- JOIN Payments pa ON o.order_id = pa.order_id
-- GROUP BY c.customer_id;

-- 14.List customers whose total payment amount is more than ₹500 but never used 'Credit Card'.
-- WITH total_payment AS (
--     SELECT order_id, amount, payment_method
--     FROM Payments
--     WHERE amount > 500 AND payment_method NOT IN ('Credit Card')
-- )
-- SELECT c.name
-- FROM Customers c 
-- JOIN Orders o ON c.customer_id = o.customer_id
-- JOIN total_payment tp ON o.order_id = tp.order_id
-- GROUP BY c.customer_id; 

-- 15.Which month had the highest revenue, and which category contributed the most to it?
-- SELECT ca.category_name, MONTHNAME(pa.payment_date), SUM(pa.amount) AS highest_revenue, COUNT(ca.category_id) AS category_contribution 
-- FROM Payments pa
-- JOIN Order_Items oi ON pa.order_id = oi.order_id
-- JOIN Products p ON oi.product_id = p.product_id
-- JOIN Categories ca ON p.category_id = ca.category_id
-- GROUP BY MONTHNAME(pa.payment_date), ca.category_id
-- ORDER BY highest_revenue DESC
-- LIMIT 1;

-- Another way
-- Step 1: Find the month with the highest revenue
-- WITH monthly_revenue AS (
--     SELECT 
--         MONTH(pa.payment_date) AS month,
--         MONTHNAME(pa.payment_date) AS month_name,
--         SUM(pa.amount) AS total_revenue
--     FROM Payments pa
--     GROUP BY MONTH(pa.payment_date), MONTHNAME(pa.payment_date)
--     ORDER BY total_revenue DESC
--     LIMIT 1
-- )

-- Step 2: Find the top category within that month
-- SELECT 
--     mr.month_name,
--     ca.category_name,
--     SUM(pa.amount) AS category_revenue
-- FROM monthly_revenue mr
-- JOIN Payments pa ON MONTH(pa.payment_date) = mr.month
-- JOIN Orders o ON pa.order_id = o.order_id
-- JOIN Order_Items oi ON o.order_id = oi.order_id
-- JOIN Products p ON oi.product_id = p.product_id
-- JOIN Categories ca ON p.category_id = ca.category_id
-- GROUP BY ca.category_id, mr.month_name
-- ORDER BY category_revenue DESC
-- LIMIT 1;

-- 📝 Review-Based Analysis
-- 16.Find all customers who gave a 5-star review and also bought that product again.
-- WITH five_stars_reviews AS (
--     SELECT r.product_id, r.customer_id, c.name
--     FROM Reviews r
--     JOIN Customers c ON r.customer_id = c.customer_id
--     WHERE rating = 5
-- )
-- SELECT fsr.name
-- FROM five_stars_reviews fsr 
-- JOIN Orders o ON fsr.customer_id = o.customer_id
-- JOIN Order_Items oi ON o.order_id = oi.order_id
-- WHERE fsr.product_id = oi.product_id
-- GROUP BY fsr.customer_id;

-- 17.Which products have a higher average rating than the average rating of their category?


-- 18.Identify products with more negative reviews (rating ≤ 2) than positive reviews (rating ≥ 4).

-- 19.List all customers who reviewed a product they didn’t buy.

-- 20.Which category has the highest average rating across all its products?

-- 🔗 Complex Joins / Nested Queries
-- For each category, list the top-selling product and its total sales amount.

-- Which customers have ordered every category at least once?

-- List all products that have been ordered by customers from more than three different cities.

-- Find orders that include both an electronics and a beauty product.

-- List all orders where the total payment is less than the sum of the product prices (possible discount detection).
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
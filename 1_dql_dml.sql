-- MySQL is a "Relational Database"
-- Relational Database means a database with a tabular format
-- where the data is stored in tables

-- To check how many databases are there : "SHOW DATABASES;" 
-- SHOW DATABASES;

-- To create a database : 'CREATE DATABASE db_name;'
-- CREATE DATABASE e_com;

-- To use database : 'USE DB_NAME;'
-- USE e_com;

-- To check how many tables are there in the current db : 'SHOW TABLES;'
-- SHOW TABLES;

-- "CREATE TABLE table_name(col 1, col 2, ...);" query is used to create a table
-- CREATE TABLE users(userid INT, username varchar(255), email varchar(255));

-- "DESC table_name;" to see the table description
-- DESC users;

-- DML - Data Manipulation Langauge
-- INSERT INTO : Adds new records.
-- INSERT INTO table_name(col 1, col 2, ...) VALUES (data),(data),...;
-- Here VALUE/VALUES is allowed but best practice is to use VALUES

-- UPDATE : Modifies records.
-- UPDATE table_name  
-- SET column1 = value1, column2 = value2  
-- WHERE condition;
-- table_name: The table where you want to update data.
-- SET: Specifies the column(s) to be updated and their new values.
-- WHERE: Specifies which records should be updated (important!).
-- Without WHERE, all records in the table will be updated!

-- DELETE : Removes records.
-- DELETE FROM table_name WHERE condition;

-- INSERT INTO users(
--     userid,
--     username,
--     email
-- ) VALUES (1, 'Parnika Sushobhan Limbole', 'parnikalimbole08@gmail.com'),
-- (2, 'Sushobhan Sunil Limbole', 'sushobhanlimbole17@gmail.com'),
-- (3, 'Pranav Ghorpade', 'pranav@gmail.com');

-- DQL - Data Query Langauge
-- SELECT : it is used to retrieve data
-- SELECT * FROM users;

-- Second method to insert data
-- INSERT INTO users VALUES (4, 'Prathmesh jadhav', 'JP@gmail.com'); 

-- UPDATE users SET userName = 'Pranav Suhas Ghorpade' WHERE userId = 3;
-- UPDATE users SET userName = 'Prathmesh Kailas Jadhav' WHERE userName = 'Prathmesh Jadhav';

-- INSERT INTO users VALUES (5, 'ABC', 'abs');
-- INSERT INTO users VALUES (6, 'XYZ', 'abs');
-- DELETE FROM users WHERE email = "abs";

-- DDL - Data Definition Langauge
-- ALTER : modifies the columns

-- Rename Column
-- ALTER TABLE users CHANGE email emailId varchar(255);
-- ALTER TABLE users CHANGE emailId email varchar(255);
-- ALTER TABLE users CHANGE userid user_id INT;

-- Modify Column
-- ALTER TABLE users MODIFY username VARCHAR(200);  
-- ALTER TABLE users MODIFY userid BIGINT;

-- Add Column
-- ALTER TABLE users ADD COLUMN mob_no INT;

-- DROP : Deleting Database Objects
-- The DROP statement is used to completely remove a database, table, or other objects.

-- Drop a Column
-- ALTER TABLE users DROP COLUMN mob_no;

-- TRUNCATE : Deleting All Data but Keeping Structure
-- The TRUNCATE statement removes all rows from a table without logging individual row deletions.
-- TRUNCATE TABLE users;

-- Practice questions
-- DML - INSERT,UPDATE,DELETE
-- 1️⃣ Insert a new product named 'Laptop' with a price of 80,000 into the products table.
-- INSERT INTO products(prod_name,price) VALUE ('Laptop',80000);

-- 2️⃣ Insert multiple customers ('Alice', 'Bob', 'Charlie') into the customers table with unique IDs.
-- INSERT INTO customers(cust_id,cust_name) VALUES (1,'Alice'),
-- (2,'Bob'),
-- (3,'Charlie');

-- 3️⃣ Update the salary of employees earning less than 40,000 by increasing it by 15%.
-- UPDATE employees
-- SET salary = salary + (salary * 0.15)
-- WHERE salary < 40000;

-- 4️⃣ Update the price of all products in the products table by reducing them by 10%.
-- UPDATE products
-- SET price = price - (price * 0.15);

-- 5️⃣ Delete all employees who have not been assigned a department (NULL values).
-- DELETE FROM employees WHERE department IS NULL;

-- 6️⃣ Delete all products from the products table that are out of stock.
-- DELETE FROM products WHERE stock IS NULL OR stock = 0;

-- 7️⃣ Insert a new record into the orders table with order ID 101, customer ID 1, and total amount 500.
-- INSERT INTO orders(order_ID,customer_ID,total_amt)
-- VALUES (101,1,500);

-- 8️⃣ Update the status column of the orders table to 'Shipped' for all orders placed in the last 7 days.
-- UPDATE orders
-- SET status = 'Shipped'
-- WHERE order_date BETWEEN DATE_SUB(CURDATE(),INTERVAL 7 DAY) AND CURDATE();

-- 9️⃣ Delete all orders that were placed more than one year ago.
-- DELETE FROM orders
-- WHERE YEAR(DATEDIFF(deli_date,CURDATE())) > 1;  

-- 🔟 Insert a new student into the students table with default values for age and grade.
-- INSERT INTO students(stud_name)
-- VALUES ('Alice'),
-- ('Bob');

-- CREATE TABLE Employees(
--     EmployeeID INT PRIMARY KEY,
--     Name VARCHAR(50) NOT NULL,
--     Age INT CONSTRAINT chk CHECK (Age >= 18),
--     Department VARCHAR(50),
--     Salary DECIMAL(10,2) DEFAULT 30000,
--     JoiningDate DATE,
--     Email VARCHAR(100) UNIQUE
-- );

-- INSERT INTO Employees(EmployeeID,Name,Age,Department,Salary,JoiningDate,Email) VALUES (101,'Alice',25,'HR',50000,'2022-06-15','alice@email.com'),
-- (102,'Bob',30,'IT',60000,'2021-09-01','bob@email.com'),
-- (103,'Charlie',28,'Finance',DEFAULT,'2023-01-10','charlie@email.com'),
-- (104,'Diana',22,NULL,35000,'2024-02-20','diana@email.com');

-- DQL (Data Query Language) - SELECT Queries
-- 1️⃣ Retrieve all employees who have a salary greater than 50,000.
SELECT * FROM Employees WHERE Salary > 50000;

-- 2️⃣ Display only the Name, Department, and Salary of employees who joined after 2022-01-01.
SELECT Name, Department, Salary FROM Employees 
WHERE JoiningDate > '2022-01-01';

-- 3️⃣ Find employees whose Department is NULL.
SELECT * FROM Employess 
WHERE Department IS NULL;

-- DML (Data Manipulation Language) - INSERT, UPDATE, DELETE
-- 4️⃣ Update Charlie's salary to 55,000.
UPDATE Employees SET Salary = 55000 WHERE Name = 'Charlie';

-- 5️⃣ Delete the employee with EmployeeID = 104.
DELETE FROM Employees WHERE EmployeeID = 104;

-- DDL (Data Definition Language) - ALTER, DROP
-- 6️⃣ Add a new column PhoneNumber with a data type of VARCHAR(15).

-- 7️⃣ Remove the Email column from the table.

-- Constraints
-- 8️⃣ Try inserting a new employee with Age = 16. What happens?

-- 9️⃣ Insert another employee with the same email as Alice. What happens?
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

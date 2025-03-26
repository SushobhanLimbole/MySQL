-- SELECT is used to retrieve data from table

-- All the data with all the columns
-- SELECT * FROM users;

-- Filtering Columns
-- If we do not want to select all columns, we can list the columns we want.
-- Suppose we only want to select the user_id and username
-- SELECT user_id, username FROM users;

-- Aliases
-- Using AS keyword to give secondary name while retrieving the data
-- SELECT user_id, username AS Username, email AS emailId FROM users; 

-- Filtering Rows
-- LIMIT
-- This keyword limits the number of rows retrieved by the SELECT statement.
-- SELECT username FROM users LIMIT 3;

-- DISTINCT
-- This keyword removes duplicates
-- ALTER TABLE users ADD COLUMN gender CHAR(1);
-- UPDATE users SET gender = 'M' WHERE user_id = 2;
-- UPDATE users SET gender = 'M' WHERE user_id = 3;
-- UPDATE users SET gender = 'M' WHERE user_id = 4;
-- UPDATE users SET gender = 'F' WHERE user_id = 1;
-- SELECT gender FROM users;
-- SELECT DISTINCT(gender) FROM users; 

-- WHERE CLAUSE
-- WHERE Clause filters the data based on the condition
-- SELECT user_id, username FROM users WHERE user_id = 1;
-- SELECT user_id, username FROM users WHERE user_id <= 2;

-- BETWEEN
-- SELECT username FROM users WHERE user_id BETWEEN 2 AND 4;

-- LIKE
-- If we want to select rows whose column values “look like” a specified
-- pattern, we use the LIKE keyword.

-- SELECT user_id, username FROM users WHERE username LIKE '%de';
-- The % symbol is used to indicate that there can be an unknown number of
-- characters in front of 'de'

-- SELECT user_id, username FROM users WHERE username LIKE 'Pa%';
-- SELECT user_id, username FROM users WHERE username LIKE '%Sushobhan%';

-- SELECT user_id, username FROM users WHERE username LIKE '___n%';
-- Besides the % symbol, MySQL also provides us with the _ symbol.
-- In contrast to the % symbol that represents an unknown number of characters,
-- the _ symbol is used to represent exactly ONE character.

-- IN
-- This operator is used to check if a value matches any value in a given list
-- SELECT username FROM users WHERE gender IN ('M');

-- NOT IN
-- This operator is used to check if a value DOES NOT matches any value in a given list
-- SELECT username FROM users WHERE gender NOT IN ('M');

-- AND, OR
-- SELECT * FROM users WHERE username LIKE '%Su%' AND gender = 'F'; 
-- SELECT * FROM users WHERE username LIKE '%Su%' OR gender = 'F'; 

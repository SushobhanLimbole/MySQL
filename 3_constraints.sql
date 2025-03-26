-- Column Constraints
-- Column constraints in SQL define rules to ensure data integrity and consistency in a table.
-- These constraints apply to individual columns.

-- NOT NULL : Ensures that a column cannot have NULL values.

-- DEFAULT : Assigns a default value if no value is provided.

-- UNIQUE : Ensures that all values in a column are distinct.
-- Can have NULL values (but only one NULL per column).

-- PRIMARY KEY : Uniquely identifies each record in a table.
-- A combination of NOT NULL and UNIQUE; uniquely identifies each row.
-- A table can have only one primary key.
-- Difference between UNIQUE and PRIMARY KEY is
-- PRIMARY KEY cannot be NULL while UNIQUE allows a single NULL record

-- FOREIGN KEY : Links a column to another table's primary key.

-- CHECK : Restricts values in a column based on a condition.

-- AUTO_INCREMENT : Automatically generates unique values.

-- Adding a constraint to an existing table
-- Here, we only need to specify the datatype of the column
-- When adding NOT NULL, DEFAULT and AUTO_INCREMENT constraint.
-- Otherwise, MySQL will give an error

-- NOT NULL
-- ALTER TABLE users MODIFY username VARCHAR(255) NOT NULL;

-- DEFAULT
-- ALTER TABLE users MODIFY username VARCHAR(255) DEFAULT "user";

-- UNIQUE
-- ALTER TABLE users ADD CONSTRAINT UNIQUE (email);

-- PRIMARY KEY 
-- ALTER TABLE users ADD CONSTRAINT PRIMARY KEY (userid);

-- ALTER TABLE users ADD COLUMN mob_no INT NOT NULL DEFAULT 0000000000;

-- CHECK
-- ALTER TABLE users ADD COLUMN salary INT NOT NULL DEFAULT 100000 CHECK (salary >= 100000);
-- UPDATE users SET salary = 200000;
-- UPDATE users SET salary = 8000 WHERE userid = 3;

-- AUTO_INCREMENT
-- DROP TABLE users;
-- CREATE TABLE users (
--     user_id BIGINT PRIMARY KEY DEFAULT 0,
--     username VARCHAR(255) UNIQUE NOT NULL,
--     email VARCHAR(255) UNIQUE
-- );
-- ALTER TABLE users MODIFY user_id BIGINT AUTO_INCREMENT;
-- INSERT INTO users (
--     username,
--     email
-- ) VALUES ('Parnika Sushobhan Limbole', 'parnikalimbole08@gmail.com'),
-- ('Sushobhan Sunil Limbole', 'sushobhanlimble17@gmail.com'),
-- ('Pranav Suhas Ghorpade', 'hehe'),
-- ('Badal Pradip Lad', 'haha');
-- SELECT * FROM users;

-- Removing Constraints
-- PRIMARY KEY
-- To remove a PRIMARY KEY which had AUTO_INCREMENT
-- We need to first remove AUTO_INCREMENT, to do this
-- we will have to MODIFY the column specifying the datatype
-- ALTER TABLE users MODIFY user_id INT;
-- Now we can remove the PRIMARY KEY as the AUTO_INCREMENT is removed
-- ALTER TABLE users DROP PRIMARY KEY;
-- If the primary key is referenced by a foreign key in another table,
-- you'll need to drop the foreign key first.

-- UNIQUE
-- ALTER TABLE users DROP INDEX email;

-- NOT NULL
-- ALTER TABLE users MODIFY user_id INT;

-- CHECK
-- To remove a check constraint, remove it using the constraint_name 
-- ALTER TABLE users ADD COLUMN salary INT DEFAULT 10000 CHECK (salary >= 10000);
-- UPDATE users SET salary = 8000 WHERE user_id = 4;
-- ALTER TABLE users DROP CHECK users_chk_1;
-- UPDATE users SET salary = 8000 WHERE user_id = 4;

-- ALTER TABLE users DROP COLUMN salary;
-- ALTER TABLE users ADD COLUMN salary INT DEFAULT 10000 CONSTRAINT chk_1 CHECK (salary >= 10000);
-- ALTER TABLE users DROP CHECK chk_1;
-- ALTER TABLE users DROP COLUMN salary;

-- NOTE : To name a constraint use CONSTRAINT keyword 
-- In MySQL, we can name most constraints using the CONSTRAINT constraint_name syntax.
-- However, some constraints must be named manually, while others are automatically named if not specified.
-- Constraints that can be named are PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK
-- Constraints that cannot be named are NOT NULL, DEFAULT, AUTO_INCREMENT

-- ALTER TABLE users ADD CONSTRAINT pri_1 PRIMARY KEY (user_id);
-- ALTER TABLE users DROP PRIMARY KEY;

-- UNIQUE
-- ALTER TABLE users ADD CONSTRAINT uni_1 UNIQUE (email);
-- DESC users;
-- ALTER TABLE users DROP CONSTRAINT uni_1;
-- DESC users;

-- DEFAULT
-- ALTER TABLE users MODIFY email VARCHAR(255) DEFAULT '***';
-- DESC users;
-- ALTER TABLE users ALTER COLUMN email DROP DEFAULT; 
-- DESC users;
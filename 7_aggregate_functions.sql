-- An aggregate function is a function that performs calculation on a set of
-- values and returns the result of the calculation as a single value.

-- COUNT()
-- The COUNT() function returns the number of the rows in the table.
-- If we pass in * to the function, it returns the total number of rows in the table.
-- If we pass in a column name instead, it returns the number of non NULL values
-- in that column (NULL values are ignored).
-- If we want to remove duplicates, we add the DISTINCT keyword before the
-- column name.

-- AVG()
-- The AVG() function returns the average of a set of values.
-- Example:
-- SELECT AVG(salary) FROM employees;
-- Result:
-- 6487.777777777777

-- ROUND()
-- If you want to format the output, you can use the ROUND() function. We need
-- to pass in two pieces of information to the ROUND() function - the number to
-- round off and the number of decimal places we want it rounded off to.
-- For instance,
-- SELECT ROUND(1.23456, 3);
-- gives us 1.235.

-- MAX()
-- The MAX() function returns the maximum of a set of values.
-- Example:
-- SELECT MAX(salary) FROM Employees;

-- MIN()
-- The MIN() function returns the minimum of a set of values.
-- Example:
-- SELECT MIN(salary) FROM Employees;

-- SUM()
-- The SUM() function returns the sum of a set of values.
-- Example:
-- SELECT SUM(salary) FROM Employees;

-- 🔍 Basic Aggregate Questions
-- 1.Find the total number of employees.
-- SELECT COUNT(*) FROM Employees;

-- 2.Get the average salary of all employees.
-- SELECT AVG(Salary) FROM Employees;

-- 3.Find the highest and lowest salary in the company.
-- SELECT MAX(Salary), MIN(Salary) FROM Employees;

-- 4.How many employees do not belong to any department?
-- SELECT COUNT(Department) FROM Employees WHERE Department IS NULL;
-- ✅ Will return 0, because COUNT(Department) only counts non-NULL values. 
-- Since you're checking for NULLs, the expression inside COUNT() is ignored if NULL.

-- SELECT COUNT(*) FROM Employees WHERE Department IS NULL;
-- COUNT(*) counts all rows, including those where Department is NULL 
-- (since the filter is in WHERE, not inside the function).
-- So it will correctly return the number of employees without a department.

-- GROUP BY
-- The GROUP BY clause is used in SQL to group rows that have the same values in specified columns. 
-- It is commonly used with aggregate functions like SUM(), AVG(), COUNT(), etc.
-- 📌 Syntax:
-- SELECT column_name, AGGREGATE_FUNCTION(column)
-- FROM table_name
-- GROUP BY column_name;

-- SELECT Department, SUM(Salary) 
-- FROM Employees
-- GROUP BY Department; 

-- HAVING
-- The HAVING clause is used to filter the results of a GROUP BY based on aggregate functions.
-- 📌 Syntax:
-- SELECT column_name, AGGREGATE_FUNCTION(column)
-- FROM table_name
-- GROUP BY column_name
-- HAVING AGGREGATE_FUNCTION(column) condition;

-- SELECT Department, SUM(Salary) 
-- FROM Employees
-- GROUP BY Department
-- HAVING SUM(Salary) > 50000; 

-- 🧠 Intermediate-Level Aggregate Challenges
-- 5.Show the total salary paid to employees in each department.
-- SELECT Department, SUM(Salary) AS Total_Salary
-- FROM Employees
-- GROUP BY Department;

-- 6.Find the average age of employees in each department.
-- SELECT Department, AVG(Age) AS avg_age
-- FROM Employees
-- GROUP BY Department;

-- 7.Which department has the maximum number of employees?
-- (Hint: GROUP BY + ORDER BY + LIMIT 1)
-- SELECT Department, COUNT(Department) AS no_of_employees
-- FROM Employees
-- GROUP BY Department
-- ORDER BY no_of_employees
-- LIMIT 1;

-- 8.Display the department(s) where the average salary is more than 40,000.
-- SELECT Department, AVG(Salary) AS avg_salary
-- FROM Employees
-- GROUP BY Department;

-- 9.Count how many employees joined in each year.
-- (Hint: Use YEAR(JoiningDate) if your SQL supports it)
-- SELECT YEAR(JoiningDate), COUNT(JoiningDate)
-- FROM Employees
-- GROUP BY YEAR(JoiningDate);

-- 10.Get the number of distinct departments employees belong to.
-- SELECT COUNT(DISTINCT Department) FROM Employees;

-- 💥 Tricky Ones
-- 11.Find the employee(s) with the highest salary.
-- (Without using MAX() in WHERE clause directly!)
-- SELECT Name, Salary
-- FROM Employees
-- ORDER BY Salary DESC
-- LIMIT 1;

-- 12.List departments where the minimum salary is greater than 30,000.
-- SELECT Department, MIN(Salary)
-- FROM Employees
-- GROUP BY Department
-- HAVING MIN(Salary) > 30000;

-- 13.Find the difference between the highest and lowest salary.
-- SELECT MAX(Salary) - MIN(Salary) FROM Employees;

-- 14.Show the average salary of employees who are above 25 years of age.
-- SELECT Age, AVG(Salary) 
-- FROM Employees
-- GROUP BY Age
-- HAVING Age > 25;

-- 15.List departments where more than one employee works.
-- SELECT Department, COUNT(*)
-- FROM Employees
-- GROUP BY Department
-- HAVING COUNT(*) > 1;


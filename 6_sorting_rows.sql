-- ORDER BY
-- To sort the table according to  column we use 
-- ORDER BY clause, the default order is ASC
-- It also has DESC

-- 1. List all Employees Ordered by Salary (Highest to Lowest)
-- Show Name, Salary, and Department, ordered from highest salary to lowest.
-- ALTER TABLE Employees DROP COLUMN PhoneNumber;

-- INSERT INTO Employees(
--     EmployeeID,
--     Name,
--     Age,
--     Department,
--     Salary,
--     JoiningDate
-- ) VALUES (104,'Charles',24,'IT',40000,'2025-01-28'),
-- (105,'Ruby',22,'IT',42000,'2025-02-28'),
-- (106,'Lucy',26,'IT',62000,'2018-01-28'),
-- (107,'Bruce',24,'IT',50000,'2022-05-20'),
-- (108,'Ben',24,'IT',50000,'2022-07-20');

-- INSERT INTO Employees(
--     EmployeeID,
--     Name,
--     Age,
--     Salary,
--     JoiningDate
-- ) VALUES (109,'Martin',27,50000,'2022-07-20');

-- SELECT * FROM Employees
-- ORDER BY Salary ASC , Age DESC; 

-- SELECT * FROM Employees
-- ORDER BY Salary, JoiningDate;

-- Answer
-- SELECT Name, Salary, Department FROM Employees
-- ORDER BY Salary DESC;

-- 2. Display Employees by Joining Date (Most Recent First)
-- List Name, JoiningDate sorted so that the most recently joined employee appears first.
-- SELECT Name, JoiningDate FROM Employees
-- ORDER BY JoiningDate DESC;

-- 3. List Employees Ordered by Department Alphabetically and Salary Descending
-- Show Name, Department, Salary — sorted by Department (A-Z) and within each department by highest salary.
-- SELECT Name, Department, Salary FROM Employees
-- ORDER BY Department ASC, Salary DESC;

-- 4. Rank Employees by Age but Show Oldest First
-- Display EmployeeID, Name, Age ordered from oldest to youngest.
-- SELECT EmployeeID, Name, Age FROM Employees
-- ORDER BY Age DESC;

-- 5. Retrieve the Top 3 Highest-Paid Employees
-- Write a query that shows only the top 3 employees with the highest salary using ORDER BY and LIMIT.
-- (Note: In some SQL dialects, you can use FETCH FIRST 3 ROWS ONLY instead of LIMIT 3.)
-- SELECT * FROM Employees
-- ORDER BY Salary DESC LIMIT 3;

-- 6. Show Employees Ordered by Email Domain Name
-- Extract the domain part of the email (after @) and order the employees based on it. Show Name, Email.
-- 💡 Hint: Use SUBSTRING_INDEX() in MySQL or SPLIT_PART() in PostgreSQL to extract the domain.
-- SELECT Name, Email FROM Employees
-- ORDER BY SUBSTRING_INDEX(Email,'@',-1) ASC;

-- 7. Show Employees in Reverse Alphabetical Order by Name
-- Simple, but sneaky! List employees in Z → A order by name.
-- SELECT Name FROM Employees 
-- ORDER BY Name DESC;

-- 8. Retrieve Employees Ordered by the Length of Their Department Name
-- Show Name, Department, ordered by the number of characters in the department name.
-- SELECT Name, Department FROM Employees
-- ORDER BY LENGTH(Department);

-- 9. List Employees Ordered by Null Department First
-- List employees where those with NULL in Department appear at the top, then the rest alphabetically by department.
-- SELECT * FROM Employees
-- ORDER BY Department ASC;

-- 10. Complex Sort: By Age Descending, Then By Salary Ascending
-- If two employees have the same age, the one with less salary should come first.
-- SELECT * FROM Employees
-- ORDER BY Age DESC, Salary ASC;
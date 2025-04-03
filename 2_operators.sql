-- Arithmetic Operators : +,-,*,/,%
-- Comparison Operators : =,!= or <>,>,<,>=,<=,BETWEEN,IN,NOT,IN,LIKE,NOT LIKE
-- Logical Operators : AND,OR,NOT
-- IS NULL,IS NOT NULL,CASE

-- CASE 
-- WHEN condition
-- THEN operation
-- ELSE operation

-- Date and Time
-- DATE - Stores only date (YYYY-MM-DD)
-- TIME - Stores only time (HH:MI:SS)
-- DATETIME - Stores date and time (YYYY-MM-DD HH:MI:SS)
-- TIMESTAMP - Stores date & time, used for tracking updates (auto-updates)
-- YEAR - Stores only year (YYYY)

-- Retrieving Date & Time
-- NOW() - Returns current date and time
-- CURDATE() - Returns current date
-- CURTIME() - Returns current time
-- SYSDATE() - Returns the system's current date and time
-- UTC_TIMESTAMP() - Returns the current UTC date & time

-- ALTER TABLE users ADD COLUMN dob DATE NOT NULL DEFAULT '2025-05-17';
-- UPDATE users SET dob = NOW();
-- UPDATE users SET dob = '2004-03-08' WHERE username LIKE 'Par%'; 
-- UPDATE users SET dob = '2004-05-17' WHERE username LIKE 'Sush%'; 
-- ALTER TABLE users ADD COLUMN login_time TIME;
-- UPDATE users SET login_time = CURTIME(); 

-- Extracting Date & Time Parts
-- YEAR(date)	Extracts year	
-- MONTH(date)	Extracts month	
-- DAY(date)	Extracts day	
-- HOUR(time)	Extracts hour	
-- MINUTE(time)	Extracts minute	
-- SECOND(time)	Extracts second	
-- DAYNAME(date)	Returns day of the week	
-- MONTHNAME(date)	Returns month name

-- SELECT username, YEAR(dob) FROM users;
-- SELECT username, MONTH(dob) FROM users;
-- SELECT username, MONTHNAME(dob) FROM users;
-- SELECT username, DAYNAME(dob) FROM users;

-- Formatting Dates & Times
-- DATE_FORMAT(date, format)	Formats a date	
-- TIME_FORMAT(time, format)	Formats a time
-- SELECT user_id, DATE_FORMAT(dob,'%d/%m/%y') AS DOB FROM users;
-- SELECT user_id, DATE_FORMAT(dob,'%D %M %Y - %W') AS DOB FROM users;


-- Format	Description	Example Output
-- %Y	Year (4 digits)	2025
-- %y	Year (2 digits)	25
-- %M	Month name	March
-- %m	Month (2 digits)	03
-- %D	Day with suffix	25th
-- %d	Day (2 digits)	25
-- %W	Day of the week	Tuesday
-- %H	Hour (24-hour)	14
-- %h	Hour (12-hour)	02
-- %i	Minutes	30
-- %s	Seconds	00
-- %p	AM/PM	PM

-- Performing Date Calculations
-- Function	Description	Example	Output
-- ADDDATE(date, INTERVAL n unit)	Adds days, months, or years	SELECT ADDDATE('2025-03-25', INTERVAL 10 DAY);	'2025-04-04'
-- SUBDATE(date, INTERVAL n unit)	Subtracts days, months, or years	SELECT SUBDATE('2025-03-25', INTERVAL 10 DAY);	'2025-03-15'
-- DATE_ADD(date, INTERVAL n unit)	Same as ADDDATE()	SELECT DATE_ADD('2025-03-25', INTERVAL 1 MONTH);	'2025-04-25'
-- DATE_SUB(date, INTERVAL n unit)	Same as SUBDATE()	SELECT DATE_SUB('2025-03-25', INTERVAL 1 YEAR);	'2024-03-25'
-- DATEDIFF(date1, date2)	Returns days between two dates	SELECT DATEDIFF('2025-04-10', '2025-03-25');	16
-- TIMEDIFF(time1, time2)	Returns time difference SELECT TIMEDIFF('14:30:00', '12:15:00');	'02:15:00'

-- Practice Questions
-- 1️⃣ Retrieve the current date.
-- SELECT CURDATE();

-- 2️⃣ Retrieve the current time.
-- SELECT CURTIME();

-- 3️⃣ Retrieve the current date and time.
-- SELECT NOW();

-- 4️⃣ Extract the year from '2024-09-15'.
-- SELECT YEAR('2024-09-15');

-- 5️⃣ Extract the day name from '2025-12-25'.
-- SELECT DAY('2025-12-25');

-- 6️⃣ Add 15 days to '2025-03-10'.
-- SELECT ADDDATE('2025-03-10', INTERVAL 15 DAY);

-- 7️⃣ Subtract 2 months from '2025-06-01'.
-- SELECT SUBDATE('2025-06-01', INTERVAL 2 MONTH);

-- 8️⃣ Find the number of days between '2025-03-10' and '2025-04-01'.
-- SELECT DATEDIFF('2025-04-01','2025-03-10');

-- 9️⃣ Find all employees who joined in the last 6 months.
-- SELECT * FROM users WHERE joining_date BETWEEN SUBDATE(CURDATE(), INTERVAL 6 MONTH) AND CURDATE();

-- 🔟 Get the employees whose age is greater than 30 years.
-- SELECT * FROM users WHERE DATEDIFF(dob,CURDATE()) > 30;



-- 1️⃣ Retrieve the first day of the current month.
-- Expected Output: '2025-03-01' (if today is in March 2025)
-- SELECT DATE_FORMAT(CURDATE(),'%Y-%m-01');

-- 2️⃣ Retrieve the last day of the current month.
-- Expected Output: '2025-03-31' (if today is in March 2025)
-- SELECT LAST_DAY(CURDATE());

-- 3️⃣ Find the difference in months between '2024-06-01' and '2025-06-01'.
-- Expected Output: 12
-- SELECT TIMESTAMPDIFF(MONTH,'2024-06-01','2025-06-01');

-- 4️⃣ Extract the quarter of '2025-09-15'.
-- Expected Output: 3 (September falls in Q3)
-- SELECT QUARTER('2025-09-15');

-- 5️⃣ Retrieve the current week number of the year.
-- Expected Output: 10 (if the current week is the 10th week of the year)
-- SELECT WEEK(CURDATE());

-- 6️⃣ Add 1 year, 3 months, and 10 days to '2025-05-20'.
-- Expected Output: '2026-08-30'
-- SELECT DATE_ADD('2025-05-20', INTERVAL 1 YEAR) + INTERVAL 3 MONTH + INTERVAL 10 DAY;



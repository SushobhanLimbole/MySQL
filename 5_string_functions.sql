-- 🔠 String Functions in SQL

-- 1. LENGTH(str)
-- Description: Returns the length in bytes of the string.
-- LENGTH('Hi') → 2
-- LENGTH('Data123') → 7

-- 2. CHAR_LENGTH(str)
-- Description: Returns the number of characters in the string.
-- CHAR_LENGTH('😊abc') → 4
-- CHAR_LENGTH('SQL') → 3

-- 3. CONCAT(s1, s2, …)
-- Description: Concatenates (joins) multiple strings together.
-- CONCAT('SQL', ' Server') → SQL Server
-- CONCAT('Data', 'Base') → DataBase

-- 4. CONCAT_WS(separator, s1, s2, …)
-- Description: Concatenates strings using a separator.
-- CONCAT_WS('-', '2024', '04', '06') → 2024-04-06
-- CONCAT_WS(':', '10', '30') → 10:30

-- 5. SUBSTRING(str, start, length)
-- Description: Extracts a substring starting from a given position.
-- SUBSTRING('Database', 5, 3) → bas
-- SUBSTRING('HelloWorld', 1, 5) → Hello

-- 6. SUBSTRING_INDEX(str, delim, count)
-- Description: Returns substring before/after a delimiter based on count.
-- Parameters
-- str: The original string you want to cut.

-- delim: The delimiter (like '@', '.', '/', etc.) that separates parts of the string.

-- count: Number of times to look for the delimiter:

-- Positive number → returns from the start

-- Negative number → returns from the end

-- ✅ Examples:
-- 1️⃣ Get the first name from an email:
-- SELECT SUBSTRING_INDEX('john.doe@gmail.com', '@', 1);
-- -- Output: john.doe

-- 2️⃣ Get the domain name:
-- SELECT SUBSTRING_INDEX('john.doe@gmail.com', '@', -1);
-- -- Output: gmail.com

-- 3️⃣ Break down a full name:
-- SELECT SUBSTRING_INDEX('Ravi Kumar Singh', ' ', 2);
-- -- Output: Ravi Kumar

-- 4️⃣ Get last part of URL:
-- SELECT SUBSTRING_INDEX('https://example.com/users/123', '/', -1);
-- -- Output: 123

-- 7. UPPER(str)
-- Description: Converts string to uppercase.
-- UPPER('sql') → SQL
-- UPPER('hello world') → HELLO WORLD

-- 8. LOWER(str)
-- Description: Converts string to lowercase.
-- LOWER('PYTHON') → python
-- LOWER('Data123') → data123

-- 9. LTRIM(str)
-- Description: Removes leading whitespace.
-- LTRIM(' SQL') → SQL
-- LTRIM(' Hello') → Hello

-- 10. RTRIM(str)
-- Description: Removes trailing whitespace.
-- RTRIM('SQL ') → SQL
-- RTRIM('Test ') → Test

-- 11. TRIM(str)
-- Description: Removes whitespace from both ends.
-- TRIM(' SQL ') → SQL
-- TRIM(' Hello ') → Hello

-- 12. REPLACE(str, from, to)
-- Description: Replaces all occurrences of a substring.
-- REPLACE('cat', 'c', 'b') → bat
-- REPLACE('aaa', 'a', 'b') → bbb

-- 13. INSTR(str, substr)
-- Description: Returns the position of first occurrence of substr in str (1-based).
-- INSTR('banana', 'n') → 3
-- INSTR('email@host.com', '@') → 6

-- 14. LOCATE(substr, str)
-- Description: Same as INSTR, but with reversed parameter order.
-- LOCATE('a', 'banana') → 2
-- LOCATE('com', 'test.com') → 6

-- 15. REVERSE(str)
-- Description: Reverses the characters in the string.
-- REVERSE('abc') → cba
-- REVERSE('12345') → 54321

-- 16. LEFT(str, n)
-- Description: Returns the first n characters from the string.
-- LEFT('Database', 4) → Data
-- LEFT('SQLWorld', 3) → SQL

-- 17. RIGHT(str, n)
-- Description: Returns the last n characters from the string.
-- RIGHT('Database', 4) → base
-- RIGHT('SQLWorld', 5) → World

-- 18. LPAD(str, len, pad)
-- Description: Pads the string from the left to a total length using the pad string.
-- LPAD('5', 3, '0') → 005
-- LPAD('abc', 6, '*') → ***abc

-- 19. RPAD(str, len, pad)
-- Description: Pads the string from the right to a total length using the pad string.
-- RPAD('5', 3, '0') → 500
-- RPAD('abc', 6, '*') → abc***

-- 20. ASCII(str)
-- Description: Returns the ASCII value of the first character.
-- ASCII('A') → 65
-- ASCII('z') → 122

-- 21. FIELD(str, val1, val2, …)
-- Description: Returns the index of str in the list of values.
-- FIELD('b', 'a', 'b', 'c') → 2
-- FIELD('SQL', 'C', 'SQL', 'DB') → 2
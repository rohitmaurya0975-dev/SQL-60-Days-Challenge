-- =====================================================
-- DAY 03 - SQL DEBUGGING
-- Topic: IN, NOT IN, BETWEEN, LIKE, AND
-- =====================================================

-- Instructions:
-- Each query below contains an intentional mistake.
-- Identify the mistake, understand why it is wrong,
-- and write the corrected query below it.


-- =====================================================
-- DEBUGGING 1 — IN
-- =====================================================

-- Goal:
-- Find employees from IT, HR, or Finance.

-- Incorrect Query:

SELECT *
FROM employee2
WHERE department IN 'IT', 'HR', 'Finance';


-- Your Correct Query:
-- Write the corrected query below.

SELECT *
FROM employee2
WHERE department IN ('IT', 'HR', 'Finance');


-- =====================================================
-- DEBUGGING 2 — BETWEEN
-- =====================================================

-- Goal:
-- Find employees whose salary is between 50,000 and 65,000.

-- Incorrect Query:

SELECT *
FROM employee2
WHERE salary BETWEEN 50000 TO 65000;


-- Your Correct Query:
-- Write the corrected query below.
SELECT *
FROM employee2
WHERE salary BETWEEN 50000 AND 65000;


-- =====================================================
-- DEBUGGING 3 — LIKE
-- =====================================================

-- Goal:
-- Find employees whose names start with 'A'.

-- Incorrect Query:

SELECT *
FROM employee2
WHERE name LIKE A%;


-- Your Correct Query:
-- Write the corrected query below.

SELECT *
FROM employee2
WHERE name LIKE 'A%';


-- =====================================================
-- DEBUGGING 4 — NOT IN
-- =====================================================

-- Goal:
-- Find employees who are NOT from Sales or Marketing.

-- Incorrect Query:

SELECT *
FROM employee2
WHERE department NOT IN 'Sales', 'Marketing';


-- Your Correct Query:
-- Write the corrected query below.
SELECT *
FROM employee2
WHERE department NOT IN ('Sales', 'Marketing');



-- =====================================================
-- DEBUGGING 5 — AND
-- =====================================================

-- Goal:
-- Find IT employees whose salary is greater than 65,000.

-- Incorrect Query:

SELECT *
FROM employee2
WHERE department = 'IT'
OR salary > 65000;


-- Your Correct Query:
-- Write the corrected query below.
SELECT *
FROM employee2
WHERE department = 'IT'
AND  salary > 65000;


-- =====================================================
-- DEBUGGING 6 — BETWEEN + AND
-- =====================================================

-- Goal:
-- Find Finance employees whose salary is between
-- 55,000 and 65,000.

-- Incorrect Query:

SELECT *
FROM employee2
WHERE department = 'Finance'
AND salary BETWEEN 55000 OR 65000;


-- Your Correct Query:
-- Write the corrected query below.
SELECT *
FROM employee2
WHERE department = 'Finance'
AND salary BETWEEN 55000 AND  65000;


-- =====================================================
-- DEBUGGING 7 — LIKE PATTERN
-- =====================================================

-- Goal:
-- Find employees whose names contain the letter 'a'.

-- Incorrect Query:

SELECT *
FROM employee2
WHERE name LIKE '%a';


-- Your Correct Query:
-- Write the corrected query below.
SELECT *
FROM employee2
WHERE name LIKE '%a%';



-- =====================================================
-- DEBUGGING 8 — COMBINED CONDITIONS
-- =====================================================

-- Goal:
-- Find employees who:
-- 1. Belong to IT or Finance
-- 2. Have salary between 60,000 and 75,000

-- Incorrect Query:

SELECT *
FROM employee2
WHERE department IN ('IT' OR 'Finance')
AND salary BETWEEN 60000 AND 75000;


-- Your Correct Query:
-- Write the corrected query below.
SELECT *
FROM employee2
WHERE department IN ('IT','Finance')
AND salary BETWEEN 60000 AND 75000;


-- =====================================================
-- DEBUGGING 9 — CITY FILTER
-- =====================================================

-- Goal:
-- Find employees from Delhi, Mumbai, or Pune.

-- Incorrect Query:

SELECT *
FROM employee2
WHERE city = ('Delhi', 'Mumbai', 'Pune');


-- Your Correct Query:
-- Write the corrected query below.
SELECT *
FROM employee2
WHERE city IN ('Delhi', 'Mumbai', 'Pune');


-- =====================================================
-- DEBUGGING 10 — FINAL DEBUGGING CHALLENGE
-- =====================================================

-- Goal:
-- Find employees who:
-- 1. Belong to IT or Finance
-- 2. Are from Delhi, Mumbai, or Pune
-- 3. Have salary between 60,000 and 75,000
-- 4. Their name contains the letter 'a'

-- Incorrect Query:

SELECT name, department, city, salary
FROM employee2
WHERE department IN ('IT' OR 'Finance')
AND city IN 'Delhi', 'Mumbai', 'Pune'
AND salary BETWEEN 60000 OR 75000
AND name LIKE '%a';


-- Your Correct Query:
-- Write the corrected query below.
SELECT name, department, city, salary
FROM employee2
WHERE department IN ('IT','Finance')
AND city IN ('Delhi', 'Mumbai', 'Pune')
AND salary BETWEEN 60000 AND  75000
AND name LIKE '%a%';


-- =====================================================
-- LEARNING GOAL
-- =====================================================

-- By completing this debugging exercise, I will learn:
--
-- 1. Correct IN syntax
-- 2. Correct NOT IN syntax
-- 3. Correct BETWEEN syntax
-- 4. Correct LIKE syntax
-- 5. Difference between AND and OR
-- 6. Combining multiple filtering conditions
-- 7. Common SQL syntax mistakes
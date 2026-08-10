-- ============================================
-- 60 DAYS SQL CHALLENGE
-- DAY 02 - DEBUGGING PRACTICE
-- Topic: COUNT, SUM, GROUP BY, HAVING
-- ============================================


-- ==================================================
-- DEBUGGING 1: COUNT()
-- ==================================================

-- Wrong Query:
-- SELECT COUNT
-- FROM employee2;

-- Problem:
-- COUNT is a function and requires parentheses.

-- Correct Query:

SELECT COUNT(*) AS total_employees
FROM employee2;


-- ==================================================
-- DEBUGGING 2: SUM()
-- ==================================================

-- Wrong Query:
-- SELECT SUM
-- FROM employee2;

-- Problem:
-- SUM() must contain the column that needs to be added.

-- Correct Query:

SELECT SUM(salary) AS total_salary
FROM employee2;


-- ==================================================
-- DEBUGGING 3: GROUP BY
-- ==================================================

-- Wrong Query:
-- SELECT department, COUNT(*)
-- FROM employee2;

-- Problem:
-- department is selected but not included in GROUP BY.

-- Correct Query:

SELECT department,
       COUNT(*) AS employee_count
FROM employee2
GROUP BY department;


-- ==================================================
-- DEBUGGING 4: GROUP BY
-- ==================================================

-- Wrong Query:
-- SELECT city, SUM(salary)
-- FROM employee2
-- GROUP BY department;

-- Problem:
-- The selected column city does not match
-- the column used for grouping.

-- Correct Query:

SELECT city,
       SUM(salary) AS total_salary
FROM employee2
GROUP BY city;


-- ==================================================
-- DEBUGGING 5: HAVING
-- ==================================================

-- Wrong Query:
-- SELECT department,
--        SUM(salary) AS total_salary
-- FROM employee2
-- GROUP BY department
-- WHERE SUM(salary) > 150000;

-- Problem:
-- WHERE cannot be used with aggregate functions
-- like SUM() after GROUP BY.
-- HAVING should be used.

-- Correct Query:

SELECT department,
       SUM(salary) AS total_salary
FROM employee2
GROUP BY department
HAVING SUM(salary) > 150000;


-- ==================================================
-- DEBUGGING 6: HAVING
-- ==================================================

-- Wrong Query:
-- SELECT department,
--        AVG(salary) AS average_salary
-- FROM employee2
-- WHERE AVG(salary) > 55000
-- GROUP BY department;

-- Problem:
-- Aggregate functions cannot be used in WHERE.
-- Use HAVING after GROUP BY.

-- Correct Query:

SELECT department,
       AVG(salary) AS average_salary
FROM employee2
GROUP BY department
HAVING AVG(salary) > 55000;


-- ==================================================
-- DEBUGGING 7: COUNT + GROUP BY
-- ==================================================

-- Wrong Query:
-- SELECT department,
--        COUNT(*)
-- FROM employee2
-- GROUP department;

-- Problem:
-- GROUP BY keyword is incomplete.
-- It must be written as GROUP BY.

-- Correct Query:

SELECT department,
       COUNT(*) AS employee_count
FROM employee2
GROUP BY department;


-- ==================================================
-- DEBUGGING 8: SUM + GROUP BY + HAVING
-- ==================================================

-- Wrong Query:
-- SELECT department,
--        SUM(salary) AS total_salary
-- FROM employee2
-- GROUP BY department
-- HAVING salary > 150000;

-- Problem:
-- HAVING should use the aggregate result
-- when filtering grouped data.

-- Correct Query:

SELECT department,
       SUM(salary) AS total_salary
FROM employee2
GROUP BY department
HAVING SUM(salary) > 150000;


-- ==================================================
-- DEBUGGING 9: AVG + GROUP BY
-- ==================================================

-- Wrong Query:
-- SELECT department,
--        AVG(salary)
-- FROM employee2
-- GROUP BY city;

-- Problem:
-- department is selected, but the query groups
-- the data by city.

-- Correct Query:

SELECT department,
       AVG(salary) AS average_salary
FROM employee2
GROUP BY department;


-- ==================================================
-- DEBUGGING 10: COUNT + HAVING
-- ==================================================

-- Wrong Query:
-- SELECT department,
--        COUNT(*) AS employee_count
-- FROM employee2
-- GROUP BY department
-- HAVING employee_count > 2;

-- Problem:
-- Depending on SQL dialect, SELECT aliases
-- should not be relied upon in HAVING.
-- Using COUNT(*) directly is clearer and portable.

-- Correct Query:

SELECT department,
       COUNT(*) AS employee_count
FROM employee2
GROUP BY department
HAVING COUNT(*) > 2;
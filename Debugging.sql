-- ==========================================
-- 60 DAYS SQL CHALLENGE
-- DAY 01 — DEBUGGING PRACTICE
-- ==========================================


-- Debugging 1:
-- Find and fix the errors.

-- Wrong Query:
-- SELECT name salary
-- FROM employee2
-- WHERE department = IT;


-- Correct Query:

SELECT name, salary
FROM employee2
WHERE department = 'IT';


-- Debugging 2:
-- Find and fix the errors.

-- Wrong Query:
-- SELECT *
-- FROM employee2
-- WHERE salary => 50000;


-- Correct Query:

SELECT *
FROM employee2
WHERE salary >= 50000;


-- Debugging 3:
-- Find and fix the errors.

-- Wrong Query:
-- SELECT *
-- FROM employee2
-- ORDER salary DESC;


-- Correct Query:

SELECT *
FROM employee2
ORDER BY salary DESC;
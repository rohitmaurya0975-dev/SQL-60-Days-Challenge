-- ==========================================
-- 60 DAYS SQL CHALLENGE
-- DAY 01 — CHALLENGE
-- ==========================================

-- Challenge 1:
-- Find employees who earn more than 60000.

SELECT *
FROM employee2
WHERE salary > 60000;


-- Challenge 2:
-- Display the names of employees
-- who work in the IT department.

SELECT name
FROM employee2
WHERE department = 'IT';


-- Challenge 3:
-- Display employees from Mumbai
-- ordered by salary from highest to lowest.

SELECT *
FROM employee2
WHERE city = 'Mumbai'
ORDER BY salary DESC;
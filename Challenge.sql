-- ============================================
-- 60 DAYS SQL CHALLENGE
-- DAY 02 - CHALLENGE
-- Topic: Aggregate Functions
-- ============================================


-- Challenge 1:
-- Find the total number of employees
-- in each department.
-- Display departments with the highest
-- number of employees first.

SELECT department,
       COUNT(*) AS employee_count
FROM employee2
GROUP BY department
ORDER BY employee_count DESC;


-- Challenge 2:
-- Find the department with the lowest
-- total salary.

SELECT department,
       SUM(salary) AS total_salary
FROM employee2
GROUP BY department
ORDER BY total_salary ASC
LIMIT 1;


-- Challenge 3:
-- Find the city with the highest
-- average salary.

SELECT city,
       AVG(salary) AS average_salary
FROM employee2
GROUP BY city
ORDER BY average_salary DESC
LIMIT 1;


-- Challenge 4:
-- Find departments where:
-- 1. Number of employees is at least 2
-- 2. Total salary is greater than 100000

SELECT department,
       COUNT(*) AS employee_count,
       SUM(salary) AS total_salary
FROM employee2
GROUP BY department
HAVING COUNT(*) >= 2
   AND SUM(salary) > 100000;


-- Challenge 5:
-- Find the total salary and average salary
-- for each department.
-- Display only departments whose
-- average salary is greater than 50000.

SELECT department,
       SUM(salary) AS total_salary,
       AVG(salary) AS average_salary
FROM employee2
GROUP BY department
HAVING AVG(salary) > 50000
ORDER BY average_salary DESC;
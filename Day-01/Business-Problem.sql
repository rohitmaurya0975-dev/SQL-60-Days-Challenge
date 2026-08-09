-- ==========================================
-- 60 DAYS SQL CHALLENGE
-- DAY 01 — BUSINESS PROBLEM
-- ==========================================


-- Business Problem 1:
-- HR wants to find employees earning
-- more than 55000.
-- Display Name, Department and Salary.

SELECT name, department, salary
FROM employee2
WHERE salary > 55000;


-- Business Problem 2:
-- Management wants to identify employees
-- working in the IT department.
-- Display Name, Salary and City.

SELECT name, salary, city
FROM employee2
WHERE department = 'IT';


-- Business Problem 3:
-- The company wants to review employees
-- from Delhi.
-- Display Name, Department and Salary
-- ordered by salary from highest to lowest.

SELECT name, department, salary
FROM employee2
WHERE city = 'Delhi'
ORDER BY salary DESC;
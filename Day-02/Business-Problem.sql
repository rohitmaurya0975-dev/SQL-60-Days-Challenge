-- ============================================
-- 60 DAYS SQL CHALLENGE
-- DAY 02 - BUSINESS PROBLEM SOLVING
-- Topic: Aggregate Functions
-- ============================================


-- ==================================================
-- BUSINESS PROBLEM 1
-- ==================================================
-- HR wants to know how many employees
-- are working in each department.
--
-- Required Output:
-- Department
-- Number of Employees

SELECT department,
       COUNT(*) AS employee_count
FROM employee2
GROUP BY department;


-- ==================================================
-- BUSINESS PROBLEM 2
-- ==================================================
-- Finance wants to know the total salary
-- expense for each department.
--
-- Required Output:
-- Department
-- Total Salary

SELECT department,
       SUM(salary) AS total_salary
FROM employee2
GROUP BY department
ORDER BY total_salary DESC;


-- ==================================================
-- BUSINESS PROBLEM 3
-- ==================================================
-- Management wants to know the average salary
-- for each department.
--
-- Required Output:
-- Department
-- Average Salary

SELECT department,
       AVG(salary) AS average_salary
FROM employee2
GROUP BY department
ORDER BY average_salary DESC;


-- ==================================================
-- BUSINESS PROBLEM 4
-- ==================================================
-- Management wants to identify departments
-- whose total salary expense is greater
-- than 150000.
--
-- Required Output:
-- Department
-- Total Salary

SELECT department,
       SUM(salary) AS total_salary
FROM employee2
GROUP BY department
HAVING SUM(salary) > 150000;


-- ==================================================
-- BUSINESS PROBLEM 5
-- ==================================================
-- HR wants to identify departments where
-- the average employee salary is greater
-- than 55000.
--
-- Required Output:
-- Department
-- Average Salary

SELECT department,
       AVG(salary) AS average_salary
FROM employee2
GROUP BY department
HAVING AVG(salary) > 55000;


-- ==================================================
-- BUSINESS PROBLEM 6
-- ==================================================
-- Management wants to know which city has
-- the highest number of employees.
--
-- Required Output:
-- City
-- Employee Count

SELECT city,
       COUNT(*) AS employee_count
FROM employee2
GROUP BY city
ORDER BY employee_count DESC
LIMIT 1;


-- ==================================================
-- BUSINESS PROBLEM 7
-- ==================================================
-- Finance wants to know the total salary
-- expense for each city.
--
-- Required Output:
-- City
-- Total Salary

SELECT city,
       SUM(salary) AS total_salary
FROM employee2
GROUP BY city
ORDER BY total_salary DESC;


-- ==================================================
-- BUSINESS PROBLEM 8
-- ==================================================
-- Management wants to find cities where
-- total salary expense is greater than 100000.
--
-- Required Output:
-- City
-- Total Salary

SELECT city,
       SUM(salary) AS total_salary
FROM employee2
GROUP BY city
HAVING SUM(salary) > 100000;

-- ==================================================
-- BUSINESS PROBLEM 9
-- ==================================================

-- HR wants to know the highest salary
-- in each department.
--
-- Required Output:
-- Department
-- Highest Salary

SELECT department,
       MAX(salary) AS highest_salary
FROM employee2
GROUP BY department
ORDER BY highest_salary DESC;


-- ==================================================
-- BUSINESS PROBLEM 10
-- ==================================================
-- Management wants a department-level report
-- containing:
-- 1. Number of Employees
-- 2. Total Salary
-- 3. Average Salary
-- 4. Highest Salary
-- 5. Lowest Salary
--
-- Required Output:
-- Department
-- Employee Count
-- Total Salary
-- Average Salary
-- Highest Salary
-- Lowest Salary

SELECT department,
       COUNT(*) AS employee_count,
       SUM(salary) AS total_salary,
       AVG(salary) AS average_salary,
       MAX(salary) AS highest_salary,
       MIN(salary) AS lowest_salary
FROM employee2
GROUP BY department
ORDER BY total_salary DESC;
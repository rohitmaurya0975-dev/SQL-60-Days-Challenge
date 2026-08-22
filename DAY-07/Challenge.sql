-- =====================================================
-- DAY 07 - SELF JOIN
-- CHALLENGE PRACTICE
-- Table: employees_hierarchy
-- Difficulty: 🔥 Advanced
-- =====================================================


-- =====================================================
-- CHALLENGE 1
-- Highest Paid Employee vs Manager
-- =====================================================

-- Find employees whose salary is higher than their manager's salary.
--
-- Display:
-- employee_name
-- employee_department
-- employee_salary
-- manager_name
-- manager_salary
-- salary_difference
--
-- Sort by salary_difference DESC.


-- =====================================================
-- CHALLENGE 2
-- Manager Team Size + Average Salary
-- =====================================================

-- Find every manager who has at least 2 direct employees.
--
-- Display:
-- manager_name
-- total_employees
-- average_team_salary
--
-- Sort by total_employees DESC,
-- then average_team_salary DESC.
--
-- Hint:
-- SELF JOIN + GROUP BY + COUNT() + AVG() + HAVING


-- =====================================================
-- CHALLENGE 3
-- Manager With Highest Team Salary
-- =====================================================

-- Find the manager whose direct team's
-- total salary is the highest.
--
-- Display:
-- manager_name
-- total_team_salary
--
-- Only return the TOP 1 manager.
--
-- Hint:
-- SELF JOIN + SUM() + GROUP BY + ORDER BY + LIMIT


-- =====================================================
-- CHALLENGE 4
-- Employee vs Manager Experience Gap
-- =====================================================

-- Find employees whose manager has at least
-- 3 more years of experience than the employee.
--
-- Display:
-- employee_name
-- employee_experience
-- manager_name
-- manager_experience
-- experience_difference
--
-- Sort by experience_difference DESC.


-- =====================================================
-- CHALLENGE 5 🔥
-- Complete Manager Performance Analysis
-- =====================================================

-- Create a manager analysis report.
--
-- Show managers who:
--
-- 1. Have at least 2 direct employees
-- 2. Have an average team salary greater than 55000
-- 3. Belong to IT, Finance, HR, Sales or Marketing
--
-- Display:
-- manager_name
-- manager_department
-- total_employees
-- average_team_salary
-- highest_employee_salary
-- lowest_employee_salary
--
-- Sort by average_team_salary DESC.
--
-- Hint:
-- SELF JOIN
-- GROUP BY
-- COUNT()
-- AVG()
-- MAX()
-- MIN()
-- HAVING
-- ORDER BY


-- =====================================================
-- 🧠 BONUS CHALLENGE
-- Multi-Level Thinking
-- =====================================================

-- Find employees who:
--
-- 1. Have a manager
-- 2. Their manager also has a manager
-- 3. Their salary is lower than their manager's salary
--
-- Display:
-- employee_name
-- employee_salary
-- manager_name
-- manager_salary
-- senior_manager_name
--
-- Hint:
-- You will need to use the SAME TABLE
-- more than two times.
--
-- Example:
--
-- employee → manager → senior manager
--
-- employees_hierarchy AS e
-- employees_hierarchy AS m
-- employees_hierarchy AS sm


-- =====================================================
-- 🎯 CHALLENGE RULE
-- =====================================================

-- Do NOT use:
-- Subqueries
-- CTEs
--
-- Try solving these challenges using
-- SELF JOIN + GROUP BY + HAVING + ORDER BY.
--
-- BONUS challenge may require
-- multiple SELF JOINs.


-- =====================================================
-- DAY 07 CHALLENGE
-- =====================================================
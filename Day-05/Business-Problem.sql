-- =====================================================
-- DAY 05 - BUSINESS PROBLEMS
-- Topic: INNER JOIN in Real-World Scenarios
-- Tables: employee2 + departments
-- =====================================================


-- =====================================================
-- BUSINESS PROBLEM 1
-- =====================================================

-- HR wants a list of all employees with their
-- department names.
--
-- Display:
-- employee_name
-- department_name
-- salary


-- Write your query below:



-- =====================================================
-- BUSINESS PROBLEM 2
-- =====================================================

-- Management wants to find employees earning
-- more than 60000.
--
-- Display:
-- employee_name
-- department_name
-- salary
--
-- Highest salary should appear first.


-- Write your query below:



-- =====================================================
-- BUSINESS PROBLEM 3
-- =====================================================

-- The IT manager wants employees from IT
-- whose salary is at least 65000.
--
-- Display:
-- employee_name
-- department_name
-- salary


-- Write your query below:



-- =====================================================
-- BUSINESS PROBLEM 4
-- =====================================================

-- Finance management wants employees whose salary
-- is at least 60000.
--
-- Display:
-- employee_name
-- department_name
-- salary
--
-- Sort salary from highest to lowest.


-- Write your query below:



-- =====================================================
-- BUSINESS PROBLEM 5
-- =====================================================

-- HR wants employees from IT, Finance and HR
-- who meet these salary requirements:
--
-- IT       → salary >= 65000
-- Finance  → salary >= 60000
-- HR       → salary >= 55000
--
-- Display:
-- employee_name
-- department_name
-- salary


-- Write your query below:



-- =====================================================
-- BUSINESS PROBLEM 6
-- =====================================================

-- Management wants to exclude HR employees.
--
-- Find employees who:
-- 1. Are NOT in HR
-- 2. Have salary >= 60000
--
-- Display:
-- employee_name
-- department_name
-- salary


-- Write your query below:



-- =====================================================
-- BUSINESS PROBLEM 7
-- =====================================================

-- The company wants to identify employees from
-- Sales and Marketing departments.
--
-- Display:
-- employee_name
-- department_name
-- salary
--
-- Sort department alphabetically and salary
-- highest to lowest.


-- Write your query below:



-- =====================================================
-- BUSINESS PROBLEM 8
-- =====================================================

-- Management wants employees who satisfy either:
--
-- IT + salary >= 70000
-- OR
-- Sales + salary >= 60000
--
-- Display:
-- employee_name
-- department_name
-- salary


-- Write your query below:



-- =====================================================
-- BUSINESS PROBLEM 9
-- =====================================================

-- HR wants a list of employees whose salary
-- is between 50000 and 70000.
--
-- Display:
-- employee_name
-- department_name
-- salary
--
-- Highest salary first.


-- Write your query below:



-- =====================================================
-- BUSINESS PROBLEM 10 — FINAL BUSINESS CASE 🔥
-- =====================================================

-- Management is preparing a promotion shortlist.
--
-- Promotion rules:
--
-- IT:
-- salary >= 70000
--
-- Finance:
-- salary >= 65000
--
-- Sales:
-- salary >= 65000
--
-- HR:
-- salary >= 60000
--
-- Marketing:
-- salary >= 65000
--
-- Display:
-- employee_name
-- department_name
-- salary
--
-- Highest salary should appear first.
--
-- Use:
-- INNER JOIN
-- Table aliases
-- WHERE
-- AND
-- OR
-- ORDER BY


-- Write your final query below:



-- =====================================================
-- BUSINESS SKILL CHECK
-- =====================================================

-- Business Requirement
--        ↓
-- Identify required tables
--        ↓
-- Find common column
--        ↓
-- INNER JOIN
--        ↓
-- Apply business conditions
--        ↓
-- Sort result
--        ↓
-- Management-ready output
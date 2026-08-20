-- =====================================================
-- DAY 06 - JOIN CHALLENGE
-- Topic: LEFT JOIN & RIGHT JOIN
-- =====================================================


-- =====================================================
-- CHALLENGE 1
-- =====================================================

-- Management wants a complete employee list.
-- Every employee must appear, even if their department
-- does not have a matching record.
--
-- Display:
-- employee_name
-- department_name
-- salary
--
-- Requirement:
-- Use LEFT JOIN.


-- Write your query below:



-- =====================================================
-- CHALLENGE 2
-- =====================================================

-- Find employees whose department information
-- is missing or does not match the departments table.
--
-- Display:
-- employee_id
-- employee_name
-- department_id
--
-- Hint:
-- Use LEFT JOIN + IS NULL.


-- Write your query below:



-- =====================================================
-- CHALLENGE 3
-- =====================================================

-- Management wants a complete department list.
-- Every department must appear, even if it has
-- no employee.
--
-- Display:
-- department_id
-- department_name
-- employee_name
--
-- Requirement:
-- Use RIGHT JOIN.


-- Write your query below:



-- =====================================================
-- CHALLENGE 4
-- =====================================================

-- Find departments that currently have
-- no employees.
--
-- Display:
-- department_id
-- department_name
--
-- Requirement:
-- Use RIGHT JOIN + IS NULL.


-- Write your query below:



-- =====================================================
-- CHALLENGE 5
-- =====================================================

-- HR wants all employees whose salary is
-- at least 65000.
--
-- Even if an employee's department information
-- is unavailable, the employee should still appear.
--
-- Display:
-- employee_name
-- salary
-- department_name
--
-- Requirement:
-- Use LEFT JOIN.


-- Write your query below:



-- =====================================================
-- CHALLENGE 6
-- =====================================================

-- Management wants a department report where:
--
-- Every department must remain in the result.
-- Only employees earning >= 60000 should be shown.
--
-- Display:
-- department_name
-- employee_name
-- salary
--
-- Sort:
-- department_name ASC
-- salary DESC
--
-- IMPORTANT:
-- Think carefully about whether the salary condition
-- should be placed in ON or WHERE.


-- Write your query below:



-- =====================================================
-- CHALLENGE 7
-- =====================================================

-- Find all departments and their employees,
-- but show only employees from:
--
-- IT + salary >= 65000
-- OR
-- Finance + salary >= 60000
--
-- Every department should still remain in the result.
--
-- Display:
-- department_name
-- employee_name
-- salary


-- Write your query below:



-- =====================================================
-- CHALLENGE 8
-- =====================================================

-- Compare the number of records returned by:
--
-- 1. INNER JOIN
-- 2. LEFT JOIN
-- 3. RIGHT JOIN
--
-- Write three separate queries using COUNT(*).
--
-- Goal:
-- Understand how JOIN type changes the result.


-- Write your queries below:



-- =====================================================
-- CHALLENGE 9
-- =====================================================

-- Management wants departments that either:
--
-- 1. Have no employees
-- OR
-- 2. Have at least one employee earning >= 70000
--
-- Display:
-- department_name
-- employee_name
-- salary
--
-- Sort by department_name.


-- Write your query below:



-- =====================================================
-- CHALLENGE 10 — FINAL CHALLENGE 🔥🔥🔥
-- =====================================================

-- The company wants a complete department report.
--
-- Rules:
--
-- 1. Every department must appear.
-- 2. Employees earning >= 60000 should be displayed.
-- 3. Departments without qualifying employees must
--    still appear.
-- 4. Show employee name and salary when available.
-- 5. Sort departments alphabetically.
-- 6. Within each department, highest salary first.
--
-- Display:
-- department_name
-- employee_name
-- salary
--
-- Requirements:
-- Use:
-- LEFT JOIN
-- ON
-- AND
-- ORDER BY
--
-- DO NOT immediately look at the solution.
-- Try to reason about where the salary condition
-- should be placed.


-- Write your final query below:



-- =====================================================
-- CHALLENGE GOAL
-- =====================================================

-- By completing this challenge, you should understand:
--
-- LEFT JOIN
-- RIGHT JOIN
-- INNER JOIN
-- IS NULL
-- ON vs WHERE
-- AND / OR
-- ORDER BY
-- Business-oriented JOIN logic
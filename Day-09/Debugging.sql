-- =====================================================
-- DAY 09 - SUBQUERIES
-- DEBUGGING PRACTICE
-- PostgreSQL
-- =====================================================
--
-- Objective:
-- Identify and fix common mistakes related to:
-- - Subqueries
-- - Correlated Subqueries
-- - Nested Subqueries
-- - AVG(), MAX(), MIN()
-- - IN / NOT IN
-- - NULL handling
-- - GROUP BY / HAVING
--
-- Instructions:
-- 1. Do NOT look at the solutions initially.
-- 2. Identify the problem in each query.
-- 3. Explain why the query is incorrect.
-- 4. Rewrite the query correctly.
-- 5. Test your corrected query in PostgreSQL.
--
-- =====================================================


-- =====================================================
-- DEBUG 01
-- Wrong Company Average Comparison
-- =====================================================
--
-- Requirement:
-- Find employees whose salary is greater than the
-- average salary of their own department.
--
-- Problem:
-- The query below compares every employee against the
-- company-wide average instead of their department average.
--
-- Identify the issue and correct the query.
-- =====================================================

SELECT
    e.name AS employee_name,
    e.salary,
    d.department_name
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
);


-- =====================================================
-- DEBUG 02
-- Incorrect Correlation Reference
-- =====================================================
--
-- Requirement:
-- Find employees earning more than their own
-- department average.
--
-- Problem:
-- The inner query is incorrectly correlated using
-- employee_id instead of department_id.
--
-- Identify the issue and correct the query.
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.employee_id = e.employee_id
);


-- =====================================================
-- DEBUG 03
-- Incorrect Aggregate Filter
-- =====================================================
--
-- Requirement:
-- Find departments whose average salary is greater
-- than 60,000.
--
-- Problem:
-- AVG() is an aggregate function and should not be
-- filtered using WHERE.
--
-- Identify the issue and correct the query.
-- =====================================================

SELECT
    d.department_name,
    AVG(e.salary) AS average_salary
FROM departments AS d
INNER JOIN employees AS e
    ON d.department_id = e.department_id
WHERE AVG(e.salary) > 60000
GROUP BY d.department_name;


-- =====================================================
-- DEBUG 04
-- Subquery Returning Multiple Rows
-- =====================================================
--
-- Requirement:
-- Find employees who work in IT or Finance.
--
-- Problem:
-- The subquery returns multiple department IDs,
-- but the query uses "=" instead of IN.
--
-- Identify the issue and correct the query.
-- =====================================================

SELECT
    name AS employee_name,
    department_id,
    salary
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('IT', 'Finance')
);


-- =====================================================
-- DEBUG 05
-- NOT IN with Missing NULL Handling
-- =====================================================
--
-- Requirement:
-- Find employees who are not assigned to IT or HR.
--
-- Problem:
-- NOT IN can behave unexpectedly when the subquery
-- contains NULL values.
--
-- Rewrite the query using safe NULL handling.
-- =====================================================

SELECT
    e.name AS employee_name,
    e.department_id,
    e.salary
FROM employees AS e
WHERE e.department_id NOT IN (
    SELECT department_id
    FROM departments
    WHERE department_name NOT IN ('IT', 'HR')
);


-- =====================================================
-- DEBUG 06
-- Incorrect NULL Comparison
-- =====================================================
--
-- Requirement:
-- Find employees who do not have a department assigned.
--
-- Problem:
-- NULL cannot be compared using "=".
--
-- Identify the issue and correct the query.
-- =====================================================

SELECT
    name AS employee_name,
    department_id,
    salary
FROM employees
WHERE department_id = NULL;


-- =====================================================
-- DEBUG 07
-- Missing Correlation Condition
-- =====================================================
--
-- Requirement:
-- Find employees earning more than their own
-- department average.
--
-- Problem:
-- The subquery calculates the average of ALL employees
-- instead of the current employee's department.
--
-- Identify the missing correlation condition.
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
);


-- =====================================================
-- DEBUG 08
-- Incorrect Second Highest Salary Logic
-- =====================================================
--
-- Requirement:
-- Find the second-highest distinct salary.
--
-- Problem:
-- The inner query does not exclude the highest salary,
-- so it can return the highest salary again.
--
-- Identify the problem and rewrite the query correctly.
--
-- Restrictions:
-- - Do not use LIMIT.
-- - Do not use OFFSET.
-- =====================================================

SELECT
    name AS employee_name,
    salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);


-- =====================================================
-- DEBUG 09
-- Wrong Department Average Comparison
-- =====================================================
--
-- Requirement:
-- Find the highest-paid employee in each department.
--
-- Problem:
-- The subquery is not correlated with the outer employee's
-- department.
--
-- Identify the issue and correct the query.
-- =====================================================

SELECT
    d.department_name,
    e.name AS employee_name,
    e.salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees AS e2
);


-- =====================================================
-- DEBUG 10
-- Incorrect HAVING Subquery Logic
-- =====================================================
--
-- Requirement:
-- Find departments whose average salary is greater
-- than the company-wide average salary.
--
-- Problem:
-- The query incorrectly compares an individual employee
-- salary with the company average inside HAVING.
--
-- Identify the logical mistake and correct the query.
-- =====================================================

SELECT
    d.department_name,
    AVG(e.salary) AS department_average_salary
FROM departments AS d
INNER JOIN employees AS e
    ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING e.salary > (
    SELECT AVG(salary)
    FROM employees
);


-- =====================================================
-- DEBUGGING CHECKLIST
-- =====================================================
--
-- Before running a subquery, ask:
--
-- 1. Does the subquery return ONE value?
--    → Use =, >, <, >=, <=
--
-- 2. Does the subquery return MULTIPLE values?
--    → Consider IN / NOT IN
--
-- 3. Does the inner query need information from
--    the current outer row?
--    → Use a correlated subquery
--
-- 4. Am I comparing department-level values?
--    → Use GROUP BY + HAVING
--
-- 5. Am I handling NULL correctly?
--    → Use IS NULL / IS NOT NULL
--
-- 6. Is my subquery calculating the correct group?
--    → Check the correlation condition
--
-- 7. For second-highest salary:
--    → Exclude the highest salary first
--
-- =====================================================
-- END OF DAY 09 DEBUGGING PRACTICE
-- =====================================================
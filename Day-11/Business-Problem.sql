-- ============================================================
-- DAY 11 - ADVANCED CTE + MULTIPLE CTEs
-- Business Problems
-- PostgreSQL
-- ============================================================
--
-- Real-world SQL business analysis problems using:
-- CTEs, Multiple CTEs, JOINs, GROUP BY and Aggregations.
--
-- Try solving each problem yourself before checking
-- Business-Solutions.sql.
-- ============================================================


-- ============================================================
-- BUSINESS PROBLEM 01
-- HR Department Performance Report
-- ============================================================
--
-- HR wants to compare department performance.
--
-- Create multiple CTEs to calculate:
-- 1. Total employees per department
-- 2. Average salary per department
-- 3. Highest salary per department
--
-- Display:
-- department_name
-- total_employees
-- average_salary
-- highest_salary
--
-- Show only departments with at least 5 employees.
-- Sort by average_salary DESC.
--
-- ============================================================


-- Write your solution below:





-- ============================================================
-- BUSINESS PROBLEM 02
-- Salary Benchmarking
-- ============================================================
--
-- Management wants to identify employees who earn more
-- than the average salary of their department.
--
-- Create a department average salary CTE.
--
-- Display:
-- employee_name
-- department_name
-- salary
-- department_average_salary
--
-- Sort by salary DESC.
--
-- ============================================================


-- Write your solution below:





-- ============================================================
-- BUSINESS PROBLEM 03
-- High-Paying Departments
-- ============================================================
--
-- Management wants to identify departments where the
-- average salary is greater than 60000.
--
-- Create a department average salary CTE.
--
-- Display:
-- department_name
-- average_salary
--
-- Sort by average_salary DESC.
--
-- ============================================================


-- Write your solution below:





-- ============================================================
-- BUSINESS PROBLEM 04
-- Company vs Department Benchmark
-- ============================================================
--
-- HR wants to compare each department's average salary
-- against the company's overall average salary.
--
-- Create:
-- 1. Company average salary CTE
-- 2. Department average salary CTE
--
-- Display:
-- department_name
-- department_average_salary
-- company_average_salary
-- salary_difference
--
-- Only show departments whose average salary is above
-- the company average.
--
-- ============================================================


-- Write your solution below:





-- ============================================================
-- BUSINESS PROBLEM 05
-- City Compensation Analysis
-- ============================================================
--
-- Management wants to identify employees whose salary
-- is above the average salary of their city.
--
-- Create a city average salary CTE.
--
-- Display:
-- employee_name
-- city
-- salary
-- city_average_salary
--
-- Ignore employees whose city is NULL.
--
-- ============================================================


-- Write your solution below:





-- ============================================================
-- BUSINESS PROBLEM 06
-- High-Performing Employees in High-Paying Departments
-- ============================================================
--
-- HR defines a high-paying department as a department
-- whose average salary is greater than 60000.
--
-- Identify employees who:
--
-- 1. Belong to a high-paying department
-- 2. Earn more than their department average
--
-- Use multiple CTEs.
--
-- Display:
-- employee_name
-- department_name
-- salary
-- department_average_salary
--
-- ============================================================


-- Write your solution below:





-- ============================================================
-- BUSINESS PROBLEM 07
-- Department Salary Leaders
-- ============================================================
--
-- Management wants to identify the highest-paid employee
-- in every department.
--
-- Create a CTE that calculates the maximum salary
-- for each department.
--
-- Display:
-- department_name
-- employee_name
-- salary
--
-- If multiple employees share the highest salary,
-- include all of them.
--
-- ============================================================


-- Write your solution below:





-- ============================================================
-- BUSINESS PROBLEM 08
-- Location-Based Department Analysis
-- ============================================================
--
-- Management wants to understand salary performance
-- across department locations.
--
-- Calculate:
-- 1. Total employees per department
-- 2. Average salary per department
--
-- Join the CTE results with:
-- departments
-- locations
--
-- Display:
-- department_name
-- city
-- total_employees
-- average_salary
--
-- Only show departments with average salary > 55000.
--
-- ============================================================


-- Write your solution below:





-- ============================================================
-- BUSINESS PROBLEM 09
-- Executive Compensation Screening
-- ============================================================
--
-- HR wants to identify employees who meet ALL conditions:
--
-- 1. Salary is above company average
-- 2. Salary is above department average
-- 3. Their department's maximum salary is greater than 90000
--
-- Create separate CTEs for:
-- 1. Company average
-- 2. Department average
-- 3. Department maximum salary
--
-- Display:
-- employee_name
-- department_name
-- salary
-- company_average_salary
-- department_average_salary
-- department_max_salary
--
-- Sort by salary DESC.
--
-- ============================================================


-- Write your solution below:





-- ============================================================
-- BUSINESS PROBLEM 10
-- Complete Management Dashboard
-- ============================================================
--
-- Build a department-level management report using
-- multiple CTEs.
--
-- Calculate:
--
-- 1. Total employees
-- 2. Average salary
-- 3. Minimum salary
-- 4. Maximum salary
-- 5. Company average salary
-- 6. Salary difference from company average
--
-- Display:
-- department_name
-- total_employees
-- average_salary
-- minimum_salary
-- maximum_salary
-- company_average_salary
-- salary_difference
--
-- Only include departments with:
-- total employees >= 5
--
-- Sort by average_salary DESC.
--
-- ============================================================


-- Write your solution below:





-- ============================================================
-- DAY 11 BUSINESS PROBLEMS COMPLETE
-- ============================================================
-- ============================================================
-- DAY 11 - ADVANCED CTE + MULTIPLE CTEs
-- Business Solutions
-- PostgreSQL
-- ============================================================


-- ============================================================
-- BUSINESS PROBLEM 01
-- HR Department Performance Report
-- ============================================================

WITH department_summary AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees,
        AVG(salary) AS average_salary,
        MAX(salary) AS highest_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    d.department_name,
    ds.total_employees,
    ds.average_salary,
    ds.highest_salary
FROM department_summary ds
JOIN departments d
    ON ds.department_id = d.department_id
WHERE ds.total_employees >= 5
ORDER BY ds.average_salary DESC;


-- ============================================================
-- BUSINESS PROBLEM 02
-- Salary Benchmarking
-- ============================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS department_average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary,
    da.department_average_salary
FROM employees e
JOIN department_average da
    ON e.department_id = da.department_id
JOIN departments d
    ON e.department_id = d.department_id
WHERE e.salary > da.department_average_salary
ORDER BY e.salary DESC;


-- ============================================================
-- BUSINESS PROBLEM 03
-- High-Paying Departments
-- ============================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    d.department_name,
    da.average_salary
FROM department_average da
JOIN departments d
    ON da.department_id = d.department_id
WHERE da.average_salary > 60000
ORDER BY da.average_salary DESC;


-- ============================================================
-- BUSINESS PROBLEM 04
-- Company vs Department Benchmark
-- ============================================================

WITH company_average AS (
    SELECT
        AVG(salary) AS company_average_salary
    FROM employees
),

department_average AS (
    SELECT
        department_id,
        AVG(salary) AS department_average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    d.department_name,
    da.department_average_salary,
    ca.company_average_salary,
    da.department_average_salary
        - ca.company_average_salary AS salary_difference
FROM department_average da
CROSS JOIN company_average ca
JOIN departments d
    ON da.department_id = d.department_id
WHERE da.department_average_salary > ca.company_average_salary
ORDER BY salary_difference DESC;


-- ============================================================
-- BUSINESS PROBLEM 05
-- City Compensation Analysis
-- ============================================================

WITH city_average AS (
    SELECT
        city,
        AVG(salary) AS city_average_salary
    FROM employees
    WHERE city IS NOT NULL
    GROUP BY city
)

SELECT
    e.name AS employee_name,
    e.city,
    e.salary,
    ca.city_average_salary
FROM employees e
JOIN city_average ca
    ON e.city = ca.city
WHERE e.salary > ca.city_average_salary
ORDER BY e.salary DESC;


-- ============================================================
-- BUSINESS PROBLEM 06
-- High-Performing Employees in High-Paying Departments
-- ============================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS department_average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),

high_paying_departments AS (
    SELECT
        department_id,
        department_average_salary
    FROM department_average
    WHERE department_average_salary > 60000
)

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary,
    hpd.department_average_salary
FROM employees e
JOIN high_paying_departments hpd
    ON e.department_id = hpd.department_id
JOIN departments d
    ON e.department_id = d.department_id
WHERE e.salary > hpd.department_average_salary
ORDER BY e.salary DESC;


-- ============================================================
-- BUSINESS PROBLEM 07
-- Department Salary Leaders
-- ============================================================

WITH department_maximum AS (
    SELECT
        department_id,
        MAX(salary) AS maximum_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    d.department_name,
    e.name AS employee_name,
    e.salary
FROM employees e
JOIN department_maximum dm
    ON e.department_id = dm.department_id
   AND e.salary = dm.maximum_salary
JOIN departments d
    ON e.department_id = d.department_id
ORDER BY e.salary DESC;


-- ============================================================
-- BUSINESS PROBLEM 08
-- Location-Based Department Analysis
-- ============================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),

employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    d.department_name,
    l.city,
    ec.total_employees,
    da.average_salary
FROM department_average da
JOIN employee_count ec
    ON da.department_id = ec.department_id
JOIN departments d
    ON da.department_id = d.department_id
JOIN locations l
    ON d.location_id = l.location_id
WHERE da.average_salary > 55000
ORDER BY da.average_salary DESC;


-- ============================================================
-- BUSINESS PROBLEM 09
-- Executive Compensation Screening
-- ============================================================

WITH company_average AS (
    SELECT
        AVG(salary) AS company_average_salary
    FROM employees
),

department_average AS (
    SELECT
        department_id,
        AVG(salary) AS department_average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),

department_maximum AS (
    SELECT
        department_id,
        MAX(salary) AS department_max_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary,
    ca.company_average_salary,
    da.department_average_salary,
    dm.department_max_salary
FROM employees e
CROSS JOIN company_average ca
JOIN department_average da
    ON e.department_id = da.department_id
JOIN department_maximum dm
    ON e.department_id = dm.department_id
JOIN departments d
    ON e.department_id = d.department_id
WHERE e.salary > ca.company_average_salary
  AND e.salary > da.department_average_salary
  AND dm.department_max_salary > 90000
ORDER BY e.salary DESC;


-- ============================================================
-- BUSINESS PROBLEM 10
-- Complete Management Dashboard
-- ============================================================

WITH company_average AS (
    SELECT
        AVG(salary) AS company_average_salary
    FROM employees
),

department_summary AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees,
        AVG(salary) AS average_salary,
        MIN(salary) AS minimum_salary,
        MAX(salary) AS maximum_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    d.department_name,
    ds.total_employees,
    ds.average_salary,
    ds.minimum_salary,
    ds.maximum_salary,
    ca.company_average_salary,
    ds.average_salary
        - ca.company_average_salary AS salary_difference
FROM department_summary ds
CROSS JOIN company_average ca
JOIN departments d
    ON ds.department_id = d.department_id
WHERE ds.total_employees >= 5
ORDER BY ds.average_salary DESC;


-- ============================================================
-- DAY 11 BUSINESS SOLUTIONS COMPLETE
-- ============================================================
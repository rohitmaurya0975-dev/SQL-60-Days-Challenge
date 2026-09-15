-- ============================================================
-- DAY 11 - ADVANCED CTE + MULTIPLE CTEs
-- Challenge File
-- PostgreSQL
-- ============================================================


-- ============================================================
-- CHALLENGE 01
-- Department Performance Benchmark
--
-- Create multiple CTEs to calculate:
-- 1. Total employees per department
-- 2. Average salary per department
-- 3. Maximum salary per department
--
-- Display:
-- department_name
-- total_employees
-- average_salary
-- highest_salary
--
-- Only show departments with average salary > 60000.
-- Sort by average_salary DESC.
-- ============================================================


-- Write your query below:





-- ============================================================
-- CHALLENGE 02
-- Above Department Average Employees
--
-- Create a CTE containing the average salary of each department.
--
-- Find employees whose salary is greater than their
-- department's average salary.
--
-- Display:
-- employee_name
-- department_name
-- employee_salary
-- department_average_salary
--
-- Sort by employee_salary DESC.
-- ============================================================


-- Write your query below:





-- ============================================================
-- CHALLENGE 03
-- Company vs Department Salary
--
-- Create:
-- 1. A CTE for company average salary
-- 2. A CTE for department average salary
--
-- Display departments where department average salary
-- is greater than company average salary.
--
-- Display:
-- department_name
-- department_average_salary
-- company_average_salary
-- salary_difference
--
-- salary_difference =
-- department_average_salary - company_average_salary
-- ============================================================


-- Write your query below:





-- ============================================================
-- CHALLENGE 04
-- City and Department Benchmark
--
-- Create two CTEs:
-- 1. Average salary by city
-- 2. Average salary by department
--
-- Find employees whose salary is greater than BOTH:
-- 1. Their city average salary
-- 2. Their department average salary
--
-- Display:
-- employee_name
-- city
-- department_name
-- salary
-- city_average_salary
-- department_average_salary
--
-- Ignore employees with NULL city.
-- ============================================================


-- Write your query below:





-- ============================================================
-- CHALLENGE 05
-- High-Paying Department Employees
--
-- Create:
-- 1. Department average salary CTE
-- 2. High-paying department CTE
--
-- A high-paying department has an average salary > 60000.
--
-- Find employees who:
-- 1. Belong to a high-paying department
-- 2. Earn more than their department average salary
--
-- Display:
-- employee_name
-- department_name
-- salary
-- department_average_salary
-- ============================================================


-- Write your query below:





-- ============================================================
-- CHALLENGE 06
-- Department Salary Leaders
--
-- Create a CTE that finds the maximum salary
-- in each department.
--
-- Find the employee(s) who earn the maximum salary
-- in their department.
--
-- Display:
-- department_name
-- employee_name
-- salary
--
-- Sort by salary DESC.
-- ============================================================


-- Write your query below:





-- ============================================================
-- CHALLENGE 07
-- Three-Level Department Analysis
--
-- Create three CTEs:
-- 1. Employee count per department
-- 2. Average salary per department
-- 3. Maximum salary per department
--
-- Return departments satisfying ALL conditions:
-- 1. At least 5 employees
-- 2. Average salary > 60000
-- 3. Maximum salary > 90000
--
-- Display:
-- department_name
-- total_employees
-- average_salary
-- maximum_salary
--
-- Sort by average_salary DESC.
-- ============================================================


-- Write your query below:





-- ============================================================
-- CHALLENGE 08
-- Company Salary Leaders
--
-- Create a CTE for company average salary.
--
-- Find employees whose salary is:
-- 1. Greater than company average
-- 2. Greater than their department average
--
-- Create a separate CTE for department average salary.
--
-- Display:
-- employee_name
-- department_name
-- salary
-- company_average_salary
-- department_average_salary
--
-- Sort by salary DESC.
-- ============================================================


-- Write your query below:





-- ============================================================
-- CHALLENGE 09
-- Department Location Analysis
--
-- Create multiple CTEs to calculate:
-- 1. Department average salary
-- 2. Department employee count
--
-- Join these CTEs with departments and locations.
--
-- Display:
-- department_name
-- city
-- total_employees
-- average_salary
--
-- Return only departments with:
-- total employees >= 5
-- average salary > 55000
--
-- Sort by average_salary DESC.
-- ============================================================


-- Write your query below:





-- ============================================================
-- CHALLENGE 10
-- Executive Compensation Analysis
--
-- Create multiple CTEs for:
-- 1. Company average salary
-- 2. Department average salary
-- 3. Department maximum salary
--
-- Find employees who satisfy ALL conditions:
--
-- 1. Salary > company average
-- 2. Salary > department average
-- 3. Department maximum salary > 90000
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
-- ============================================================


-- Write your query below:





-- ============================================================
-- DAY 11 CHALLENGE COMPLETE
-- ==========================SOLUTION---------------------------------------
-- ============================================================
-- DAY 11 - ADVANCED CTE + MULTIPLE CTEs
-- Challenge Solutions
-- PostgreSQL
-- ============================================================


-- ============================================================
-- CHALLENGE 01
-- Department Performance Benchmark
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
),

department_maximum AS (
    SELECT
        department_id,
        MAX(salary) AS highest_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    d.department_name,
    ec.total_employees,
    da.average_salary,
    dm.highest_salary
FROM department_average da
JOIN employee_count ec
    ON da.department_id = ec.department_id
JOIN department_maximum dm
    ON da.department_id = dm.department_id
JOIN departments d
    ON da.department_id = d.department_id
WHERE da.average_salary > 60000
ORDER BY da.average_salary DESC;


-- ============================================================
-- CHALLENGE 02
-- Above Department Average Employees
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
    e.salary AS employee_salary,
    da.department_average_salary
FROM employees e
JOIN department_average da
    ON e.department_id = da.department_id
JOIN departments d
    ON e.department_id = d.department_id
WHERE e.salary > da.department_average_salary
ORDER BY e.salary DESC;


-- ============================================================
-- CHALLENGE 03
-- Company vs Department Salary
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
-- CHALLENGE 04
-- City and Department Benchmark
-- ============================================================

WITH city_average AS (
    SELECT
        city,
        AVG(salary) AS city_average_salary
    FROM employees
    WHERE city IS NOT NULL
    GROUP BY city
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
    e.name AS employee_name,
    e.city,
    d.department_name,
    e.salary,
    ca.city_average_salary,
    da.department_average_salary
FROM employees e
JOIN city_average ca
    ON e.city = ca.city
JOIN department_average da
    ON e.department_id = da.department_id
JOIN departments d
    ON e.department_id = d.department_id
WHERE e.salary > ca.city_average_salary
  AND e.salary > da.department_average_salary
ORDER BY e.salary DESC;


-- ============================================================
-- CHALLENGE 05
-- High-Paying Department Employees
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
-- CHALLENGE 06
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
-- CHALLENGE 07
-- Three-Level Department Analysis
-- ============================================================

WITH employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),

department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),

department_maximum AS (
    SELECT
        department_id,
        MAX(salary) AS maximum_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    d.department_name,
    ec.total_employees,
    da.average_salary,
    dm.maximum_salary
FROM employee_count ec
JOIN department_average da
    ON ec.department_id = da.department_id
JOIN department_maximum dm
    ON ec.department_id = dm.department_id
JOIN departments d
    ON ec.department_id = d.department_id
WHERE ec.total_employees >= 5
  AND da.average_salary > 60000
  AND dm.maximum_salary > 90000
ORDER BY da.average_salary DESC;


-- ============================================================
-- CHALLENGE 08
-- Company Salary Leaders
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
    e.name AS employee_name,
    d.department_name,
    e.salary,
    ca.company_average_salary,
    da.department_average_salary
FROM employees e
CROSS JOIN company_average ca
JOIN department_average da
    ON e.department_id = da.department_id
JOIN departments d
    ON e.department_id = d.department_id
WHERE e.salary > ca.company_average_salary
  AND e.salary > da.department_average_salary
ORDER BY e.salary DESC;


-- ============================================================
-- CHALLENGE 09
-- Department Location Analysis
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
WHERE ec.total_employees >= 5
  AND da.average_salary > 55000
ORDER BY da.average_salary DESC;


-- ============================================================
-- CHALLENGE 10
-- Executive Compensation Analysis
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
-- DAY 11 CHALLENGE SOLUTIONS COMPLETE
-- ============================================================
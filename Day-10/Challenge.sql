-- =====================================================
-- DAY 10 - CTE (COMMON TABLE EXPRESSIONS)
-- CHALLENGE
-- PostgreSQL
-- =====================================================


-- =====================================================
-- CHALLENGE 01
-- Company Average Salary
-- =====================================================
-- Use a CTE to calculate the company's average salary.
--
-- Display employees whose salary is greater than
-- the company average.
--
-- Display:
-- employee name
-- salary
--
-- Sort by salary DESC.


-- =====================================================
-- CHALLENGE 02
-- Highest Salary
-- =====================================================
-- Use a CTE to calculate the highest salary.
--
-- Display:
-- employee name
-- salary
--
-- Return the employee(s) earning the highest salary.


-- =====================================================
-- CHALLENGE 03
-- Employees From IT and Finance
-- =====================================================
-- Use a CTE to identify the department IDs
-- of IT and Finance.
--
-- Display:
-- employee name
-- department_id
-- salary
--
-- Sort by salary DESC.


-- =====================================================
-- CHALLENGE 04
-- Department Salary Analysis
-- =====================================================
-- Create a CTE that calculates for every department:
--
-- employee count
-- average salary
-- maximum salary
-- minimum salary
--
-- Display all results.
--
-- Sort by average salary DESC.


-- =====================================================
-- CHALLENGE 05
-- Departments Above Company Average
-- =====================================================
-- Create one CTE for the company average salary.
--
-- Create another CTE for department average salary.
--
-- Display departments whose average salary is
-- greater than the company average.
--
-- Display:
-- department_id
-- average_salary
--
-- Sort by average_salary DESC.


-- =====================================================
-- CHALLENGE 06
-- Department Maximum Salary
-- =====================================================
-- Create a CTE that calculates the maximum salary
-- for every department.
--
-- Then display employees who earn the maximum salary
-- in their department.
--
-- Display:
-- employee name
-- department_id
-- salary
--
-- Sort by salary DESC.


-- =====================================================
-- CHALLENGE 07
-- City Salary Benchmark
-- =====================================================
-- Create a CTE that calculates the average salary
-- for every city.
--
-- Then display employees whose salary is greater
-- than their city's average salary.
--
-- Display:
-- employee name
-- city
-- salary
-- city_average_salary
--
-- Ignore employees whose city is NULL.
--
-- Sort by salary DESC.


-- =====================================================
-- CHALLENGE 08
-- Multiple CTE Analysis
-- =====================================================
-- Create two CTEs:
--
-- 1. Calculate employee count for each department.
-- 2. Calculate average salary for each department.
--
-- Combine both CTEs.
--
-- Display:
-- department_id
-- employee_count
-- average_salary
--
-- Sort by average_salary DESC.


-- =====================================================
-- CHALLENGE 09
-- High-Paying Departments
-- =====================================================
-- Create a CTE that calculates the average salary
-- of each department.
--
-- Identify departments whose average salary
-- is greater than 60000.
--
-- Then display all employees belonging to those
-- departments.
--
-- Display:
-- employee name
-- department_id
-- salary
--
-- Sort by salary DESC.


-- =====================================================
-- CHALLENGE 10
-- Department Salary Benchmark
-- =====================================================
-- Create a CTE that calculates the average salary
-- for every department.
--
-- Then display employees whose salary is greater
-- than their own department's average salary.
--
-- Display:
-- employee name
-- department_id
-- salary
-- department_average_salary
--
-- Sort by salary DESC.


-- =====================================================
-- END OF DAY 10 CHALLENGE
-- ======================================SOLUTION-------------------------------------------
-- =====================================================
-- DAY 10 - CTE (COMMON TABLE EXPRESSIONS)
-- CHALLENGE SOLUTIONS
-- PostgreSQL
-- =====================================================


-- =====================================================
-- CHALLENGE 01
-- Company Average Salary
-- =====================================================

WITH company_average AS (
    SELECT AVG(salary) AS average_salary
    FROM employees
)
SELECT
    e.name,
    e.salary
FROM employees AS e
CROSS JOIN company_average AS c
WHERE e.salary > c.average_salary
ORDER BY e.salary DESC;


-- =====================================================
-- CHALLENGE 02
-- Highest Salary
-- =====================================================

WITH highest_salary AS (
    SELECT MAX(salary) AS maximum_salary
    FROM employees
)
SELECT
    e.name,
    e.salary
FROM employees AS e
CROSS JOIN highest_salary AS h
WHERE e.salary = h.maximum_salary
ORDER BY e.salary DESC;


-- =====================================================
-- CHALLENGE 03
-- Employees From IT and Finance
-- =====================================================

WITH selected_departments AS (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('IT', 'Finance')
)
SELECT
    e.name,
    e.department_id,
    e.salary
FROM employees AS e
WHERE e.department_id IN (
    SELECT department_id
    FROM selected_departments
)
ORDER BY e.salary DESC;


-- =====================================================
-- CHALLENGE 04
-- Department Salary Analysis
-- =====================================================

WITH department_analysis AS (
    SELECT
        department_id,
        COUNT(*) AS employee_count,
        AVG(salary) AS average_salary,
        MAX(salary) AS maximum_salary,
        MIN(salary) AS minimum_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)
SELECT
    department_id,
    employee_count,
    average_salary,
    maximum_salary,
    minimum_salary
FROM department_analysis
ORDER BY average_salary DESC;


-- =====================================================
-- CHALLENGE 05
-- Departments Above Company Average
-- =====================================================

WITH company_average AS (
    SELECT AVG(salary) AS company_average_salary
    FROM employees
),
department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)
SELECT
    d.department_id,
    d.average_salary
FROM department_average AS d
CROSS JOIN company_average AS c
WHERE d.average_salary > c.company_average_salary
ORDER BY d.average_salary DESC;


-- =====================================================
-- CHALLENGE 06
-- Department Maximum Salary
-- =====================================================

WITH department_maximum AS (
    SELECT
        department_id,
        MAX(salary) AS maximum_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)
SELECT
    e.name,
    e.department_id,
    e.salary
FROM employees AS e
INNER JOIN department_maximum AS d
    ON e.department_id = d.department_id
   AND e.salary = d.maximum_salary
ORDER BY e.salary DESC;


-- =====================================================
-- CHALLENGE 07
-- City Salary Benchmark
-- =====================================================

WITH city_average AS (
    SELECT
        city,
        AVG(salary) AS city_average_salary
    FROM employees
    WHERE city IS NOT NULL
    GROUP BY city
)
SELECT
    e.name,
    e.city,
    e.salary,
    c.city_average_salary
FROM employees AS e
INNER JOIN city_average AS c
    ON e.city = c.city
WHERE e.salary > c.city_average_salary
ORDER BY e.salary DESC;


-- =====================================================
-- CHALLENGE 08
-- Multiple CTE Analysis
-- =====================================================

WITH employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS employee_count
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),
salary_analysis AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)
SELECT
    e.department_id,
    e.employee_count,
    s.average_salary
FROM employee_count AS e
INNER JOIN salary_analysis AS s
    ON e.department_id = s.department_id
ORDER BY s.average_salary DESC;


-- =====================================================
-- CHALLENGE 09
-- High-Paying Departments
-- =====================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),
high_paying_departments AS (
    SELECT
        department_id
    FROM department_average
    WHERE average_salary > 60000
)
SELECT
    e.name,
    e.department_id,
    e.salary
FROM employees AS e
INNER JOIN high_paying_departments AS h
    ON e.department_id = h.department_id
ORDER BY e.salary DESC;


-- =====================================================
-- CHALLENGE 10
-- Department Salary Benchmark
-- =====================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS department_average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)
SELECT
    e.name,
    e.department_id,
    e.salary,
    d.department_average_salary
FROM employees AS e
INNER JOIN department_average AS d
    ON e.department_id = d.department_id
WHERE e.salary > d.department_average_salary
ORDER BY e.salary DESC;


-- =====================================================
-- END OF DAY 10 CHALLENGE SOLUTIONS
-- =====================================================
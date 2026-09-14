-- =====================================================
-- DAY 10 - CTE (COMMON TABLE EXPRESSIONS)
-- BUSINESS PROBLEMS
-- PostgreSQL
-- =====================================================


-- =====================================================
-- BUSINESS PROBLEM 01
-- HR Salary Benchmark
-- =====================================================
-- HR wants to identify employees earning more than
-- the company's average salary.
--
-- Use a CTE to calculate the company average salary.
--
-- Display:
-- employee name
-- salary
--
-- Sort by salary DESC.


-- =====================================================
-- BUSINESS PROBLEM 02
-- Highest-Paid Employee
-- =====================================================
-- Management wants to identify the highest-paid
-- employee in the company.
--
-- Use a CTE to calculate the maximum salary.
--
-- Display:
-- employee name
-- salary


-- =====================================================
-- BUSINESS PROBLEM 03
-- Department Performance
-- =====================================================
-- HR wants a department-level salary report.
--
-- Use a CTE to calculate:
-- employee count
-- average salary
-- highest salary
-- lowest salary
--
-- Display:
-- department_id
-- employee_count
-- average_salary
-- highest_salary
-- lowest_salary
--
-- Sort by average_salary DESC.


-- =====================================================
-- BUSINESS PROBLEM 04
-- High-Paying Departments
-- =====================================================
-- Management wants to identify departments whose
-- average salary is greater than 60000.
--
-- Use a CTE to calculate department averages.
--
-- Display:
-- department_id
-- average_salary
--
-- Sort by average_salary DESC.


-- =====================================================
-- BUSINESS PROBLEM 05
-- Department Salary Leaders
-- =====================================================
-- HR wants to identify the highest-paid employee
-- from every department.
--
-- Use a CTE to calculate the maximum salary
-- for each department.
--
-- Display:
-- employee name
-- department_id
-- salary
--
-- Sort by salary DESC.


-- =====================================================
-- BUSINESS PROBLEM 06
-- City Compensation Analysis
-- =====================================================
-- Management wants to compare salary levels
-- across different cities.
--
-- Use a CTE to calculate the average salary
-- for each city.
--
-- Ignore employees whose city is NULL.
--
-- Display:
-- city
-- average_salary
--
-- Sort by average_salary DESC.


-- =====================================================
-- BUSINESS PROBLEM 07
-- Above-Benchmark Employees
-- =====================================================
-- HR wants to find employees earning more than
-- their department's average salary.
--
-- Use a CTE to calculate the average salary
-- for every department.
--
-- Display:
-- employee name
-- department_id
-- salary
-- department_average_salary
--
-- Sort by salary DESC.


-- =====================================================
-- BUSINESS PROBLEM 08
-- High-Paying Department Employees
-- =====================================================
-- Management wants to see all employees working
-- in departments where the average salary is
-- greater than 60000.
--
-- Use CTEs to:
-- 1. Calculate department average salary.
-- 2. Identify high-paying departments.
--
-- Display:
-- employee name
-- department_id
-- salary
--
-- Sort by salary DESC.


-- =====================================================
-- BUSINESS PROBLEM 09
-- Department Workforce Analysis
-- =====================================================
-- HR wants to compare department size with
-- average compensation.
--
-- Use two CTEs:
-- 1. Employee count by department.
-- 2. Average salary by department.
--
-- Display:
-- department_id
-- employee_count
-- average_salary
--
-- Sort by employee_count DESC.


-- =====================================================
-- BUSINESS PROBLEM 10
-- Executive Compensation Analysis
-- =====================================================
-- Senior management wants to identify employees
-- who:
--
-- 1. Work in departments with an average salary
--    greater than 60000.
-- 2. Earn more than their own department average.
--
-- Use CTEs to perform the analysis.
--
-- Display:
-- employee name
-- department_id
-- salary
-- department_average_salary
--
-- Sort by salary DESC.


-- =====================================================
-- END OF DAY 10 BUSINESS PROBLEMS
-- =====================================================SOLUTION---------------------------------\
-- =====================================================
-- DAY 10 - CTE (COMMON TABLE EXPRESSIONS)
-- BUSINESS SOLUTIONS
-- PostgreSQL
-- =====================================================


-- =====================================================
-- BUSINESS PROBLEM 01
-- HR Salary Benchmark
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
-- BUSINESS PROBLEM 02
-- Highest-Paid Employee
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
WHERE e.salary = h.maximum_salary;


-- =====================================================
-- BUSINESS PROBLEM 03
-- Department Performance
-- =====================================================

WITH department_performance AS (
    SELECT
        department_id,
        COUNT(*) AS employee_count,
        AVG(salary) AS average_salary,
        MAX(salary) AS highest_salary,
        MIN(salary) AS lowest_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)
SELECT
    department_id,
    employee_count,
    average_salary,
    highest_salary,
    lowest_salary
FROM department_performance
ORDER BY average_salary DESC;


-- =====================================================
-- BUSINESS PROBLEM 04
-- High-Paying Departments
-- =====================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)
SELECT
    department_id,
    average_salary
FROM department_average
WHERE average_salary > 60000
ORDER BY average_salary DESC;


-- =====================================================
-- BUSINESS PROBLEM 05
-- Department Salary Leaders
-- =====================================================

WITH department_max_salary AS (
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
INNER JOIN department_max_salary AS d
    ON e.department_id = d.department_id
   AND e.salary = d.maximum_salary
ORDER BY e.salary DESC;


-- =====================================================
-- BUSINESS PROBLEM 06
-- City Compensation Analysis
-- =====================================================

WITH city_average AS (
    SELECT
        city,
        AVG(salary) AS average_salary
    FROM employees
    WHERE city IS NOT NULL
    GROUP BY city
)
SELECT
    city,
    average_salary
FROM city_average
ORDER BY average_salary DESC;


-- =====================================================
-- BUSINESS PROBLEM 07
-- Above-Benchmark Employees
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
-- BUSINESS PROBLEM 08
-- High-Paying Department Employees
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
-- BUSINESS PROBLEM 09
-- Department Workforce Analysis
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
ORDER BY e.employee_count DESC;


-- =====================================================
-- BUSINESS PROBLEM 10
-- Executive Compensation Analysis
-- =====================================================

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
    e.name,
    e.department_id,
    e.salary,
    h.department_average_salary
FROM employees AS e
INNER JOIN high_paying_departments AS h
    ON e.department_id = h.department_id
WHERE e.salary > h.department_average_salary
ORDER BY e.salary DESC;


-- =====================================================
-- END OF DAY 10 BUSINESS SOLUTIONS
-- =====================================================
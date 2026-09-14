-- =====================================================
-- DAY 10 - CTE (COMMON TABLE EXPRESSIONS)
-- DEBUGGING PRACTICE
-- PostgreSQL
-- =====================================================


-- =====================================================
-- DEBUG 01
-- Employees Above Company Average
-- =====================================================

-- Find employees earning more than the company average salary.

WITH company_average AS (
    SELECT AVG(salary)
    FROM employees
)
SELECT
    name,
    salary
FROM employees
WHERE salary > company_average;


-- =====================================================
-- DEBUG 02
-- Highest-Paid Employee
-- =====================================================

-- Find the employee with the highest salary.

WITH highest_salary AS (
    SELECT MAX(salary) AS maximum_salary
    FROM employees
)
SELECT
    name,
    salary
FROM employees
WHERE salary = MAXIMUM_SALARY;


-- =====================================================
-- DEBUG 03
-- IT Department Employees
-- =====================================================

-- Find employees working in the IT department.

WITH it_department AS (
    SELECT department_id
    FROM departments
    WHERE department_name = 'IT'
)
SELECT
    name,
    salary
FROM employees
WHERE department_id = it_department;


-- =====================================================
-- DEBUG 04
-- Department Average Salary
-- =====================================================

-- Calculate the average salary for every department.

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
)
SELECT
    department_id,
    average_salary
FROM department_average
GROUP BY department_id;


-- =====================================================
-- DEBUG 05
-- Departments Above Company Average
-- =====================================================

-- Find departments whose average salary is
-- greater than the company average salary.

WITH company_average AS (
    SELECT AVG(salary) AS average_salary
    FROM employees
),
department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)
SELECT
    department_id,
    average_salary
FROM department_average
WHERE average_salary > company_average.average_salary;


-- =====================================================
-- DEBUG 06
-- Department Maximum Salary
-- =====================================================

-- Find the maximum salary for each department.

WITH department_maximum AS (
    SELECT
        department_id,
        MAX(salary) AS maximum_salary
    FROM employees
    GROUP BY department_id
)
SELECT
    department_id,
    maximum_salary
FROM employees
WHERE salary = maximum_salary;


-- =====================================================
-- DEBUG 07
-- Employees Above Department Average
-- =====================================================

-- Find employees earning more than their
-- department's average salary.

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS department_average_salary
    FROM employees
    GROUP BY department_id
)
SELECT
    e.name,
    e.department_id,
    e.salary
FROM employees AS e
INNER JOIN department_average AS d
    ON e.department_id = d.department_id
WHERE e.salary < d.department_average_salary;


-- =====================================================
-- DEBUG 08
-- City Average Salary
-- =====================================================

-- Calculate average salary for each city.
-- Ignore NULL cities.

WITH city_average AS (
    SELECT
        city,
        AVG(salary) AS average_salary
    FROM employees
    WHERE city = NULL
    GROUP BY city
)
SELECT
    city,
    average_salary
FROM city_average;


-- =====================================================
-- DEBUG 09
-- Multiple CTE Analysis
-- =====================================================

-- Calculate employee count and average salary
-- for every department.

WITH employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS employee_count
    FROM employees
    GROUP BY department_id
),
salary_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)
SELECT
    e.department_id,
    e.employee_count,
    s.average_salary
FROM employee_count AS e
INNER JOIN salary_average AS s
    ON e.department_id = s.average_salary;


-- =====================================================
-- DEBUG 10
-- High-Paying Departments
-- =====================================================

-- Find employees who belong to departments
-- whose average salary is greater than 60000.

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
    WHERE average_salary < 60000
)
SELECT
    e.name,
    e.department_id,
    e.salary
FROM employees AS e
INNER JOIN high_paying_departments AS h
    ON e.department_id = h.department_id;


-- =====================================================
-- END OF DAY 10 DEBUGGING
-- =====================================================
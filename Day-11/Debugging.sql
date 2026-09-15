-- ============================================================
-- DAY 11 - ADVANCED CTE + MULTIPLE CTEs
-- Debugging Practice
-- PostgreSQL
-- ============================================================
--
-- IMPORTANT:
-- Every query below contains an intentional mistake.
-- Identify the problem and fix the query.
-- ============================================================


-- ============================================================
-- DEBUG 01
-- Problem: Multiple CTE syntax
-- ============================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)

employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY department_id
)

SELECT *
FROM department_average;


-- ============================================================
-- DEBUG 02
-- Problem: Incorrect CTE reference
-- ============================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)

SELECT
    department_id,
    avg_salary
FROM department_average;


-- ============================================================
-- DEBUG 03
-- Problem: Missing JOIN condition
-- ============================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
),

employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY department_id
)

SELECT
    da.department_id,
    da.average_salary,
    ec.total_employees
FROM department_average da
JOIN employee_count ec;


-- ============================================================
-- DEBUG 04
-- Problem: Wrong column used in JOIN
-- ============================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)

SELECT
    e.name,
    e.salary,
    da.average_salary
FROM employees e
JOIN department_average da
    ON e.employee_id = da.department_id
WHERE e.salary > da.average_salary;


-- ============================================================
-- DEBUG 05
-- Problem: Missing GROUP BY
-- ============================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
)

SELECT *
FROM department_average;


-- ============================================================
-- DEBUG 06
-- Problem: CTE used before it is defined
-- ============================================================

WITH high_paying_departments AS (
    SELECT
        department_id,
        average_salary
    FROM department_average
    WHERE average_salary > 60000
),

department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)

SELECT *
FROM high_paying_departments;


-- ============================================================
-- DEBUG 07
-- Problem: Incorrect comparison with aggregate CTE
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
    GROUP BY department_id
)

SELECT
    d.department_name,
    da.department_average_salary
FROM department_average da
JOIN departments d
    ON da.department_id = d.department_id
WHERE da.department_average_salary >
      company_average.company_average_salary;


-- ============================================================
-- DEBUG 08
-- Problem: Incorrect city NULL handling
-- ============================================================

WITH city_average AS (
    SELECT
        city,
        AVG(salary) AS city_average_salary
    FROM employees
    GROUP BY city
)

SELECT
    e.name,
    e.city,
    e.salary,
    ca.city_average_salary
FROM employees e
JOIN city_average ca
    ON e.city = ca.city
WHERE e.city = NULL
  AND e.salary > ca.city_average_salary;


-- ============================================================
-- DEBUG 09
-- Problem: Incorrect CTE chaining
-- ============================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
),

high_paying_departments AS (
    SELECT
        department_id,
        average_salary
    FROM department_average
    WHERE average_salary > 60000
),

department_employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees
    FROM high_paying_departments
    GROUP BY department_id
)

SELECT
    d.department_name,
    hpd.average_salary,
    dec.total_employees
FROM high_paying_departments hpd
JOIN department_employee_count dec
    ON hpd.department_id = dec.department_id
JOIN departments d
    ON hpd.department_id = d.department_id;


-- ============================================================
-- DEBUG 10
-- Problem: Wrong logical condition
-- ============================================================

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
        department_id,
        average_salary
    FROM department_average
    WHERE average_salary < 60000
)

SELECT
    d.department_name,
    hpd.average_salary
FROM high_paying_departments hpd
JOIN departments d
    ON hpd.department_id = d.department_id
ORDER BY hpd.average_salary DESC;


-- ============================================================
-- DEBUGGING TASK
-- ============================================================
--
-- For each query:
--
-- 1. Find the error.
-- 2. Understand why the query fails.
-- 3. Correct the query.
-- 4. Run the corrected query in PostgreSQL.
-- 5. Verify the result.
--
-- ============================================================
-- DAY 11 DEBUGGING PRACTICE
-- ============================================================
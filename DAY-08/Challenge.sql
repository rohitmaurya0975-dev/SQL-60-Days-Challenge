-- =====================================================
-- DAY 08 - MULTIPLE JOIN CHALLENGE
-- PostgreSQL
-- =====================================================


-- =====================================================
-- CHALLENGE 01
-- =====================================================
-- Find employees who earn more than the average salary
-- of their department.
--
-- Display:
-- employee_name
-- department_name
-- employee_salary
-- department_average_salary
--
-- Requirements:
-- Use Multiple JOIN
-- Use a Subquery
-- Use WHERE


-- =====================================================
-- CHALLENGE 02
-- =====================================================
-- Find departments where the total salary expense
-- is greater than 350000.
--
-- Display:
-- department_name
-- city
-- total_employees
-- total_salary
--
-- Requirements:
-- Use Multiple JOIN
-- Use COUNT()
-- Use SUM()
-- Use GROUP BY
-- Use HAVING
-- Sort by total_salary DESC


-- =====================================================
-- CHALLENGE 03
-- =====================================================
-- Find cities where the average employee salary
-- is greater than 65000.
--
-- Display:
-- city
-- total_employees
-- average_salary
-- highest_salary
--
-- Requirements:
-- Use Multiple JOIN
-- Use COUNT()
-- Use AVG()
-- Use MAX()
-- Use GROUP BY
-- Use HAVING
-- Sort by average_salary DESC


-- =====================================================
-- CHALLENGE 04
-- =====================================================
-- Identify departments that have at least one employee
-- earning 90000 or more.
--
-- Display:
-- department_name
-- city
-- highest_salary
--
-- Requirements:
-- Use Multiple JOIN
-- Use MAX()
-- Use GROUP BY
-- Use HAVING


-- =====================================================
-- CHALLENGE 05
-- =====================================================
-- Create a department performance classification.
--
-- Calculate the average salary of each department
-- and classify departments as:
--
-- Average Salary >= 75000  → Premium
-- Average Salary >= 60000  → Standard
-- Otherwise                → Basic
--
-- Display:
-- department_name
-- city
-- average_salary
-- department_category
--
-- Requirements:
-- Use Multiple JOIN
-- Use AVG()
-- Use GROUP BY
-- Use CASE WHEN


-- =====================================================
-- CHALLENGE 06
-- =====================================================
-- Find employees whose salary is higher than the
-- average salary of their city.
--
-- Display:
-- employee_name
-- department_name
-- city
-- employee_salary
-- city_average_salary
--
-- Requirements:
-- Use Multiple JOIN
-- Use a Subquery
-- Use WHERE


-- =====================================================
-- CHALLENGE 07
-- =====================================================
-- Find the highest-paid employee from each department.
--
-- Display:
-- department_name
-- employee_name
-- salary
--
-- Requirements:
-- Use Multiple JOIN
-- Use MAX()
-- Use GROUP BY
-- Use a Subquery or suitable filtering technique


-- =====================================================
-- CHALLENGE 08
-- =====================================================
-- Generate a management report for departments
-- having:
--
-- 1. At least 4 employees
-- 2. Average salary greater than 60000
-- 3. At least one employee earning 80000 or more
--
-- Display:
-- department_name
-- city
-- total_employees
-- average_salary
-- highest_salary
--
-- Requirements:
-- Use Multiple JOIN
-- COUNT()
-- AVG()
-- MAX()
-- GROUP BY
-- HAVING
-- ORDER BY


-- =====================================================
-- CHALLENGE 09
-- =====================================================
-- Generate a complete employee classification report.
--
-- Salary Category:
--
-- Salary >= 90000 → Executive
-- Salary >= 70000 → Senior
-- Salary >= 50000 → Mid-Level
-- Otherwise       → Junior
--
-- Additionally:
-- If department is missing, display 'Not Assigned'.
-- If city is missing, display 'Unknown City'.
--
-- Display:
-- employee_name
-- department_name
-- city
-- salary
-- salary_category
--
-- Requirements:
-- Use Multiple JOIN
-- Use LEFT JOIN
-- Use COALESCE()
-- Use CASE WHEN


-- =====================================================
-- CHALLENGE 10 — BUSINESS CHALLENGE
-- =====================================================
-- Management wants to identify the strongest
-- performing departments.
--
-- A department qualifies when:
--
-- 1. It has at least 4 employees.
-- 2. Average salary is greater than 60000.
-- 3. Total salary expense is greater than 350000.
-- 4. Highest employee salary is at least 80000.
--
-- Display:
-- department_name
-- city
-- total_employees
-- total_salary
-- average_salary
-- highest_salary
--
-- Requirements:
-- Use Multiple JOIN
-- COUNT()
-- SUM()
-- AVG()
-- MAX()
-- GROUP BY
-- HAVING
-- ORDER BY
--
-- Sort by average_salary DESC.

-- =====================================================
-- DAY 08 - MULTIPLE JOIN CHALLENGE
-- CHALLENGE SOLUTIONS
-- PostgreSQL
-- =====================================================


-- =====================================================
-- CHALLENGE 01
-- Employees earning more than their department average
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary AS employee_salary,
    (
        SELECT AVG(e2.salary)
        FROM employees AS e2
        WHERE e2.department_id = e.department_id
    ) AS department_average_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.department_id = e.department_id
)
ORDER BY e.salary DESC;


-- =====================================================
-- CHALLENGE 02
-- Departments with total salary expense > 350000
-- =====================================================

SELECT
    d.department_name,
    l.city,
    COUNT(e.employee_id) AS total_employees,
    SUM(e.salary) AS total_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
GROUP BY
    d.department_name,
    l.city
HAVING SUM(e.salary) > 350000
ORDER BY total_salary DESC;


-- =====================================================
-- CHALLENGE 03
-- Cities with average salary > 65000
-- =====================================================

SELECT
    l.city,
    COUNT(e.employee_id) AS total_employees,
    AVG(e.salary) AS average_salary,
    MAX(e.salary) AS highest_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
GROUP BY l.city
HAVING AVG(e.salary) > 65000
ORDER BY average_salary DESC;


-- =====================================================
-- CHALLENGE 04
-- Departments having at least one employee
-- earning 90000 or more
-- =====================================================

SELECT
    d.department_name,
    l.city,
    MAX(e.salary) AS highest_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
GROUP BY
    d.department_name,
    l.city
HAVING MAX(e.salary) >= 90000
ORDER BY highest_salary DESC;


-- =====================================================
-- CHALLENGE 05
-- Department performance classification
-- =====================================================

SELECT
    d.department_name,
    l.city,
    AVG(e.salary) AS average_salary,
    CASE
        WHEN AVG(e.salary) >= 75000 THEN 'Premium'
        WHEN AVG(e.salary) >= 60000 THEN 'Standard'
        ELSE 'Basic'
    END AS department_category
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
GROUP BY
    d.department_name,
    l.city
ORDER BY average_salary DESC;


-- =====================================================
-- CHALLENGE 06
-- Employees earning more than their city average
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    l.city,
    e.salary AS employee_salary,
    (
        SELECT AVG(e2.salary)
        FROM employees AS e2
        INNER JOIN departments AS d2
            ON e2.department_id = d2.department_id
        WHERE d2.location_id = d.location_id
    ) AS city_average_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    INNER JOIN departments AS d2
        ON e2.department_id = d2.department_id
    WHERE d2.location_id = d.location_id
)
ORDER BY e.salary DESC;


-- =====================================================
-- CHALLENGE 07
-- Highest-paid employee from each department
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
    WHERE e2.department_id = e.department_id
)
ORDER BY
    d.department_name,
    e.salary DESC;


-- =====================================================
-- CHALLENGE 08
-- High-performing departments
-- =====================================================

SELECT
    d.department_name,
    l.city,
    COUNT(e.employee_id) AS total_employees,
    AVG(e.salary) AS average_salary,
    MAX(e.salary) AS highest_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
GROUP BY
    d.department_name,
    l.city
HAVING
    COUNT(e.employee_id) >= 4
    AND AVG(e.salary) > 60000
    AND MAX(e.salary) >= 80000
ORDER BY average_salary DESC;


-- =====================================================
-- CHALLENGE 09
-- Complete employee classification report
-- =====================================================

SELECT
    e.name AS employee_name,
    COALESCE(d.department_name, 'Not Assigned') AS department_name,
    COALESCE(l.city, 'Unknown City') AS city,
    e.salary,
    CASE
        WHEN e.salary >= 90000 THEN 'Executive'
        WHEN e.salary >= 70000 THEN 'Senior'
        WHEN e.salary >= 50000 THEN 'Mid-Level'
        ELSE 'Junior'
    END AS salary_category
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
LEFT JOIN locations AS l
    ON d.location_id = l.location_id
ORDER BY e.employee_id;


-- =====================================================
-- CHALLENGE 10
-- Management Business Challenge
-- =====================================================

SELECT
    d.department_name,
    l.city,
    COUNT(e.employee_id) AS total_employees,
    SUM(e.salary) AS total_salary,
    AVG(e.salary) AS average_salary,
    MAX(e.salary) AS highest_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
GROUP BY
    d.department_name,
    l.city
HAVING
    COUNT(e.employee_id) >= 4
    AND AVG(e.salary) > 60000
    AND SUM(e.salary) > 350000
    AND MAX(e.salary) >= 80000
ORDER BY average_salary DESC;
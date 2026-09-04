-- =====================================================
-- DAY 08 - MULTIPLE JOIN PRACTICE
-- MY SOLUTIONS
-- PostgreSQL
-- =====================================================


-- =====================================================
-- Q01 — Employee Department Mapping
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id;


-- =====================================================
-- Q02 — Employee Office Information
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    l.city,
    l.state
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id;


-- =====================================================
-- Q03 — IT Department Employee Report
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    l.city,
    l.state,
    e.salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
WHERE d.department_name = 'IT';


-- =====================================================
-- Q04 — Department Employee Count
-- =====================================================

SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
GROUP BY d.department_name
ORDER BY total_employees DESC;


-- =====================================================
-- Q05 — Department Salary Analysis
-- =====================================================

SELECT
    d.department_name,
    l.city,
    COUNT(e.employee_id) AS total_employees,
    AVG(e.salary) AS average_salary
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
-- Q06 — High-Paying Departments
-- =====================================================

SELECT
    d.department_name,
    l.city,
    AVG(e.salary) AS average_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
GROUP BY
    d.department_name,
    l.city
HAVING AVG(e.salary) > 60000
ORDER BY average_salary DESC;


-- =====================================================
-- Q07 — City-Wise Salary Analysis
-- =====================================================

SELECT
    l.city,
    COUNT(e.employee_id) AS total_employees,
    SUM(e.salary) AS total_salary,
    AVG(e.salary) AS average_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
GROUP BY l.city
ORDER BY total_salary DESC;


-- =====================================================
-- Q08 — Employee Salary Classification
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary,
    CASE
        WHEN e.salary >= 80000 THEN 'High'
        WHEN e.salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id;


-- =====================================================
-- Q09 — Complete Employee Report with NULL Handling
-- =====================================================

SELECT
    e.name AS employee_name,
    COALESCE(d.department_name, 'Not Assigned') AS department_name,
    COALESCE(l.city, 'Unknown City') AS city,
    COALESCE(l.state, 'Unknown State') AS state,
    e.salary,
    CASE
        WHEN e.salary >= 80000 THEN 'High'
        WHEN e.salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
LEFT JOIN locations AS l
    ON d.location_id = l.location_id
ORDER BY e.employee_id;


-- =====================================================
-- Q10 — Management Business Analysis
-- =====================================================

SELECT
    d.department_name,
    l.city,
    COUNT(e.employee_id) AS total_qualifying_employees,
    AVG(e.salary) AS average_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
WHERE e.salary >= 50000
GROUP BY
    d.department_name,
    l.city
HAVING
    COUNT(e.employee_id) >= 3
    AND AVG(e.salary) > 60000
ORDER BY average_salary DESC;
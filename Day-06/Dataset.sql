-- =====================================================
-- DAY 06 - DATASET
-- Topic: LEFT JOIN, RIGHT JOIN
-- =====================================================

-- Day 05 ke existing tables:
-- employee2
-- departments

-- Check employee table
SELECT *
FROM employee2
ORDER BY employee_id;


-- Check departments table
SELECT *
FROM departments
ORDER BY department_id;


-- Check relationship
SELECT
    e.employee_id,
    e.name,
    e.department_id,
    d.department_name,
    e.salary
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
ORDER BY e.employee_id;


-- LEFT JOIN practice base
SELECT
    e.employee_id,
    e.name,
    e.department_id,
    d.department_name
FROM employee2 AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
ORDER BY e.employee_id;


-- RIGHT JOIN practice base
SELECT
    e.employee_id,
    e.name,
    d.department_id,
    d.department_name
FROM employee2 AS e
RIGHT JOIN departments AS d
    ON e.department_id = d.department_id
ORDER BY d.department_id;
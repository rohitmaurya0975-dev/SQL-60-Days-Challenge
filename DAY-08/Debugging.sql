-- =====================================================
-- DAY 08 - MULTIPLE JOIN
-- DEBUGGING PRACTICE
-- PostgreSQL
-- =====================================================


-- =====================================================
-- DEBUG 01
-- Issue: Incorrect JOIN condition
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name
FROM employees AS e
INNER JOIN departments AS d
    ON e.employee_id = d.department_id;


-- =====================================================
-- DEBUG 02
-- Issue: Incorrect location JOIN
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    l.city
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON e.department_id = l.location_id;


-- =====================================================
-- DEBUG 03
-- Issue: Filtering the wrong column
-- Requirement: Display only IT employees
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    l.city
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
WHERE e.name = 'IT';


-- =====================================================
-- DEBUG 04
-- Issue: Missing GROUP BY column
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
GROUP BY d.department_name;


-- =====================================================
-- DEBUG 05
-- Issue: Aggregate filtering incorrectly placed
-- Requirement: Average salary greater than 60000
-- =====================================================

SELECT
    d.department_name,
    AVG(e.salary) AS average_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE AVG(e.salary) > 60000
GROUP BY d.department_name;


-- =====================================================
-- DEBUG 06
-- Issue: NULL compared using =
-- Requirement: Find employees without a department
-- =====================================================

SELECT
    e.name AS employee_name,
    e.salary
FROM employees AS e
WHERE e.department_id = NULL;


-- =====================================================
-- DEBUG 07
-- Issue: LEFT JOIN converted into INNER JOIN
-- Requirement: Display all employees
-- including employees without a department
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_name IS NOT NULL;


-- =====================================================
-- DEBUG 08
-- Issue: Missing JOIN condition
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    l.city
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l;


-- =====================================================
-- DEBUG 09
-- Issue: WHERE condition changes the intended
-- LEFT JOIN result
-- Requirement: Keep all employees
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    l.city
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
LEFT JOIN locations AS l
    ON d.location_id = l.location_id
WHERE l.city = 'Mumbai';


-- =====================================================
-- DEBUG 10
-- BUSINESS DEBUGGING
--
-- Requirement:
-- Find departments having:
-- 1. At least 3 employees
-- 2. Average salary greater than 60000
--
-- Display:
-- department_name
-- city
-- total_employees
-- average_salary
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
WHERE COUNT(e.employee_id) >= 3
    AND AVG(e.salary) > 60000
GROUP BY
    d.department_name,
    l.city;
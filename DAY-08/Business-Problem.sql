-- =====================================================
-- DAY 08 - MULTIPLE JOIN
-- BUSINESS PROBLEMS
-- PostgreSQL
-- =====================================================


-- =====================================================
-- BUSINESS PROBLEM 01
-- Employee Department & Office Analysis
-- =====================================================
-- HR wants a complete employee directory containing
-- each employee's department and office location.
--
-- Display:
-- employee_name
-- department_name
-- city
-- state
--
-- Requirement:
-- Use employees, departments and locations.
-- Use Multiple JOIN.


-- =====================================================
-- BUSINESS PROBLEM 02
-- IT Department Salary Review
-- =====================================================
-- Management wants to review employees working
-- in the IT department.
--
-- Display:
-- employee_name
-- department_name
-- city
-- salary
--
-- Requirement:
-- Return only IT department employees.
-- Sort employees by salary DESC.


-- =====================================================
-- BUSINESS PROBLEM 03
-- Department Workforce Analysis
-- =====================================================
-- Management wants to identify departments based
-- on their employee workforce.
--
-- Display:
-- department_name
-- city
-- total_employees
-- average_salary
--
-- Requirement:
-- Include only departments having at least 4 employees.
-- Sort by total_employees DESC.


-- =====================================================
-- BUSINESS PROBLEM 04
-- High Salary Department Analysis
-- =====================================================
-- Finance wants to identify departments with a
-- strong average salary.
--
-- Display:
-- department_name
-- city
-- average_salary
-- highest_salary
--
-- Requirement:
-- Average salary must be greater than 60000.
-- Sort by average_salary DESC.


-- =====================================================
-- BUSINESS PROBLEM 05
-- City-Wise Compensation Analysis
-- =====================================================
-- Management wants to compare salary expenditure
-- across different office locations.
--
-- Display:
-- city
-- total_employees
-- total_salary
-- average_salary
-- highest_salary
--
-- Requirement:
-- Group employees by office city.
-- Sort by total_salary DESC.


-- =====================================================
-- BUSINESS PROBLEM 06
-- Employee Salary Classification
-- =====================================================
-- HR wants to classify employees according to
-- their salary level.
--
-- Classification:
--
-- Salary >= 80000  → High
-- Salary >= 50000  → Medium
-- Salary < 50000   → Low
--
-- Display:
-- employee_name
-- department_name
-- city
-- salary
-- salary_category
--
-- Requirement:
-- Use CASE WHEN.


-- =====================================================
-- BUSINESS PROBLEM 07
-- Missing Employee Information
-- =====================================================
-- HR wants a complete employee report, including
-- employees whose department information is missing.
--
-- Display:
-- employee_name
-- department_name
-- city
-- state
-- salary
--
-- Requirement:
-- Display all employees.
-- Use LEFT JOIN.
-- Replace missing department with 'Not Assigned'.
-- Replace missing city with 'Unknown City'.
-- Replace missing state with 'Unknown State'.
-- Use COALESCE().


-- =====================================================
-- BUSINESS PROBLEM 08
-- High-Performing Departments
-- =====================================================
-- Management wants to identify departments with
-- strong employee performance based on salary.
--
-- A department qualifies when:
--
-- 1. It has at least 4 employees.
-- 2. Average salary is greater than 60000.
-- 3. Highest salary is at least 80000.
--
-- Display:
-- department_name
-- city
-- total_employees
-- average_salary
-- highest_salary
--
-- Requirement:
-- Use COUNT(), AVG(), MAX(), GROUP BY and HAVING.
-- Sort by average_salary DESC.


-- =====================================================
-- BUSINESS PROBLEM 09
-- Salary Budget Analysis
-- =====================================================
-- Finance wants to identify departments whose total
-- salary expenditure is greater than 350000.
--
-- Display:
-- department_name
-- city
-- total_employees
-- total_salary
-- average_salary
--
-- Requirement:
-- Total salary must be greater than 350000.
-- Use SUM(), COUNT(), AVG(), GROUP BY and HAVING.
-- Sort by total_salary DESC.


-- =====================================================
-- BUSINESS PROBLEM 10
-- EXECUTIVE MANAGEMENT REPORT
-- =====================================================
-- Senior management wants to identify the strongest
-- departments for strategic review.
--
-- A department qualifies when:
--
-- 1. At least 4 employees are present.
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
-- Use Multiple JOIN.
-- Use COUNT().
-- Use SUM().
-- Use AVG().
-- Use MAX().
-- Use GROUP BY.
-- Use HAVING.
-- Use ORDER BY.
--
-- Sort by average_salary DESC.

-- =====================================================
-- DAY 08 - MULTIPLE JOIN
-- BUSINESS SOLUTIONS
-- PostgreSQL
-- =====================================================


-- =====================================================
-- BUSINESS PROBLEM 01
-- Employee Department & Office Analysis
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
    ON d.location_id = l.location_id
ORDER BY e.name;


-- =====================================================
-- BUSINESS PROBLEM 02
-- IT Department Salary Review
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    l.city,
    e.salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
WHERE d.department_name = 'IT'
ORDER BY e.salary DESC;


-- =====================================================
-- BUSINESS PROBLEM 03
-- Department Workforce Analysis
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
HAVING COUNT(e.employee_id) >= 4
ORDER BY total_employees DESC;


-- =====================================================
-- BUSINESS PROBLEM 04
-- High Salary Department Analysis
-- =====================================================

SELECT
    d.department_name,
    l.city,
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
HAVING AVG(e.salary) > 60000
ORDER BY average_salary DESC;


-- =====================================================
-- BUSINESS PROBLEM 05
-- City-Wise Compensation Analysis
-- =====================================================

SELECT
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
GROUP BY l.city
ORDER BY total_salary DESC;


-- =====================================================
-- BUSINESS PROBLEM 06
-- Employee Salary Classification
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    l.city,
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
    ON d.location_id = l.location_id
ORDER BY e.salary DESC;


-- =====================================================
-- BUSINESS PROBLEM 07
-- Missing Employee Information
-- =====================================================

SELECT
    e.name AS employee_name,
    COALESCE(d.department_name, 'Not Assigned') AS department_name,
    COALESCE(l.city, 'Unknown City') AS city,
    COALESCE(l.state, 'Unknown State') AS state,
    e.salary
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
LEFT JOIN locations AS l
    ON d.location_id = l.location_id
ORDER BY e.employee_id;


-- =====================================================
-- BUSINESS PROBLEM 08
-- High-Performing Departments
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
-- BUSINESS PROBLEM 09
-- Salary Budget Analysis
-- =====================================================

SELECT
    d.department_name,
    l.city,
    COUNT(e.employee_id) AS total_employees,
    SUM(e.salary) AS total_salary,
    AVG(e.salary) AS average_salary
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
-- BUSINESS PROBLEM 10
-- Executive Management Report
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
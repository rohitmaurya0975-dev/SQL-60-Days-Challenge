-- =====================================================
-- DAY 09 - SUBQUERIES
-- BUSINESS PROBLEMS
-- PostgreSQL
-- =====================================================
--
-- Objective:
-- Solve real-world business analysis problems using
-- SQL subqueries and correlated subqueries.
--
-- Dataset:
-- employees
-- departments
-- locations
--
-- Focus Areas:
-- - Business benchmarking
-- - Salary analysis
-- - Department performance
-- - Employee comparison
-- - Management reporting
--
-- =====================================================


-- =====================================================
-- BUSINESS PROBLEM 01
-- Company Salary Benchmark
-- =====================================================
--
-- Business Requirement:
-- HR wants to identify employees whose salary is
-- higher than the overall company average.
--
-- Display:
-- employee_name
-- department_id
-- salary
-- company_average_salary
--
-- Requirements:
-- - Use a subquery.
-- - Calculate the company average dynamically.
-- - Do not hardcode the average salary.
--
-- Skills:
-- - Subquery
-- - AVG()
-- - WHERE
-- =====================================================



-- =====================================================
-- BUSINESS PROBLEM 02
-- Department Salary Leaders
-- =====================================================
--
-- Business Requirement:
-- Management wants to identify the highest-paid
-- employee in every department.
--
-- Display:
-- department_name
-- employee_name
-- salary
--
-- Requirements:
-- - Use a correlated subquery.
-- - Return all employees if multiple employees
--   share the highest salary.
--
-- Skills:
-- - Correlated Subquery
-- - MAX()
-- - JOIN
-- - Handling Ties
-- =====================================================



-- =====================================================
-- BUSINESS PROBLEM 03
-- HR Salary Review
-- =====================================================
--
-- Business Requirement:
-- HR wants to find employees who earn more than
-- the average salary of their own department.
--
-- Display:
-- employee_name
-- department_name
-- salary
-- department_average_salary
--
-- Requirements:
-- - Use a correlated subquery.
-- - Compare each employee with their department
--   average.
--
-- Skills:
-- - Correlated Subquery
-- - AVG()
-- - Outer Query Reference
-- =====================================================



-- =====================================================
-- BUSINESS PROBLEM 04
-- High-Performing Departments
-- =====================================================
--
-- Business Requirement:
-- Management wants to identify departments whose
-- average salary is greater than the company-wide
-- average salary.
--
-- Display:
-- department_name
-- city
-- department_average_salary
-- company_average_salary
--
-- Requirements:
-- - Use GROUP BY.
-- - Use a subquery for company average.
-- - Use HAVING for department-level filtering.
--
-- Skills:
-- - Subquery
-- - AVG()
-- - GROUP BY
-- - HAVING
-- - Multiple JOIN
-- =====================================================



-- =====================================================
-- BUSINESS PROBLEM 05
-- City Salary Benchmark
-- =====================================================
--
-- Business Requirement:
-- Management wants to identify employees who earn
-- more than the average salary of employees in
-- their city.
--
-- Display:
-- employee_name
-- department_name
-- city
-- salary
-- city_average_salary
--
-- Requirements:
-- - Use a correlated subquery.
-- - Compare employee salary with city average.
--
-- Skills:
-- - Correlated Subquery
-- - AVG()
-- - JOIN
-- - Outer Query Reference
-- =====================================================



-- =====================================================
-- BUSINESS PROBLEM 06
-- Salary Above HR Benchmark
-- =====================================================
--
-- Business Requirement:
-- Management wants to identify employees whose
-- salary is higher than the highest salary currently
-- paid in the HR department.
--
-- Display:
-- employee_name
-- department_name
-- salary
-- highest_hr_salary
--
-- Requirements:
-- - Use a subquery to calculate the highest HR salary.
-- - Do not hardcode the salary value.
--
-- Skills:
-- - Subquery
-- - MAX()
-- - JOIN
-- =====================================================



-- =====================================================
-- BUSINESS PROBLEM 07
-- Department Workforce Comparison
-- =====================================================
--
-- Business Requirement:
-- Management wants to identify departments whose
-- employee count is greater than the average number
-- of employees per department.
--
-- Display:
-- department_name
-- employee_count
-- average_department_employee_count
--
-- Requirements:
-- - Calculate employee count for each department.
-- - Calculate the average department employee count
--   using a subquery.
-- - Compare both values.
--
-- Skills:
-- - Subquery
-- - COUNT()
-- - GROUP BY
-- - HAVING
-- - Nested Query
-- =====================================================



-- =====================================================
-- BUSINESS PROBLEM 08
-- Salary Budget Analysis
-- =====================================================
--
-- Business Requirement:
-- Finance wants to identify departments whose total
-- salary expense is greater than ₹350,000.
--
-- Display:
-- department_name
-- city
-- total_employees
-- total_salary
-- average_salary
--
-- Requirements:
-- - Use COUNT(), SUM(), and AVG().
-- - Group results by department.
-- - Use HAVING for salary-budget filtering.
--
-- Skills:
-- - Aggregate Functions
-- - GROUP BY
-- - HAVING
-- - Multiple JOIN
-- =====================================================



-- =====================================================
-- BUSINESS PROBLEM 09
-- Executive Salary Analysis
-- =====================================================
--
-- Business Requirement:
-- Management wants to identify employees who:
--
-- 1. Work in a department whose average salary
--    is greater than ₹60,000.
--
-- 2. Personally earn more than their own
--    department average salary.
--
-- Display:
-- employee_name
-- department_name
-- salary
-- department_average_salary
--
-- Requirements:
-- - Use correlated subqueries.
-- - Both conditions must be satisfied.
-- - Do not hardcode department IDs.
--
-- Skills:
-- - Correlated Subquery
-- - AVG()
-- - Multiple Conditions
-- - Outer Query Reference
-- =====================================================



-- =====================================================
-- BUSINESS PROBLEM 10
-- Strategic Department Analysis
-- =====================================================
--
-- Business Requirement:
-- Senior management wants a list of departments
-- that meet ALL strategic performance criteria:
--
-- 1. At least 4 employees
-- 2. Average salary greater than ₹60,000
-- 3. Total salary greater than ₹350,000
-- 4. Highest salary greater than ₹80,000
-- 5. Department average salary is greater than
--    the overall company average salary
--
-- Display:
-- department_name
-- city
-- total_employees
-- total_salary
-- average_salary
-- highest_salary
-- company_average_salary
--
-- Requirements:
-- - Use COUNT(), SUM(), AVG(), and MAX().
-- - Use GROUP BY.
-- - Use HAVING.
-- - Use a subquery for company average salary.
-- - All five conditions must be satisfied.
--
-- Skills:
-- - Subquery
-- - Aggregate Functions
-- - GROUP BY
-- - HAVING
-- - Multiple JOIN
-- - Business Analysis
-- =====================================================


-- =====================================================
-- BUSINESS ANALYSIS CHECKLIST
-- =====================================================
--
-- Before solving each problem:
--
-- 1. What business question is being asked?
--
-- 2. What value needs to be calculated first?
--
-- 3. Should that value come from:
--      - Company level?
--      - Department level?
--      - City level?
--      - Current employee's group?
--
-- 4. Does the subquery return:
--      - One value?
--      - Multiple values?
--      - A value dependent on the outer row?
--
-- 5. Should filtering happen using:
--      - WHERE?
--      - HAVING?
--
-- 6. Are NULL values relevant?
--
-- =====================================================
-- END OF DAY 09 BUSINESS PROBLEMS
-- ===================================SOLUTION-------------------------
-- =====================================================
-- DAY 09 - SUBQUERIES
-- BUSINESS SOLUTIONS
-- PostgreSQL
-- =====================================================


-- =====================================================
-- BUSINESS PROBLEM 01
-- Company Salary Benchmark
-- =====================================================
--
-- Find employees earning above the company average.
-- =====================================================

SELECT
    e.name AS employee_name,
    e.department_id,
    e.salary,
    (
        SELECT AVG(salary)
        FROM employees
    ) AS company_average_salary
FROM employees AS e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY e.salary DESC;


-- =====================================================
-- BUSINESS PROBLEM 02
-- Department Salary Leaders
-- =====================================================
--
-- Find the highest-paid employee in each department.
-- Correlated subquery is used to calculate the maximum
-- salary for the current employee's department.
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
ORDER BY d.department_name;


-- =====================================================
-- BUSINESS PROBLEM 03
-- HR Salary Review
-- =====================================================
--
-- Find employees earning more than their own
-- department average.
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary,
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
-- BUSINESS PROBLEM 04
-- High-Performing Departments
-- =====================================================
--
-- Find departments whose average salary is greater
-- than the company-wide average salary.
-- =====================================================

SELECT
    d.department_name,
    l.city,
    AVG(e.salary) AS department_average_salary,
    (
        SELECT AVG(salary)
        FROM employees
    ) AS company_average_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
GROUP BY
    d.department_id,
    d.department_name,
    l.city
HAVING AVG(e.salary) > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY department_average_salary DESC;


-- =====================================================
-- BUSINESS PROBLEM 05
-- City Salary Benchmark
-- =====================================================
--
-- Find employees earning more than the average salary
-- of employees in their city.
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    e.city,
    e.salary,
    (
        SELECT AVG(e2.salary)
        FROM employees AS e2
        WHERE e2.city = e.city
    ) AS city_average_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.city = e.city
)
ORDER BY e.salary DESC;


-- =====================================================
-- BUSINESS PROBLEM 06
-- Salary Above HR Benchmark
-- =====================================================
--
-- Find employees earning more than the highest salary
-- currently paid in the HR department.
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary,
    (
        SELECT MAX(e2.salary)
        FROM employees AS e2
        INNER JOIN departments AS d2
            ON e2.department_id = d2.department_id
        WHERE d2.department_name = 'HR'
    ) AS highest_hr_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT MAX(e2.salary)
    FROM employees AS e2
    INNER JOIN departments AS d2
        ON e2.department_id = d2.department_id
    WHERE d2.department_name = 'HR'
)
ORDER BY e.salary DESC;


-- =====================================================
-- BUSINESS PROBLEM 07
-- Department Workforce Comparison
-- =====================================================
--
-- Find departments whose employee count is greater
-- than the average number of employees per department.
--
-- The derived table calculates employee count for
-- each department.
--
-- The outer subquery calculates the average of those
-- department-level employee counts.
-- =====================================================

SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count,
    (
        SELECT AVG(department_employee_count)
        FROM (
            SELECT COUNT(*) AS department_employee_count
            FROM employees
            WHERE department_id IS NOT NULL
            GROUP BY department_id
        ) AS department_counts
    ) AS average_department_employee_count
FROM departments AS d
INNER JOIN employees AS e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name
HAVING COUNT(e.employee_id) > (
    SELECT AVG(department_employee_count)
    FROM (
        SELECT COUNT(*) AS department_employee_count
        FROM employees
        WHERE department_id IS NOT NULL
        GROUP BY department_id
    ) AS department_counts
)
ORDER BY employee_count DESC;


-- =====================================================
-- BUSINESS PROBLEM 08
-- Salary Budget Analysis
-- =====================================================
--
-- Find departments whose total salary expense is
-- greater than ₹350,000.
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
    d.department_id,
    d.department_name,
    l.city
HAVING SUM(e.salary) > 350000
ORDER BY total_salary DESC;


-- =====================================================
-- BUSINESS PROBLEM 09
-- Executive Salary Analysis
-- =====================================================
--
-- Conditions:
--
-- 1. Department average salary > ₹60,000
-- 2. Employee salary > their department average
--
-- Both conditions must be satisfied.
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary,
    (
        SELECT AVG(e2.salary)
        FROM employees AS e2
        WHERE e2.department_id = e.department_id
    ) AS department_average_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.department_id = e.department_id
) > 60000
AND e.salary > (
    SELECT AVG(e3.salary)
    FROM employees AS e3
    WHERE e3.department_id = e.department_id
)
ORDER BY e.salary DESC;


-- =====================================================
-- BUSINESS PROBLEM 10
-- Strategic Department Analysis
-- =====================================================
--
-- Find departments satisfying ALL five conditions:
--
-- 1. At least 4 employees
-- 2. Average salary > ₹60,000
-- 3. Total salary > ₹350,000
-- 4. Highest salary > ₹80,000
-- 5. Department average > company average
-- =====================================================

SELECT
    d.department_name,
    l.city,
    COUNT(e.employee_id) AS total_employees,
    SUM(e.salary) AS total_salary,
    AVG(e.salary) AS average_salary,
    MAX(e.salary) AS highest_salary,
    (
        SELECT AVG(salary)
        FROM employees
    ) AS company_average_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
GROUP BY
    d.department_id,
    d.department_name,
    l.city
HAVING COUNT(e.employee_id) >= 4
   AND AVG(e.salary) > 60000
   AND SUM(e.salary) > 350000
   AND MAX(e.salary) > 80000
   AND AVG(e.salary) > (
       SELECT AVG(salary)
       FROM employees
   )
ORDER BY average_salary DESC;


-- =====================================================
-- END OF DAY 09 BUSINESS SOLUTIONS
-- =====================================================
--
-- Concepts Practiced:
--
-- 1. Subqueries
-- 2. Correlated Subqueries
-- 3. Nested Subqueries
-- 4. Outer Query References
-- 5. AVG()
-- 6. MAX()
-- 7. COUNT()
-- 8. SUM()
-- 9. GROUP BY
-- 10. HAVING
-- 11. Multiple JOIN
-- 12. Business Benchmarking
--
-- =====================================================
-- =====================================================
-- DAY 09 - SUBQUERIES
-- CHALLENGE
-- PostgreSQL
-- =====================================================
--
-- Objective:
-- Solve the following advanced SQL problems using
-- subqueries and correlated subqueries.
--
-- Rules:
-- 1. Do not modify the dataset.
-- 2. Do not write solutions in this file.
-- 3. Use subqueries wherever explicitly required.
-- 4. Handle duplicate salaries correctly where applicable.
-- 5. Use meaningful aliases and readable SQL formatting.
--
-- Difficulty:
-- Q01-Q03  → Intermediate
-- Q04-Q06  → Advanced
-- Q07-Q10  → Expert
--
-- =====================================================


-- =====================================================
-- CHALLENGE 01
-- Employees Above Department Average
-- =====================================================
--
-- Find employees whose salary is greater than the
-- average salary of their own department.
--
-- Display:
-- employee_name
-- department_name
-- salary
-- department_average_salary
--
-- Requirements:
-- - Use a correlated subquery.
-- - Compare each employee's salary with their
--   department's average salary.
--
-- Skills:
-- - Correlated Subquery
-- - AVG()
-- - INNER JOIN
-- =====================================================



-- =====================================================
-- CHALLENGE 02
-- Highest-Paid Employee in Each Department
-- =====================================================
--
-- Find the highest-paid employee from every department.
--
-- Display:
-- department_name
-- employee_name
-- salary
--
-- Requirements:
-- - Use a correlated subquery.
-- - Return all employees tied for the highest salary
--   within their department.
--
-- Skills:
-- - Correlated Subquery
-- - MAX()
-- - INNER JOIN
-- - Handling Ties
-- =====================================================



-- =====================================================
-- CHALLENGE 03
-- Employees Earning More Than the Highest HR Salary
-- =====================================================
--
-- Find employees whose salary is greater than the
-- highest salary earned by any HR employee.
--
-- Display:
-- employee_name
-- department_name
-- salary
--
-- Requirements:
-- - Use a subquery to find the maximum HR salary.
-- - Do not hardcode the HR salary.
--
-- Skills:
-- - Subquery
-- - MAX()
-- - WHERE
-- - JOIN
-- =====================================================



-- =====================================================
-- CHALLENGE 04
-- Departments Above Company Average
-- =====================================================
--
-- Find departments whose average salary is greater
-- than the overall company average salary.
--
-- Display:
-- department_name
-- city
-- department_average_salary
-- company_average_salary
--
-- Requirements:
-- - Calculate the company average using a subquery.
-- - Calculate department averages using GROUP BY.
-- - Compare department average with company average.
--
-- Skills:
-- - Subquery
-- - AVG()
-- - GROUP BY
-- - HAVING
-- - Multiple JOIN
-- =====================================================



-- =====================================================
-- CHALLENGE 05
-- Employees Above City Average
-- =====================================================
--
-- Find employees whose salary is greater than the
-- average salary of employees working in the same city.
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
-- - Compare each employee's salary with the average
--   salary of their city.
--
-- Skills:
-- - Correlated Subquery
-- - AVG()
-- - JOIN
-- - Outer Query Reference
-- =====================================================



-- =====================================================
-- CHALLENGE 06
-- Second Highest Salary
-- =====================================================
--
-- Find the second-highest distinct salary in the
-- company and display all employees earning it.
--
-- Display:
-- employee_name
-- department_name
-- salary
--
-- Requirements:
-- - Use nested subqueries.
-- - Do not use LIMIT or OFFSET.
-- - If multiple employees have the second-highest
--   salary, return all of them.
--
-- Skills:
-- - Nested Subquery
-- - MAX()
-- - DISTINCT Salary Logic
-- =====================================================



-- =====================================================
-- CHALLENGE 07
-- Departments with High-Paid Employees
-- =====================================================
--
-- Find departments that have at least one employee
-- earning more than the overall company average salary.
--
-- Display:
-- department_name
-- city
-- highest_salary
--
-- Requirements:
-- - Use a subquery to calculate the company average.
-- - Use GROUP BY to calculate the highest salary
--   in each department.
-- - Return only departments whose highest salary
--   is greater than the company average.
--
-- Skills:
-- - Subquery
-- - AVG()
-- - MAX()
-- - GROUP BY
-- - HAVING
-- - Multiple JOIN
-- =====================================================



-- =====================================================
-- CHALLENGE 08
-- Employees Above Their Department's Minimum Salary
-- =====================================================
--
-- Find employees whose salary is greater than the
-- minimum salary of their own department.
--
-- Display:
-- employee_name
-- department_name
-- salary
-- department_minimum_salary
--
-- Requirements:
-- - Use a correlated subquery.
-- - Compare each employee's salary with the minimum
--   salary in their department.
--
-- Skills:
-- - Correlated Subquery
-- - MIN()
-- - Outer Query Reference
-- - JOIN
-- =====================================================



-- =====================================================
-- CHALLENGE 09
-- Strong Departments Analysis
-- =====================================================
--
-- Identify departments that satisfy ALL of the
-- following conditions:
--
-- 1. At least 4 employees
-- 2. Average salary greater than 60,000
-- 3. Highest salary greater than 80,000
-- 4. Total department salary greater than 350,000
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
-- - Use GROUP BY.
-- - Use COUNT(), SUM(), AVG(), and MAX().
-- - Use a subquery to calculate the company average salary.
-- - The department average must also be greater than
--   the company average.
-- - Use HAVING for group-level filtering.
--
-- Skills:
-- - Subquery
-- - Aggregate Functions
-- - GROUP BY
-- - HAVING
-- - Multiple Conditions
-- - Multiple JOIN
-- =====================================================



-- =====================================================
-- CHALLENGE 10
-- Executive Salary Benchmark
-- =====================================================
--
-- Find employees who satisfy BOTH conditions:
--
-- 1. They belong to a department whose average salary
--    is greater than 60,000.
--
-- 2. Their individual salary is greater than the average
--    salary of their own department.
--
-- Display:
-- employee_name
-- department_name
-- salary
-- department_average_salary
--
-- Requirements:
-- - Use correlated subqueries.
-- - Determine department average salary dynamically.
-- - Do not hardcode department IDs.
-- - Return employees only when both conditions are true.
--
-- Skills:
-- - Correlated Subquery
-- - AVG()
-- - Multiple Conditions
-- - Outer Query Reference
-- - INNER JOIN
-- =====================================================


-- =====================================================
-- END OF DAY 09 CHALLENGE
-- =====================================================
--
-- Recommended approach:
--
-- 1. Understand the requirement.
-- 2. Identify whether the subquery returns:
--      - One value
--      - Multiple values
--      - A value for each outer row
-- 3. Decide between:
--      =, >, <, >=, <=
--      IN / NOT IN
--      Correlated Subquery
-- 4. Test the inner query separately.
-- 5. Combine it with the outer query.
-- 6. Verify the final result.
--
-- Remember:
--
-- Normal Subquery:
-- Inner query works independently.
--
-- Correlated Subquery:
-- Inner query depends on the current row
-- of the outer query.
--
-- =====================================================SOLUTION-------------------------------
-- =====================================================
-- DAY 09 - SUBQUERIES
-- CHALLENGE SOLUTIONS
-- PostgreSQL
-- =====================================================
--
-- Topics Covered:
-- - Single-value Subqueries
-- - Correlated Subqueries
-- - Nested Subqueries
-- - AVG(), MAX(), MIN()
-- - GROUP BY
-- - HAVING
-- - Multiple JOIN
-- - Outer Query References
-- - Handling Ties
--
-- =====================================================


-- =====================================================
-- CHALLENGE 01
-- Employees Above Department Average
-- =====================================================
--
-- Find employees whose salary is greater than the
-- average salary of their own department.
--
-- Key Concept:
-- The inner query references the outer query's
-- department_id, making this a correlated subquery.
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
-- CHALLENGE 02
-- Highest-Paid Employee in Each Department
-- =====================================================
--
-- Find the highest-paid employee from every department.
--
-- The correlated subquery finds the maximum salary
-- within the current employee's department.
--
-- Salary ties are automatically handled because
-- salary = MAX(salary) can return multiple employees.
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
-- CHALLENGE 03
-- Employees Earning More Than the Highest HR Salary
-- =====================================================
--
-- Find employees whose salary is greater than the
-- highest salary earned by any HR employee.
--
-- The subquery first finds the maximum HR salary.
-- The outer query then compares every employee
-- against that value.
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary
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
-- CHALLENGE 04
-- Departments Above Company Average
-- =====================================================
--
-- Find departments whose average salary is greater
-- than the overall company average salary.
--
-- GROUP BY calculates the department average.
-- The subquery calculates the company-wide average.
-- HAVING performs the group-level comparison.
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
-- CHALLENGE 05
-- Employees Above City Average
-- =====================================================
--
-- Find employees whose salary is greater than the
-- average salary of employees in the same city.
--
-- The inner query references e.city from the outer
-- query, therefore this is a correlated subquery.
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
-- CHALLENGE 06
-- Second Highest Salary
-- =====================================================
--
-- Find the second-highest distinct salary and return
-- all employees earning that salary.
--
-- No LIMIT or OFFSET is used.
--
-- Logic:
-- 1. Find the highest salary.
-- 2. Find the maximum salary below the highest salary.
-- 3. Return all employees earning that salary.
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees AS e2
    WHERE e2.salary < (
        SELECT MAX(e3.salary)
        FROM employees AS e3
    )
)
ORDER BY e.salary DESC;


-- =====================================================
-- CHALLENGE 07
-- Departments with High-Paid Employees
-- =====================================================
--
-- Find departments whose highest salary is greater
-- than the overall company average salary.
--
-- MAX() finds the highest salary per department.
-- The subquery calculates the company average.
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
    d.department_id,
    d.department_name,
    l.city
HAVING MAX(e.salary) > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY highest_salary DESC;


-- =====================================================
-- CHALLENGE 08
-- Employees Above Their Department's Minimum Salary
-- =====================================================
--
-- Find employees whose salary is greater than the
-- minimum salary of their own department.
--
-- The inner query uses the current employee's
-- department_id from the outer query.
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary,
    (
        SELECT MIN(e2.salary)
        FROM employees AS e2
        WHERE e2.department_id = e.department_id
    ) AS department_minimum_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT MIN(e2.salary)
    FROM employees AS e2
    WHERE e2.department_id = e.department_id
)
ORDER BY e.salary DESC;


-- =====================================================
-- CHALLENGE 09
-- Strong Departments Analysis
-- =====================================================
--
-- Identify departments satisfying ALL conditions:
--
-- 1. At least 4 employees
-- 2. Average salary > 60,000
-- 3. Highest salary > 80,000
-- 4. Total salary > 350,000
-- 5. Department average > company average
--
-- HAVING is used because all conditions operate
-- on aggregated department-level values.
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
    d.department_id,
    d.department_name,
    l.city
HAVING COUNT(e.employee_id) >= 4
   AND AVG(e.salary) > 60000
   AND MAX(e.salary) > 80000
   AND SUM(e.salary) > 350000
   AND AVG(e.salary) > (
       SELECT AVG(salary)
       FROM employees
   )
ORDER BY average_salary DESC;


-- =====================================================
-- CHALLENGE 10
-- Executive Salary Benchmark
-- =====================================================
--
-- Find employees who satisfy BOTH conditions:
--
-- 1. Their department's average salary is greater
--    than 60,000.
--
-- 2. Their individual salary is greater than the
--    average salary of their own department.
--
-- Two correlated subqueries are used:
--
-- Subquery 1:
-- Determines whether the employee's department
-- has an average salary above 60,000.
--
-- Subquery 2:
-- Calculates the employee's own department average
-- for salary comparison.
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
-- END OF DAY 09 CHALLENGE SOLUTIONS
-- =====================================================
--
-- Key Concepts Practiced:
--
-- 1. Single-value Subquery
-- 2. Correlated Subquery
-- 3. Nested Subquery
-- 4. Outer Query Reference
-- 5. AVG()
-- 6. MAX()
-- 7. MIN()
-- 8. COUNT()
-- 9. SUM()
-- 10. GROUP BY
-- 11. HAVING
-- 12. Multiple JOIN
-- 13. Salary Benchmarking
-- 14. Department-level Analysis
--
-- =====================================================
-- =====================================================
-- DAY 10 - CTE (COMMON TABLE EXPRESSIONS)
-- MY SOLUTIONS
-- PostgreSQL
-- =====================================================


-- =====================================================
-- Q01. Employees Above Company Average
-- =====================================================

WITH company_average AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT
    e.name,
    e.salary
FROM employees AS e
CROSS JOIN company_average AS c
WHERE e.salary > c.avg_salary
ORDER BY e.salary DESC;


-- =====================================================
-- Q02. Highest-Paid Employee
-- =====================================================

WITH highest_salary AS (
    SELECT MAX(salary) AS max_salary
    FROM employees
)
SELECT
    e.name,
    e.salary
FROM employees AS e
CROSS JOIN highest_salary AS h
WHERE e.salary = h.max_salary;


-- =====================================================
-- Q03. Lowest-Paid Employee
-- =====================================================

WITH lowest_salary AS (
    SELECT MIN(salary) AS min_salary
    FROM employees
)
SELECT
    e.name,
    e.salary
FROM employees AS e
CROSS JOIN lowest_salary AS l
WHERE e.salary = l.min_salary;


-- =====================================================
-- Q04. Employees Earning More Than 60000
-- =====================================================

WITH high_salary_employees AS (
    SELECT
        employee_id,
        name,
        department_id,
        salary
    FROM employees
    WHERE salary > 60000
)
SELECT
    name,
    department_id,
    salary
FROM high_salary_employees
ORDER BY salary DESC;


-- =====================================================
-- Q05. IT Department Employees
-- =====================================================

WITH it_department AS (
    SELECT department_id
    FROM departments
    WHERE department_name = 'IT'
)
SELECT
    e.name,
    e.salary
FROM employees AS e
WHERE e.department_id IN (
    SELECT department_id
    FROM it_department
)
ORDER BY e.salary DESC;


-- =====================================================
-- Q06. Department Salary Summary
-- =====================================================

WITH department_summary AS (
    SELECT
        department_id,
        COUNT(*) AS employee_count,
        AVG(salary) AS average_salary,
        MAX(salary) AS maximum_salary,
        MIN(salary) AS minimum_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)
SELECT
    department_id,
    employee_count,
    average_salary,
    maximum_salary,
    minimum_salary
FROM department_summary
ORDER BY average_salary DESC;


-- =====================================================
-- Q07. Departments Above Company Average
-- =====================================================

WITH company_average AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
),
department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)
SELECT
    d.department_id,
    d.average_salary
FROM department_average AS d
CROSS JOIN company_average AS c
WHERE d.average_salary > c.avg_salary
ORDER BY d.average_salary DESC;


-- =====================================================
-- Q08. Department Maximum Salary
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
    department_id,
    maximum_salary
FROM department_max_salary
ORDER BY maximum_salary DESC;


-- =====================================================
-- Q09. Highest-Paid Employee in Each Department
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
-- Q10. City Salary Analysis
-- =====================================================

WITH city_average_salary AS (
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
FROM city_average_salary
ORDER BY average_salary DESC;


-- =====================================================
-- Q11. Departments With More Than 5 Employees
-- =====================================================

WITH department_employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS employee_count
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)
SELECT
    department_id,
    employee_count
FROM department_employee_count
WHERE employee_count > 5
ORDER BY employee_count DESC;


-- =====================================================
-- Q12. Employees Above Their Department Average
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
-- Q13. Departments With Average Salary Above 60000
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
-- Q14. High-Paid Employees From High-Paid Departments
-- =====================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),
high_paid_departments AS (
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
INNER JOIN high_paid_departments AS h
    ON e.department_id = h.department_id
ORDER BY e.salary DESC;


-- =====================================================
-- Q15. Salary Difference From Company Average
-- =====================================================

WITH company_average AS (
    SELECT AVG(salary) AS average_salary
    FROM employees
)
SELECT
    e.name,
    e.salary,
    e.salary - c.average_salary AS salary_difference
FROM employees AS e
CROSS JOIN company_average AS c
ORDER BY salary_difference DESC;


-- =====================================================
-- Q16. Department Performance Analysis
-- =====================================================

WITH employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS employee_count
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),
salary_summary AS (
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
INNER JOIN salary_summary AS s
    ON e.department_id = s.department_id
ORDER BY s.average_salary DESC;


-- =====================================================
-- Q17. High-Salary Department Employees
-- =====================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),
high_salary_departments AS (
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
INNER JOIN high_salary_departments AS h
    ON e.department_id = h.department_id
ORDER BY e.salary DESC;


-- =====================================================
-- Q18. Department Salary Ranking Preparation
-- =====================================================

WITH department_analysis AS (
    SELECT
        department_id,
        COUNT(*) AS employee_count,
        AVG(salary) AS average_salary,
        MAX(salary) AS maximum_salary,
        MIN(salary) AS minimum_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)
SELECT
    department_id,
    employee_count,
    average_salary,
    maximum_salary,
    minimum_salary
FROM department_analysis
ORDER BY average_salary DESC;


-- =====================================================
-- Q19. City Compensation Benchmark
-- =====================================================

WITH city_average AS (
    SELECT
        city,
        AVG(salary) AS city_average_salary
    FROM employees
    WHERE city IS NOT NULL
    GROUP BY city
)
SELECT
    e.name,
    e.city,
    e.salary,
    c.city_average_salary
FROM employees AS e
INNER JOIN city_average AS c
    ON e.city = c.city
WHERE e.salary > c.city_average_salary
ORDER BY e.salary DESC;


-- =====================================================
-- Q20. Executive Salary Analysis
-- =====================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS department_average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),
high_paid_departments AS (
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
INNER JOIN high_paid_departments AS h
    ON e.department_id = h.department_id
WHERE e.salary > h.department_average_salary
ORDER BY e.salary DESC;


-- =====================================================
-- END OF DAY 10 MY-SOLUTIONS
-- =====================================================
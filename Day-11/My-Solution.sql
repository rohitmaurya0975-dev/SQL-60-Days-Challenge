-- ============================================================
-- DAY 11 - ADVANCED CTE + MULTIPLE CTEs
-- My Solutions
-- PostgreSQL
-- ============================================================


-- ============================================================
-- Q01. Department Average Salary
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
    average_salary
FROM department_average
ORDER BY average_salary DESC;


-- ============================================================
-- Q02. Department Employee Count
-- ============================================================

WITH employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)
SELECT
    department_id,
    total_employees
FROM employee_count
ORDER BY total_employees DESC;


-- ============================================================
-- Q03. Department Salary Range
-- ============================================================

WITH salary_range AS (
    SELECT
        department_id,
        MIN(salary) AS minimum_salary,
        MAX(salary) AS maximum_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)
SELECT
    department_id,
    minimum_salary,
    maximum_salary
FROM salary_range
ORDER BY department_id;


-- ============================================================
-- Q04. Combine Department Average and Employee Count
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
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    da.department_id,
    da.average_salary,
    ec.total_employees
FROM department_average da
JOIN employee_count ec
    ON da.department_id = ec.department_id
ORDER BY da.average_salary DESC;


-- ============================================================
-- Q05. Department Summary With Names
-- ============================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),

employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    d.department_name,
    da.average_salary,
    ec.total_employees
FROM department_average da
JOIN employee_count ec
    ON da.department_id = ec.department_id
JOIN departments d
    ON da.department_id = d.department_id
ORDER BY da.average_salary DESC;


-- ============================================================
-- Q06. Departments Above Company Average
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
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    d.department_name,
    da.department_average_salary,
    ca.company_average_salary
FROM department_average da
CROSS JOIN company_average ca
JOIN departments d
    ON da.department_id = d.department_id
WHERE da.department_average_salary > ca.company_average_salary
ORDER BY da.department_average_salary DESC;


-- ============================================================
-- Q07. Highest Salary in Each Department
-- ============================================================

WITH department_max_salary AS (
    SELECT
        department_id,
        MAX(salary) AS maximum_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    e.name AS employee_name,
    e.salary,
    e.department_id
FROM employees e
JOIN department_max_salary dms
    ON e.department_id = dms.department_id
   AND e.salary = dms.maximum_salary
ORDER BY e.department_id;


-- ============================================================
-- Q08. Department Salary Analysis
-- ============================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),

department_maximum AS (
    SELECT
        department_id,
        MAX(salary) AS highest_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),

employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    d.department_name,
    da.average_salary,
    dm.highest_salary,
    ec.total_employees
FROM department_average da
JOIN department_maximum dm
    ON da.department_id = dm.department_id
JOIN employee_count ec
    ON da.department_id = ec.department_id
JOIN departments d
    ON da.department_id = d.department_id
ORDER BY da.average_salary DESC;


-- ============================================================
-- Q09. High-Paying Departments
-- ============================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    d.department_name,
    da.average_salary
FROM department_average da
JOIN departments d
    ON da.department_id = d.department_id
WHERE da.average_salary > 60000
ORDER BY da.average_salary DESC;


-- ============================================================
-- Q10. Above Department Average Employees
-- ============================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS department_average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    e.name AS employee_name,
    e.salary,
    d.department_name,
    da.department_average_salary
FROM employees e
JOIN department_average da
    ON e.department_id = da.department_id
JOIN departments d
    ON e.department_id = d.department_id
WHERE e.salary > da.department_average_salary
ORDER BY e.salary DESC;


-- ============================================================
-- Q11. City Salary Benchmark
-- ============================================================

WITH city_average AS (
    SELECT
        city,
        AVG(salary) AS city_average_salary
    FROM employees
    WHERE city IS NOT NULL
    GROUP BY city
)

SELECT
    e.name AS employee_name,
    e.city,
    e.salary,
    ca.city_average_salary
FROM employees e
JOIN city_average ca
    ON e.city = ca.city
WHERE e.salary > ca.city_average_salary
ORDER BY e.salary DESC;


-- ============================================================
-- Q12. Department and Location Analysis
-- ============================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),

employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    d.department_name,
    l.city,
    da.average_salary,
    ec.total_employees
FROM department_average da
JOIN employee_count ec
    ON da.department_id = ec.department_id
JOIN departments d
    ON da.department_id = d.department_id
JOIN locations l
    ON d.location_id = l.location_id
ORDER BY da.average_salary DESC;


-- ============================================================
-- Q13. Three-CTE Department Performance Analysis
-- ============================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),

employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),

department_maximum AS (
    SELECT
        department_id,
        MAX(salary) AS highest_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    d.department_name,
    da.average_salary,
    ec.total_employees,
    dm.highest_salary
FROM department_average da
JOIN employee_count ec
    ON da.department_id = ec.department_id
JOIN department_maximum dm
    ON da.department_id = dm.department_id
JOIN departments d
    ON da.department_id = d.department_id
WHERE da.average_salary > 60000
  AND ec.total_employees >= 5
ORDER BY da.average_salary DESC;


-- ============================================================
-- Q14. High-Salary Employees From High-Paying Departments
-- ============================================================

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS department_average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),

high_paying_departments AS (
    SELECT
        department_id,
        department_average_salary
    FROM department_average
    WHERE department_average_salary > 60000
)

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary,
    hpd.department_average_salary
FROM employees e
JOIN high_paying_departments hpd
    ON e.department_id = hpd.department_id
JOIN departments d
    ON e.department_id = d.department_id
WHERE e.salary > hpd.department_average_salary
ORDER BY e.salary DESC;


-- ============================================================
-- Q15. Department Salary Difference From Company Average
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
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    d.department_name,
    da.department_average_salary,
    ca.company_average_salary,
    da.department_average_salary
        - ca.company_average_salary AS salary_difference
FROM department_average da
CROSS JOIN company_average ca
JOIN departments d
    ON da.department_id = d.department_id
ORDER BY salary_difference DESC;


-- ============================================================
-- Q16. Department Salary Leaders
-- ============================================================

WITH department_max_salary AS (
    SELECT
        department_id,
        MAX(salary) AS maximum_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    d.department_name,
    e.name AS employee_name,
    e.salary
FROM department_max_salary dms
JOIN employees e
    ON dms.department_id = e.department_id
   AND dms.maximum_salary = e.salary
JOIN departments d
    ON e.department_id = d.department_id
ORDER BY d.department_name;


-- ============================================================
-- Q17. Multi-Level CTE Analysis
-- ============================================================

WITH employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),

department_average AS (
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
    WHERE average_salary > 60000
)

SELECT
    d.department_name,
    ec.total_employees,
    hpd.average_salary
FROM high_paying_departments hpd
JOIN employee_count ec
    ON hpd.department_id = ec.department_id
JOIN departments d
    ON hpd.department_id = d.department_id
WHERE ec.total_employees >= 5
ORDER BY hpd.average_salary DESC;


-- ============================================================
-- Q18. City and Department Benchmark
-- ============================================================

WITH city_average AS (
    SELECT
        city,
        AVG(salary) AS city_average_salary
    FROM employees
    WHERE city IS NOT NULL
    GROUP BY city
),

department_average AS (
    SELECT
        department_id,
        AVG(salary) AS department_average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    e.name AS employee_name,
    e.city,
    e.department_id,
    e.salary,
    ca.city_average_salary,
    da.department_average_salary
FROM employees e
JOIN city_average ca
    ON e.city = ca.city
JOIN department_average da
    ON e.department_id = da.department_id
WHERE e.salary > ca.city_average_salary
  AND e.salary > da.department_average_salary
ORDER BY e.salary DESC;


-- ============================================================
-- Q19. Executive Compensation Analysis
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
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),

department_maximum AS (
    SELECT
        department_id,
        MAX(salary) AS department_max_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary,
    ca.company_average_salary,
    da.department_average_salary,
    dm.department_max_salary
FROM employees e
CROSS JOIN company_average ca
JOIN department_average da
    ON e.department_id = da.department_id
JOIN department_maximum dm
    ON e.department_id = dm.department_id
JOIN departments d
    ON e.department_id = d.department_id
WHERE e.salary > ca.company_average_salary
  AND e.salary > da.department_average_salary
  AND dm.department_max_salary > 90000
ORDER BY e.salary DESC;


-- ============================================================
-- Q20. Complete Department Performance Report
-- ============================================================

WITH company_average AS (
    SELECT
        AVG(salary) AS company_average_salary
    FROM employees
),

department_summary AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees,
        AVG(salary) AS average_salary,
        MIN(salary) AS minimum_salary,
        MAX(salary) AS maximum_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    d.department_name,
    ds.total_employees,
    ds.average_salary,
    ds.minimum_salary,
    ds.maximum_salary,
    ca.company_average_salary,
    ds.average_salary
        - ca.company_average_salary AS salary_difference_from_company_average
FROM department_summary ds
CROSS JOIN company_average ca
JOIN departments d
    ON ds.department_id = d.department_id
WHERE ds.total_employees >= 5
ORDER BY ds.average_salary DESC;


-- ============================================================
-- DAY 11 - MY SOLUTIONS COMPLETE
-- ============================================================
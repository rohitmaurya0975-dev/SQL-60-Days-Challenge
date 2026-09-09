-- =====================================================
-- DAY 09 - SUBQUERIES
-- MY SOLUTIONS
-- PostgreSQL
-- =====================================================


-- =====================================================
-- Q01 - Employees Above Company Average Salary
-- =====================================================

SELECT
    name AS employee_name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY salary DESC;


-- =====================================================
-- Q02 - Highest-Paid Employee
-- =====================================================

SELECT
    name AS employee_name,
    salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);


-- =====================================================
-- Q03 - Lowest-Paid Employee
-- =====================================================

SELECT
    name AS employee_name,
    salary
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);


-- =====================================================
-- Q04 - Employees in IT Department
-- =====================================================

SELECT
    name AS employee_name,
    department_id,
    salary
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE department_name = 'IT'
)
ORDER BY salary DESC;


-- =====================================================
-- Q05 - Employees Outside IT and HR
-- =====================================================

SELECT
    name AS employee_name,
    department_id,
    salary
FROM employees
WHERE department_id NOT IN (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('IT', 'HR')
)
ORDER BY salary DESC;


-- =====================================================
-- Q06 - Employees Above Their Department Average
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
-- Q07 - Employees Earning More Than Highest HR Salary
-- =====================================================

SELECT
    e.name AS employee_name,
    e.department_id,
    e.salary
FROM employees AS e
WHERE e.salary > (
    SELECT MAX(e2.salary)
    FROM employees AS e2
    INNER JOIN departments AS d2
        ON e2.department_id = d2.department_id
    WHERE d2.department_name = 'HR'
)
ORDER BY e.salary DESC;


-- =====================================================
-- Q08 - Departments with Employees Above
-- Company Average Salary
-- =====================================================

SELECT DISTINCT
    d.department_name,
    l.city
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY d.department_name;


-- =====================================================
-- Q09 - Highest-Paid Employee in Each Department
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
ORDER BY e.salary DESC;


-- =====================================================
-- Q10 - Employees Above City Average
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
-- Q11 - Second Highest Salary
-- =====================================================

SELECT
    name AS employee_name,
    salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);


-- =====================================================
-- Q12 - Departments Above Company Average Salary
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
    d.department_name,
    l.city
HAVING AVG(e.salary) > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY department_average_salary DESC;


-- =====================================================
-- Q13 - Employees Above Maximum Junior Salary
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
    WHERE e2.department_id = e.department_id
      AND e2.salary < 60000
)
ORDER BY e.salary DESC;


-- =====================================================
-- Q14 - Departments with Above-Average Employee Count
-- =====================================================

SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments AS d
INNER JOIN employees AS e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
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
-- Q15 - HR Salary Benchmark Analysis
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary,
    (
        SELECT AVG(salary)
        FROM employees
    ) AS company_average_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY e.salary DESC;


-- =====================================================
-- Q16 - High-Paying Department Analysis
-- =====================================================

SELECT
    d.department_name,
    l.city,
    AVG(e.salary) AS average_salary,
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
    d.department_name,
    l.city
HAVING AVG(e.salary) > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY average_salary DESC;


-- =====================================================
-- Q17 - Salary Outlier Analysis
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < 50000
)
ORDER BY e.salary DESC;


-- =====================================================
-- Q18 - Department Leader Analysis
-- =====================================================

SELECT
    d.department_name,
    e.name AS employee_name,
    e.salary,
    l.city
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees AS e2
    WHERE e2.department_id = e.department_id
)
ORDER BY d.department_name;


-- =====================================================
-- Q19 - City Compensation Benchmark
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
-- Q20 - Executive Salary Analysis
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.department_id IN (
        SELECT d2.department_id
        FROM departments AS d2
        WHERE d2.department_id IN (
            SELECT e3.department_id
            FROM employees AS e3
            GROUP BY e3.department_id
            HAVING AVG(e3.salary) > 60000
        )
    )
)
ORDER BY e.salary DESC;


-- =====================================================
-- END OF DAY 09 - MY SOLUTIONS
-- =====================================================
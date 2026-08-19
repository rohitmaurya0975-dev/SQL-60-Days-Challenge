-- =====================================================
-- DAY 05 - MY SOLUTIONS
-- Topic: INNER JOIN
-- Tables: employee2 + departments
-- =====================================================


-- =====================================================
-- Q1 — Basic INNER JOIN
-- =====================================================

-- Goal:
-- Employee name aur department name display karna.

SELECT
    e.name,
    d.department_name
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id;

-- CONCEPT:
-- INNER JOIN sirf matching department_id wale records
-- ko combine karta hai.


-- =====================================================
-- Q2 — Employee + Salary + Department
-- =====================================================

SELECT
    e.name,
    e.salary,
    d.department_name
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id;

-- CONCEPT:
-- Ek JOIN se hum employee table aur department table
-- se columns ek saath retrieve kar sakte hain.


-- =====================================================
-- Q3 — INNER JOIN with WHERE
-- =====================================================

-- Goal:
-- Sirf IT department ke employees.

SELECT
    e.name,
    e.salary,
    d.department_name
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_name = 'IT';

-- CONCEPT:
-- JOIN tables ko connect karta hai.
-- WHERE result ko filter karta hai.


-- =====================================================
-- Q4 — Salary Filter with JOIN
-- =====================================================

-- Goal:
-- Salary >= 60000 wale employees.

SELECT
    e.name,
    e.salary,
    d.department_name
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary >= 60000;

-- CONCEPT:
-- JOIN ke baad WHERE ka use karke specific
-- employees filter kar sakte hain.


-- =====================================================
-- Q5 — IT High-Salary Employees
-- =====================================================

-- Goal:
-- IT department + salary >= 65000.

SELECT
    e.name,
    e.salary,
    d.department_name
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_name = 'IT'
  AND e.salary >= 65000;

-- CONCEPT:
-- AND ka matlab dono conditions TRUE honi chahiye.


-- =====================================================
-- Q6 — Finance Employees
-- =====================================================

-- Goal:
-- Finance employees ko highest salary se lowest salary
-- order mein display karna.

SELECT
    e.name,
    e.salary,
    d.department_name
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_name = 'Finance'
ORDER BY e.salary DESC;

-- CONCEPT:
-- ORDER BY salary DESC highest salary ko top par
-- rakhta hai.


-- =====================================================
-- Q7 — Table Aliases
-- =====================================================

SELECT
    e.name AS employee_name,
    e.salary,
    d.department_name
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id;

-- CONCEPT:
-- e = employee2
-- d = departments
--
-- Alias query ko short aur readable banata hai.


-- =====================================================
-- Q8 — Multiple Conditions
-- =====================================================

-- Rules:
-- IT + salary >= 60000
-- OR
-- Finance + salary >= 55000

SELECT
    e.name,
    d.department_name,
    e.salary
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE (d.department_name = 'IT'
       AND e.salary >= 60000)
   OR (d.department_name = 'Finance'
       AND e.salary >= 55000);

-- CONCEPT:
-- AND conditions ko group karne ke liye parentheses
-- use kiye gaye hain.
--
-- OR ke through dono business rules ko combine kiya.


-- =====================================================
-- Q9 — Department-wise Employee List
-- =====================================================

SELECT
    d.department_name,
    e.name,
    e.salary
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
ORDER BY
    d.department_name ASC,
    e.salary DESC;

-- CONCEPT:
-- Multiple columns ke basis par ORDER BY kar sakte hain.
--
-- Pehle department ascending.
-- Same department ke andar salary descending.


-- =====================================================
-- Q10 — FINAL JOIN BUSINESS QUESTION
-- =====================================================

-- Rules:
--
-- IT + salary >= 70000
-- OR
-- Finance + salary >= 65000
-- OR
-- HR + salary >= 60000

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE (d.department_name = 'IT'
       AND e.salary >= 70000)
   OR (d.department_name = 'Finance'
       AND e.salary >= 65000)
   OR (d.department_name = 'HR'
       AND e.salary >= 60000)
ORDER BY e.salary DESC;

-- CONCEPT:
-- Ye real-world business filtering ka example hai.
--
-- INNER JOIN:
-- Employee aur department information connect karta hai.
--
-- AND:
-- Department aur salary dono conditions check karta hai.
--
-- OR:
-- Multiple business rules ko combine karta hai.
--
-- ORDER BY DESC:
-- Highest salary ko top par display karta hai.


-- =====================================================
-- DAY 05 KEY LEARNING
-- =====================================================

-- Primary Key
-- → Unique identity of a record.
--
-- Foreign Key
-- → Do tables ke beech relationship create karta hai.
--
-- INNER JOIN
-- → Sirf matching records return karta hai.
--
-- ON
-- → JOIN condition define karta hai.
--
-- WHERE
-- → Records ko filter karta hai.
--
-- ORDER BY
-- → Result ko sort karta hai.
--
-- Alias
-- → Table names ko short aur readable banata hai.


-- =====================================================
-- IMPORTANT JOIN PATTERN
-- =====================================================

SELECT
    e.name,
    d.department_name
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary >= 60000
ORDER BY e.salary DESC;
-- =====================================================
-- DAY 05 - SQL JOIN DEBUGGING
-- Topic: INNER JOIN Errors
-- Tables: employee2 + departments
-- =====================================================


-- =====================================================
-- DEBUG 1 — Wrong JOIN Condition
-- =====================================================

-- ❌ Problem:
-- JOIN condition mein wrong columns use kiye gaye hain.

SELECT
    e.name,
    d.department_name
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.employee_id = d.department_id;


-- ✅ Fix:
-- employee2.department_id ko
-- departments.department_id se match karna hai.



-- =====================================================
-- DEBUG 2 — Missing ON Condition
-- =====================================================

-- ❌ Problem:
-- INNER JOIN ke saath ON condition missing hai.

SELECT
    e.name,
    d.department_name
FROM employee2 AS e
INNER JOIN departments AS d;



-- =====================================================
-- DEBUG 3 — Wrong Table Alias
-- =====================================================

-- ❌ Problem:
-- Table alias 'd' define kiya gaya hai,
-- lekin SELECT mein incorrect alias use hua hai.

SELECT
    e.name,
    dept.department_name
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id;



-- =====================================================
-- DEBUG 4 — Wrong WHERE Column
-- =====================================================

-- ❌ Problem:
-- Department name departments table mein hai,
-- employee2 mein nahi.

SELECT
    e.name,
    e.salary,
    d.department_name
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.department_name = 'IT';



-- =====================================================
-- DEBUG 5 — AND / OR Logic Error
-- =====================================================

-- ❌ Business Rule:
-- IT + salary >= 65000
-- OR
-- Finance + salary >= 60000

SELECT
    e.name,
    d.department_name,
    e.salary
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_name = 'IT'
  AND e.salary >= 65000
  OR d.department_name = 'Finance'
  AND e.salary >= 60000;



-- =====================================================
-- DEBUG 6 — Wrong ORDER BY
-- =====================================================

-- ❌ Problem:
-- Salary ko highest se lowest sort karna tha,
-- lekin ASC use kiya gaya hai.

SELECT
    e.name,
    d.department_name,
    e.salary
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
ORDER BY e.salary ASC;



-- =====================================================
-- DEBUG 7 — Alias Not Defined
-- =====================================================

-- ❌ Problem:
-- SELECT mein 'emp' alias use hua,
-- lekin employee2 ka alias 'e' hai.

SELECT
    emp.name,
    d.department_name
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id;



-- =====================================================
-- DEBUG 8 — Incorrect Salary Condition
-- =====================================================

-- ❌ Requirement:
-- Salary 60000 ya greater honi chahiye.

SELECT
    e.name,
    e.salary,
    d.department_name
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary < 60000;



-- =====================================================
-- DEBUG 9 — Missing Parentheses
-- =====================================================

-- ❌ Business Rule:
-- IT + salary >= 70000
-- OR
-- Finance + salary >= 65000
-- OR
-- HR + salary >= 60000

SELECT
    e.name,
    d.department_name,
    e.salary
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_name = 'IT'
  AND e.salary >= 70000
  OR d.department_name = 'Finance'
  AND e.salary >= 65000
  OR d.department_name = 'HR'
  AND e.salary >= 60000;



-- =====================================================
-- DEBUG 10 — FINAL DEBUGGING 🔥
-- =====================================================

-- ❌ Requirement:
-- Find employees from IT or Finance
-- whose salary is >= 60000.
--
-- Display:
-- name
-- department_name
-- salary
--
-- Highest salary first.

SELECT
    e.name,
    d.department_name,
    e.salary
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.employee_id = d.department_id
WHERE d.department_name = 'IT'
   OR d.department_name = 'Finance'
  AND e.salary >= 60000
ORDER BY e.salary ASC;



-- =====================================================
-- DEBUGGING CHECKLIST
-- =====================================================

-- Before executing a JOIN query, check:

-- 1. Correct tables?
-- 2. Correct aliases?
-- 3. Correct JOIN columns?
-- 4. ON condition present?
-- 5. Correct WHERE column?
-- 6. AND / OR logic correct?
-- 7. Parentheses required?
-- 8. Correct comparison operator?
-- 9. Correct ORDER BY direction?
-- 10. Does the output match the business requirement?
-- =====================================================
-- DAY 07 - SELF JOIN
-- DEBUGGING PRACTICE
-- Table: employees_hierarchy
-- =====================================================


-- =====================================================
-- Q1. WRONG JOIN CONDITION
-- =====================================================

SELECT
    e.name AS employee_name,
    m.name AS manager_name
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.employee_id = m.manager_id;


-- ❌ Find the mistake:
-- Employee ka manager_id kis column se match hona chahiye?


-- =====================================================
-- Q2. WRONG ALIAS
-- =====================================================

SELECT
    e.name AS employee_name,
    m.name AS manager_name
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = e.employee_id;


-- ❌ Find the mistake:
-- ON condition mein kaunsa alias manager ko represent karta hai?


-- =====================================================
-- Q3. MISSING ON CLAUSE
-- =====================================================

SELECT
    e.name AS employee_name,
    m.name AS manager_name
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
WHERE e.department = 'IT';


-- ❌ Find the missing part.
-- SELF JOIN ko relationship kaise define karoge?


-- =====================================================
-- Q4. WRONG WHERE CONDITION
-- =====================================================

SELECT
    e.name AS employee_name,
    m.name AS manager_name
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
WHERE m.department = e.department;


-- ❌ Query syntactically correct hai.
-- Lekin agar question ho:
-- "IT employees and their managers"
-- to WHERE condition kya honi chahiye?


-- =====================================================
-- Q5. WRONG SALARY COMPARISON
-- =====================================================

SELECT
    e.name AS employee_name,
    e.salary AS employee_salary,
    m.name AS manager_name,
    m.salary AS manager_salary
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
WHERE e.salary > e.salary;


-- ❌ Employee salary ko kiske salary se compare karna chahiye?


-- =====================================================
-- Q6. WRONG GROUP BY
-- =====================================================

SELECT
    m.name AS manager_name,
    COUNT(e.employee_id) AS employee_count
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
GROUP BY e.name;


-- ❌ Find the GROUP BY mistake.
-- Hum kis person ke according employees count kar rahe hain?


-- =====================================================
-- Q7. WRONG HAVING
-- =====================================================

SELECT
    m.name AS manager_name,
    COUNT(e.employee_id) AS employee_count
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.name
HAVING COUNT(e.employee_id) < 1;


-- ❌ Question:
-- "Managers having more than 1 employee"
-- HAVING condition kya honi chahiye?


-- =====================================================
-- Q8. WRONG CITY COMPARISON
-- =====================================================

SELECT
    e.name AS employee_name,
    e.city AS employee_city,
    m.name AS manager_name,
    m.city AS manager_city
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
WHERE e.city != m.city;


-- ❌ Question:
-- "Employees living in the SAME city as their manager"
-- Comparison operator kya hona chahiye?


-- =====================================================
-- Q9. WRONG 10% SALARY LOGIC
-- =====================================================

SELECT
    e.name AS employee_name,
    e.salary AS employee_salary,
    m.name AS manager_name,
    m.salary AS manager_salary
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
WHERE e.salary <= m.salary * 1.10;


-- ❌ Question:
-- Employee salary manager se AT LEAST 10% lower honi chahiye.
-- Formula mein kya mistake hai?


-- =====================================================
-- Q10. WRONG ORDER BY
-- =====================================================

SELECT
    e.name AS employee_name,
    e.salary AS employee_salary,
    m.name AS manager_name,
    m.salary AS manager_salary
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
ORDER BY m.salary ASC;


-- ❌ Question:
-- Agar employee salary ko highest → lowest sort karna ho,
-- ORDER BY mein kya change karoge?


-- =====================================================
-- DEBUGGING CHECKLIST
-- =====================================================

-- [ ] Correct aliases?
-- [ ] Correct ON condition?
-- [ ] e.manager_id = m.employee_id ?
-- [ ] WHERE correct alias par laga hai?
-- [ ] Employee vs Manager columns correctly compare kiye?
-- [ ] GROUP BY correct manager column par hai?
-- [ ] HAVING aggregate condition ke liye use hua?
-- [ ] ORDER BY correct column par hai?


-- =====================================================
-- DAY 07 DEBUGGING
-- 10 Problems
-- =====================================================
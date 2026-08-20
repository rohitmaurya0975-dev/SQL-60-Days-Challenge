-- =====================================================
-- DAY 06 - SQL JOIN DEBUGGING
-- Topic: LEFT JOIN & RIGHT JOIN
-- Tables: employee2 + departments
-- =====================================================


-- =====================================================
-- DEBUG 1 — Wrong JOIN Columns
-- =====================================================

-- ❌ Problem:
-- Wrong columns ko JOIN kiya gaya hai.

SELECT
    e.name,
    d.department_name
FROM employee2 AS e
LEFT JOIN departments AS d
    ON e.employee_id = d.department_id;


-- =====================================================
-- DEBUG 2 — LEFT JOIN Converted to INNER JOIN
-- =====================================================

-- ❌ Requirement:
-- Har employee ko display karna hai,
-- chahe department match kare ya nahi.
--
-- Problem identify karo.

SELECT
    e.name,
    d.department_name
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id;


-- =====================================================
-- DEBUG 3 — Wrong NULL Check
-- =====================================================

-- ❌ Requirement:
-- Aise employees find karo jinka department
-- departments table mein exist nahi karta.

SELECT
    e.employee_id,
    e.name,
    e.department_id
FROM employee2 AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_id = NULL;


-- =====================================================
-- DEBUG 4 — Wrong RIGHT JOIN Direction
-- =====================================================

-- ❌ Requirement:
-- Har department display hona chahiye,
-- chahe usmein employee ho ya na ho.

SELECT
    d.department_name,
    e.name
FROM departments AS d
LEFT JOIN employee2 AS e
    ON d.department_id = e.department_id;


-- =====================================================
-- DEBUG 5 — WHERE Removes Unmatched Departments
-- =====================================================

-- ❌ Requirement:
-- Har department display hona chahiye.
-- Sirf salary >= 60000 wale employees show hone chahiye.
--
-- Problem:
-- Kuch departments result se disappear ho sakte hain.

SELECT
    d.department_name,
    e.name,
    e.salary
FROM departments AS d
LEFT JOIN employee2 AS e
    ON d.department_id = e.department_id
WHERE e.salary >= 60000;


-- =====================================================
-- DEBUG 6 — Wrong Table Alias
-- =====================================================

-- ❌ Problem:
-- employee2 ka alias 'e' hai,
-- lekin SELECT mein 'emp' use kiya gaya hai.

SELECT
    emp.name,
    d.department_name
FROM employee2 AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id;


-- =====================================================
-- DEBUG 7 — Missing JOIN Condition
-- =====================================================

-- ❌ Problem:
-- LEFT JOIN ke saath ON condition missing hai.

SELECT
    e.name,
    d.department_name
FROM employee2 AS e
LEFT JOIN departments AS d;


-- =====================================================
-- DEBUG 8 — Wrong Department Filter
-- =====================================================

-- ❌ Requirement:
-- Har employee ko preserve karna hai,
-- aur IT department ke employees ki information
-- available ho to show karni hai.
--
-- Problem identify karo.

SELECT
    e.name,
    d.department_name,
    e.salary
FROM employee2 AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_name = 'IT';


-- =====================================================
-- DEBUG 9 — Wrong AND Placement
-- =====================================================

-- ❌ Requirement:
-- Har department display hona chahiye.
-- Sirf salary >= 65000 wale employees show hone chahiye.
--
-- Problem:
-- JOIN ke baad filtering ki placement galat hai.

SELECT
    d.department_name,
    e.name,
    e.salary
FROM departments AS d
LEFT JOIN employee2 AS e
    ON d.department_id = e.department_id
WHERE e.salary >= 65000;


-- =====================================================
-- DEBUG 10 — FINAL DEBUGGING 🔥
-- =====================================================

-- ❌ Business Requirement:
--
-- 1. Every department must appear.
-- 2. Only employees with salary >= 60000
--    should be displayed.
-- 3. Departments without qualifying employees
--    should still appear.
-- 4. Highest salary first.
--
-- Problem:
-- Query requirement ko completely satisfy nahi karti.

SELECT
    d.department_name,
    e.name AS employee_name,
    e.salary
FROM departments AS d
LEFT JOIN employee2 AS e
    ON d.department_id = e.department_id
WHERE e.salary >= 60000
ORDER BY e.salary DESC;


-- =====================================================
-- DEBUGGING CHECKLIST
-- =====================================================

-- 1. LEFT table kaunsi hai?
-- 2. RIGHT table kaunsi hai?
-- 3. Correct JOIN type use hua?
-- 4. ON condition correct hai?
-- 5. PK/FK relationship correct hai?
-- 6. IS NULL correctly use hua?
-- 7. WHERE unmatched rows ko remove to nahi kar raha?
-- 8. Filtering ON mein honi chahiye ya WHERE mein?
-- 9. Aliases correct hain?
-- 10. ORDER BY requirement ke according hai?
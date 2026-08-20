-- =====================================================
-- DAY 06 - BUSINESS PROBLEMS
-- Topic: LEFT JOIN & RIGHT JOIN
-- Tables: employee2 + departments
-- =====================================================


-- =====================================================
-- BUSINESS PROBLEM 1
-- =====================================================

-- HR ko complete employee list chahiye.
--
-- Har employee report mein hona chahiye,
-- chahe department information available ho ya nahi.
--
-- Display:
-- employee_name
-- department_name
-- salary
--
-- Requirement:
-- Use LEFT JOIN.


-- Write your query below:



-- =====================================================
-- BUSINESS PROBLEM 2
-- =====================================================

-- HR identify karna chahta hai ki kaunse employees
-- ka department record missing hai.
--
-- Display:
-- employee_id
-- employee_name
-- department_id
--
-- Requirement:
-- Use LEFT JOIN + IS NULL.


-- Write your query below:



-- =====================================================
-- BUSINESS PROBLEM 3
-- =====================================================

-- Management ko complete department list chahiye.
--
-- Har department report mein hona chahiye,
-- chahe usmein koi employee ho ya nahi.
--
-- Display:
-- department_id
-- department_name
-- employee_name
--
-- Requirement:
-- Use RIGHT JOIN.


-- Write your query below:



-- =====================================================
-- BUSINESS PROBLEM 4
-- =====================================================

-- Management identify karna chahta hai ki kaunse
-- departments mein currently koi employee nahi hai.
--
-- Display:
-- department_id
-- department_name
--
-- Requirement:
-- Use RIGHT JOIN + IS NULL.


-- Write your query below:



-- =====================================================
-- BUSINESS PROBLEM 5
-- =====================================================

-- HR ko high-salary employee report chahiye.
--
-- Rules:
-- Salary >= 65000
--
-- Har employee preserve hona chahiye,
-- even if department information missing ho.
--
-- Display:
-- employee_name
-- department_name
-- salary
--
-- Requirement:
-- Use LEFT JOIN.


-- Write your query below:



-- =====================================================
-- BUSINESS PROBLEM 6
-- =====================================================

-- Management ko department-wise salary report chahiye.
--
-- Rules:
-- 1. Har department report mein hona chahiye.
-- 2. Sirf employees with salary >= 60000 show karo.
-- 3. Jis department mein qualifying employee nahi hai,
--    wo department phir bhi show hona chahiye.
--
-- Display:
-- department_name
-- employee_name
-- salary
--
-- Sort:
-- department_name ASC
-- salary DESC
--
-- IMPORTANT:
-- Salary condition ko carefully place karo.


-- Write your query below:



-- =====================================================
-- BUSINESS PROBLEM 7
-- =====================================================

-- HR ko IT aur Finance ke high-performing employees
-- ki list chahiye.
--
-- Rules:
--
-- IT       → salary >= 65000
-- Finance  → salary >= 60000
--
-- Display:
-- employee_name
-- department_name
-- salary
--
-- Requirement:
-- Use JOIN + AND / OR.


-- Write your query below:



-- =====================================================
-- BUSINESS PROBLEM 8
-- =====================================================

-- Management ko identify karna hai:
--
-- 1. Departments with no employees
-- OR
-- 2. Departments having employees with salary >= 70000
--
-- Display:
-- department_name
-- employee_name
-- salary
--
-- Requirement:
-- Use appropriate JOIN and filtering.


-- Write your query below:



-- =====================================================
-- BUSINESS PROBLEM 9
-- =====================================================

-- Company ek department audit kar rahi hai.
--
-- Har department ke employees show karo.
--
-- Agar kisi department mein employee nahi hai,
-- tab bhi department show hona chahiye.
--
-- Display:
-- department_name
-- employee_name
-- salary
--
-- Sort:
-- department_name ASC
-- employee_name ASC


-- Write your query below:



-- =====================================================
-- BUSINESS PROBLEM 10 — FINAL BUSINESS CASE 🔥
-- =====================================================

-- Management ko complete salary audit report chahiye.
--
-- Rules:
--
-- 1. Every department must appear.
-- 2. Employees earning >= 60000 should be displayed.
-- 3. Departments without qualifying employees
--    must still appear.
-- 4. Employee name and salary available ho to show karo.
-- 5. Departments alphabetically sorted hon.
-- 6. Same department mein highest salary first.
--
-- Display:
-- department_name
-- employee_name
-- salary
--
-- Required concepts:
--
-- LEFT JOIN
-- ON
-- AND
-- ORDER BY
--
-- Think carefully about:
--
-- ON condition
-- vs
-- WHERE condition


-- Write your final query below:



-- =====================================================
-- BUSINESS SKILL CHECK
-- =====================================================

-- Business Requirement
--        ↓
-- Identify important table
--        ↓
-- Choose JOIN type
--        ↓
-- Identify relationship
--        ↓
-- Write ON condition
--        ↓
-- Apply business filters
--        ↓
-- Sort result
--        ↓
-- Management-ready report
-- =====================================================
-- DAY 04 - SQL CHALLENGE
-- Topic: CASE WHEN + Business Logic
-- =====================================================


-- =====================================================
-- CHALLENGE 1 — Employee Performance Category
-- =====================================================

-- Management wants to classify employees based
-- on their salary.
--
-- Rules:
-- 75,000 or more  → 'Excellent'
-- 60,000–74,999  → 'Good'
-- 50,000–59,999  → 'Average'
-- Below 50,000   → 'Needs Improvement'
--
-- Display:
-- name, salary, performance_category
--
-- Hint:
-- Use CASE with multiple WHEN conditions.



-- =====================================================
-- CHALLENGE 2 — Department Priority
-- =====================================================

-- The company wants to prioritize employees
-- from specific departments.
--
-- Rules:
-- IT + salary >= 65,000
--     → 'High Priority'
--
-- Finance + salary >= 60,000
--     → 'High Priority'
--
-- HR + salary >= 55,000
--     → 'Medium Priority'
--
-- Everyone else
--     → 'Low Priority'
--
-- Display:
-- name, department, salary, priority
--
-- Hint:
-- Use CASE + AND.



-- =====================================================
-- CHALLENGE 3 — Location Classification
-- =====================================================

-- The company has offices across different regions.
--
-- Rules:
--
-- Delhi       → 'North'
-- Mumbai      → 'West'
-- Pune        → 'West'
-- Ahmedabad   → 'West'
-- Jaipur      → 'North'
-- All others  → 'Other'
--
-- Display:
-- name, city, region
--
-- Hint:
-- Use CASE with multiple WHEN conditions.



-- =====================================================
-- CHALLENGE 4 — Salary Review Decision
-- =====================================================

-- HR wants to identify employees for salary review.
--
-- Rules:
--
-- Salary < 50,000
--     → 'Immediate Review'
--
-- Salary 50,000–65,000
--     → 'Review Later'
--
-- Salary > 65,000
--     → 'No Review'
--
-- Display:
-- name, salary, review_status
--
-- Hint:
-- Use CASE + BETWEEN.



-- =====================================================
-- CHALLENGE 5 — Special Project Eligibility
-- =====================================================

-- Management wants to identify employees eligible
-- for a special project.
--
-- Rules:
--
-- IT + salary >= 65,000
--     → 'Eligible'
--
-- Finance + salary >= 60,000
--     → 'Eligible'
--
-- Everyone else
--     → 'Not Eligible'
--
-- Display:
-- name, department, salary, project_status
--
-- Hint:
-- Use CASE + AND + OR.



-- =====================================================
-- CHALLENGE 6 — Employee Level
-- =====================================================

-- Create an employee level based on salary.
--
-- Rules:
--
-- salary >= 75,000 → 'Level 3'
-- salary >= 60,000 → 'Level 2'
-- salary >= 45,000 → 'Level 1'
-- otherwise        → 'Entry Level'
--
-- Display:
-- name, salary, employee_level
--
-- Important:
-- Think carefully about the order of WHEN conditions.



-- =====================================================
-- CHALLENGE 7 — Department Salary Band
-- =====================================================

-- Management wants to classify employees differently
-- depending on their department and salary.
--
-- Rules:
--
-- IT + salary >= 70,000
--     → 'IT Senior Band'
--
-- Finance + salary >= 65,000
--     → 'Finance Senior Band'
--
-- HR + salary >= 60,000
--     → 'HR Senior Band'
--
-- Everyone else
--     → 'Standard Band'
--
-- Display:
-- name, department, salary, salary_band
--
-- Hint:
-- CASE + AND.



-- =====================================================
-- CHALLENGE 8 — Conditional Department Count
-- =====================================================

-- Management wants to know how many employees
-- in each department have salary >= 60,000.
-- Display:
-- department
-- high_salary_employees
-- Requirements:
-- Use:
-- CASE
-- COUNT
-- GROUP BY
-- Do NOT simply count all employees.

-- =====================================================
-- CHALLENGE 9 — Conditional Salary Total
-- =====================================================

-- Management wants the total salary paid to employees
-- earning >= 60,000 in each department.
--
-- Display:
-- department
-- high_salary_total
--
-- Requirements:
-- Use:
-- CASE
-- SUM
-- GROUP BY



-- =====================================================
-- CHALLENGE 10 — FINAL BUSINESS CHALLENGE 🔥🔥
-- =====================================================

-- The company is creating a high-priority project team.
--
-- An employee is classified according to these rules:
--
-- 1. IT + salary >= 70,000
--       → 'Top Candidate'
--
-- 2. IT + salary >= 60,000
--       → 'Potential Candidate'
--
-- 3. Finance + salary >= 65,000
--       → 'Top Candidate'
--
-- 4. Finance + salary >= 55,000
--       → 'Potential Candidate'
--
-- 5. HR + salary >= 60,000
--       → 'Potential Candidate'
--
-- 6. Everyone else
--       → 'Not Selected'
--
-- Display:
-- name
-- department
-- salary
-- project_status
--
-- Hint:
-- Use CASE + multiple WHEN + AND.
--
-- IMPORTANT:
-- Write the conditions from the most specific/highest
-- priority condition to the broader condition.



-- =====================================================
-- CHALLENGE RULE
-- =====================================================

-- Try to solve all challenges yourself.
--
-- Do NOT copy solutions from My-Solutions.sql.
--
-- The objective is to improve:
--
-- 1. Logical thinking
-- 2. CASE WHEN understanding
-- 3. Business rule translation
-- 4. SQL problem-solving
-- 5. Query-writing confidence
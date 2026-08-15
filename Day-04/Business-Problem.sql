-- =====================================================
-- DAY 04 - BUSINESS PROBLEMS
-- Topic: CASE WHEN + Business Decision Making
-- Dataset: employee2
-- =====================================================


-- =====================================================
-- BUSINESS PROBLEM 1 — HR Salary Classification
-- =====================================================

-- HR wants to classify employees based on salary.
--
-- Rules:
-- salary >= 70000 → 'High Salary'
-- salary >= 55000 → 'Medium Salary'
-- otherwise        → 'Low Salary'
--
-- Display:
-- name, salary, salary_category
--
-- Business Goal:
-- Help HR quickly identify different salary bands.



-- =====================================================
-- BUSINESS PROBLEM 2 — Salary Review Priority
-- =====================================================

-- HR wants to identify employees who may require
-- salary review.
--
-- Rules:
-- salary < 50000
--     → 'Immediate Review'
--
-- salary 50000–65000
--     → 'Normal Review'
--
-- salary > 65000
--     → 'No Review'
--
-- Display:
-- name, salary, review_status
--
-- Business Goal:
-- Help HR prioritize salary reviews.



-- =====================================================
-- BUSINESS PROBLEM 3 — Department Reporting
-- =====================================================

-- Management wants departments grouped into
-- business-friendly categories.
--
-- Rules:
-- IT       → 'Technology'
-- HR       → 'Human Resources'
-- Finance  → 'Finance'
-- Sales    → 'Sales'
-- Marketing → 'Marketing'
-- Others   → 'Other'
--
-- Display:
-- name, department, department_category
--
-- Business Goal:
-- Make department reporting easier to understand.



-- =====================================================
-- BUSINESS PROBLEM 4 — Employee Priority
-- =====================================================

-- Management wants to identify high-priority employees.
--
-- Rules:
-- IT + salary >= 65000
--     → 'High Priority'
--
-- Finance + salary >= 60000
--     → 'High Priority'
--
-- HR + salary >= 55000
--     → 'Medium Priority'
--
-- Everyone else
--     → 'Normal Priority'
--
-- Display:
-- name, department, salary, employee_priority
--
-- Business Goal:
-- Identify employees who may be suitable for
-- important company initiatives.



-- =====================================================
-- BUSINESS PROBLEM 5 — Regional Reporting
-- =====================================================

-- The company wants to classify office locations
-- by region.
--
-- Rules:
-- Delhi      → 'North'
-- Jaipur     → 'North'
-- Mumbai     → 'West'
-- Pune       → 'West'
-- Ahmedabad  → 'West'
-- Others     → 'Other'
--
-- Display:
-- name, city, region
--
-- Business Goal:
-- Support regional employee analysis.



-- =====================================================
-- BUSINESS PROBLEM 6 — Project Eligibility
-- =====================================================

-- Management is selecting employees for a special project.
--
-- Eligibility rules:
--
-- IT + salary >= 65000
--     → 'Eligible'
--
-- Finance + salary >= 60000
--     → 'Eligible'
--
-- HR + salary >= 55000
--     → 'Potential'
--
-- Everyone else
--     → 'Not Eligible'
--
-- Display:
-- name, department, salary, project_status
--
-- Business Goal:
-- Create a preliminary project candidate list.



-- =====================================================
-- BUSINESS PROBLEM 7 — Employee Level
-- =====================================================

-- HR wants to assign employee levels based on salary.
--
-- Rules:
-- salary >= 75000 → 'Level 3'
-- salary >= 60000 → 'Level 2'
-- salary >= 45000 → 'Level 1'
-- otherwise        → 'Entry Level'
--
-- Display:
-- name, salary, employee_level
--
-- Business Goal:
-- Create a simple salary-based employee hierarchy.



-- =====================================================
-- BUSINESS PROBLEM 8 — Department High Salary Count
-- =====================================================

-- Management wants to know how many employees
-- in each department earn at least 60000.
--
-- Display:
-- department
-- high_salary_employees
--
-- Requirements:
-- Use:
-- CASE
-- COUNT
-- GROUP BY
--
-- Business Goal:
-- Compare the number of higher-paid employees
-- across departments.



-- =====================================================
-- BUSINESS PROBLEM 9 — Department High Salary Cost
-- =====================================================

-- Finance wants to calculate the total salary cost
-- of employees earning at least 60000 in each department.
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
--
-- Business Goal:
-- Understand how much each department spends
-- on higher-paid employees.



-- =====================================================
-- BUSINESS PROBLEM 10 — FINAL MANAGEMENT CASE 🔥
-- =====================================================

-- Management is creating a priority project team.
--
-- Employee classification rules:
--
-- IT + salary >= 70000
--     → 'Top Candidate'
--
-- IT + salary >= 60000
--     → 'Potential Candidate'
--
-- Finance + salary >= 65000
--     → 'Top Candidate'
--
-- Finance + salary >= 55000
--     → 'Potential Candidate'
--
-- HR + salary >= 60000
--     → 'Potential Candidate'
--
-- Everyone else
--     → 'Not Selected'
--
-- Display:
-- name
-- department
-- salary
-- project_status
--
-- Business Goal:
-- Help management create an initial candidate list
-- using objective salary and department criteria.
--
-- Important:
-- Check conditions from the most specific/highest
-- priority rule to the broader rules.



-- =====================================================
-- BUSINESS ANALYST THINKING
-- =====================================================

-- Business Requirement
--        ↓
-- Identify Conditions
--        ↓
-- Convert Conditions into CASE WHEN
--        ↓
-- Create a Business-Friendly Column
--        ↓
-- Analyze the Result
--
-- This is an important Data Analyst skill:
--
-- Business Problem → SQL Logic → Useful Insight
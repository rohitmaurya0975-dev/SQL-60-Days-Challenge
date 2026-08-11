-- =====================================================
-- DAY 03 - BUSINESS PROBLEMS
-- Topic: SQL Filtering Operators
-- IN, NOT IN, BETWEEN, LIKE, AND
-- =====================================================


-- =====================================================
-- BUSINESS PROBLEM 1
-- Employee Recruitment
-- =====================================================

-- HR wants to identify employees working in
-- IT, Finance, or HR for a special training program.
--
-- Task:
-- Find all employees who belong to IT, Finance, or HR.
--
-- Display:
-- employee_id, name, department, salary



-- =====================================================
-- BUSINESS PROBLEM 2
-- Salary Review
-- =====================================================

-- Management wants to review employees whose salary
-- falls between 50,000 and 65,000.
--
-- Task:
-- Find all employees whose salary is between
-- 50,000 and 65,000.
--
-- Display:
-- name, department, salary



-- =====================================================
-- BUSINESS PROBLEM 3
-- Employee Search
-- =====================================================

-- HR is searching for employees whose names
-- start with the letter 'A'.
--
-- Task:
-- Find all employees whose name starts with 'A'.
--
-- Display:
-- employee_id, name, department



-- =====================================================
-- BUSINESS PROBLEM 4
-- Department Exclusion
-- =====================================================

-- The company wants to analyze employees outside
-- the Sales and Marketing departments.
--
-- Task:
-- Find employees who are NOT from Sales or Marketing.
--
-- Display:
-- name, department, city, salary



-- =====================================================
-- BUSINESS PROBLEM 5
-- High-Salary IT Employees
-- =====================================================

-- Management wants to identify IT employees
-- earning more than 65,000.
--
-- Task:
-- Find IT employees whose salary is greater than 65,000.
--
-- Display:
-- name, department, salary



-- =====================================================
-- BUSINESS PROBLEM 6
-- Location-Based Analysis
-- =====================================================

-- The company has offices in Delhi, Mumbai, and Pune.
--
-- Management wants to analyze employees working
-- in these cities.
--
-- Task:
-- Find employees from Delhi, Mumbai, or Pune.
--
-- Display:
-- name, department, city



-- =====================================================
-- BUSINESS PROBLEM 7
-- Finance Team Review
-- =====================================================

-- The Finance department wants to identify employees
-- whose salary is between 55,000 and 65,000.
--
-- Task:
-- Find Finance employees within this salary range.
--
-- Display:
-- name, salary, city



-- =====================================================
-- BUSINESS PROBLEM 8
-- Special Project Selection
-- =====================================================

-- Management wants employees who:
--
-- 1. Work in IT or Finance
-- 2. Work in Delhi, Mumbai, or Pune
-- 3. Earn between 60,000 and 75,000
--
-- Task:
-- Find suitable employees for the special project.
--
-- Display:
-- name, department, city, salary



-- =====================================================
-- BUSINESS PROBLEM 9
-- HR Salary Screening
-- =====================================================

-- HR wants employees who:
--
-- 1. Are NOT from Sales or Marketing
-- 2. Earn more than 55,000
-- 3. Work in Delhi, Mumbai, or Pune
--
-- Task:
-- Find employees matching all three conditions.
--
-- Display:
-- name, department, city, salary



-- =====================================================
-- BUSINESS PROBLEM 10 — FINAL BUSINESS CASE
-- =====================================================

-- The company is creating a high-priority project team.
--
-- The requirements are:
--
-- 1. Employee must belong to IT or Finance.
-- 2. Employee must work in Delhi, Mumbai, or Pune.
-- 3. Salary must be between 60,000 and 75,000.
-- 4. Employee name must contain the letter 'a'.
--
-- Task:
-- Find all employees who satisfy ALL requirements.
--
-- Display:
-- name, department, city, salary
--
-- This problem combines:
-- IN + IN + BETWEEN + LIKE + AND
--
-- Try to solve it without looking at My-Solutions.sql.



-- =====================================================
-- LEARNING GOAL
-- =====================================================

-- These business problems help practice:
--
-- 1. Translating business requirements into SQL.
-- 2. Filtering employee data.
-- 3. Using IN and NOT IN.
-- 4. Using BETWEEN.
-- 5. Using LIKE.
-- 6. Combining multiple conditions with AND.
-- 7. Applying SQL to real-world Data Analyst problems.
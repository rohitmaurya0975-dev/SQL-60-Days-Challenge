-- =====================================================
-- DAY 04 - MY SOLUTIONS
-- Topic: SQL Conditional Logic
-- CASE, WHEN, THEN, ELSE, END
-- =====================================================


-- =====================================================
-- Q1 — Salary Classification
-- =====================================================

-- Concept:
-- CASE WHEN is used to create a new category
-- based on a condition.

SELECT
    name,
    salary,
    CASE
        WHEN salary >= 60000 THEN 'High Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM employee2;


-- =====================================================
-- Q2 — Multiple Salary Categories
-- =====================================================

-- Concept:
-- Multiple WHEN conditions can be used to create
-- multiple categories.

SELECT
    name,
    salary,
    CASE
        WHEN salary >= 70000 THEN 'High'
        WHEN salary >= 55000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employee2;


-- =====================================================
-- Q3 — Department Classification
-- =====================================================

-- Concept:
-- CASE can be used with text/string values.

SELECT
    name,
    department,
    CASE
        WHEN department = 'IT' THEN 'Technology'
        WHEN department = 'HR' THEN 'Human Resources'
        WHEN department = 'Finance' THEN 'Finance'
        ELSE 'Other'
    END AS department_type
FROM employee2;


-- =====================================================
-- Q4 — Salary Review
-- =====================================================

-- Concept:
-- CASE can be combined with BETWEEN.

SELECT
    name,
    salary,
    CASE
        WHEN salary < 50000 THEN 'Priority Review'
        WHEN salary BETWEEN 50000 AND 65000 THEN 'Normal Review'
        ELSE 'No Review Required'
    END AS salary_review
FROM employee2;


-- =====================================================
-- Q5 — IT Employee Classification
-- =====================================================

-- Concept:
-- CASE can use multiple conditions with AND.

SELECT
    name,
    department,
    salary,
    CASE
        WHEN department = 'IT' AND salary >= 65000
            THEN 'Senior IT'
        ELSE 'Other Employee'
    END AS employee_category
FROM employee2;


-- =====================================================
-- Q6 — Location Classification
-- =====================================================

-- Concept:
-- CASE can classify records based on different
-- values from a text column.

SELECT
    name,
    city,
    CASE
        WHEN city = 'Delhi' THEN 'North'
        WHEN city = 'Mumbai' THEN 'West'
        WHEN city = 'Pune' THEN 'West'
        WHEN city = 'Ahmedabad' THEN 'West'
        ELSE 'Other'
    END AS office_region
FROM employee2;


-- =====================================================
-- Q7 — Employee Level
-- =====================================================

-- Concept:
-- Multiple WHEN conditions are checked from top
-- to bottom. Therefore, condition order matters.

SELECT
    name,
    salary,
    CASE
        WHEN salary >= 75000 THEN 'Level 3'
        WHEN salary >= 60000 THEN 'Level 2'
        WHEN salary >= 45000 THEN 'Level 1'
        ELSE 'Entry Level'
    END AS employee_level
FROM employee2;


-- =====================================================
-- Q8 — Conditional COUNT
-- =====================================================

-- Concept:
-- CASE can be used inside COUNT to count only
-- records satisfying a specific condition.

SELECT
    department,
    COUNT(
        CASE
            WHEN salary >= 60000 THEN 1
        END
    ) AS high_salary_employees
FROM employee2
GROUP BY department;


-- =====================================================
-- Q9 — Conditional SUM
-- =====================================================

-- Concept:
-- CASE can be used inside SUM to calculate the
-- total of only those values that meet a condition.

SELECT
    department,
    SUM(
        CASE
            WHEN salary >= 60000 THEN salary
            ELSE 0
        END
    ) AS high_salary_total
FROM employee2
GROUP BY department;


-- =====================================================
-- Q10 — FINAL BUSINESS CHALLENGE
-- =====================================================

-- Concept:
-- Multiple CASE conditions can be combined using
-- AND and OR to implement business rules.

SELECT
    name,
    department,
    salary,
    CASE
        WHEN department = 'IT'
             AND salary >= 65000
            THEN 'Priority Candidate'

        WHEN department = 'Finance'
             AND salary >= 60000
            THEN 'Priority Candidate'

        WHEN department = 'HR'
             AND salary >= 55000
            THEN 'Potential Candidate'

        ELSE 'Not Selected'
    END AS project_status
FROM employee2;


-- =====================================================
-- DAY 04 KEY CONCEPTS
-- =====================================================

-- CASE
--   ↓
-- WHEN = condition
--   ↓
-- THEN = result when condition is TRUE
--   ↓
-- ELSE = default result
--   ↓
-- END = finish CASE expression


-- CASE can be combined with:
--
-- AND
-- OR
-- BETWEEN
-- COUNT
-- SUM
-- GROUP BY
--
-- This allows SQL to perform conditional analysis
-- and create business-oriented classifications.
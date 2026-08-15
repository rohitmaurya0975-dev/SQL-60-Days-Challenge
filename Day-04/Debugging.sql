-- =====================================================
-- DAY 04 - SQL DEBUGGING
-- Topic: CASE WHEN
-- =====================================================


-- =====================================================
-- DEBUGGING 1 — Missing END
-- =====================================================

-- Goal:
-- Classify employees as High or Low Salary.
--
-- Rule:
-- salary >= 60000 → 'High'
-- otherwise        → 'Low'

-- Incorrect Query:

SELECT
    name,
    salary,
    CASE
        WHEN salary >= 60000 THEN 'High'
        ELSE 'Low'
    AS salary_category
FROM employee2;


-- Your Correct Query:
-- Write the corrected query below.

SELECT
    name,
    salary,
    CASE
        WHEN salary >= 60000 THEN 'High'
        ELSE 'Low' END
    AS salary_category
FROM employee2;


-- =====================================================
-- DEBUGGING 2 — Incorrect CASE Syntax
-- =====================================================

-- Goal:
-- Classify IT employees as 'Technology'
-- and all others as 'Other'.

-- Incorrect Query:

SELECT
    name,
    department,
    CASE department
        WHEN 'IT' 'Technology'
        ELSE 'Other'
    END AS department_type
FROM employee2;


-- Your Correct Query:
-- Write the corrected query below.

SELECT
    name,
    department,
    CASE 
        WHEN department = 'IT' THEN 'Technology'
        ELSE 'Other'
    END AS department_type
FROM employee2;


-- =====================================================
-- DEBUGGING 3 — Incorrect Condition
-- =====================================================

-- Goal:
-- Salary >= 60000 → 'High'
-- Salary < 60000  → 'Low'

-- Incorrect Query:

SELECT
    name,
    salary,
    CASE
        WHEN salary > 60000 THEN 'High'
        ELSE 'Low'
    END AS salary_category
FROM employee2;


-- Your Correct Query:
-- Write the corrected query below.


SELECT
    name,
    salary,
    CASE
        WHEN salary >= 60000 THEN 'High'
        ELSE 'Low'
    END AS salary_category
FROM employee2;

-- =====================================================
-- DEBUGGING 4 — Wrong Condition Order
-- =====================================================

-- Goal:
-- salary >= 70000 → 'High'
-- salary >= 55000 → 'Medium'
-- salary < 55000  → 'Low'

-- Incorrect Query:

SELECT
    name,
    salary,
    CASE
        WHEN salary >= 55000 THEN 'Medium'
        WHEN salary >= 70000 THEN 'High'
        ELSE 'Low'
    END AS salary_category
FROM employee2;


-- Your Correct Query:
-- Write the corrected query below.

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
-- DEBUGGING 5 — Missing ELSE
-- =====================================================

-- Goal:
-- Classify departments:
-- IT → 'Technology'
-- HR → 'Human Resources'
-- Others → 'Other'

-- Incorrect Query:

SELECT
    name,
    department,
    CASE
        WHEN department = 'IT' THEN 'Technology'
        WHEN department = 'HR' THEN 'Human Resources'
    END AS department_type
FROM employee2;


-- Your Correct Query:
-- Write the corrected query below.

SELECT
    name,
    department,
    CASE
        WHEN department = 'IT' THEN 'Technology'
        WHEN department = 'HR' THEN 'Human Resources'
        ELSE 'OTHER'
    END AS department_type
FROM employee2;


-- =====================================================
-- DEBUGGING 6 — AND Condition Error
-- =====================================================

-- Goal:
-- IT employees with salary >= 65000
-- should be classified as 'Senior IT'.

-- Incorrect Query:

SELECT
    name,
    department,
    salary,
    CASE
        WHEN department = 'IT' OR salary >= 65000
            THEN 'Senior IT'
        ELSE 'Other Employee'
    END AS employee_category
FROM employee2;


-- Your Correct Query:
-- Write the corrected query below.

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
-- DEBUGGING 7 — BETWEEN Error
-- =====================================================

-- Goal:
-- Salary between 50000 and 65000
-- → 'Medium Salary'

-- Incorrect Query:

SELECT
    name,
    salary,
    CASE
        WHEN salary BETWEEN 50000 OR 65000
            THEN 'Medium Salary'
        ELSE 'Other'
    END AS salary_category
FROM employee2;


-- Your Correct Query:
-- Write the corrected query below.


SELECT
    name,
    salary,
    CASE
        WHEN salary BETWEEN 50000 AND 65000
            THEN 'Medium Salary'
        ELSE 'Other'
    END AS salary_category
FROM employee2;


-- =====================================================
-- DEBUGGING 8 — COUNT + CASE Error
-- =====================================================

-- Goal:
-- Count employees whose salary is >= 60000
-- in each department.

-- Incorrect Query:

SELECT
    department,
    COUNT(
        CASE
            WHEN salary >= 60000
                THEN 'High Salary'
            ELSE 0
        END
    ) AS high_salary_employees
FROM employee2
GROUP BY department;


-- Your Correct Query:
-- Write the corrected query below.

SELECT
    department,
    COUNT(
        CASE
            WHEN salary >= 60000
                THEN 1
            ELSE 0
        END
    ) AS high_salary_employees
FROM employee2
GROUP BY department;


-- =====================================================
-- DEBUGGING 9 — SUM + CASE Error
-- =====================================================

-- Goal:
-- Calculate the total salary of employees
-- whose salary is >= 60000 in each department.

-- Incorrect Query:

SELECT
    department,
    SUM(
        CASE
            WHEN salary >= 60000
                THEN salary
            ELSE NULL
        END
    ) AS high_salary_total
FROM employee2;


-- Your Correct Query:
-- Write the corrected query below.

SELECT
    department,
    SUM(
        CASE
            WHEN salary >= 60000
                THEN salary
            ELSE NULL
        END
    ) AS high_salary_total
FROM employee2
GROUP BY department;


-- =====================================================
-- DEBUGGING 10 — FINAL DEBUGGING CHALLENGE 🔥
-- =====================================================

-- Goal:
-- Classify employees according to:
--
-- IT + salary >= 65000
--     → 'Priority Candidate'
--
-- Finance + salary >= 60000
--     → 'Priority Candidate'
--
-- HR + salary >= 55000
--     → 'Potential Candidate'
--
-- Everyone else
--     → 'Not Selected'

-- Incorrect Query:

SELECT
    name,
    department,
    salary,
    CASE
        WHEN department = 'IT'
             AND salary > 65000
            THEN 'Priority Candidate'

        WHEN department = 'Finance'
             OR salary >= 60000
            THEN 'Priority Candidate'

        WHEN department = 'HR'
             AND salary >= 55000
            THEN 'Potential Candidate'

        ELSE 'Not Selected'
    END AS project_status
FROM employee2;


-- Your Correct Query:
-- Write the corrected query below.


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
-- DEBUGGING LEARNING GOALS
-- =====================================================

-- By completing these debugging exercises,
-- I will practice:
--
-- 1. CASE syntax
-- 2. WHEN / THEN / ELSE / END
-- 3. Correct condition operators
-- 4. Condition ordering
-- 5. AND vs OR
-- 6. BETWEEN inside CASE
-- 7. CASE with COUNT
-- 8. CASE with SUM
-- 9. GROUP BY with conditional calculations
-- 10. Translating business rules into CASE logic
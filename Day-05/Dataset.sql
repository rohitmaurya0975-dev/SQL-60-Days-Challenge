

-- =====================================================
-- DAY 05 - DATASET
-- Topic: Primary Key, Foreign Key & INNER JOIN
-- =====================================================

-- We will continue using the existing employee2 table
-- containing 50 employees from previous days.

-- =====================================================
-- STEP 1 — Create Departments Table
-- =====================================================

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);


-- =====================================================
-- STEP 2 — Insert Department Data
-- =====================================================

INSERT INTO departments (department_id, department_name)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales'),
(5, 'Marketing');


-- =====================================================
-- STEP 3 — Check Departments
-- =====================================================

SELECT *
FROM departments
ORDER BY department_id;


-- =====================================================
-- STEP 4 — Add Foreign Key Column
-- =====================================================

ALTER TABLE employee2
ADD COLUMN department_id INT;


-- =====================================================
-- STEP 5 — Assign Department IDs
-- =====================================================

UPDATE employee2
SET department_id =
    CASE
        WHEN department = 'IT' THEN 1
        WHEN department = 'HR' THEN 2
        WHEN department = 'Finance' THEN 3
        WHEN department = 'Sales' THEN 4
        WHEN department = 'Marketing' THEN 5
    END;


-- =====================================================
-- STEP 6 — Add Foreign Key Relationship
-- =====================================================

ALTER TABLE employee2
ADD CONSTRAINT fk_employee_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id);


-- =====================================================
-- STEP 7 — Verify Employee Data
-- =====================================================

SELECT
    employee_id,
    name,
    department,
    department_id,
    salary
FROM employee2
ORDER BY employee_id;


-- =====================================================
-- STEP 8 — Verify Department Data
-- =====================================================

SELECT *
FROM departments
ORDER BY department_id;


-- =====================================================
-- DATASET RELATIONSHIP
-- =====================================================

-- departments.department_id
--          ↓
-- Primary Key
--
-- employee2.department_id
--          ↓
-- Foreign Key
--
-- This relationship will be used for INNER JOIN practice


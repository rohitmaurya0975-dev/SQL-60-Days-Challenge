-- ============================================
-- 60 DAYS SQL CHALLENGE
-- DAY 02 - AGGREGATE FUNCTIONS
-- ============================================

CREATE TABLE employee2(
    employee_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary NUMERIC(10,2),
    city VARCHAR(50)
);

INSERT INTO employee2(employee_id, name, department, salary, city)
VALUES
(101, 'Amit', 'Sales', 45000, 'Delhi'),
(102, 'Riya', 'HR', 52000, 'Mumbai'),
(103, 'Karan', 'IT', 60000, 'Mumbai'),
(104, 'Neha', 'Sales', 48000, 'Delhi'),
(105, 'Rahul', 'IT', 70000, 'Bangalore'),
(106, 'Priya', 'HR', 55000, 'Mumbai'),
(107, 'Ankit', 'Sales', 45000, 'Jaipur'),
(108, 'Meena', 'IT', 70000, 'Pune');

-- Check the dataset
SELECT * FROM employee2;

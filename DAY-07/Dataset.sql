-- =====================================================
-- DAY 07 - SELF JOIN
-- EMPLOYEE HIERARCHY DATASET
-- Total Employees: 50
-- Database: PostgreSQL
-- =====================================================


-- =====================================================
-- STEP 1: CREATE TABLE
-- =====================================================

CREATE TABLE employees_hierarchy (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary NUMERIC(10,2),
    manager_id INT,
    city VARCHAR(50),
    experience_years INT
);


-- =====================================================
-- STEP 2: INSERT 50 EMPLOYEES
-- =====================================================

INSERT INTO employees_hierarchy
(employee_id, name, department, salary, manager_id, city, experience_years)
VALUES

-- =====================================================
-- TOP MANAGEMENT
-- =====================================================

(101, 'Amit Sharma', 'Management', 150000, NULL, 'Mumbai', 15),

-- =====================================================
-- SENIOR MANAGERS
-- =====================================================

(102, 'Riya Patel', 'IT', 110000, 101, 'Ahmedabad', 10),
(103, 'Karan Mehta', 'Finance', 105000, 101, 'Mumbai', 9),
(104, 'Neha Shah', 'HR', 100000, 101, 'Surat', 9),
(105, 'Rahul Verma', 'Sales', 98000, 101, 'Delhi', 8),
(106, 'Priya Singh', 'Marketing', 95000, 101, 'Pune', 8),

-- =====================================================
-- IT TEAM
-- =====================================================

(107, 'Ankit Kumar', 'IT', 85000, 102, 'Ahmedabad', 7),
(108, 'Pooja Desai', 'IT', 82000, 102, 'Vadodara', 6),
(109, 'Arjun Patel', 'IT', 78000, 102, 'Ahmedabad', 6),
(110, 'Meena Joshi', 'IT', 75000, 102, 'Surat', 5),

-- IT TEAM MEMBERS
(111, 'Rohan Gupta', 'IT', 65000, 107, 'Mumbai', 4),
(112, 'Sneha Shah', 'IT', 62000, 107, 'Pune', 3),
(113, 'Vivek Patel', 'IT', 60000, 107, 'Ahmedabad', 3),
(114, 'Kunal Mehta', 'IT', 58000, 108, 'Vadodara', 2),
(115, 'Isha Sharma', 'IT', 56000, 108, 'Mumbai', 2),
(116, 'Dev Kumar', 'IT', 54000, 109, 'Delhi', 2),
(117, 'Nisha Patel', 'IT', 52000, 109, 'Surat', 1),
(118, 'Yash Shah', 'IT', 50000, 110, 'Pune', 1),

-- =====================================================
-- FINANCE TEAM
-- =====================================================

(119, 'Sanjay Verma', 'Finance', 82000, 103, 'Mumbai', 6),
(120, 'Kavita Singh', 'Finance', 79000, 103, 'Delhi', 5),
(121, 'Manish Patel', 'Finance', 76000, 103, 'Ahmedabad', 5),
(122, 'Komal Shah', 'Finance', 73000, 103, 'Surat', 4),

-- FINANCE TEAM MEMBERS
(123, 'Akash Kumar', 'Finance', 62000, 119, 'Pune', 3),
(124, 'Ritika Mehta', 'Finance', 60000, 119, 'Mumbai', 2),
(125, 'Nitin Joshi', 'Finance', 58000, 120, 'Delhi', 2),
(126, 'Bhavna Patel', 'Finance', 55000, 120, 'Ahmedabad', 1),

-- =====================================================
-- HR TEAM
-- =====================================================

(127, 'Suresh Shah', 'HR', 80000, 104, 'Surat', 6),
(128, 'Divya Sharma', 'HR', 76000, 104, 'Mumbai', 5),
(129, 'Harsh Patel', 'HR', 72000, 104, 'Ahmedabad', 4),
(130, 'Simran Verma', 'HR', 68000, 104, 'Delhi', 4),

-- HR TEAM MEMBERS
(131, 'Ayesha Khan', 'HR', 58000, 127, 'Mumbai', 2),
(132, 'Mohit Kumar', 'HR', 55000, 127, 'Pune', 2),
(133, 'Rashmi Shah', 'HR', 52000, 128, 'Surat', 1),
(134, 'Tarun Patel', 'HR', 50000, 129, 'Ahmedabad', 1),

-- =====================================================
-- SALES TEAM
-- =====================================================

(135, 'Vikram Singh', 'Sales', 82000, 105, 'Delhi', 6),
(136, 'Anjali Mehta', 'Sales', 78000, 105, 'Mumbai', 5),
(137, 'Deepak Sharma', 'Sales', 74000, 105, 'Pune', 5),
(138, 'Nandini Patel', 'Sales', 70000, 105, 'Ahmedabad', 4),

-- SALES TEAM MEMBERS
(139, 'Raj Kumar', 'Sales', 60000, 135, 'Delhi', 3),
(140, 'Muskan Shah', 'Sales', 57000, 135, 'Surat', 2),
(141, 'Aman Verma', 'Sales', 55000, 136, 'Mumbai', 2),
(142, 'Payal Singh', 'Sales', 52000, 136, 'Pune', 1),

-- =====================================================
-- MARKETING TEAM
-- =====================================================

(143, 'Varun Mehta', 'Marketing', 80000, 106, 'Mumbai', 6),
(144, 'Shreya Patel', 'Marketing', 76000, 106, 'Ahmedabad', 5),
(145, 'Gaurav Shah', 'Marketing', 72000, 106, 'Surat', 4),
(146, 'Pallavi Kumar', 'Marketing', 68000, 106, 'Delhi', 4),

-- MARKETING TEAM MEMBERS
(147, 'Ravi Sharma', 'Marketing', 58000, 143, 'Pune', 2),
(148, 'Tanvi Mehta', 'Marketing', 55000, 143, 'Mumbai', 2),
(149, 'Abhishek Patel', 'Marketing', 52000, 144, 'Ahmedabad', 1),
(150, 'Mansi Shah', 'Marketing', 50000, 145, 'Surat', 1);


-- =====================================================
-- STEP 3: CHECK TOTAL RECORDS
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM employees_hierarchy;


-- =====================================================
-- STEP 4: VIEW COMPLETE DATASET
-- =====================================================

SELECT *
FROM employees_hierarchy
ORDER BY employee_id;


-- =====================================================
-- STEP 5: CHECK EMPLOYEE-MANAGER RELATIONSHIP
-- =====================================================

SELECT
    employee_id,
    name,
    manager_id
FROM employees_hierarchy
ORDER BY employee_id;
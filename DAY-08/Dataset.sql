-- =====================================================
-- DAY 08 - MULTIPLE JOIN
-- CLEAN DATASET
-- PostgreSQL
-- =====================================================


-- =====================================================
-- STEP 1: OLD TABLES DELETE
-- =====================================================

DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS locations CASCADE;


-- =====================================================
-- STEP 2: LOCATIONS TABLE
-- =====================================================

CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL
);


-- =====================================================
-- STEP 3: DEPARTMENTS TABLE
-- =====================================================

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location_id INT NOT NULL,

    FOREIGN KEY (location_id)
    REFERENCES locations(location_id)
);


-- =====================================================
-- STEP 4: EMPLOYEES TABLE
-- =====================================================

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department_id INT,
    salary NUMERIC(10,2),
    city VARCHAR(50),

    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);


-- =====================================================
-- STEP 5: LOCATIONS DATA
-- =====================================================

INSERT INTO locations
(location_id, city, state)
VALUES
(101, 'Mumbai', 'Maharashtra'),
(102, 'Delhi', 'Delhi'),
(103, 'Bangalore', 'Karnataka'),
(104, 'Hyderabad', 'Telangana'),
(105, 'Pune', 'Maharashtra'),
(106, 'Ahmedabad', 'Gujarat'),
(107, 'Chennai', 'Tamil Nadu'),
(108, 'Kolkata', 'West Bengal');


-- =====================================================
-- STEP 6: DEPARTMENTS DATA
-- =====================================================

INSERT INTO departments
(department_id, department_name, location_id)
VALUES
(1, 'IT', 101),
(2, 'HR', 102),
(3, 'Finance', 103),
(4, 'Sales', 104),
(5, 'Marketing', 105),
(6, 'Operations', 106),
(7, 'Analytics', 107),
(8, 'Support', 108);


-- =====================================================
-- STEP 7: 50 EMPLOYEES DATA
-- =====================================================

INSERT INTO employees
(employee_id, name, department_id, salary, city)
VALUES
(1, 'Amit Sharma', 1, 85000, 'Mumbai'),
(2, 'Riya Patel', 1, 72000, 'Mumbai'),
(3, 'Karan Mehta', 1, 68000, 'Mumbai'),
(4, 'Neha Shah', 1, 55000, 'Mumbai'),
(5, 'Rahul Verma', 1, 92000, 'Mumbai'),
(6, 'Priya Singh', 1, 48000, 'Mumbai'),

(7, 'Ankit Kumar', 2, 65000, 'Delhi'),
(8, 'Sneha Gupta', 2, 58000, 'Delhi'),
(9, 'Pooja Yadav', 2, 52000, 'Delhi'),
(10, 'Rohit Mishra', 2, 47000, 'Delhi'),
(11, 'Simran Kaur', 2, 61000, 'Delhi'),
(12, 'Vikas Jain', 2, 45000, 'Delhi'),

(13, 'Arjun Rao', 3, 95000, 'Bangalore'),
(14, 'Nisha Reddy', 3, 78000, 'Bangalore'),
(15, 'Manish Joshi', 3, 69000, 'Bangalore'),
(16, 'Kavita Rao', 3, 62000, 'Bangalore'),
(17, 'Deepak Nair', 3, 54000, 'Bangalore'),
(18, 'Anjali Das', 3, 50000, 'Bangalore'),

(19, 'Suresh Kumar', 4, 88000, 'Hyderabad'),
(20, 'Meena Iyer', 4, 76000, 'Hyderabad'),
(21, 'Varun Shah', 4, 65000, 'Hyderabad'),
(22, 'Komal Jain', 4, 59000, 'Hyderabad'),
(23, 'Nitin Patel', 4, 52000, 'Hyderabad'),
(24, 'Swati Singh', 4, 48000, 'Hyderabad'),

(25, 'Akash Gupta', 5, 82000, 'Pune'),
(26, 'Isha Sharma', 5, 71000, 'Pune'),
(27, 'Mohit Verma', 5, 63000, 'Pune'),
(28, 'Divya Mehta', 5, 57000, 'Pune'),
(29, 'Rakesh Shah', 5, 51000, 'Pune'),
(30, 'Tanya Patel', 5, 46000, 'Pune'),

(31, 'Harsh Desai', 6, 79000, 'Ahmedabad'),
(32, 'Mansi Shah', 6, 68000, 'Ahmedabad'),
(33, 'Jay Patel', 6, 60000, 'Ahmedabad'),
(34, 'Hetal Mehta', 6, 55000, 'Ahmedabad'),
(35, 'Dhruv Shah', 6, 49000, 'Ahmedabad'),
(36, 'Kunal Joshi', 6, 44000, 'Ahmedabad'),

(37, 'Aditya Rao', 7, 98000, 'Chennai'),
(38, 'Snehal Kumar', 7, 85000, 'Chennai'),
(39, 'Varsha Nair', 7, 74000, 'Chennai'),
(40, 'Rohan Das', 7, 67000, 'Chennai'),
(41, 'Pallavi Iyer', 7, 59000, 'Chennai'),
(42, 'Gaurav Singh', 7, 53000, 'Chennai'),

(43, 'Sachin Roy', 8, 62000, 'Kolkata'),
(44, 'Anu Gupta', 8, 56000, 'Kolkata'),
(45, 'Ravi Kumar', 8, 50000, 'Kolkata'),
(46, 'Kiran Das', 8, 47000, 'Kolkata'),
(47, 'Sonali Roy', 8, 44000, 'Kolkata'),
(48, 'Aman Singh', 8, 40000, 'Kolkata'),

(49, 'Raj Malhotra', 1, 75000, NULL),
(50, 'Pankaj Verma', NULL, 42000, NULL);


-- =====================================================
-- STEP 8: CHECK DATA
-- =====================================================

SELECT * FROM locations;

SELECT * FROM departments;

SELECT * FROM employees;


-- =====================================================
-- STEP 9: CHECK RECORD COUNTS
-- =====================================================

SELECT COUNT(*) AS total_locations
FROM locations;

SELECT COUNT(*) AS total_departments
FROM departments;

SELECT COUNT(*) AS total_employees
FROM employees;
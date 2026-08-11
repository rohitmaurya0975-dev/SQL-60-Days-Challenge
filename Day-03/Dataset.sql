-- ============================================
-- DAY 03 - SQL PRACTICE DATASET
-- 60 Days SQL Challenge
-- Total Employees: 50
-- Table: employee2
-- ============================================


-- STEP 1: Create table
CREATE TABLE employee2(
    employee_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary NUMERIC(10,2),
    city VARCHAR(50)
);


-- STEP 2: Insert Day-01 original 8 employees

INSERT INTO employee2
(employee_id, name, department, salary, city)
VALUES
(101, 'AMIT', 'sales', 45000, 'Delhi'),
(102, 'Riya', 'HR', 52000, 'Mumbai'),
(103, 'Karan', 'IT', 60000, 'Mumbai'),
(104, 'Neha', 'sales', 48000, 'Delhi'),
(105, 'Rahul', 'IT', 70000, 'Benglore'),
(106, 'Priya', 'HR', 55000, 'Mumbai'),
(107, 'Ankit', 'sales', 45000, 'jaipur'),
(108, 'Meena', 'IT', 70000, 'Pune');


-- STEP 3: Insert 42 additional employees

INSERT INTO employee2
(employee_id, name, department, salary, city)
VALUES
(109, 'Vikas', 'Finance', 58000, 'Delhi'),
(110, 'Pooja', 'Marketing', 50000, 'Mumbai'),
(111, 'Arjun', 'IT', 65000, 'Delhi'),
(112, 'Sneha', 'HR', 48000, 'Pune'),
(113, 'Rohit', 'Finance', 62000, 'Mumbai'),
(114, 'Kavita', 'Sales', 53000, 'Bangalore'),
(115, 'Manish', 'Marketing', 47000, 'Delhi'),
(116, 'Nisha', 'IT', 72000, 'Pune'),
(117, 'Suresh', 'Finance', 56000, 'Jaipur'),
(118, 'Anjali', 'HR', 51000, 'Delhi'),

(119, 'Deepak', 'Sales', 49000, 'Mumbai'),
(120, 'Komal', 'Marketing', 54000, 'Pune'),
(121, 'Akash', 'IT', 68000, 'Bangalore'),
(122, 'Simran', 'HR', 57000, 'Mumbai'),
(123, 'Varun', 'Finance', 61000, 'Delhi'),
(124, 'Shweta', 'Sales', 46000, 'Pune'),
(125, 'Gaurav', 'Marketing', 59000, 'Bangalore'),
(126, 'Pankaj', 'IT', 75000, 'Mumbai'),
(127, 'Divya', 'HR', 53000, 'Delhi'),
(128, 'Mohit', 'Finance', 64000, 'Pune'),

(129, 'Isha', 'Sales', 51000, 'Jaipur'),
(130, 'Rakesh', 'Marketing', 48000, 'Mumbai'),
(131, 'Varsha', 'IT', 69000, 'Delhi'),
(132, 'Nitin', 'HR', 50000, 'Bangalore'),
(133, 'Swati', 'Finance', 67000, 'Mumbai'),
(134, 'Ajay', 'Sales', 55000, 'Delhi'),
(135, 'Payal', 'Marketing', 52000, 'Pune'),
(136, 'Harsh', 'IT', 78000, 'Bangalore'),
(137, 'Renu', 'HR', 54000, 'Jaipur'),
(138, 'Sameer', 'Finance', 60000, 'Delhi'),

(139, 'Tanya', 'Sales', 47000, 'Mumbai'),
(140, 'Yash', 'Marketing', 56000, 'Bangalore'),
(141, 'Kunal', 'IT', 73000, 'Pune'),
(142, 'Aarti', 'HR', 49000, 'Delhi'),
(143, 'Ravi', 'Finance', 65000, 'Mumbai'),
(144, 'Sakshi', 'Sales', 52000, 'Bangalore'),
(145, 'Abhishek', 'Marketing', 60000, 'Delhi'),
(146, 'Priti', 'IT', 71000, 'Mumbai'),
(147, 'Tarun', 'HR', 56000, 'Pune'),
(148, 'Maya', 'Finance', 59000, 'Jaipur'),
(149, 'Vivek', 'Sales', 54000, 'Delhi'),
(150, 'Rashmi', 'Marketing', 57000, 'Mumbai');


-- STEP 4: Verify total employees

SELECT COUNT(*) AS total_employees
FROM employee2;


-- STEP 5: Display complete dataset

SELECT *
FROM employee2
ORDER BY employee_id;
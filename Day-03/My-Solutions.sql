-- =====================================================
-- DAY 03 - MY SOLUTIONS
-- Topic: SQL Filtering Operators
-- IN, NOT IN, BETWEEN, LIKE, AND
-- =====================================================


-- Q1
-- Display all employees who belong to the IT, HR,
-- or Finance department.

SELECT *
FROM employee2
WHERE department IN ('IT', 'HR', 'Finance');


-- Q2
-- Display all employees whose salary is
-- between 50,000 and 65,000.

SELECT *
FROM employee2
WHERE salary BETWEEN 50000 AND 65000;


-- Q3
-- Display all employees whose name starts
-- with the letter 'A'.

SELECT *
FROM employee2
WHERE name LIKE 'A%';


-- Q4
-- Display all employees who do NOT belong
-- to the Sales or Marketing department.

SELECT *
FROM employee2
WHERE department NOT IN ('Sales', 'Marketing');


-- Q5
-- Display all employees who work in the IT department
-- AND have a salary greater than 65,000.

SELECT *
FROM employee2
WHERE department = 'IT'
AND salary > 65000;


-- Q6
-- Display the name, department, and city of employees
-- who are from Delhi, Mumbai, or Pune.

SELECT name, department, city
FROM employee2
WHERE city IN ('Delhi', 'Mumbai', 'Pune');


-- Q7
-- Display all employees from the Finance department
-- whose salary is between 55,000 and 65,000.

SELECT *
FROM employee2
WHERE department = 'Finance'
AND salary BETWEEN 55000 AND 65000;


-- Q8
-- Display all employees whose names contain
-- the letter 'a'.

SELECT *
FROM employee2
WHERE name LIKE '%a%';


-- Q9
-- Display the name, department, and salary of employees
-- who are NOT from the IT or HR department
-- AND have a salary greater than 50,000.

SELECT name, department, salary
FROM employee2
WHERE department NOT IN ('IT', 'HR')
AND salary > 50000;


-- Q10
-- Display the name, department, city, and salary
-- of employees who:
-- 1. Belong to IT or Finance
-- 2. Are from Delhi, Mumbai, or Pune
-- 3. Have salary between 60,000 and 75,000

SELECT name, department, city, salary
FROM employee2
WHERE department IN ('IT', 'Finance')
AND city IN ('Delhi', 'Mumbai', 'Pune')
AND salary BETWEEN 60000 AND 75000;
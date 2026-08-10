-- ============================================
-- 60 DAYS SQL CHALLENGE
-- DAY 02 - MY SOLUTIONS
-- Topic: SQL Aggregate Functions
-- ============================================


-- Q1: Count the total number of employees.

SELECT COUNT(*) AS total_employees
FROM employee2;


-- Q2: Find the total salary of all employees.

SELECT SUM(salary) AS total_salary
FROM employee2;


-- Q3: Find the average salary of all employees.

SELECT AVG(salary) AS average_salary
FROM employee2;


-- Q4: Find the minimum salary among all employees.

SELECT MIN(salary) AS minimum_salary
FROM employee2;


-- Q5: Find the maximum salary among all employees.

SELECT MAX(salary) AS maximum_salary
FROM employee2;


-- Q6: Find the number of employees in each department.

SELECT department,
       COUNT(*) AS employee_count
FROM employee2
GROUP BY department;


-- Q7: Find the total salary paid to each department.

SELECT department,
       SUM(salary) AS total_salary
FROM employee2
GROUP BY department;


-- Q8: Find the average salary of each department.

SELECT department,
       AVG(salary) AS average_salary
FROM employee2
GROUP BY department;


-- Q9: Display departments where the total salary
-- is greater than 150000.

SELECT department,
       SUM(salary) AS total_salary
FROM employee2
GROUP BY department
HAVING SUM(salary) > 150000;


-- Q10: Display departments where the average salary
-- is greater than 55000.

SELECT department,
       AVG(salary) AS average_salary
FROM employee2
GROUP BY department
HAVING AVG(salary) > 55000;


-- Q11: Find the department with the highest total salary.

SELECT department,
       SUM(salary) AS total_salary
FROM employee2
GROUP BY department
ORDER BY total_salary DESC
LIMIT 1;


-- Q12: Find the department with the highest average salary.

SELECT department,
       AVG(salary) AS average_salary
FROM employee2
GROUP BY department
ORDER BY average_salary DESC
LIMIT 1;


-- Q13: Count the number of employees in each city.

SELECT city,
       COUNT(*) AS employee_count
FROM employee2
GROUP BY city;


-- Q14: Find the total salary paid in each city.

SELECT city,
       SUM(salary) AS total_salary
FROM employee2
GROUP BY city;


-- Q15: Find cities where the total salary
-- is greater than 100000.

SELECT city,
       SUM(salary) AS total_salary
FROM employee2
GROUP BY city
HAVING SUM(salary) > 100000;
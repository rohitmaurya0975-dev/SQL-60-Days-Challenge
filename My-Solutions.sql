---------------------------------------DAY1----------------------------------------------

CREATE TABLE employee2(
employee\_id INT PRIMARY KEY,
name varchar(50) NOT NULL,
department varchar(50),
salary NUMERIC(10,2),
city varchar(50));

SELECT * FROM employee2;

INSERT INTO employee2(employee_id,name,department,salary,city)
VALUES(101,'AMIT','sales',45000,'Delhi'),
(102,'Riya','HR',52000,'Mumbai'),
(103,'Karan','IT',60000,'Mumbai'),
(104,'Neha','sales',48000,'Delhi'),
(105,'Rahul','IT',70000,'Benglore'),
(106,'Priya','HR',55000,'Mumbai'),
(107,'Ankit','sales',45000,'jaipur'),
(108,'Meena','IT',70000,'Pune');

--Q1:Display all employee details.

SELECT * FROM employee2;

--Q1:Display only Name and Salary.

SELECT name,salary FROM employee2;		

--Q3:Show employees whose salary is greater than 50000.

SELECT * FROM employee2
WHERE salary>50000;

--Q4:Show employees from Delhi.

SELECT * FROM employee2
WHERE city='Delhi';

--Q5:Display all employees ordered by Salary (Highest to Lowest).

SELECT * FROM employee2
ORDER BY salary DESC;

--Q6:Display unique department.

SELECT DISTINCT department FROM employee2;
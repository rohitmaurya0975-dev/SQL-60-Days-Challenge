--Q01 — Employees Above Company Average Salary

Find all employees whose salary is greater than the
overall average employee salary.

Display
employee_name
salary
Requirements
Use a subquery
Use AVG()
Use WHERE
Skills
Single-value subquery
Aggregate function
Comparison operator

Q02 — Highest-Paid Employee

Find the employee or employees who have the highest salary
in the company.

Display
employee_name
salary
Requirements
Use MAX()
Use a subquery
Do not manually enter the highest salary
Skills
Single-value subquery
MAX()
Equality comparison

Q03 — Lowest-Paid Employee

Find the employee or employees who have the lowest salary
in the company.

Display
employee_name
salary
Requirements
Use MIN()
Use a subquery
Skills
Single-value subquery
MIN()
Q04 — Employees in IT Department

Find all employees who belong to the IT department using
a subquery.

Display
employee_name
salary
department_id
Requirements
Use IN
Find the IT department_id using a subquery
Do not directly use the department_id number
Skills
Multi-value subquery
IN
Nested filtering
🟡 INTERMEDIATE LEVEL
Q05 — Employees Outside IT and HR

Find employees who do not belong to either IT or HR.

Display
employee_name
department_id
salary
Requirements
Use NOT IN
Find department IDs using a subquery
Skills
Multi-value subquery
NOT IN
Q06 — Employees Above Their Department Average

Find employees whose salary is greater than the average
salary of their own department.

Display
employee_name
department_name
salary
department_average_salary
Requirements
Use a correlated subquery
Compare each employee's salary with their department average
Skills
Correlated subquery
AVG()
Outer query reference

Q07 — Employees Earning More Than the Highest HR Salary

Find employees whose salary is greater than the highest salary
earned by an HR employee.

Display
employee_name
department_id
salary
Requirements
Use MAX()
Use a subquery to find the highest HR salary
Skills
Subquery with aggregate
MAX()
Conditional filtering

Q08 — Departments with Employees Above Company Average

Find departments that have at least one employee earning
more than the overall company average salary.

Display
department_name
city
Requirements
Use a subquery for company average salary
Use IN
Use JOIN where required
Skills
Subquery
IN
JOIN
Aggregate comparison
🟠 ADVANCED LEVEL
Q09 Highest-Paid Employee in Each Department

Find the highest-paid employee from every department.

Display
department_name
employee_name
salary
Requirements
Use a correlated subquery
Compare each employee's salary with the maximum salary
of their department
Skills
Correlated subquery
MAX()
Multiple JOIN
Department-level analysis
Q10 — Employees Above City Average

Find employees whose salary is greater than the average
salary of employees working in the same city.

Display
employee_name
department_name
city
salary
city_average_salary
Requirements
Use a correlated subquery
Compare employee salary with city average salary
Skills
Correlated subquery
AVG()
Multiple JOIN
Analytical comparison
🔴 EXPERT PRACTICE
Q11 — Second Highest Salary

Find the employee or employees with the second-highest
salary in the company.

Display
employee_name
salary
Requirements
Use a subquery
Do not use LIMIT 1
Handle duplicate salaries correctly
Skills
Nested subquery
MAX()
Advanced filtering
Q12 — Departments Above Company Average Department Salary

Calculate the average salary of every department and return
only departments whose average salary is greater than the
overall company average salary.

Display
department_name
city
department_average_salary
company_average_salary
Requirements
Use subqueries
Use GROUP BY
Use HAVING
Skills
Subquery
Aggregation
GROUP BY
HAVING
Q13 — Employees Earning More Than Their Department's Maximum Junior Salary

Consider employees earning below 60000 as junior employees.

Find employees whose salary is greater than the maximum salary
earned by a junior employee in their department.

Display
employee_name
department_name
salary
Requirements
Use a correlated subquery
Use MAX()
Apply a salary condition inside the subquery
Skills
Correlated subquery
Conditional aggregation
Advanced filtering
Q14 — Departments with Above-Average Employee Count

Find departments whose employee count is greater than the
average employee count across all departments.

Display
department_name
employee_count
Requirements
Use GROUP BY
Use a subquery
Compare department count with average department count
Skills
Subquery
Aggregation
Nested aggregation
HAVING
💼 BUSINESS ANALYSIS
Q15 — HR Salary Benchmark Analysis

HR wants to identify employees who earn more than the
company-wide average salary.

Display
employee_name
department_name
salary
company_average_salary
Requirements
Use a subquery
Use JOIN
Sort by salary descending
Business Objective

Identify employees whose compensation is above the
company-wide salary benchmark.

Q16 — High-Paying Department Analysis

Management wants to identify departments whose average salary
is higher than the company's overall average salary.

Display
department_name
city
average_salary
company_average_salary
Requirements
Use subquery
Use GROUP BY
Use HAVING
Business Objective

Identify departments with stronger compensation levels.

Q17 — Salary Outlier Analysis

Identify employees whose salary is greater than the highest
salary of employees earning below 50000.

Display
employee_name
department_name
salary
Requirements
Use a subquery
Use MAX()
Use JOIN
Business Objective

Identify employees whose compensation is significantly above
the lower salary segment.

Q18 — Department Leader Analysis

Find the highest-paid employee from each department.

Display
department_name
employee_name
salary
city
Requirements
Use a correlated subquery
Use JOIN
Handle departments with multiple employees sharing
the same maximum salary
Business Objective

Identify the top compensation holder in every department.

Q19 — City Compensation Benchmark

Find employees whose salary is greater than the average salary
of their city.

Display
employee_name
department_name
city
salary
city_average_salary
Requirements
Use a correlated subquery
Use JOIN
Business Objective

Identify employees performing above their local
compensation benchmark.

Q20 — Executive Salary Analysis

Find employees earning more than the average salary of
employees in departments whose average salary is above 60000.

Display
employee_name
department_name
salary
Requirements
Use nested subqueries
Use aggregate functions
Use JOIN
Do not manually enter department IDs
Business Objective

Identify employees working in high-compensation departments
who individually earn above the relevant salary benchmark.
Practice Questions
--Q01 — Employee Department Mapping

Objective: Retrieve employee and department information.

Requirements:

Display employee name.
Display department name.
Join employees and departments.
Use INNER JOIN.

Skills: INNER JOIN, table relationships

Q02 — Employee Office Information

Objective: Retrieve complete organizational and office information for employees.

Requirements:

Display employee name.
Display department name.
Display office city.
Display state.
Use all three tables.
Use multiple INNER JOIN operations.

Skills: 3-Table JOIN, INNER JOIN

Q03 — IT Department Employee Report

Objective: Generate an employee report for the IT department.

Requirements:

Display employee name.
Display department name.
Display office city.
Display state.
Display salary.
Return only employees belonging to the IT department.
Use WHERE.

Skills: Multiple JOIN, WHERE

Q04 — Department Employee Count

Objective: Calculate the number of employees in each department.

Requirements:

Display department name.
Display total number of employees.
Use COUNT().
Use GROUP BY.
Sort the result by total employees in descending order.

Skills: Multiple JOIN, COUNT(), GROUP BY, ORDER BY

Q05 — Department Salary Analysis

Objective: Analyze employee salary levels across departments.

Requirements:

Display department name.
Display office city.
Display total number of employees.
Display average salary.
Use COUNT().
Use AVG().
Use GROUP BY.
Sort the result by average salary in descending order.

Skills: Multiple JOIN, aggregate functions, GROUP BY, ORDER BY

Q06 — High-Paying Departments

Objective: Identify departments with a high average employee salary.

Requirements:

Display department name.
Display office city.
Display average salary.
Calculate the average salary for each department.
Return only departments with an average salary greater than 60000.
Use GROUP BY.
Use HAVING.

Skills: Multiple JOIN, AVG(), GROUP BY, HAVING

Q07 — City-Wise Salary Analysis

Objective: Analyze employee salary distribution by office city.

Requirements:

Display city.
Display total number of employees.
Display total salary.
Display average salary.
Use COUNT().
Use SUM().
Use AVG().
Group the results by city.
Sort by total salary in descending order.

Skills: Multiple JOIN, aggregate functions, GROUP BY, ORDER BY

Q08 — Employee Salary Classification

Objective: Classify employees based on their salary level.

Salary Classification:

Salary Range	Category
Salary >= 80000	High
Salary >= 50000	Medium
Salary < 50000	Low

Requirements:

Display employee name.
Display department name.
Display salary.
Display salary category.
Use multiple JOIN.
Use CASE WHEN.

Skills: Multiple JOIN, CASE WHEN

Q09 — Complete Employee Report with NULL Handling

Objective: Generate a complete employee report while handling missing department and location information.

Requirements:

Display all employees.
Display employee name.
Display department name.
Display city.
Display state.
Display salary.
Display salary category.
Use LEFT JOIN.
Replace missing department names with Not Assigned.
Replace missing cities with Unknown City.
Replace missing states with Unknown State.
Use COALESCE().
Use CASE WHEN.

Skills: LEFT JOIN, NULL, COALESCE(), CASE WHEN

Q10 — Management Business Analysis

Objective: Identify departments that meet management's salary and employee-count requirements.

Business Requirements

A department should be included only when:

Employee salary is at least 50000.
The department has at least 3 qualifying employees.
The average salary of qualifying employees is greater than 60000.
Output Requirements

Display:

Department name
Office city
Total qualifying employees
Average salary
SQL Requirements

The solution must use:

Multiple JOIN
WHERE
COUNT()
AVG()
GROUP BY
HAVING
ORDER BY
Sorting

Sort the final result by average salary in descending order.

Skills: Multiple JOIN, filtering, aggregation, GROUP BY, HAVING, business analysis   

 


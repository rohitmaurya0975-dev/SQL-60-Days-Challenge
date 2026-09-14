# DAY 10 — CTE (Common Table Expressions)

## SQL Practice Questions

**Database:** PostgreSQL  
**Dataset:** Day 09 Dataset  
**Topic:** Common Table Expressions (CTE)

---

## Beginner Level

### Q01. Employees Above Company Average

Use a CTE to calculate the company's average salary.

Display:
- employee name
- salary

Return employees whose salary is greater than the company average.

---

### Q02. Highest-Paid Employee

Use a CTE to calculate the highest salary in the company.

Display:
- employee name
- salary

Return the employee(s) earning the highest salary.

---

### Q03. Lowest-Paid Employee

Use a CTE to calculate the lowest salary in the company.

Display:
- employee name
- salary

Return the employee(s) earning the lowest salary.

---

### Q04. Employees Earning More Than 60000

Create a CTE containing employees whose salary is greater than 60000.

Display:
- employee name
- department_id
- salary

Sort the result by salary in descending order.

---

### Q05. IT Department Employees

Create a CTE to identify the `department_id` of the IT department.

Use that CTE to display:
- employee name
- salary

for employees working in IT.

---

## Intermediate Level

### Q06. Department Salary Summary

Create a CTE that calculates salary statistics for each department.

Display:
- department_id
- employee_count
- average_salary
- maximum_salary
- minimum_salary

Sort by average salary in descending order.

---

### Q07. Departments Above Company Average

Create a CTE to calculate the company's average salary.

Then calculate the average salary of each department.

Display departments whose average salary is greater than the company average.

Display:
- department_id
- average_salary

Sort by average salary in descending order.

---

### Q08. Department Maximum Salary

Create a CTE that calculates the maximum salary for every department.

Display:
- department_id
- maximum_salary

Sort by maximum salary in descending order.

---

### Q09. Highest-Paid Employee in Each Department

Create a CTE that calculates the maximum salary for each department.

Use the CTE to find employees whose salary equals their department's maximum salary.

Display:
- employee name
- department_id
- salary

Sort by salary in descending order.

---

### Q10. City Salary Analysis

Create a CTE that calculates the average salary for each city.

Display:
- city
- average_salary

Ignore employees whose city is `NULL`.

Sort by average salary in descending order.

---

## Advanced Beginner Level

### Q11. Departments With More Than 5 Employees

Create a CTE that counts employees in each department.

Display:
- department_id
- employee_count

Return only departments having more than 5 employees.

---

### Q12. Employees Above Their Department Average

Create a CTE that calculates the average salary of each department.

Use the CTE to find employees whose salary is greater than their department's average salary.

Display:
- employee name
- department_id
- salary
- department_average_salary

Sort by salary in descending order.

---

### Q13. Departments With Average Salary Above 60000

Create a CTE that calculates the average salary for each department.

Return departments whose average salary is greater than 60000.

Display:
- department_id
- average_salary

Sort by average salary in descending order.

---

### Q14. High-Paid Employees From High-Paid Departments

Create a CTE that identifies departments whose average salary is greater than 60000.

Then display employees belonging to those departments.

Display:
- employee name
- department_id
- salary

Sort by salary in descending order.

---

### Q15. Salary Difference From Company Average

Create a CTE to calculate the company average salary.

Display:
- employee name
- salary
- salary_difference

Where `salary_difference` represents the employee's salary minus the company average salary.

Sort by salary difference in descending order.

---

## Multiple CTE Practice

### Q16. Department Performance Analysis

Create two CTEs:

1. One CTE calculates employee count for each department.
2. Another CTE calculates average salary for each department.

Combine the results.

Display:
- department_id
- employee_count
- average_salary

Sort by average salary in descending order.

---

### Q17. High-Salary Department Employees

Create two CTEs:

1. Calculate the average salary of each department.
2. Identify departments whose average salary is greater than 60000.

Use the result to display employees from those departments.

Display:
- employee name
- department_id
- salary

Sort by salary in descending order.

---

### Q18. Department Salary Ranking Preparation

Create a CTE containing:

- department_id
- employee_count
- average_salary
- maximum_salary
- minimum_salary

Sort the final result by average salary in descending order.

---

### Q19. City Compensation Benchmark

Create a CTE to calculate the average salary for each city.

Then display employees whose salary is greater than the average salary of their city.

Display:
- employee name
- city
- salary
- city_average_salary

Ignore employees whose city is `NULL`.

Sort by salary in descending order.

---

### Q20. Executive Salary Analysis

Create CTEs to:

1. Calculate the average salary of each department.
2. Identify departments whose average salary is greater than 60000.
3. Find employees in those departments who earn more than their own department's average salary.

Display:
- employee name
- department_id
- salary
- department_average_salary

Sort by salary in descending order.

---

# Practice Guidelines

- Use `WITH` to create CTEs.
- Give every CTE a meaningful name.
- Do not modify the dataset.
- Solve the questions in order.
- Start with Q01–Q05 before moving to multiple CTEs.
- Use PostgreSQL syntax.
- Write clean and readable SQL.
# DAY 11 — Advanced CTE + Multiple CTEs

## SQL Practice Questions

### Objective

Practice advanced Common Table Expressions (CTEs), multiple CTEs, CTE chaining, aggregation, joins, and business-oriented SQL analysis using PostgreSQL.

---

## Basic Level

### Q01. Department Average Salary

Create a CTE that calculates the average salary for each department.

Display:

- department_id
- average_salary

Sort by average_salary DESC.

---

### Q02. Department Employee Count

Create a CTE that calculates the total number of employees in each department.

Display:

- department_id
- total_employees

Sort by total_employees DESC.

---

### Q03. Department Salary Range

Create a CTE that calculates the minimum and maximum salary for every department.

Display:

- department_id
- minimum_salary
- maximum_salary

---

### Q04. Combine Department Average and Employee Count

Create two separate CTEs:

1. Department average salary
2. Department employee count

Join the two CTEs using department_id.

Display:

- department_id
- average_salary
- total_employees

---

### Q05. Department Summary With Names

Create CTEs for:

1. Average department salary
2. Employee count

Join the CTE results with the departments table.

Display:

- department_name
- average_salary
- total_employees

Sort by average_salary DESC.

---

## Intermediate Level

### Q06. Departments Above Company Average

Create a CTE for the company-wide average salary.

Create another CTE for department average salary.

Display only departments whose average salary is greater than the company average.

Display:

- department_name
- department_average_salary
- company_average_salary

---

### Q07. Highest Salary in Each Department

Create a CTE that finds the maximum salary for every department.

Join the CTE with employees.

Display:

- employee_name
- salary
- department_id

Return employees who earn the highest salary in their department.

---

### Q08. Department Salary Analysis

Create three CTEs:

1. Department average salary
2. Department maximum salary
3. Department employee count

Combine all three CTEs.

Display:

- department_name
- average_salary
- highest_salary
- total_employees

Sort by average_salary DESC.

---

### Q09. High-Paying Departments

Create a CTE that calculates department average salary.

Return departments whose average salary is greater than 60000.

Display:

- department_name
- average_salary

---

### Q10. Above Department Average Employees

Create a CTE containing the average salary of every department.

Join it with employees.

Display employees whose salary is greater than their department's average salary.

Display:

- employee_name
- salary
- department_name
- department_average_salary

---

### Q11. City Salary Benchmark

Create a CTE that calculates average salary for each city.

Display employees whose salary is greater than their city's average salary.

Display:

- employee_name
- city
- salary
- city_average_salary

Ignore employees whose city is NULL.

---

### Q12. Department and Location Analysis

Create multiple CTEs to calculate:

1. Department average salary
2. Department employee count

Join these CTEs with departments and locations.

Display:

- department_name
- city
- average_salary
- total_employees

Sort by average_salary DESC.

---

## Advanced Level

### Q13. Three-CTE Department Performance Analysis

Create three CTEs:

1. Department average salary
2. Department employee count
3. Department maximum salary

Combine all CTEs and display:

- department_name
- average_salary
- total_employees
- highest_salary

Return only departments with:

- average salary > 60000
- total employees >= 5

---

### Q14. High-Salary Employees From High-Paying Departments

Create a CTE for department average salary.

Create another CTE containing departments whose average salary is greater than 60000.

Join these results with employees.

Display employees whose salary is greater than their department's average salary.

Display:

- employee_name
- department_name
- salary
- department_average_salary

---

### Q15. Department Salary Difference From Company Average

Create a CTE for company average salary.

Create another CTE for department average salary.

Display:

- department_name
- department_average_salary
- company_average_salary
- salary_difference

Calculate salary_difference as:

department average salary - company average salary

Sort by salary_difference DESC.

---

### Q16. Department Salary Leaders

Create a CTE that finds the maximum salary for each department.

Join it with employees and departments.

Display:

- department_name
- employee_name
- salary

Return only employees who earn the maximum salary in their department.

---

### Q17. Multi-Level CTE Analysis

Create the following CTEs:

1. Department employee count
2. Department average salary
3. High-paying departments where average salary > 60000

Use the results to display:

- department_name
- total_employees
- average_salary

Return only departments that satisfy both:

- average salary > 60000
- total employees >= 5

---

### Q18. City and Department Benchmark

Create two CTEs:

1. Average salary by city
2. Average salary by department

Join the employee table with both CTEs.

Display employees whose salary is greater than:

- their city average salary
- their department average salary

Display:

- employee_name
- city
- department_id
- salary
- city_average_salary
- department_average_salary

Ignore NULL city values.

---

### Q19. Executive Compensation Analysis

Create multiple CTEs to calculate:

1. Company average salary
2. Department average salary
3. Department maximum salary

Identify employees who:

- earn more than the company average
- earn more than their department average
- belong to a department whose maximum salary is greater than 90000

Display:

- employee_name
- department_name
- salary
- company_average_salary
- department_average_salary
- department_max_salary

---

### Q20. Complete Department Performance Report

Build a final department performance report using multiple CTEs.

Calculate:

1. Total employees
2. Average salary
3. Minimum salary
4. Maximum salary
5. Company average salary

Display:

- department_name
- total_employees
- average_salary
- minimum_salary
- maximum_salary
- company_average_salary
- salary_difference_from_company_average

Only include departments with at least 5 employees.

Sort by average_salary DESC.

---

# Learning Focus

By completing these questions, you should be able to:

- Create multiple CTEs
- Use multiple CTEs in one query
- Join CTEs together
- Combine CTEs with normal tables
- Use CTEs with GROUP BY
- Use CTEs with aggregate functions
- Compare department-level and company-level metrics
- Build multi-step SQL analysis
- Chain multiple analytical steps
- Solve business-oriented SQL problems
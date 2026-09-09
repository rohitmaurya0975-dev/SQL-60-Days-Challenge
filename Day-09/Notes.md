# Day 09 — Subqueries

## Overview

A **Subquery** is a SQL query written inside another SQL query.

Subqueries are useful when one query needs the result of another query to perform filtering, comparison, or calculation.

Day 09 focuses on:

- Subquery Fundamentals
- Single-Value Subqueries
- Multi-Value Subqueries
- `IN` and `NOT IN`
- Correlated Subqueries
- Outer Query References
- Nested Subqueries
- Subqueries with Aggregate Functions
- Subqueries with `GROUP BY` and `HAVING`
- Business Analysis using Subqueries

---

# 1. What is a Subquery?

A subquery is a query written inside another query.

### Basic Structure

```sql
SELECT column1, column2
FROM table_name
WHERE column1 > (
    SELECT aggregate_function(column1)
    FROM table_name
);

The inner query executes to produce a value that is used by the outer query.

2. Simple Subquery Example

Find employees earning more than the company average salary.

SELECT
    name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
How it works

First, the inner query calculates:

SELECT AVG(salary)
FROM employees;

Then the outer query compares every employee's salary with that result.

Concept
Inner Query
     ↓
Company Average
     ↓
Outer Query
     ↓
Compare Employee Salary
3. Single-Value Subquery

A subquery that returns exactly one value is called a single-value subquery.

Example:

SELECT MAX(salary)
FROM employees;

Result:

98000

Because the result is one value, comparison operators can be used.

=
>
<
>=
<=

Example:

SELECT
    name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
4. Common Aggregate Subqueries
Average Salary
SELECT AVG(salary)
FROM employees;
Maximum Salary
SELECT MAX(salary)
FROM employees;
Minimum Salary
SELECT MIN(salary)
FROM employees;

These values can be used by the outer query.

5. Multi-Value Subquery

Sometimes a subquery returns multiple rows.

Example:

SELECT department_id
FROM departments
WHERE department_name IN ('IT', 'Finance', 'Analytics');

The result may be:

1
3
7

Because multiple values are returned, IN is appropriate.

SELECT
    name,
    department_id,
    salary
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('IT', 'Finance', 'Analytics')
);
6. = vs IN

This is an important rule.

One value

Use:

=

Example:

WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);
Multiple values

Use:

IN

Example:

WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('IT', 'Finance')
);
Remember
One value   → =, >, <, >=, <=

Many values → IN / NOT IN
7. IN Subquery

IN checks whether a value exists in the result returned by the subquery.

Example:

SELECT
    name,
    department_id,
    salary
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('IT', 'HR')
);

The outer query returns employees belonging to the selected departments.

8. NOT IN Subquery

NOT IN excludes values returned by the subquery.

Example:

SELECT
    name,
    department_id,
    salary
FROM employees
WHERE department_id NOT IN (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('IT', 'HR')
);

This returns employees whose department is neither IT nor HR.

9. Important NOT IN + NULL Rule

NULL can create unexpected results with NOT IN.

Remember:

NULL = NULL

does not evaluate to TRUE.

Also:

NULL NOT IN (...)

does not evaluate to TRUE.

It evaluates to UNKNOWN.

Therefore, if the subquery can return NULL values, handle them carefully.

Example:

SELECT
    name,
    department_id
FROM employees
WHERE department_id NOT IN (
    SELECT department_id
    FROM departments
    WHERE department_id IS NOT NULL
);

If employees with no department should also be included:

SELECT
    name,
    department_id
FROM employees
WHERE department_id NOT IN (
    SELECT department_id
    FROM departments
    WHERE department_id IS NOT NULL
)
OR department_id IS NULL;
10. What is a Correlated Subquery?

A correlated subquery is a subquery that depends on the current row of the outer query.

The inner query references a column from the outer query.

Basic Pattern
SELECT
    e.name,
    e.salary
FROM employees AS e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.department_id = e.department_id
);

The important condition is:

e2.department_id = e.department_id

Here:

e2 → Inner Query
e  → Outer Query

Therefore, the inner query depends on the current outer employee.

11. Outer Query Reference

An outer query reference occurs when the inner query uses a column belonging to the outer query.

Example:

WHERE e2.department_id = e.department_id

The following part:

e.department_id

is an outer query reference.

Why?

Because e was defined in the outer query:

FROM employees AS e

The inner query uses that value.

12. Correlated Subquery Example

Find employees earning more than their department average.

SELECT
    e.name AS employee_name,
    e.salary
FROM employees AS e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.department_id = e.department_id
);
Logic

For every employee:

Current Employee
      ↓
Get Department ID
      ↓
Find Employees in Same Department
      ↓
Calculate Department Average
      ↓
Compare Current Employee Salary
13. Normal Subquery vs Correlated Subquery
Normal Subquery	Correlated Subquery
Works independently	Depends on outer query
Usually executes independently	Evaluated in relation to outer rows
Does not require outer reference	Uses outer query reference
Example: company average	Example: department average
Simpler	More advanced
Normal
SELECT AVG(salary)
FROM employees;
Correlated
SELECT AVG(e2.salary)
FROM employees AS e2
WHERE e2.department_id = e.department_id;
14. Correlated Subquery with MAX()

Find the highest-paid employee in each department.

SELECT
    d.department_name,
    e.name AS employee_name,
    e.salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees AS e2
    WHERE e2.department_id = e.department_id
);

The subquery calculates the maximum salary for the current employee's department.

15. Correlated Subquery with MIN()

Find employees whose salary is greater than the minimum salary in their department.

SELECT
    e.name AS employee_name,
    e.salary
FROM employees AS e
WHERE e.salary > (
    SELECT MIN(e2.salary)
    FROM employees AS e2
    WHERE e2.department_id = e.department_id
);
16. Subquery with GROUP BY

Subqueries can be combined with grouped analysis.

Example:

Find departments whose average salary is greater than the company average.

SELECT
    d.department_name,
    AVG(e.salary) AS department_average_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
GROUP BY
    d.department_id,
    d.department_name
HAVING AVG(e.salary) > (
    SELECT AVG(salary)
    FROM employees
);

Here:

GROUP BY
    ↓
Department Average
    ↓
HAVING
    ↓
Compare with Company Average
17. Subquery with HAVING

Use HAVING when the condition applies to an aggregated group.

Example:

HAVING AVG(e.salary) > (
    SELECT AVG(salary)
    FROM employees
)

The left side is:

Department Average

The right side is:

Company Average

The department is returned only when:

Department Average > Company Average
18. Nested Subquery

A nested subquery is a subquery inside another subquery.

Example: second-highest salary.

SELECT
    name,
    salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);
Execution logic
Level 1
Find highest salary
        ↓
Level 2
Find maximum salary below highest
        ↓
Outer Query
Find employees earning that salary
19. Second-Highest Salary Logic

The logic is:

Highest Salary
      ↓
Exclude Highest Salary
      ↓
Find MAX of remaining salaries
      ↓
Second Highest Salary

This approach:

Does not require LIMIT
Does not require OFFSET
Can return multiple employees if they share the second-highest salary
20. Subquery with JOIN

Subqueries and JOINs can be used together.

Example:

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT MAX(e2.salary)
    FROM employees AS e2
    INNER JOIN departments AS d2
        ON e2.department_id = d2.department_id
    WHERE d2.department_name = 'HR'
);

The subquery calculates the highest HR salary.

The outer query compares all employees against that value.

21. Subquery Execution Flow

A simplified way to understand many subqueries:

Outer Query
    ↓
Subquery Required
    ↓
Execute Inner Query
    ↓
Get Result
    ↓
Outer Query Uses Result
    ↓
Final Result

For correlated subqueries:

Outer Row
    ↓
Outer Value
    ↓
Inner Query
    ↓
Calculate Related Result
    ↓
Compare
    ↓
Next Outer Row
22. Common Subquery Mistakes
Mistake 1 — Using = for Multiple Rows

Incorrect:

WHERE department_id = (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('IT', 'Finance')
);

If the subquery returns multiple rows, = is inappropriate.

Use:

WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('IT', 'Finance')
);
Mistake 2 — Forgetting Correlation

Incorrect for department comparison:

WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
);

This compares against the company average.

For department average:

WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.department_id = e.department_id
);
Mistake 3 — Wrong Outer Reference

Incorrect:

WHERE e2.employee_id = e.employee_id

If the requirement is department-level comparison, the correlation should be based on:

e2.department_id = e.department_id

Always correlate using the business relationship required by the question.

23. NULL Handling

Never write:

WHERE department_id = NULL;

Use:

WHERE department_id IS NULL;

For non-NULL:

WHERE department_id IS NOT NULL;

Remember:

= NULL        ❌

IS NULL       ✅

IS NOT NULL   ✅
24. Subquery Decision Guide

Before writing a subquery, ask:

Question 1

Does the inner query return one value?

YES
↓
Use:
= > < >= <=
Question 2

Does it return multiple values?

YES
↓
Use:
IN / NOT IN
Question 3

Does the inner query depend on the current outer row?

YES
↓
Correlated Subquery
Question 4

Are you comparing aggregated groups?

YES
↓
GROUP BY + HAVING
25. Subquery vs JOIN

Both can sometimes solve the same problem, but they serve different purposes.

Subquery

Useful when you need a value for comparison.

Example:

WHERE salary > (
    SELECT AVG(salary)
    FROM employees
)
JOIN

Useful when you need related columns from another table.

Example:

INNER JOIN departments AS d
    ON e.department_id = d.department_id
Practical Rule
Need a comparison value?
→ Subquery can be useful.

Need columns from another table?
→ JOIN is usually appropriate.

Need row-by-row comparison?
→ Consider a correlated subquery.
26. Business Analysis Applications

Subqueries are useful in real-world analytics for:

Salary Benchmarking

Find employees above company average.

Department Performance

Find departments above company average.

Compensation Analysis

Compare employees with department or city benchmarks.

Management Reporting

Find highest-paid employees.

Budget Analysis

Compare department salary expenses.

Outlier Detection

Identify unusually high or low salaries.

Workforce Analysis

Compare department employee counts.

27. Day 09 Key Query Patterns
Company Average
SELECT AVG(salary)
FROM employees;
Employee Above Company Average
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
)
Employee Above Department Average
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.department_id = e.department_id
)
Highest Salary
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
)
Employees in Selected Departments
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('IT', 'Finance')
)
28. Day 09 Golden Rules
A subquery is a query inside another query.
Single-value subqueries can use comparison operators.
Multi-value subqueries commonly use IN.
Be careful with NOT IN and NULL.
Correlated subqueries depend on the outer query.
Outer query references connect the inner query to the current outer row.
WHERE filters rows.
HAVING filters groups.
GROUP BY is used for grouped calculations.
Use IS NULL instead of = NULL.
Test complex subqueries independently first.
Use aliases to clearly distinguish outer and inner queries.
29. Interview Questions — Day 09
Q1. What is a subquery?

A query written inside another SQL query.

Q2. What is a correlated subquery?

A subquery that depends on the current row of the outer query.

Q3. What is an outer query reference?

A column from the outer query referenced inside the inner query.

Q4. When should you use IN?

When the subquery can return multiple values.

Q5. Why can NOT IN be problematic with NULL?

Because comparisons involving NULL evaluate to UNKNOWN.

Q6. What is a nested subquery?

A subquery placed inside another subquery.

Q7. What is the difference between WHERE and HAVING?

WHERE filters individual rows, while HAVING filters grouped/aggregated results.

Q8. How can you find the second-highest salary without LIMIT?

Find the maximum salary below the overall maximum salary.

30. Day 09 Quick Revision
SUBQUERY
   │
   ├── Single Value
   │      ├── =
   │      ├── >
   │      ├── <
   │      └── >= / <=
   │
   ├── Multiple Values
   │      ├── IN
   │      └── NOT IN
   │
   ├── Correlated
   │      └── Outer Query Reference
   │
   ├── Nested
   │      └── Subquery inside Subquery
   │
   └── Aggregation
          ├── AVG()
          ├── MAX()
          ├── MIN()
          ├── COUNT()
          └── SUM()
Final Day 09 Takeaway

The most important concept of Day 09 is understanding what the inner query is returning and whether it depends on the outer query.

One Value
    → Comparison Operator

Multiple Values
    → IN / NOT IN

Depends on Current Outer Row
    → Correlated Subquery

Multiple Levels
    → Nested Subquery

Group Comparison
    → GROUP BY + HAVING
Core Correlated Subquery Pattern
SELECT
    e.name,
    e.salary
FROM employees AS e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.department_id = e.department_id
);

Day 09 = Subqueries → Correlated Subqueries → Nested Queries → Business Analysis


### ✅ Day 09 status

`Dataset.sql` ✅  
`Questions.md` ✅  
`My-Solutions.sql` ✅  
`Challenge.sql` ✅  
`Challenge-Solutions.sql` ✅  
`Debugging.sql` ✅  
`Business-Problem.sql` ✅  
`Business-Solutions.sql` ✅  
`Notes.md` ✅  

Ab **last file `Day-09-Summary.png`** hai. Uske baad Day 09 complete ho jayega.
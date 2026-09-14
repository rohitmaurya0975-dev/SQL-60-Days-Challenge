# DAY 10 — CTE (Common Table Expressions)

## SQL Revision Notes

**Database:** PostgreSQL  
**Dataset:** Day 09 Dataset  
**Topic:** Common Table Expressions (CTE)

---

# 1. What is a CTE?

CTE stands for:

**Common Table Expression**

A CTE allows us to create a temporary named result and use that result in the main query.

Simple definition:

> CTE = Query ke result ko temporary naam dekar, baad mein use karna.

Basic structure:

```sql
WITH cte_name AS (
    SELECT ...
)
SELECT ...
FROM cte_name;
2. Why Do We Use CTE?

CTEs are useful when:

A query becomes long or difficult to understand.
We want to break a large query into smaller steps.
We want to reuse an intermediate result.
We need multiple stages of analysis.
We want cleaner and more readable SQL.

Instead of writing everything in one large query, we can divide the logic into steps.

3. Basic CTE Structure
WITH temporary_name AS (
    SELECT
        column1,
        column2
    FROM table_name
)
SELECT
    column1,
    column2
FROM temporary_name;

There are two main parts:

Step 1 — Create the CTE
WITH temporary_name AS (
    SELECT ...
)
Step 2 — Use the CTE
SELECT ...
FROM temporary_name;
4. CTE Example

Suppose we want to find employees earning more than the company average salary.

Without CTE:

SELECT
    name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

With CTE:

WITH company_average AS (
    SELECT AVG(salary) AS average_salary
    FROM employees
)
SELECT
    e.name,
    e.salary
FROM employees AS e
CROSS JOIN company_average AS c
WHERE e.salary > c.average_salary;

The CTE first calculates the average salary.

Then the main query uses that result.

5. Understanding WITH

The keyword:

WITH

starts the CTE section.

Example:

WITH company_average AS (
    ...
)

Think:

WITH = I am creating a temporary result.

6. Understanding AS

In:

WITH company_average AS (
    SELECT AVG(salary) AS average_salary
    FROM employees
)

The first AS gives a name to the CTE.

company_average
      ↓
temporary result

The second AS gives a name to the calculated column.

average_salary
      ↓
column alias
7. CTE as a Temporary Box

Think of a CTE like a temporary box.

Employees Table
       ↓
   CTE Query
       ↓
┌──────────────────┐
│ company_average  │
│ average_salary   │
└──────────────────┘
       ↓
 Main Query

The CTE exists only while the SQL statement is running.

It does not permanently create a table.

8. CTE vs Subquery
Subquery

A subquery is a query inside another query.

Example:

SELECT
    name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
CTE

A CTE is written before the main query.

WITH company_average AS (
    SELECT AVG(salary) AS average_salary
    FROM employees
)
SELECT
    name,
    salary
FROM employees
WHERE salary > (
    SELECT average_salary
    FROM company_average
);
Simple Difference
Subquery
    ↓
Query inside query

CTE
    ↓
Named temporary result
    ↓
Main query uses it
9. Single-Value CTE

A CTE can return one value.

Example:

WITH highest_salary AS (
    SELECT MAX(salary) AS maximum_salary
    FROM employees
)
SELECT
    name,
    salary
FROM employees
WHERE salary = (
    SELECT maximum_salary
    FROM highest_salary
);

The CTE produces one value:

maximum_salary
      ↓
    98000
10. Multiple-Row CTE

A CTE can also return multiple rows.

Example:

WITH selected_departments AS (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('IT', 'HR')
)
SELECT *
FROM selected_departments;

The CTE may return:

department_id
-------------
1
2

Then we can use those IDs in another query.

SELECT
    name,
    department_id,
    salary
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM selected_departments
);
11. CTE With GROUP BY

CTEs are very useful with aggregation.

Example:

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)
SELECT *
FROM department_average;

Result conceptually:

department_id | average_salary
---------------+---------------
1              | ...
2              | ...
3              | ...

Each department gets its own average salary.

12. CTE With JOIN

A CTE can be joined with another table.

Example:

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)
SELECT
    e.name,
    e.department_id,
    e.salary,
    d.average_salary
FROM employees AS e
INNER JOIN department_average AS d
    ON e.department_id = d.department_id;

This allows us to compare an employee's salary with the department average.

13. Finding Employees Above Department Average

This is an important CTE pattern.

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS department_average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)
SELECT
    e.name,
    e.department_id,
    e.salary,
    d.department_average_salary
FROM employees AS e
INNER JOIN department_average AS d
    ON e.department_id = d.department_id
WHERE e.salary > d.department_average_salary;
Logic
Step 1
Calculate department averages
        ↓
Step 2
Join employees with their department average
        ↓
Step 3
Compare employee salary
with department average
        ↓
Step 4
Return employees above average
14. Multiple CTEs

We can create more than one CTE in the same query.

Syntax:

WITH cte_one AS (
    SELECT ...
),
cte_two AS (
    SELECT ...
)
SELECT ...
FROM cte_one
JOIN cte_two
    ON ...;

Example:

WITH employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),
salary_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)
SELECT
    e.department_id,
    e.total_employees,
    s.average_salary
FROM employee_count AS e
INNER JOIN salary_average AS s
    ON e.department_id = s.department_id;
15. Multiple CTE Mental Model

Think of multiple CTEs as multiple temporary boxes.

employees
    │
    ├──────────────→ employee_count
    │
    └──────────────→ salary_average
                         │
                         ↓
                       JOIN
                         │
                         ↓
                    Final Result
16. CTE Execution Thinking

When reading a CTE query, think in this order:

Step 1

Find:

WITH
Step 2

Read the first CTE.

Step 3

Understand what result it produces.

Step 4

Read the next CTE, if present.

Step 5

Read the main SELECT.

Step 6

Understand how the main query uses the CTE results.

17. Important CTE Pattern
Company Average
WITH company_average AS (
    SELECT AVG(salary) AS average_salary
    FROM employees
)
Department Average
WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)
Department Maximum
WITH department_maximum AS (
    SELECT
        department_id,
        MAX(salary) AS maximum_salary
    FROM employees
    GROUP BY department_id
)
Employee Count
WITH employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS employee_count
    FROM employees
    GROUP BY department_id
)

These patterns are very important for data-analysis SQL.

18. CTE Naming Best Practices

Use meaningful names.

Good:

company_average
department_average
employee_count
department_maximum
city_average
high_paying_departments

Avoid unclear names:

x
temp1
abc
data
test

A good CTE name should tell us what the CTE contains.

19. CTE With ORDER BY

Usually, sorting the final result should be done in the main query.

Example:

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)
SELECT
    department_id,
    average_salary
FROM department_average
ORDER BY average_salary DESC;

The final ORDER BY controls the displayed result.

20. CTE Does Not Permanently Create a Table

A CTE:

WITH company_average AS (
    ...
)

does NOT create a permanent database table.

It is available only for that SQL statement.

CTE
 ↓
Temporary query result
 ↓
Used during current query
 ↓
Query finishes
 ↓
CTE is gone
21. Common Mistakes
Mistake 1 — Forgetting the CTE name

Wrong:

WITH AS (
    SELECT AVG(salary)
    FROM employees
)

Correct:

WITH company_average AS (
    SELECT AVG(salary)
    FROM employees
)
Mistake 2 — Using CTE name like a column

Wrong:

WHERE salary > company_average

company_average is a result/table-like name, not the calculated value.

You need to reference the column:

WHERE salary > c.average_salary

after bringing the CTE into the query.

Mistake 3 — Forgetting GROUP BY

Wrong:

SELECT
    department_id,
    AVG(salary)
FROM employees;

When selecting department_id with AVG(), department_id needs to be grouped.

Correct:

SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id;
Mistake 4 — Incorrect JOIN condition

Always compare related columns.

Correct:

ON e.department_id = d.department_id

Do not accidentally compare unrelated columns such as:

ON e.department_id = d.average_salary
Mistake 5 — Using WHERE city = NULL

Wrong:

WHERE city = NULL

Correct:

WHERE city IS NULL

For non-NULL:

WHERE city IS NOT NULL
22. CTE Decision Guide

Ask yourself:

Do I need a temporary named result?
YES
 ↓
Consider CTE
Is the query simple?
YES
 ↓
Normal SELECT may be enough
Is the query becoming difficult to read?
YES
 ↓
Use CTE
Do I have multiple analysis steps?
YES
 ↓
Multiple CTEs can help
23. Important Patterns to Remember
Pattern 1 — One CTE
WITH cte_name AS (
    SELECT ...
)
SELECT ...
FROM cte_name;
Pattern 2 — CTE + JOIN
WITH cte_name AS (
    SELECT ...
)
SELECT ...
FROM employees AS e
JOIN cte_name AS c
    ON e.department_id = c.department_id;
Pattern 3 — Multiple CTEs
WITH first_cte AS (
    SELECT ...
),
second_cte AS (
    SELECT ...
)
SELECT ...
FROM first_cte
JOIN second_cte
    ON ...;
24. Day 10 Key Takeaways

Remember these five points:

CTE = Common Table Expression
WITH starts a CTE
AS gives the CTE its name
The main query uses the CTE result
Multiple CTEs allow multi-step SQL analysis
25. Final Mental Model
WITH
   ↓
Create temporary result
   ↓
Give it a name
   ↓
Use that name
   ↓
Main SELECT
   ↓
Final Result
One-line definition:

CTE is a named temporary query result used to make complex SQL easier to read, organize, and analyze.

DAY 10 COMPLETE
Topics Covered
CTE introduction
WITH
AS
Basic CTE
CTE with aggregate functions
CTE with GROUP BY
CTE with JOIN
Single-value CTE
Multiple-row CTE
Multiple CTEs
Department analysis
City analysis
Salary benchmarking
Common CTE mistakes
CTE best practices
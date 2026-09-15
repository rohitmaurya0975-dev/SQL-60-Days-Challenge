# DAY 11 — Advanced CTE + Multiple CTEs

## 1. Day 11 Overview

Day 11 focuses on advanced usage of Common Table Expressions (CTEs).

Topics covered:

- Multiple CTEs
- CTE chaining
- CTE + JOIN
- CTE + GROUP BY
- CTE + normal tables
- Multiple CTEs for business analysis
- Company-level benchmarks
- Department-level benchmarks
- City-level benchmarks
- Advanced salary analysis
- Executive compensation analysis
- Management reporting

---

# 2. What is a CTE?

CTE stands for:

**Common Table Expression**

A CTE is a temporary named result that can be used inside a single SQL statement.

Basic syntax:

```sql
WITH cte_name AS (
    SELECT ...
)
SELECT *
FROM cte_name;

Think of a CTE as:

Complex Query
      ↓
Temporary Result
      ↓
Final Query
3. Why Use CTEs?

CTEs make complex SQL queries:

Easier to read
Easier to understand
Easier to debug
Easier to maintain
Easier to divide into logical steps

Instead of writing one large query, we can break the analysis into smaller parts.

4. Multiple CTEs

Multiple CTEs can be created inside the same WITH clause.

Syntax:

WITH cte1 AS (
    SELECT ...
),

cte2 AS (
    SELECT ...
),

cte3 AS (
    SELECT ...
)

SELECT ...
FROM cte1
JOIN cte2
    ON ...
JOIN cte3
    ON ...;
Important Rule

There is only one WITH.

Do NOT write:

WITH cte1 AS (...);

WITH cte2 AS (...);

Instead:

WITH cte1 AS (...),
cte2 AS (...)
SELECT ...;

Multiple CTEs are separated using commas.

5. CTE 1 — Department Average Salary

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

The CTE creates a department-level salary benchmark.

6. CTE 2 — Employee Count

We can create another CTE to count employees.

WITH employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT *
FROM employee_count;

Now we have:

department_id | total_employees
---------------+----------------
1              | 6
2              | 6
3              | 6
...
7. Combining Multiple CTEs

We can combine the two CTEs.

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),

employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    da.department_id,
    da.average_salary,
    ec.total_employees
FROM department_average da
JOIN employee_count ec
    ON da.department_id = ec.department_id;

Mental model:

employees
   │
   ├──→ department_average
   │
   └──→ employee_count
              │
              ↓
            JOIN
              │
              ↓
        Final Result
8. CTE + Normal Table JOIN

A CTE can also be joined with existing database tables.

Example:

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)

SELECT
    d.department_name,
    da.average_salary
FROM department_average da
JOIN departments d
    ON da.department_id = d.department_id;

Here:

department_average
        ↓
      JOIN
        ↓
departments table
        ↓
Final Result
9. CTE + GROUP BY

CTEs are very useful for aggregation.

Example:

WITH department_summary AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees,
        AVG(salary) AS average_salary,
        MIN(salary) AS minimum_salary,
        MAX(salary) AS maximum_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT *
FROM department_summary;

This produces a department-level summary.

10. CTE Chaining

One CTE can be used by another CTE.

Example:

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
),

high_paying_departments AS (
    SELECT
        department_id,
        average_salary
    FROM department_average
    WHERE average_salary > 60000
)

SELECT *
FROM high_paying_departments;

Flow:

employees
    ↓
department_average
    ↓
high_paying_departments
    ↓
final SELECT

This is called CTE chaining.

11. CTE Dependency

When one CTE depends on another CTE, the first CTE must be defined before the dependent CTE.

Correct:

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
),

high_paying_departments AS (
    SELECT *
    FROM department_average
    WHERE average_salary > 60000
)

SELECT *
FROM high_paying_departments;

The order matters because:

department_average
        ↓
high_paying_departments
12. Company Average Salary

A CTE can calculate a company-wide benchmark.

WITH company_average AS (
    SELECT
        AVG(salary) AS company_average_salary
    FROM employees
)

SELECT *
FROM company_average;

The result contains one row:

company_average_salary
----------------------
...

This is a single-value CTE.

13. CROSS JOIN with a Single-Row CTE

When a CTE contains one company-wide value, we can use CROSS JOIN.

Example:

WITH company_average AS (
    SELECT
        AVG(salary) AS company_average_salary
    FROM employees
)

SELECT
    e.name,
    e.salary,
    ca.company_average_salary
FROM employees e
CROSS JOIN company_average ca;

Why CROSS JOIN?

Because the company average applies to every employee.

Concept:

Employee 1 ─┐
Employee 2 ─┤
Employee 3 ─┤
Employee 4 ─┤──→ Company Average
Employee 5 ─┤
Employee 6 ─┘
14. Company Average vs Department Average

We can calculate both levels separately.

WITH company_average AS (
    SELECT
        AVG(salary) AS company_average_salary
    FROM employees
),

department_average AS (
    SELECT
        department_id,
        AVG(salary) AS department_average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    da.department_id,
    da.department_average_salary,
    ca.company_average_salary
FROM department_average da
CROSS JOIN company_average ca;

Now we can compare:

Department Average
        vs
Company Average
15. Salary Difference from Company Average

We can calculate the difference:

WITH company_average AS (
    SELECT
        AVG(salary) AS company_average_salary
    FROM employees
),

department_average AS (
    SELECT
        department_id,
        AVG(salary) AS department_average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    da.department_id,
    da.department_average_salary,
    ca.company_average_salary,
    da.department_average_salary
        - ca.company_average_salary AS salary_difference
FROM department_average da
CROSS JOIN company_average ca;

Interpretation:

Positive difference
→ Department average is above company average

Negative difference
→ Department average is below company average
16. Finding Employees Above Department Average

This is a common business-analysis problem.

Step 1:

Calculate department average.

Step 2:

Join employees with department average.

Step 3:

Compare employee salary with department average.

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
    e.salary,
    da.department_average_salary
FROM employees e
JOIN department_average da
    ON e.department_id = da.department_id
WHERE e.salary > da.department_average_salary;

Mental model:

Employee Salary
      ↓
Compare
      ↓
Department Average
      ↓
salary > average
17. Finding High-Paying Departments

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
    d.department_name,
    da.average_salary
FROM department_average da
JOIN departments d
    ON da.department_id = d.department_id
WHERE da.average_salary > 60000
ORDER BY da.average_salary DESC;

The CTE calculates the benchmark.

The final query filters the benchmark.

18. Finding Department Salary Leaders

We can calculate the maximum salary for each department.

WITH department_maximum AS (
    SELECT
        department_id,
        MAX(salary) AS maximum_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    e.name,
    e.salary,
    dm.maximum_salary
FROM employees e
JOIN department_maximum dm
    ON e.department_id = dm.department_id
   AND e.salary = dm.maximum_salary;

Important:

Using MAX() alone gives the salary.

Joining it back to employees gives the employee who earns that salary.

19. City-Level Benchmark

The same idea can be applied to cities.

WITH city_average AS (
    SELECT
        city,
        AVG(salary) AS city_average_salary
    FROM employees
    WHERE city IS NOT NULL
    GROUP BY city
)

SELECT
    e.name,
    e.city,
    e.salary,
    ca.city_average_salary
FROM employees e
JOIN city_average ca
    ON e.city = ca.city
WHERE e.salary > ca.city_average_salary;

This identifies employees earning above their city's average salary.

20. Three CTEs

We can use three CTEs in one query.

Example:

WITH company_average AS (
    SELECT
        AVG(salary) AS company_average_salary
    FROM employees
),

department_average AS (
    SELECT
        department_id,
        AVG(salary) AS department_average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),

department_maximum AS (
    SELECT
        department_id,
        MAX(salary) AS department_max_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)

SELECT
    e.name,
    e.salary,
    da.department_average_salary,
    dm.department_max_salary,
    ca.company_average_salary
FROM employees e
CROSS JOIN company_average ca
JOIN department_average da
    ON e.department_id = da.department_id
JOIN department_maximum dm
    ON e.department_id = dm.department_id;

Mental model:

                    employees
                       │
          ┌────────────┼────────────┐
          ↓            ↓            ↓
 company_average  department_avg  department_max
          │            │            │
          └────────────┼────────────┘
                       ↓
                   Final JOIN
                       ↓
                  Final Report
21. CTE + JOIN + GROUP BY

A CTE can prepare data and the final query can perform additional grouping.

Example:

WITH employee_data AS (
    SELECT
        department_id,
        salary
    FROM employees
    WHERE salary IS NOT NULL
)

SELECT
    department_id,
    COUNT(*) AS total_employees,
    AVG(salary) AS average_salary
FROM employee_data
GROUP BY department_id;

This separates:

Data preparation
      ↓
Aggregation
22. CTE + Multiple Tables

CTEs are not limited to one table.

Example:

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)

SELECT
    d.department_name,
    l.city,
    da.average_salary
FROM department_average da
JOIN departments d
    ON da.department_id = d.department_id
JOIN locations l
    ON d.location_id = l.location_id;

Flow:

employees
    ↓
department_average
    ↓
departments
    ↓
locations
    ↓
Final Report
23. NULL Handling

Remember:

= NULL

is incorrect.

Use:

IS NULL

or:

IS NOT NULL

Example:

SELECT *
FROM employees
WHERE city IS NULL;

For the Day 11 dataset, some employee records intentionally contain NULL values.

24. COALESCE

COALESCE() returns the first non-NULL value.

Example:

SELECT
    name,
    COALESCE(city, 'Unknown') AS employee_city
FROM employees;

If city is NULL:

NULL
 ↓
Unknown
25. WHERE vs HAVING in CTE Analysis

WHERE filters rows before grouping.

Example:

SELECT
    department_id,
    AVG(salary)
FROM employees
WHERE salary > 50000
GROUP BY department_id;

HAVING filters groups after grouping.

Example:

SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 60000;

Remember:

WHERE
↓
GROUP BY
↓
HAVING
↓
SELECT
26. CTE vs Subquery
Subquery
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
CTE
WITH company_average AS (
    SELECT AVG(salary) AS average_salary
    FROM employees
)

SELECT *
FROM employees e
CROSS JOIN company_average ca
WHERE e.salary > ca.average_salary;

Both can solve similar problems.

CTE advantages
Better readability
Easier debugging
Multiple logical steps
Reusable within the same query
Excellent for complex business analysis
27. CTE vs Multiple CTEs

One CTE:

WITH department_average AS (
    SELECT ...
)
SELECT ...;

Multiple CTEs:

WITH department_average AS (
    SELECT ...
),

employee_count AS (
    SELECT ...
)

SELECT ...;

Use multiple CTEs when the problem has multiple independent calculations.

28. Common Mistakes
Mistake 1 — Using multiple WITH statements

Wrong:

WITH cte1 AS (...)
WITH cte2 AS (...)
SELECT ...;

Correct:

WITH cte1 AS (...),
cte2 AS (...)
SELECT ...;
Mistake 2 — Missing comma

Wrong:

WITH cte1 AS (
    SELECT ...
)

cte2 AS (
    SELECT ...
)

Correct:

WITH cte1 AS (
    SELECT ...
),

cte2 AS (
    SELECT ...
)
Mistake 3 — Wrong CTE name

If the CTE is:

WITH department_average AS (...)

you must reference:

department_average

not another name.

Mistake 4 — Wrong JOIN key

If both datasets are connected through department_id:

ON e.department_id = da.department_id

Do not accidentally join:

ON e.employee_id = da.department_id
Mistake 5 — Missing JOIN condition

Avoid:

JOIN department_average da

Use:

JOIN department_average da
    ON e.department_id = da.department_id
Mistake 6 — Comparing with a single-value CTE without connecting it

For a company-wide average:

CROSS JOIN company_average ca

allows the value to be available to every employee/department row.

Mistake 7 — Using = NULL

Wrong:

WHERE city = NULL;

Correct:

WHERE city IS NULL;
29. Advanced CTE Pattern

A very useful pattern is:

Step 1
Calculate benchmark
       ↓
Step 2
Filter benchmark
       ↓
Step 3
Join employees
       ↓
Step 4
Apply business condition
       ↓
Step 5
Generate report

Example:

WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
),

high_paying_departments AS (
    SELECT
        department_id,
        average_salary
    FROM department_average
    WHERE average_salary > 60000
)

SELECT
    e.name,
    e.salary,
    hpd.average_salary
FROM employees e
JOIN high_paying_departments hpd
    ON e.department_id = hpd.department_id
WHERE e.salary > hpd.average_salary;
30. Business Analysis Mental Model

Advanced SQL often follows this structure:

RAW DATA
   ↓
CTE 1
Benchmark / Aggregation
   ↓
CTE 2
Filter / Analysis
   ↓
CTE 3
Additional Metric
   ↓
JOIN
   ↓
Business Condition
   ↓
Final Report
31. Important SQL Patterns from Day 11
Department average
AVG(salary)
GROUP BY department_id
Employee count
COUNT(*)
GROUP BY department_id
Department maximum
MAX(salary)
GROUP BY department_id
Company average
AVG(salary)
Above department average
e.salary > da.average_salary
Above company average
e.salary > ca.company_average_salary
Difference from benchmark
employee_salary - benchmark_salary
Multiple CTEs
WITH cte1 AS (...),
cte2 AS (...),
cte3 AS (...)
SELECT ...;
32. Day 11 Key Takeaways
A CTE creates a temporary named result for one SQL statement.
Multiple CTEs use only one WITH.
Multiple CTEs are separated by commas.
One CTE can depend on another CTE.
CTE chaining is useful for step-by-step analysis.
CTEs can be joined with normal database tables.
CTEs can contain GROUP BY.
CTEs can calculate company, department, and city benchmarks.
CROSS JOIN is useful for applying a single company-wide value.
MAX() can identify salary leaders when joined back to employees.
WHERE filters rows.
HAVING filters groups.
IS NULL must be used for NULL comparison.
COALESCE() can replace NULL values.
Multiple CTEs are extremely useful for complex business reports.
33. Day 11 Final Mental Model
                    EMPLOYEES
                       │
          ┌────────────┼────────────┐
          ↓            ↓            ↓
    Company Avg   Department Avg   City Avg
          │            │            │
          └────────────┼────────────┘
                       ↓
                 Multiple CTEs
                       ↓
                  JOIN / FILTER
                       ↓
                Business Analysis
                       ↓
                  Final Report
DAY 11 COMPLETE

Main Skill:

Break a complex business problem into multiple logical CTE steps and combine the results into one professional SQL report.


### ✅ Day 11 files

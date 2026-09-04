# Day 08 — Multiple JOIN Notes

## 1. Multiple JOIN

A Multiple JOIN is used when data needs to be retrieved from more than two related tables.

### Basic Structure

```sql
SELECT
    ...
FROM table1
JOIN table2
    ON table1.key = table2.key
JOIN table3
    ON table2.key = table3.key;
Example
SELECT
    e.name,
    d.department_name,
    l.city
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id;
2. Three-Table JOIN

Our Day-08 database contains three related tables:

employees
    ↓
departments
    ↓
locations
Relationships
employees.department_id
        ↓
departments.department_id

departments.location_id
        ↓
locations.location_id

This allows us to combine employee, department, and office information in a single query.

3. INNER JOIN with Multiple Tables

INNER JOIN returns only rows where matching records exist in all joined tables.

SELECT
    e.name,
    d.department_name,
    l.city
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id;
Result

Employees without a valid department relationship are excluded.

4. JOIN + WHERE

WHERE is used to filter rows after establishing the table relationships.

Example
SELECT
    e.name,
    d.department_name,
    l.city,
    e.salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
WHERE d.department_name = 'IT';
Key Difference
ON     → Defines the relationship
WHERE  → Filters the result
5. Multiple JOIN + GROUP BY

GROUP BY is used to create groups for aggregate calculations.

Example
SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
GROUP BY d.department_name;
6. Aggregate Functions with Multiple JOIN

Common aggregate functions:

COUNT() → Counts records
SUM()   → Calculates total
AVG()   → Calculates average
MAX()   → Finds maximum value
MIN()   → Finds minimum value
Example
SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    SUM(e.salary) AS total_salary,
    AVG(e.salary) AS average_salary,
    MAX(e.salary) AS highest_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
GROUP BY d.department_name;
7. HAVING

HAVING filters grouped results.

Example
SELECT
    d.department_name,
    AVG(e.salary) AS average_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG(e.salary) > 60000;
WHERE vs HAVING
WHERE
↓
Filters individual rows

GROUP BY
↓
Creates groups

HAVING
↓
Filters groups
8. CASE WHEN with Multiple JOIN

CASE WHEN is used to create conditional categories.

Example
SELECT
    e.name,
    d.department_name,
    e.salary,
    CASE
        WHEN e.salary >= 80000 THEN 'High'
        WHEN e.salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id;
9. LEFT JOIN

LEFT JOIN returns all records from the left table, even when matching records do not exist.

Example
SELECT
    e.name,
    d.department_name
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id;

This is useful when we want to include employees who do not have a department assigned.

10. NULL Handling

NULL represents missing or unknown data.

Incorrect
WHERE department_id = NULL;
Correct
WHERE department_id IS NULL;
Check for available values
WHERE department_id IS NOT NULL;
11. COALESCE()

COALESCE() replaces NULL with a specified alternative value.

Example
SELECT
    e.name,
    COALESCE(d.department_name, 'Not Assigned') AS department_name
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id;

If the department is NULL:

NULL
 ↓
Not Assigned
12. Multiple LEFT JOIN

Multiple LEFT JOIN operations can be used when we want to preserve records from the main table while retrieving optional information from related tables.

SELECT
    e.name,
    d.department_name,
    l.city
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
LEFT JOIN locations AS l
    ON d.location_id = l.location_id;
13. Complete Multiple JOIN Query Structure

A common business query follows this order:

SELECT
    ↓
FROM
    ↓
JOIN
    ↓
JOIN
    ↓
WHERE
    ↓
GROUP BY
    ↓
HAVING
    ↓
ORDER BY
Example
SELECT
    d.department_name,
    l.city,
    COUNT(e.employee_id) AS total_employees,
    AVG(e.salary) AS average_salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id
WHERE e.salary >= 50000
GROUP BY
    d.department_name,
    l.city
HAVING
    COUNT(e.employee_id) >= 3
    AND AVG(e.salary) > 60000
ORDER BY average_salary DESC;
14. Important Rules
Rule 1

Every JOIN should have a correct relationship.

ON e.department_id = d.department_id
Rule 2

Do not use = NULL.

Use:

IS NULL

or:

IS NOT NULL
Rule 3

Use WHERE for row-level filtering.

Rule 4

Use HAVING for aggregate/group-level filtering.

Rule 5

Every selected non-aggregate column should normally appear in GROUP BY.

Rule 6

Use table aliases to make queries readable.

employees AS e
departments AS d
locations AS l
15. Query Execution Order

SQL logically processes a query approximately in this order:

FROM
 ↓
JOIN
 ↓
WHERE
 ↓
GROUP BY
 ↓
HAVING
 ↓
SELECT
 ↓
ORDER BY

Understanding this order helps prevent common SQL mistakes.

16. Common Mistakes
Mistake 1 — Wrong JOIN condition
ON e.employee_id = d.department_id

The columns do not represent the same relationship.

Correct:

ON e.department_id = d.department_id
Mistake 2 — Using aggregate functions in WHERE

Incorrect:

WHERE AVG(e.salary) > 60000

Correct:

HAVING AVG(e.salary) > 60000
Mistake 3 — Incorrect NULL comparison

Incorrect:

WHERE e.department_id = NULL

Correct:

WHERE e.department_id IS NULL
Mistake 4 — Forgetting GROUP BY

Incorrect:

SELECT
    d.department_name,
    AVG(e.salary)
FROM employees AS e
JOIN departments AS d
    ON e.department_id = d.department_id;

Correct:

SELECT
    d.department_name,
    AVG(e.salary)
FROM employees AS e
JOIN departments AS d
    ON e.department_id = d.department_id
GROUP BY d.department_name;
17. Key Takeaways
Multiple JOIN
    ↓
Combine data from multiple related tables

ON
    ↓
Defines table relationships

WHERE
    ↓
Filters individual rows

GROUP BY
    ↓
Creates groups

Aggregate Functions
    ↓
COUNT, SUM, AVG, MAX, MIN

HAVING
    ↓
Filters grouped results

CASE WHEN
    ↓
Creates conditional categories

LEFT JOIN
    ↓
Keeps all records from the left table

COALESCE
    ↓
Replaces NULL with a readable value
Day 08 Learning Checklist
 Multiple JOIN
 3-Table JOIN
 INNER JOIN
 JOIN + WHERE
 JOIN + GROUP BY
 JOIN + Aggregate Functions
 JOIN + HAVING
 JOIN + CASE WHEN
 LEFT JOIN
 NULL Handling
 COALESCE
 Business-Oriented SQL Queries
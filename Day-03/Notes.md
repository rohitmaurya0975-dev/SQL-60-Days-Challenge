# Day 03 — SQL Filtering Operators

## 60 Days SQL Challenge

### Topics Covered

- WHERE
- IN
- NOT IN
- BETWEEN
- LIKE
- AND
- OR
- Wildcards
- Multiple Filtering Conditions
- Business-oriented Filtering

---

# 1. WHERE

`WHERE` is used to filter rows based on a condition.

### Syntax

```sql
SELECT column_name
FROM table_name
WHERE condition;
Example
SELECT *
FROM employee2
WHERE salary > 50000;
Meaning

Only employees whose salary is greater than 50,000 will be displayed.

2. IN

IN is used when we want to check whether a value matches one of multiple specified values.

Syntax
WHERE column_name IN (value1, value2, value3);
Example
SELECT *
FROM employee2
WHERE department IN ('IT', 'HR', 'Finance');
Meaning

Return employees from:

IT
HR
Finance
Alternative using OR
WHERE department = 'IT'
   OR department = 'HR'
   OR department = 'Finance';

IN makes the query shorter and cleaner.

3. NOT IN

NOT IN is used to exclude multiple values.

Syntax
WHERE column_name NOT IN (value1, value2);
Example
SELECT *
FROM employee2
WHERE department NOT IN ('Sales', 'Marketing');
Meaning

Return employees who are NOT from:

Sales
Marketing
4. BETWEEN

BETWEEN is used to filter values within a range.

Syntax
WHERE column_name BETWEEN value1 AND value2;
Example
SELECT *
FROM employee2
WHERE salary BETWEEN 50000 AND 65000;
Important

BETWEEN includes both boundary values.

For example:

50000 → Included
55000 → Included
60000 → Included
65000 → Included

But:

49999 → Not Included
65001 → Not Included
5. LIKE

LIKE is used for pattern matching.

It is commonly used with text columns.

Syntax
WHERE column_name LIKE 'pattern';
6. LIKE with %

% means zero or more characters.

Starts with A
SELECT *
FROM employee2
WHERE name LIKE 'A%';

Examples:

Amit      → Match
Ankit     → Match
Arjun     → Match
Abhishek  → Match
Ends with a
SELECT *
FROM employee2
WHERE name LIKE '%a';
Contains a
SELECT *
FROM employee2
WHERE name LIKE '%a%';

This means the letter a can appear anywhere in the name.

7. LIKE with _

_ represents exactly one character.

Example
WHERE name LIKE '_mit';

Here _ represents one character.

Example:

Amit
8. AND

AND is used when multiple conditions must be TRUE.

Example
SELECT *
FROM employee2
WHERE department = 'IT'
AND salary > 65000;

Both conditions must be satisfied:

Department = IT
        AND
Salary > 65000
9. OR

OR is used when at least one condition can be TRUE.

Example
SELECT *
FROM employee2
WHERE department = 'IT'
OR department = 'HR';

Employees from either IT or HR can be returned.

10. Combining IN and AND
Example
SELECT *
FROM employee2
WHERE department IN ('IT', 'Finance')
AND salary > 60000;

Meaning:

Employee must belong to IT or Finance.
Salary must be greater than 60,000.

Both requirements must be satisfied.

11. Combining IN and BETWEEN
Example
SELECT *
FROM employee2
WHERE department IN ('IT', 'Finance')
AND salary BETWEEN 60000 AND 75000;

Meaning:

Department = IT or Finance
Salary = 60,000 to 75,000
12. Combining NOT IN and AND
Example
SELECT *
FROM employee2
WHERE department NOT IN ('Sales', 'Marketing')
AND salary > 55000;

Meaning:

Employee must NOT belong to Sales or Marketing.
Salary must be greater than 55,000.
13. Combining LIKE and AND
Example
SELECT *
FROM employee2
WHERE name LIKE 'A%'
AND department = 'IT';

Meaning:

Name starts with A.
Employee belongs to IT.
14. Multiple IN Conditions

Different columns can have different IN conditions.

Example
SELECT name, department, city, salary
FROM employee2
WHERE department IN ('IT', 'Finance')
AND city IN ('Delhi', 'Mumbai', 'Pune');

Meaning:

Department must be IT or Finance.

AND

City must be Delhi, Mumbai, or Pune.

15. Complete Filtering Example
SELECT name, department, city, salary
FROM employee2
WHERE department IN ('IT', 'Finance')
AND city IN ('Delhi', 'Mumbai', 'Pune')
AND salary BETWEEN 60000 AND 75000
AND name LIKE '%a%';

This combines:

IN
IN
BETWEEN
LIKE
AND
16. Operator Cheat Sheet
Operator	Meaning
WHERE	Filter rows
IN	Match any value from a list
NOT IN	Exclude values from a list
BETWEEN	Filter within a range
LIKE	Pattern matching
AND	All conditions must be TRUE
OR	At least one condition can be TRUE
%	Zero or more characters
_	Exactly one character
17. Common Mistakes
Mistake 1 — Incorrect IN syntax

Wrong:

WHERE department IN 'IT', 'HR';

Correct:

WHERE department IN ('IT', 'HR');
Mistake 2 — Incorrect BETWEEN syntax

Wrong:

WHERE salary BETWEEN 50000 TO 65000;

Correct:

WHERE salary BETWEEN 50000 AND 65000;
Mistake 3 — Forgetting quotes with LIKE

Wrong:

WHERE name LIKE A%;

Correct:

WHERE name LIKE 'A%';
Mistake 4 — Incorrect NOT IN syntax

Wrong:

WHERE department NOT IN 'Sales', 'Marketing';

Correct:

WHERE department NOT IN ('Sales', 'Marketing');
Mistake 5 — Using OR instead of AND

Question:

Find IT employees with salary greater than 65,000.

Wrong:

WHERE department = 'IT'
OR salary > 65000;

Correct:

WHERE department = 'IT'
AND salary > 65000;
18. Real-World Data Analyst Thinking

SQL questions often come as business requirements.

Example:

Business Requirement

"Find employees suitable for a special project."

Requirements:

IT or Finance
Delhi, Mumbai, or Pune
Salary between 60,000 and 75,000
Name contains a

Translate the requirements into SQL:

IT or Finance
      ↓
IN

Delhi/Mumbai/Pune
      ↓
IN

60,000–75,000
      ↓
BETWEEN

Name contains a
      ↓
LIKE

All conditions
      ↓
AND

Final query:

SELECT name, department, city, salary
FROM employee2
WHERE department IN ('IT', 'Finance')
AND city IN ('Delhi', 'Mumbai', 'Pune')
AND salary BETWEEN 60000 AND 75000
AND name LIKE '%a%';

19. Day 03 Learning Summary

Today I learned how to:

Filter rows using WHERE
Match multiple values using IN
Exclude multiple values using NOT IN
Filter numerical ranges using BETWEEN
Search text patterns using LIKE
Use % wildcard
Use _ wildcard
Combine conditions using AND
Use OR for alternative conditions
Combine multiple filtering operators
Convert business requirements into SQL queries
Debug common filtering mistakes
20. Day 03 Key Takeaway

The main goal of Day 03 is not just memorizing SQL syntax.

The goal is to understand:

Business Requirement → Conditions → SQL Operators → Query → Result

This is an important skill for a Data Analyst.
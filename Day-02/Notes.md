# 📚 Day 02 — SQL Aggregate Functions Notes

## 🎯 Today's Learning

Today I learned how to summarize and analyze data using SQL aggregate functions.

### Topics Covered

- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- GROUP BY
- HAVING
- ORDER BY with aggregate functions
- Aggregate functions with business problems

---

# 1️⃣ COUNT()

`COUNT()` is used to count rows or values.

### Syntax

```sql
SELECT COUNT(*)
FROM employee2;
```

### Example

```sql
SELECT COUNT(*) AS total_employees
FROM employee2;
```

### Meaning

This counts the total number of employees in the table.

### Important

`COUNT(*)` counts all rows.

---

# 2️⃣ SUM()

`SUM()` is used to calculate the total of a numeric column.

### Syntax

```sql
SELECT SUM(column_name)
FROM table_name;
```

### Example

```sql
SELECT SUM(salary) AS total_salary
FROM employee2;
```

### Meaning

This calculates the total salary of all employees.

---

# 3️⃣ AVG()

`AVG()` calculates the average value of a numeric column.

### Syntax

```sql
SELECT AVG(column_name)
FROM table_name;
```

### Example

```sql
SELECT AVG(salary) AS average_salary
FROM employee2;
```

### Meaning

This calculates the average salary of all employees.

### PostgreSQL Tip

If you want a cleaner result:

```sql
SELECT ROUND(AVG(salary), 2) AS average_salary
FROM employee2;
```

---

# 4️⃣ MIN()

`MIN()` returns the smallest value.

### Example

```sql
SELECT MIN(salary) AS minimum_salary
FROM employee2;
```

### Meaning

This finds the lowest salary.

---

# 5️⃣ MAX()

`MAX()` returns the largest value.

### Example

```sql
SELECT MAX(salary) AS maximum_salary
FROM employee2;
```

### Meaning

This finds the highest salary.

---

# 6️⃣ GROUP BY

`GROUP BY` is used to create groups of rows based on one or more columns.

It is commonly used with aggregate functions.

### Example

```sql
SELECT department,
       COUNT(*) AS employee_count
FROM employee2
GROUP BY department;
```

### Meaning

Instead of getting one total count for the whole table, we get the employee count for each department.

---

# 7️⃣ GROUP BY with SUM()

We can calculate the total salary for each department.

```sql
SELECT department,
       SUM(salary) AS total_salary
FROM employee2
GROUP BY department;
```

### Result Concept

```text
Department → Total Salary
HR         → Department total
IT         → Department total
Sales      → Department total
```

---

# 8️⃣ GROUP BY with AVG()

We can calculate the average salary for each department.

```sql
SELECT department,
       AVG(salary) AS average_salary
FROM employee2
GROUP BY department;
```

---

# 9️⃣ GROUP BY with MIN() and MAX()

We can find the lowest and highest salary in each department.

```sql
SELECT department,
       MIN(salary) AS minimum_salary,
       MAX(salary) AS maximum_salary
FROM employee2
GROUP BY department;
```

---

# 🔟 HAVING

`HAVING` is used to filter grouped results.

### Example

```sql
SELECT department,
       SUM(salary) AS total_salary
FROM employee2
GROUP BY department
HAVING SUM(salary) > 150000;
```

### Meaning

First SQL creates groups by department.

Then it calculates total salary for each department.

Finally, `HAVING` keeps only departments whose total salary is greater than 150000.

---

# ⚠️ WHERE vs HAVING

This is one of the most important concepts.

## WHERE

`WHERE` filters individual rows **before grouping**.

Example:

```sql
SELECT *
FROM employee2
WHERE salary > 50000;
```

---

## HAVING

`HAVING` filters groups **after GROUP BY**.

Example:

```sql
SELECT department,
       SUM(salary) AS total_salary
FROM employee2
GROUP BY department
HAVING SUM(salary) > 150000;
```

### Easy Rule

```text
WHERE  → Filter Rows
HAVING → Filter Groups
```

---

# 1️⃣1️⃣ ORDER BY with Aggregate Functions

We can sort grouped results.

### Example

```sql
SELECT department,
       SUM(salary) AS total_salary
FROM employee2
GROUP BY department
ORDER BY total_salary DESC;
```

### DESC

Highest to lowest.

### ASC

Lowest to highest.

---

# 1️⃣2️⃣ Finding the Highest Department Salary

To find the department with the highest total salary:

```sql
SELECT department,
       SUM(salary) AS total_salary
FROM employee2
GROUP BY department
ORDER BY total_salary DESC
LIMIT 1;
```

### Logic

```text
GROUP BY
   ↓
Calculate SUM
   ↓
ORDER BY DESC
   ↓
LIMIT 1
```

---

# 1️⃣3️⃣ Multiple Aggregate Functions

We can use multiple aggregate functions together.

```sql
SELECT department,
       COUNT(*) AS employee_count,
       SUM(salary) AS total_salary,
       AVG(salary) AS average_salary,
       MIN(salary) AS minimum_salary,
       MAX(salary) AS maximum_salary
FROM employee2
GROUP BY department;
```

This creates a useful department-level summary report.

---

# 📌 Aggregate Functions Quick Reference

| Function | Purpose |
|---|---|
| COUNT() | Counts rows/values |
| SUM() | Calculates total |
| AVG() | Calculates average |
| MIN() | Finds minimum value |
| MAX() | Finds maximum value |

---

# 📌 Important SQL Pattern

A common aggregate query follows this structure:

```sql
SELECT column_name,
       AGGREGATE_FUNCTION(column)
FROM table_name
GROUP BY column_name
HAVING AGGREGATE_FUNCTION(column) condition
ORDER BY column_name;
```

---

# 🧠 SQL Execution Order

A simplified way to understand SQL execution:

```text
FROM
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
  ↓
LIMIT
```

### Remember

`WHERE` happens before grouping.

`HAVING` happens after grouping.

---

# 🐛 Common Mistakes

## Mistake 1

Incorrect:

```sql
SELECT department, COUNT(*)
FROM employee2;
```

Correct:

```sql
SELECT department,
       COUNT(*)
FROM employee2
GROUP BY department;
```

---

## Mistake 2

Incorrect:

```sql
SELECT department,
       SUM(salary)
FROM employee2
GROUP BY city;
```

Correct:

```sql
SELECT department,
       SUM(salary)
FROM employee2
GROUP BY department;
```

---

## Mistake 3

Incorrect:

```sql
SELECT department,
       SUM(salary)
FROM employee2
WHERE SUM(salary) > 150000
GROUP BY department;
```

Correct:

```sql
SELECT department,
       SUM(salary)
FROM employee2
GROUP BY department
HAVING SUM(salary) > 150000;
```

---

# 💼 Business Understanding

Aggregate functions are very important in Data Analytics because businesses often ask questions like:

- How many employees do we have?
- What is the total salary expense?
- What is the average salary?
- Which department has the highest salary expense?
- Which city has the most employees?
- Which departments have high salary costs?

SQL aggregate functions help convert raw data into useful business information.

---

# 🎯 Day 02 Key Learnings

Today I learned:

✅ COUNT()

✅ SUM()

✅ AVG()

✅ MIN()

✅ MAX()

✅ GROUP BY

✅ HAVING

✅ WHERE vs HAVING

✅ Aggregate functions with ORDER BY

✅ Finding highest/lowest grouped results

✅ Solving business problems using aggregate functions

---

# 📝 Day 02 Revision Formula

```text
COUNT → How many?
SUM   → How much total?
AVG   → What is the average?
MIN   → What is the lowest?
MAX   → What is the highest?
GROUP BY → Analyze each group
HAVING → Filter groups
```

---

# 🚀 Day 02 Status

**Status:** ✅ Completed

**Difficulty:** Beginner → Intermediate

**Main Goal:** Learn how to summarize, group and analyze data using SQL aggregate functions.

---

# 💡 Personal Learning Note

> I learned that SQL is not only about retrieving individual records. Aggregate functions allow me to summarize large amounts of data and answer business questions efficiently.
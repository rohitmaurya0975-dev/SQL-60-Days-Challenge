# Day 04 — SQL Conditional Logic with CASE WHEN

> **60 Days SQL Challenge | Data Analyst Learning Journey**

---

## 📌 Day 04 Overview

Today I learned how to use SQL conditional logic to classify data,
create derived columns, and implement real-world business rules.

### Main Topic

`CASE WHEN`

### Supporting Concepts

- CASE
- WHEN
- THEN
- ELSE
- END
- Multiple conditions
- AND / OR inside CASE
- BETWEEN inside CASE
- CASE with COUNT()
- CASE with SUM()
- GROUP BY with conditional calculations
- Business rule implementation

---

# 1. What is CASE WHEN?

`CASE WHEN` is SQL's conditional expression.

It allows us to check conditions and return different results
depending on whether those conditions are TRUE or FALSE.

It is similar to:

```text
IF → ELSE IF → ELSE
2. Basic CASE WHEN Syntax
CASE
    WHEN condition THEN result
    ELSE default_result
END
Example
SELECT
    name,
    salary,
    CASE
        WHEN salary >= 60000 THEN 'High Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM employee2;
Logic
salary >= 60000
       ↓
     TRUE
       ↓
'High Salary'


Otherwise
       ↓
'Low Salary'
3. Important Parts of CASE

A CASE expression contains:

CASE

Starts the conditional logic.

WHEN

Defines the condition.

THEN

Defines the result when the condition is TRUE.

ELSE

Defines the default result when no WHEN condition matches.

END

Closes the CASE expression.

4. Multiple WHEN Conditions

We can use multiple WHEN conditions.

Example
SELECT
    name,
    salary,
    CASE
        WHEN salary >= 70000 THEN 'High'
        WHEN salary >= 55000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employee2;
Logic
salary >= 70000
      ↓
     High


ELSE IF salary >= 55000
      ↓
    Medium


ELSE
      ↓
     Low
5. Condition Order is Important

SQL evaluates CASE conditions from top to bottom.

It returns the result of the first matching WHEN condition.

Correct
CASE
    WHEN salary >= 70000 THEN 'High'
    WHEN salary >= 55000 THEN 'Medium'
    ELSE 'Low'
END
Why?

Consider:

Salary = 75000

It satisfies:

salary >= 70000

and also:

salary >= 55000

But SQL reaches salary >= 70000 first.

Therefore:

75000 → High
Key Rule

Put more specific / higher-priority conditions before broader conditions.

6. ELSE

ELSE provides a default result when none of the
WHEN conditions are TRUE.

Example
CASE
    WHEN department = 'IT' THEN 'Technology'
    WHEN department = 'HR' THEN 'Human Resources'
    ELSE 'Other'
END

If department is Sales, the result will be:

Other
7. CASE Creates a Derived Column

The original table does not need to contain the new category column.

We can create it inside the query.

Example
SELECT
    name,
    salary,
    CASE
        WHEN salary >= 60000 THEN 'High Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM employee2;

Here:

salary_category

is a derived/calculated column in the query result.

8. CASE with Text Values

CASE can classify text data as well.

Example
SELECT
    name,
    department,
    CASE
        WHEN department = 'IT' THEN 'Technology'
        WHEN department = 'HR' THEN 'Human Resources'
        WHEN department = 'Finance' THEN 'Finance'
        ELSE 'Other'
    END AS department_type
FROM employee2;
Use Case

This is useful when raw database values need to be
converted into business-friendly categories.

9. CASE with AND

Multiple conditions can be combined using AND.

Example
SELECT
    name,
    department,
    salary,
    CASE
        WHEN department = 'IT'
             AND salary >= 65000
            THEN 'Senior IT'
        ELSE 'Other Employee'
    END AS employee_category
FROM employee2;
Logic

Both conditions must be TRUE:

Department = IT
      AND
Salary >= 65000
10. CASE with OR

OR can be used when either condition can satisfy
the business rule.

Example
CASE
    WHEN department = 'IT'
         OR department = 'Finance'
        THEN 'Technical/Financial Team'
    ELSE 'Other'
END

Meaning:

IT OR Finance
     ↓
Category
11. CASE with BETWEEN

BETWEEN can be used inside a CASE condition.

Example
SELECT
    name,
    salary,
    CASE
        WHEN salary < 50000 THEN 'Low'
        WHEN salary BETWEEN 50000 AND 65000 THEN 'Medium'
        ELSE 'High'
    END AS salary_category
FROM employee2;

This is useful for creating salary bands.

12. CASE with COUNT()

CASE can be used inside COUNT() to count
only records satisfying a condition.

Example
SELECT
    department,
    COUNT(
        CASE
            WHEN salary >= 60000 THEN 1
        END
    ) AS high_salary_employees
FROM employee2
GROUP BY department;
Logic
For every employee:


salary >= 60000
      ↓
    TRUE
      ↓
     1
      ↓
   COUNT()

Employees who don't satisfy the condition return NULL,
which COUNT(expression) does not count.

13. CASE with SUM()

CASE can also be used inside SUM().

Example
SELECT
    department,
    SUM(
        CASE
            WHEN salary >= 60000 THEN salary
            ELSE 0
        END
    ) AS high_salary_total
FROM employee2
GROUP BY department;
Meaning

For each department:

If salary >= 60000 → include salary
Otherwise → add 0

This calculates the total salary of higher-paid employees.

14. CASE + GROUP BY

CASE can be combined with GROUP BY
for conditional analysis.

Example
SELECT
    department,
    COUNT(
        CASE
            WHEN salary >= 60000 THEN 1
        END
    ) AS high_salary_employees
FROM employee2
GROUP BY department;
Result

The query produces department-level analysis.

Department → Number of High Salary Employees
15. CASE with Multiple Business Rules

Real-world analysis often requires several business conditions.

Example
SELECT
    name,
    department,
    salary,
    CASE
        WHEN department = 'IT'
             AND salary >= 70000
            THEN 'Top Candidate'


        WHEN department = 'IT'
             AND salary >= 60000
            THEN 'Potential Candidate'


        WHEN department = 'Finance'
             AND salary >= 65000
            THEN 'Top Candidate'


        WHEN department = 'Finance'
             AND salary >= 55000
            THEN 'Potential Candidate'


        ELSE 'Not Selected'
    END AS project_status
FROM employee2;

This converts business rules into SQL logic.

16. Business Requirement → SQL Logic

A Data Analyst normally receives a business requirement,
not an SQL query.

Example Business Requirement

Management says:

Identify employees suitable for a special project.

Rules:

IT + salary >= 70000
        ↓
Top Candidate


IT + salary >= 60000
        ↓
Potential Candidate


Finance + salary >= 65000
        ↓
Top Candidate


Finance + salary >= 55000
        ↓
Potential Candidate


Everyone else
        ↓
Not Selected
SQL Translation
Business Rule
      ↓
Condition
      ↓
WHEN
      ↓
THEN
      ↓
CASE Result

This is an important Data Analyst skill.

17. Common CASE Mistakes
❌ Mistake 1 — Missing END

Wrong:

CASE
    WHEN salary >= 60000 THEN 'High'
    ELSE 'Low'
AS salary_category

Correct:

CASE
    WHEN salary >= 60000 THEN 'High'
    ELSE 'Low'
END AS salary_category
❌ Mistake 2 — Wrong Condition Operator

Question:

IT employees with salary >= 65000

Wrong:

WHEN department = 'IT'
     OR salary >= 65000

Correct:

WHEN department = 'IT'
     AND salary >= 65000
❌ Mistake 3 — Wrong BETWEEN Syntax

Wrong:

WHEN salary BETWEEN 50000 OR 65000

Correct:

WHEN salary BETWEEN 50000 AND 65000
❌ Mistake 4 — Wrong Condition Order

Wrong:

CASE
    WHEN salary >= 55000 THEN 'Medium'
    WHEN salary >= 70000 THEN 'High'
    ELSE 'Low'
END

A salary of 75000 would be classified as Medium
because the first condition is already TRUE.

Correct:

CASE
    WHEN salary >= 70000 THEN 'High'
    WHEN salary >= 55000 THEN 'Medium'
    ELSE 'Low'
END
18. CASE vs WHERE

These two have different purposes.

WHERE

Used to filter rows.

SELECT *
FROM employee2
WHERE salary >= 60000;

Only matching employees are returned.

CASE

Used to classify or transform values.

SELECT
    name,
    salary,
    CASE
        WHEN salary >= 60000 THEN 'High'
        ELSE 'Low'
    END AS salary_category
FROM employee2;

All employees can remain in the result,
but they receive a category.

Simple Difference
WHERE → Which rows should I see?


CASE  → How should I classify the rows I see?
19. CASE Execution Flow

Remember this flow:

             CASE
               ↓
        Check WHEN #1
               ↓
        TRUE? ───── YES → THEN Result #1
          │
          NO
          ↓
        Check WHEN #2
               ↓
        TRUE? ───── YES → THEN Result #2
          │
          NO
          ↓
           ELSE
          ↓
      Default Result
          ↓
           END
20. CASE Cheat Sheet
Basic
CASE
    WHEN condition THEN result
    ELSE default_result
END
Multiple Conditions
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ELSE default_result
END
With AND
CASE
    WHEN condition1
         AND condition2
    THEN result
    ELSE default_result
END
With COUNT
COUNT(
    CASE
        WHEN condition THEN 1
    END
)
With SUM
SUM(
    CASE
        WHEN condition THEN value
        ELSE 0
    END
)
21. Day 04 Key Concepts
Concept	Purpose
CASE	Starts conditional logic
WHEN	Defines condition
THEN	Defines TRUE result
ELSE	Defines default result
END	Ends CASE
AND	All conditions must be TRUE
OR	At least one condition can be TRUE
BETWEEN	Checks a range
COUNT()	Counts matching records
SUM()	Calculates conditional totals
GROUP BY	Creates grouped analysis
22. Real-World Data Analyst Applications

CASE WHEN is commonly useful for:

Salary classification
Employee levels
Performance categories
Customer segmentation
Sales performance bands
Profit categories
Risk classification
Regional grouping
Project eligibility
Business rule implementation
23. Day 04 Practice Completed
Questions
10 CASE WHEN Questions
Challenge
10 Business-oriented CASE Challenges
Debugging
10 Incorrect CASE Queries
Business Problems
10 Real-world HR and Management Problems
24. Day 04 Learning Formula
Business Requirement
        ↓
Identify Conditions
        ↓
Choose Operators
        ↓
Write CASE WHEN
        ↓
Create Derived Column
        ↓
Group / Aggregate if Required
        ↓
Check Result
        ↓
Validate Business Logic
25. Day 04 Key Takeaway

The main purpose of CASE WHEN is not just
creating labels.

It allows SQL to implement decision-making logic
inside a query.

Remember:
WHEN  → What condition?


THEN  → What result?


ELSE  → What if nothing matches?


END   → Finish the logic

SQL can do more than retrieve data — it can apply business rules and transform raw data into meaningful categories.
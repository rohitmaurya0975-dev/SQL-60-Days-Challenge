# Day 05 — SQL JOIN Notes

## 📚 Topic
Primary Key, Foreign Key, JOIN & INNER JOIN

---

# 1. Primary Key

Primary Key kisi table ke har record ki unique identity hoti hai.

### Example

```sql
employee_id INT PRIMARY KEY

Rules
Har value unique honi chahiye.
NULL value allowed nahi hoti.
Ek table mein normally ek Primary Key hoti hai.
Record ko uniquely identify karti hai.
Remember

Primary Key = Record ki unique identity

2. Foreign Key

Foreign Key ek table ke column ko doosri table ki Primary Key se connect karti hai.

Example
FOREIGN KEY (department_id)
REFERENCES departments(department_id)

Yahan:

departments.department_id
        ↓
    Primary Key


employee2.department_id
        ↓
    Foreign Key
Remember

Foreign Key = Tables ke beech relationship

3. Why Do We Need JOIN?

Real-world databases mein saara data ek hi table mein nahi rakha jata.

Example:

employee2
employee_id	name	department_id	salary
101	Amit	1	70000
102	Riya	2	55000
departments
department_id	department_name
1	IT
2	HR

Employee table mein department ka naam nahi hai.

JOIN ke through hum dono tables ka related data combine kar sakte hain.

4. JOIN

JOIN ka use related tables ke data ko combine karne ke liye hota hai.

Basic structure:

SELECT columns
FROM table1
JOIN table2
    ON table1.common_column = table2.common_column;
5. INNER JOIN

INNER JOIN sirf matching records return karta hai.

Syntax
SELECT
    e.name,
    d.department_name
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id;
Logic
employee2
    ↓
department_id
    ↓
INNER JOIN
    ↓
departments
    ↓
Matching department_id
    ↓
Final Result
Remember

INNER JOIN = Only Matching Records

6. ON Clause

ON JOIN condition define karta hai.

Example:

ON e.department_id = d.department_id

Meaning:

Employee table ka department_id

=

Department table ka department_id

7. Table Alias

Long table names ko short banane ke liye aliases use kar sakte hain.

Example:

FROM employee2 AS e
INNER JOIN departments AS d

Ab:

e → employee2
d → departments

Instead of:

employee2.name
departments.department_name

Hum likh sakte hain:

e.name
d.department_name
Benefit
Query short hoti hai.
Readability improve hoti hai.
Multiple tables ke saath kaam karna easy hota hai.
8. INNER JOIN + WHERE

JOIN tables ko connect karta hai.

WHERE records ko filter karta hai.

Example:

SELECT
    e.name,
    e.salary,
    d.department_name
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary >= 60000;
Flow
JOIN
 ↓
Tables combine
 ↓
WHERE
 ↓
Required records filter
9. AND with JOIN

Jab dono conditions TRUE honi chahiye, AND use karte hain.

Example:

WHERE d.department_name = 'IT'
  AND e.salary >= 65000;

Meaning:

Department = IT
AND
Salary >= 65000
10. OR with JOIN

Jab multiple possible conditions mein se koi ek TRUE ho sakti hai, OR use karte hain.

Example:

WHERE (d.department_name = 'IT'
       AND e.salary >= 65000)
   OR (d.department_name = 'Finance'
       AND e.salary >= 60000);

Parentheses business rules ko clearly separate karti hain.

11. ORDER BY with JOIN

JOIN ke result ko sort kar sakte hain.

Highest salary first
ORDER BY e.salary DESC;
Lowest salary first
ORDER BY e.salary ASC;

Multiple columns ke basis par bhi sort kar sakte hain:

ORDER BY
    d.department_name ASC,
    e.salary DESC;
12. Complete INNER JOIN Pattern
SELECT
    e.name AS employee_name,
    e.salary,
    d.department_name
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary >= 60000
ORDER BY e.salary DESC;
Query Flow
FROM
 ↓
Choose main table


INNER JOIN
 ↓
Connect second table


ON
 ↓
Define relationship


WHERE
 ↓
Filter data


ORDER BY
 ↓
Sort result


SELECT
 ↓
Display required columns
13. Common JOIN Mistakes
Mistake 1 — Wrong JOIN Column

❌ Wrong:

ON e.employee_id = d.department_id

✅ Correct:

ON e.department_id = d.department_id
Mistake 2 — Missing ON

❌

INNER JOIN departments AS d;

✅

INNER JOIN departments AS d
    ON e.department_id = d.department_id;
Mistake 3 — Wrong Alias

❌

SELECT emp.name
FROM employee2 AS e;

✅

SELECT e.name
FROM employee2 AS e;
Mistake 4 — Wrong Table Column

Department name departments table mein hai.

❌

WHERE e.department_name = 'IT'

✅

WHERE d.department_name = 'IT'
14. Primary Key vs Foreign Key
Primary Key	Foreign Key
Unique identity	Relationship
Unique	Duplicate values possible
NULL not allowed	NULL may be allowed
Identifies record	References another table
Parent table mein common	Child table mein common
Easy Trick
PK = Identity
FK = Relationship
JOIN = Connection
ON = Matching Rule
WHERE = Filter
ORDER BY = Sort
15. Day 05 Learning Checklist
 Primary Key
 Foreign Key
 Table Relationship
 JOIN Basic Concept
 INNER JOIN
 ON condition
 Table Aliases
 INNER JOIN + WHERE
 AND / OR
 ORDER BY
 JOIN Debugging
 Business Problems
🎯 Day 05 Key Takeaway

SQL JOIN ka main purpose hai:

Related tables ko common column ke through connect karke useful information ek saath retrieve karna.

INNER JOIN ka main rule:

Only matching records are returned.
# 🚀 Day 07 — SQL SELF JOIN

> **Focus:** SELF JOIN + Employee Hierarchy + Real-World HR Analysis

---

## 📚 Topics Covered

- SELF JOIN
- Table Aliases
- Employee → Manager Relationship
- Manager → Senior Manager Relationship
- SELF JOIN with INNER JOIN
- SELF JOIN with LEFT JOIN
- Multiple SELF JOIN
- SELF JOIN + WHERE
- SELF JOIN + GROUP BY
- SELF JOIN + HAVING
- SELF JOIN + Aggregate Functions
- Salary Comparison
- Experience Comparison
- Employee Hierarchy
- Real-World Business Problems

---

# 1. What is SELF JOIN?

**SELF JOIN** ka matlab hai ek table ko
usi table ke saath JOIN karna.

Normally:

```text
employees_hierarchy
        ↓
    departments

SELF JOIN mein:

employees_hierarchy
        ↓
employees_hierarchy

Same table ko different aliases ke saath use kiya jata hai.

2. Why do we need SELF JOIN?

SELF JOIN tab useful hota hai jab ek table ke
records ka relationship usi table ke doosre records
ke saath ho.

Example:

Employee aur Manager dono same table mein hain.

employee_id | name          | manager_id
------------|---------------|-----------
101         | Amit Sharma   | NULL
102         | Riya Patel    | 101
107         | Ankit Kumar   | 102

Relationship:

Riya → Amit
Ankit → Riya
3. Our Employee Hierarchy Table

Table:

employees_hierarchy

Columns:

employee_id
name
department
salary
manager_id
city
experience_years
Important columns:
employee_id
    ↓
Employee ki unique ID

manager_id
    ↓
Us employee ke manager ki employee_id
4. Most Important SELF JOIN Relationship ⭐

Employee ka manager_id

manager ke employee_id se match hota hai.

ON e.manager_id = m.employee_id
Golden Rule:

Employee.manager_id = Manager.employee_id

Ye SELF JOIN ka sabse important concept hai.

5. Table Aliases

Same table ko do aliases dete hain:

FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m

Meaning:

e = Employee
m = Manager

Important:

e aur m alag tables nahi hain.

Dono same employees_hierarchy table ke aliases hain.
6. Basic SELF JOIN Syntax
SELECT
    e.name AS employee_name,
    m.name AS manager_name
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id;
Result:
employee_name | manager_name
--------------|-------------
Riya Patel    | Amit Sharma
Karan Mehta   | Amit Sharma
Neha Shah     | Amit Sharma
7. SELF JOIN with INNER JOIN

INNER JOIN sirf un employees ko return karega
jinka manager available hai.

FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id

Agar:

manager_id = NULL

to employee ka matching manager nahi milega.

Isliye woh INNER JOIN result mein nahi aayega.

8. SELF JOIN with LEFT JOIN

Agar humein har employee chahiye,
including top-level manager:

SELECT
    e.name AS employee_name,
    m.name AS manager_name
FROM employees_hierarchy AS e
LEFT JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id;

Result mein:

Amit Sharma | NULL
Riya Patel  | Amit Sharma
Karan Mehta | Amit Sharma
Remember:
INNER JOIN
→ Matching employees only

LEFT JOIN
→ Every employee
→ Manager available ho to manager name
9. Employee → Manager → Senior Manager

SELF JOIN ko multiple times bhi use kar sakte hain.

Employee
   ↓
Manager
   ↓
Senior Manager

SQL:

SELECT
    e.name AS employee_name,
    m.name AS manager_name,
    sm.name AS senior_manager_name
FROM employees_hierarchy AS e

INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id

INNER JOIN employees_hierarchy AS sm
    ON m.manager_id = sm.employee_id;

Aliases:

e  = Employee
m  = Manager
sm = Senior Manager
10. SELF JOIN + WHERE

Employee department filter karna ho:

SELECT
    e.name AS employee_name,
    m.name AS manager_name
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
WHERE e.department = 'IT';
Logic:
JOIN
 ↓
Employee + Manager relationship
 ↓
WHERE
 ↓
IT employees only
11. Comparing Employee and Manager Salary

SELF JOIN se same table ke do records ki
salary compare kar sakte hain.

WHERE e.salary > m.salary;

Meaning:

Employee Salary
      >
Manager Salary
Salary difference:
e.salary - m.salary
12. Comparing Experience

Employee aur manager ki experience compare:

m.experience_years - e.experience_years

Agar:

WHERE m.experience_years - e.experience_years >= 3

to manager ke paas employee se minimum
3 years extra experience hai.

13. Comparing Cities

Same city:

WHERE e.city = m.city;

Different city:

WHERE e.city != m.city;
14. SELF JOIN + GROUP BY

Har manager ke employees count karne ke liye:

SELECT
    m.name AS manager_name,
    COUNT(e.employee_id) AS total_employees
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
GROUP BY
    m.employee_id,
    m.name;
Logic:
SELF JOIN
    ↓
Employee → Manager
    ↓
GROUP BY Manager
    ↓
COUNT Employees
15. SELF JOIN + HAVING

Sirf un managers ko find karna ho
jinke under 2+ employees hain:

HAVING COUNT(e.employee_id) >= 2;
Important:

WHERE individual rows filter karta hai.

HAVING grouped/aggregate results filter karta hai.

16. Aggregate Functions with SELF JOIN

SELF JOIN ke saath common aggregate functions:

COUNT()
→ Employees count

SUM()
→ Team total salary

AVG()
→ Average team salary

MAX()
→ Highest team salary

MIN()
→ Lowest team salary

Example:

SELECT
    m.name AS manager_name,
    SUM(e.salary) AS total_team_salary
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
GROUP BY
    m.employee_id,
    m.name;
17. Real-World HR Use Cases

SELF JOIN ka practical use:

👨‍💼 Employee Management
Employee → Manager
💰 Salary Analysis
Employee Salary
vs
Manager Salary
📊 Manager Workload
Manager → Number of Employees
🎯 Team Performance
Manager → Average Team Salary
🌳 Employee Hierarchy
Employee
   ↓
Manager
   ↓
Senior Manager
🏢 Organization Structure
CEO
 ↓
Senior Manager
 ↓
Manager
 ↓
Employee
18. Common SELF JOIN Mistakes
❌ Mistake 1 — Wrong JOIN condition

Wrong:

ON e.employee_id = m.manager_id

Correct:

ON e.manager_id = m.employee_id
❌ Mistake 2 — Same alias comparison

Wrong:

ON e.manager_id = e.employee_id

Correct:

ON e.manager_id = m.employee_id
❌ Mistake 3 — Forgetting aliases

Wrong:

FROM employees_hierarchy
JOIN employees_hierarchy

Better:

FROM employees_hierarchy AS e
JOIN employees_hierarchy AS m
❌ Mistake 4 — Wrong salary comparison

Wrong:

WHERE e.salary > e.salary;

Correct:

WHERE e.salary > m.salary;
❌ Mistake 5 — Wrong GROUP BY

Agar manager-wise result chahiye:

GROUP BY
    m.employee_id,
    m.name;

Employee ko GROUP BY karne se
manager-wise grouping nahi milegi.

19. SELF JOIN Cheat Sheet 🧠
Same Table
    ↓
Two Aliases
    ↓
e = Employee
m = Manager
    ↓
e.manager_id = m.employee_id
Basic:
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
Multiple levels:
e = Employee
m = Manager
sm = Senior Manager
ON e.manager_id = m.employee_id
ON m.manager_id = sm.employee_id
20. Important Query Patterns
Employee + Manager
SELECT
    e.name,
    m.name
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id;
Employee salary > Manager salary
WHERE e.salary > m.salary;
Same department
WHERE e.department = m.department;
Same city
WHERE e.city = m.city;
Manager with 2+ employees
GROUP BY m.employee_id, m.name
HAVING COUNT(e.employee_id) >= 2;
Total team salary
SUM(e.salary)
Average team salary
AVG(e.salary)
🎯 Day 07 Key Takeaway

SELF JOIN ka main purpose same table ke records ke
beech relationship identify karna hai.

Employee hierarchy mein:

Employee
   ↓
manager_id
   ↓
Manager employee_id
Golden Rule ⭐
e.manager_id = m.employee_id

Agar ye relationship samajh aa gaya,
to SELF JOIN ka core concept samajh aa gaya.
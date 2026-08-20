# 🚀 Day 06 — SQL JOIN Notes

## 📚 Topics Covered

- LEFT JOIN
- RIGHT JOIN
- INNER JOIN vs LEFT JOIN vs RIGHT JOIN
- Unmatched Records
- IS NULL
- JOIN + WHERE
- JOIN + AND / OR
- ON vs WHERE
- ORDER BY with JOIN
- Real-World JOIN Scenarios

---

# 1. LEFT JOIN

LEFT JOIN ka use tab hota hai jab humein
**left table ke saare records** chahiye.

Right table se sirf matching records aate hain.

### Syntax

```sql
SELECT columns
FROM table1
LEFT JOIN table2
    ON table1.common_column = table2.common_column;
    xample
SELECT
    e.name,
    d.department_name
FROM employee2 AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id;
Rule
LEFT JOIN
    ↓
ALL LEFT records
+
Matching RIGHT records
Remember

LEFT JOIN = Left table ke saare records

2. RIGHT JOIN

RIGHT JOIN ka use tab hota hai jab humein
right table ke saare records chahiye.

Left table se sirf matching records aate hain.

Syntax
SELECT columns
FROM table1
RIGHT JOIN table2
    ON table1.common_column = table2.common_column;
Example
SELECT
    e.name,
    d.department_name
FROM employee2 AS e
RIGHT JOIN departments AS d
    ON e.department_id = d.department_id;
Rule
RIGHT JOIN
    ↓
ALL RIGHT records
+
Matching LEFT records
Remember

RIGHT JOIN = Right table ke saare records

3. INNER JOIN vs LEFT JOIN vs RIGHT JOIN
JOIN	Result
INNER JOIN	Only matching records
LEFT JOIN	All LEFT + matching RIGHT
RIGHT JOIN	All RIGHT + matching LEFT
Visual Logic
INNER JOIN
→ Matching only




LEFT JOIN
→ LEFT table ALL
→ RIGHT matching




RIGHT JOIN
→ RIGHT table ALL
→ LEFT matching
4. Unmatched Records

Kabhi-kabhi humein ye find karna hota hai:

"Kaunse employees ka department match nahi karta?"

LEFT JOIN use kar sakte hain.

SELECT
    e.employee_id,
    e.name,
    e.department_id
FROM employee2 AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL;
Logic
LEFT JOIN
    ↓
Unmatched record
    ↓
Right table columns = NULL
    ↓
IS NULL
    ↓
Unmatched records
5. Finding Departments Without Employees

Agar humein aise departments find karne hain
jinke saath koi employee nahi hai:

SELECT
    d.department_id,
    d.department_name
FROM departments AS d
LEFT JOIN employee2 AS e
    ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;
Important

Yahan departments left table hai.

Isliye saare departments preserve honge.

6. IS NULL

IS NULL ka use NULL values check karne ke liye hota hai.

Correct
WHERE e.employee_id IS NULL;
Incorrect
WHERE e.employee_id = NULL;
Remember

NULL ko = se compare nahi karte.

Use:

IS NULL

or

IS NOT NULL
7. JOIN + WHERE

JOIN tables ko connect karta hai.

WHERE result ko filter karta hai.

Example:

SELECT
    e.name,
    e.salary,
    d.department_name
FROM employee2 AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary >= 60000;
Query Flow
FROM
 ↓
JOIN
 ↓
ON
 ↓
WHERE
 ↓
ORDER BY
 ↓
SELECT result
8. JOIN + AND

Multiple conditions ko combine karne ke liye
AND use hota hai.

Example:

WHERE d.department_name = 'IT'
  AND e.salary >= 65000;

Meaning:

Department = IT
AND
Salary >= 65000

Dono conditions TRUE honi chahiye.

9. JOIN + OR

Alternative conditions ke liye OR use hota hai.

Example:

WHERE d.department_name = 'IT'
   OR d.department_name = 'Finance';

Meaning:

IT
OR
Finance
10. AND + OR with Parentheses

Complex business rules mein parentheses important hain.

Example:

WHERE
    (d.department_name = 'IT'
     AND e.salary >= 65000)
OR
    (d.department_name = 'Finance'
     AND e.salary >= 60000);
Business Logic
IT + 65000+
        OR
Finance + 60000+
11. ON vs WHERE

Ye Day-06 ka most important concept hai. ⭐

Consider:

FROM departments AS d
LEFT JOIN employee2 AS e
    ON d.department_id = e.department_id

Agar hum salary condition ON mein lagate hain:

ON d.department_id = e.department_id
AND e.salary >= 60000

To departments without qualifying employees
still remain.

ON Condition
LEFT JOIN employee2 AS e
    ON d.department_id = e.department_id
   AND e.salary >= 60000;

Meaning:

Matching employee tab karo jab salary 60000+ ho.

Department phir bhi preserve rahega.

WHERE Condition
LEFT JOIN employee2 AS e
    ON d.department_id = e.department_id
WHERE e.salary >= 60000;

Yahan unmatched employee rows ka salary NULL hoga.

WHERE e.salary >= 60000 un rows ko remove kar dega.

Remember

LEFT JOIN mein right-table filter ko WHERE mein lagane se unmatched rows remove ho sakti hain.

12. ORDER BY with JOIN

JOIN result ko sort bhi kar sakte hain.

Salary highest first
ORDER BY e.salary DESC;
Department alphabetically
ORDER BY d.department_name ASC;
Multiple sorting
ORDER BY
    d.department_name ASC,
    e.salary DESC;

Meaning:

Department A-Z
Same department mein highest salary first
13. Table Aliases

Aliases query ko short aur readable banate hain.

FROM employee2 AS e
LEFT JOIN departments AS d

Ab:

e = employee2
d = departments

Example:

SELECT
    e.name,
    d.department_name
14. Real-World JOIN Selection

Business requirement dekhkar JOIN choose karo.

Requirement:

Sirf matching employees chahiye.

INNER JOIN
Requirement:

Har employee chahiye, department ho ya na ho.

LEFT JOIN
Requirement:

Har department chahiye, employee ho ya na ho.

LEFT JOIN

ya table order ke according:

RIGHT JOIN
15. LEFT JOIN Example — HR

HR ko complete employee report chahiye:

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary
FROM employee2 AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id;
Why LEFT JOIN?

Because:

Every employee must appear.

16. RIGHT JOIN Example — Management

Management ko complete department list chahiye:

SELECT
    d.department_name,
    e.name AS employee_name
FROM employee2 AS e
RIGHT JOIN departments AS d
    ON e.department_id = d.department_id;
Why RIGHT JOIN?

Because:

Every department must appear.

17. Common Mistakes
❌ Mistake 1 — Wrong JOIN Column
ON e.employee_id = d.department_id
Correct
ON e.department_id = d.department_id
❌ Mistake 2 — Wrong NULL Check
WHERE d.department_id = NULL;
Correct
WHERE d.department_id IS NULL;
❌ Mistake 3 — Wrong Alias
SELECT emp.name
FROM employee2 AS e;
Correct
SELECT e.name
FROM employee2 AS e;
❌ Mistake 4 — LEFT JOIN ko INNER JOIN bana dena

Agar requirement hai:

Every department must appear.

Aur query mein:

WHERE e.salary >= 60000

lagaya gaya hai, to unmatched departments remove
ho sakte hain.

Isliye ON vs WHERE carefully decide karo.

18. JOIN Decision Tree
             JOIN Requirement
                    ↓
          ┌─────────┴─────────┐
          ↓                   ↓
   Matching only?       All records needed?
          ↓                   ↓
   INNER JOIN          Which table important?
                              ↓
                    ┌─────────┴─────────┐
                    ↓                   ↓
               Left table          Right table
                    ↓                   ↓
               LEFT JOIN          RIGHT JOIN
19. Day 06 Quick Cheat Sheet
INNER JOIN
→ Matching records only


LEFT JOIN
→ All LEFT records
→ Matching RIGHT records


RIGHT JOIN
→ All RIGHT records
→ Matching LEFT records


ON
→ Tables ko match/connect karta hai


WHERE
→ Result ko filter karta hai


IS NULL
→ Missing/unmatched records find karta hai


AND
→ Both conditions TRUE


OR
→ Either condition TRUE


ORDER BY
→ Result sort karta hai
🎯 Day 06 Key Takeaway

JOIN ka sabse important skill syntax yaad karna nahi,
balki business requirement ke according correct JOIN
choose karna hai.

Golden Rule:
INNER JOIN
→ Matching


LEFT JOIN
→ Left table important


RIGHT JOIN
→ Right table important


IS NULL
→ Missing relationship


ON
→ Matching + JOIN condition


WHERE
→ Final filtering
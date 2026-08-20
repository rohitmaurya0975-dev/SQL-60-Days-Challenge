# Day 06 — SQL JOIN Practice

## Topic: LEFT JOIN, RIGHT JOIN & JOIN Comparison

**Tables:**
- employee2
- departments

---

## Q1 — Basic LEFT JOIN

Har employee ka naam aur department name display karo.

### Display:
- employee_name
- department_name

### Requirement:
Use `LEFT JOIN`.

---

## Q2 — LEFT JOIN + Salary Filter

Har employee ko display karo jinki salary **60000 ya usse greater** hai.

### Display:
- employee_name
- salary
- department_name

### Requirement:
Use:
- `LEFT JOIN`
- `WHERE`

---

## Q3 — LEFT JOIN + Department

Sirf **IT department** ke employees display karo.

### Display:
- employee_name
- department_name
- salary

### Requirement:
Use `LEFT JOIN` + `WHERE`.

---

## Q4 — Find Employees Without Matching Department

Aise employees find karo jinka `department_id`
`departments` table mein match nahi karta.

### Display:
- employee_id
- employee_name
- department_id

### Hint:

`LEFT JOIN` ke baad right table ki matching column
`NULL` check karo.

---

## Q5 — Basic RIGHT JOIN

Har department ko display karo aur agar employee
available hai to employee ka naam bhi display karo.

### Display:
- department_name
- employee_name

### Requirement:
Use `RIGHT JOIN`.

---

## Q6 — Find Departments Without Employees

Aise departments find karo jinke saath koi employee
associated nahi hai.

### Display:
- department_id
- department_name

### Requirement:
Use `RIGHT JOIN`.

### Hint:
Employee table ki appropriate column ko `IS NULL`
ke saath check karo.

---

## Q7 — INNER JOIN vs LEFT JOIN

Ek query `INNER JOIN` ke saath aur ek query
`LEFT JOIN` ke saath likho.

Dono mein:

- employee_name
- department_name

display karo.

### Goal:
Dono results ko compare karo aur samjho ki difference
kyun aata hai.

---

## Q8 — LEFT JOIN + AND

Har employee ko check karo jo:

- IT department mein hai
- AND salary >= 65000

### Display:
- employee_name
- department_name
- salary

### Requirement:
Use:
- `LEFT JOIN`
- `AND`
- `WHERE`

---

## Q9 — RIGHT JOIN + Sorting

Har department ke employees display karo.

### Display:
- department_name
- employee_name
- salary

Results ko:

1. Department name ascending
2. Salary descending

order mein display karo.

### Requirement:
Use:
- `RIGHT JOIN`
- `ORDER BY`

---

# Q10 — FINAL JOIN CHALLENGE 🔥

Management ko complete department report chahiye.

### Requirements:

1. **Har department** report mein hona chahiye.
2. Agar department mein employees hain to unka data
   display karo.
3. Employee ka salary **60000 ya greater** ho to
   usko include karo.
4. Department ke naam ascending order mein hone chahiye.
5. Same department mein highest salary pehle aaye.

### Display:
- department_name
- employee_name
- salary

### Requirement:
Use appropriate JOIN, filtering and sorting.
# 🎯 Day 06 Practice Goal

By completing these questions, I should be able to:

- Understand LEFT JOIN
- Understand RIGHT JOIN
- Understand INNER JOIN
- Identify the left and right table
- Find unmatched records
- Use `IS NULL` with JOINs
- Use JOIN with WHERE
- Use JOIN with AND
- Use ORDER BY with JOIN
- Compare INNER JOIN and OUTER JOIN behavior
- Choose the appropriate JOIN for a business requirement

---

# 🧠 JOIN Cheat Sheet

```text
INNER JOIN
→ Only matching records

LEFT JOIN
→ All LEFT records
→ Matching RIGHT records

RIGHT JOIN
→ All RIGHT records
→ Matching LEFT records
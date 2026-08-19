# Day 05 — SQL JOIN Practice

## Topic: Primary Key, Foreign Key & INNER JOIN

**Dataset:** `employee2` + `departments`

---

## Q1 — Basic INNER JOIN

Employee ka naam aur uska department name display karo.

### Display:
- name
- department_name

### Requirement:
Use `INNER JOIN`.

---

## Q2 — Employee + Salary + Department

Har employee ka:

- name
- salary
- department_name

display karo.

Tables:
- `employee2`
- `departments`

Join condition ke liye `department_id` use karo.

---

## Q3 — INNER JOIN with WHERE

Sirf **IT department** ke employees display karo.

### Display:
- name
- salary
- department_name

### Requirement:
Use `INNER JOIN` + `WHERE`.

---

## Q4 — Salary Filter with JOIN

Un employees ko find karo jinki salary **60000 ya usse greater** hai.

### Display:
- name
- salary
- department_name

### Requirement:
Use:
- `INNER JOIN`
- `WHERE`

---

## Q5 — IT High-Salary Employees

IT department ke un employees ko find karo jinki salary
**65000 ya usse greater** hai.

### Display:
- name
- salary
- department_name

### Requirement:
Use:
- `INNER JOIN`
- `WHERE`
- `AND`

---

## Q6 — Finance Employees

Sirf **Finance department** ke employees display karo.

### Display:
- name
- salary
- department_name

Salary ko **highest se lowest** order mein display karo.

### Requirement:
Use:
- `INNER JOIN`
- `WHERE`
- `ORDER BY`

---

## Q7 — Table Aliases

Employee aur department information ko table aliases ke
saath display karo.

### Display:
- employee_name
- salary
- department_name

### Requirement:

Use:

```sql
employee2 AS e
departments AS d

Q8 — Multiple Conditions

Un employees ko find karo jo:

IT department mein hain aur salary >= 60000

OR

Finance department mein hain aur salary >= 55000
Display:
name
department_name
salary
Requirement:

Use:

INNER JOIN
AND
OR
Q9 — Department-wise Employee List

Employee aur department ka relationship use karke
department-wise employee information display karo.

Display:
department_name
name
salary

Results ko:

Department name ke ascending order mein
Salary ke descending order mein

arrange karo.

Requirement:

Use:

INNER JOIN
ORDER BY
Q10 — FINAL JOIN BUSINESS QUESTION 🔥

Management ko high-value employees ki list chahiye.

Employee ko select karo agar:

Rule 1:

IT department + salary >= 70000

OR
Rule 2:

Finance department + salary >= 65000

OR
Rule 3:

HR department + salary >= 60000

Display:
employee_name
department_name
salary
Results:

Salary ko highest se lowest order mein display karo.

Requirement:

Use:

INNER JOIN
Table aliases
AND
OR
WHERE
ORDER BY
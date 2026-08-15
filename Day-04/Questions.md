# Day 04 — SQL CASE WHEN Practice

## 60 Days SQL Challenge

### Topic
SQL Conditional Logic using:

- CASE
- WHEN
- THEN
- ELSE
- END
- Multiple WHEN conditions
- CASE with AND
- CASE with OR
- CASE with Aggregate Functions

---

# Practice Questions

## Q1 — Salary Classification

Display employee name, salary, and a new column called `salary_category`.

Classify employees as:

- `High Salary` → salary >= 60,000
- `Low Salary` → salary < 60,000

**Concept:** CASE WHEN

---

## Q2 — Multiple Salary Categories

Display employee name, salary, and `salary_category`.

Classify employees as:

- `High` → salary >= 70,000
- `Medium` → salary >= 55,000
- `Low` → salary < 55,000

**Concept:** Multiple WHEN conditions

---

## Q3 — Department Classification

Display employee name, department, and a new column called `department_type`.

Classify:

- IT → `Technology`
- HR → `Human Resources`
- Finance → `Finance`
- All other departments → `Other`

**Concept:** CASE with text values + ELSE

---

## Q4 — Salary Increment Category

Display employee name, salary, and a new column called `salary_review`.

Classify employees as:

- `Priority Review` → salary < 50,000
- `Normal Review` → salary between 50,000 and 65,000
- `No Review Required` → salary > 65,000

**Concept:** CASE + BETWEEN

---

## Q5 — IT Employee Classification

Display employee name, department, salary, and `employee_category`.

Classify employees as:

- `Senior IT` → department is IT AND salary >= 65,000
- `Other Employee` → everyone else

**Concept:** CASE + AND

---

# Bonus Practice

## Q6 — Location Classification

Display employee name, city, and a new column called `office_region`.

Classify:

- Delhi → `North`
- Mumbai → `West`
- Pune → `West`
- Ahmedabad → `West`
- All other cities → `Other`

**Concept:** CASE with multiple conditions

---

## Q7 — Experience/Salary Style Classification

Create a column called `employee_level`.

Classify employees based on salary:

- salary >= 75,000 → `Level 3`
- salary >= 60,000 → `Level 2`
- salary >= 45,000 → `Level 1`
- otherwise → `Entry Level`

Display:

- name
- salary
- employee_level

**Concept:** Multiple WHEN + correct condition order

---

## Q8 — Conditional COUNT

For each department, count how many employees have salary >= 60,000.

Display:

- department
- `high_salary_employees`

**Concept:** CASE + COUNT + GROUP BY

---

## Q9 — Conditional SUM

For each department, calculate the total salary of employees whose salary is >= 60,000.

Display:

- department
- `high_salary_total`

**Concept:** CASE + SUM + GROUP BY

---

# Q10 — FINAL CHALLENGE 🔥

Management wants to identify employees suitable for a special project.

Create a column called `project_status`.

Rules:

- IT + salary >= 65,000 → `Priority Candidate`
- Finance + salary >= 60,000 → `Priority Candidate`
- HR + salary >= 55,000 → `Potential Candidate`
- Everyone else → `Not Selected`

Display:

- name
- department
- salary
- project_status

**Concept:**

CASE + WHEN + AND + OR + multiple conditions

---

# Learning Goal

After completing these 10 questions, I should be able to:

- Use CASE WHEN confidently
- Create derived/calculated columns
- Apply multiple WHEN conditions
- Use ELSE correctly
- Combine CASE with AND/OR
- Use CASE with COUNT
- Use CASE with SUM
- Combine CASE with GROUP BY
- Translate business rules into SQL logic
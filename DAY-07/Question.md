# 🚀 Day 07 — SELF JOIN Practice Questions

## 📌 Dataset
Table: `employees_hierarchy`

### Columns:
- `employee_id`
- `name`
- `department`
- `salary`
- `manager_id`
- `city`
- `experience_years`

---

## 🎯 Topic: SELF JOIN

> SELF JOIN is used when records from the same table
> have a relationship with other records in that same table.

---

# 🟢 BASIC LEVEL

### Q1. Employee → Manager
Display the name of every employee along with their manager's name.

**Output columns:**
- employee_name
- manager_name


---

### Q2. Employee + Manager ID

Display every employee's:

- employee_id
- employee_name
- manager_id

along with the manager's name.

---

### Q3. IT Employees and Their Managers

Find all employees who belong to the `IT` department and display:

- employee_name
- manager_name
- salary

---

# 🟡 INTERMEDIATE LEVEL

### Q4. Employees Managed by Amit

Find all employees who directly report to **Amit Sharma**.

**Display:**
- employee_name
- department
- salary

---

### Q5. Employees with Higher Salary Than Their Manager

Find employees whose salary is **greater than their manager's salary**.

**Display:**
- employee_name
- employee_salary
- manager_name
- manager_salary

---

### Q6. Same Department as Manager

Find employees who work in the **same department as their manager**.

**Display:**
- employee_name
- department
- manager_name
- manager_department

---

### Q7. Employees Living in the Same City as Their Manager

Find employees whose city is the same as their manager's city.

**Display:**
- employee_name
- employee_city
- manager_name
- manager_city

---

# 🔴 ADVANCED LEVEL

### Q8. Managers with Multiple Employees

Find managers who have **more than one direct employee**.

**Display:**
- manager_name
- number_of_employees

> Hint: SELF JOIN + GROUP BY + COUNT()

---

### Q9. Manager Salary Comparison

Find employees whose salary is at least **10% lower than their manager's salary**.

**Display:**
- employee_name
- employee_salary
- manager_name
- manager_salary

> Hint: Compare employee salary with manager salary using an arithmetic condition.

---

### Q10. Complete Employee-Manager Analysis

Create a report showing:

- employee_name
- employee_department
- employee_salary
- manager_name
- manager_department
- manager_salary

Only include employees who:

1. Have a manager
2. Work in the `IT`, `Finance`, or `Sales` department
3. Have a salary greater than `50000`
4. Sort the result by employee salary from highest to lowest.

---

# 🧠 BONUS CHALLENGE

### Q11. Manager's Team Salary

Find each manager and the **total salary of all employees directly reporting to them**.

**Display:**
- manager_name
- total_team_salary

Sort from highest total team salary to lowest.

---

### Q12. Manager vs Employee Experience

Find employees who have **less experience than their manager**.

**Display:**
- employee_name
- employee_experience
- manager_name
- manager_experience

---

# 🔥 SELF JOIN CHECKLIST

Before solving, remember:

```text
Same Table
    ↓
Two Aliases
    ↓
Employee (e)
Manager (m)
    ↓
e.manager_id = m.employee_id
-- =====================================================
-- DAY 07 - SELF JOIN
-- MY SOLUTIONS
-- Table: employees_hierarchy
-- =====================================================


-- =====================================================
-- Q1. Employee → Manager
-- Display every employee along with their manager.
-- =====================================================

SELECT
    e.name AS employee_name,
    m.name AS manager_name
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id;


-- CONCEPT:
-- Same table ko do aliases diye:
-- e = employee
-- m = manager
--
-- Employee ka manager_id
-- Manager ke employee_id se match hota hai.


-- =====================================================
-- Q2. Employee + Manager ID
-- =====================================================

SELECT
    e.employee_id,
    e.name AS employee_name,
    e.manager_id,
    m.name AS manager_name
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id;


-- CONCEPT:
-- SELF JOIN ke through employee ki manager information
-- same table se retrieve ki.


-- =====================================================
-- Q3. IT Employees and Their Managers
-- =====================================================

SELECT
    e.name AS employee_name,
    m.name AS manager_name,
    e.salary
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
WHERE e.department = 'IT';


-- CONCEPT:
-- JOIN relationship banata hai.
-- WHERE employee department ko filter karta hai.


-- =====================================================
-- Q4. Employees Managed by Amit Sharma
-- =====================================================

SELECT
    e.name AS employee_name,
    e.department,
    e.salary
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
WHERE m.name = 'Amit Sharma';


-- CONCEPT:
-- m.name manager ka naam hai.
-- Isliye manager table alias par condition lagayi.


-- =====================================================
-- Q5. Employees with Higher Salary Than Their Manager
-- =====================================================

SELECT
    e.name AS employee_name,
    e.salary AS employee_salary,
    m.name AS manager_name,
    m.salary AS manager_salary
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;


-- CONCEPT:
-- Same table ke do records ki salary compare kar rahe hain.
--
-- Employee salary > Manager salary


-- =====================================================
-- Q6. Same Department as Manager
-- =====================================================

SELECT
    e.name AS employee_name,
    e.department,
    m.name AS manager_name,
    m.department AS manager_department
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
WHERE e.department = m.department;


-- CONCEPT:
-- Employee aur manager ke department ko compare kiya.
--
-- e.department = m.department


-- =====================================================
-- Q7. Same City as Manager
-- =====================================================

SELECT
    e.name AS employee_name,
    e.city AS employee_city,
    m.name AS manager_name,
    m.city AS manager_city
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
WHERE e.city = m.city;


-- CONCEPT:
-- Employee aur manager ki city compare ki.
--
-- e.city = m.city


-- =====================================================
-- Q8. Managers with Multiple Employees
-- =====================================================

SELECT
    m.name AS manager_name,
    COUNT(e.employee_id) AS number_of_employees
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.name
HAVING COUNT(e.employee_id) > 1
ORDER BY number_of_employees DESC;


-- CONCEPT:
-- SELF JOIN se manager aur employees connect kiye.
-- GROUP BY manager kiya.
-- COUNT() se direct employees count kiye.
-- HAVING > 1 se multiple employees wale managers nikale.


-- =====================================================
-- Q9. Employee Salary At Least 10% Lower Than Manager
-- =====================================================

SELECT
    e.name AS employee_name,
    e.salary AS employee_salary,
    m.name AS manager_name,
    m.salary AS manager_salary
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
WHERE e.salary <= m.salary * 0.90;


-- CONCEPT:
-- At least 10% lower ka matlab:
--
-- Employee Salary <= Manager Salary ka 90%
--
-- Example:
-- Manager = 100000
-- 90% = 90000
-- Employee <= 90000


-- =====================================================
-- Q10. Complete Employee-Manager Analysis
-- =====================================================

SELECT
    e.name AS employee_name,
    e.department AS employee_department,
    e.salary AS employee_salary,
    m.name AS manager_name,
    m.department AS manager_department,
    m.salary AS manager_salary
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
WHERE e.department IN ('IT', 'Finance', 'Sales')
  AND e.salary > 50000
ORDER BY e.salary DESC;


-- CONCEPT:
-- IN() se multiple departments filter kiye.
-- Salary > 50000 condition lagayi.
-- INNER JOIN automatically un employees ko hata deta hai
-- jinka manager nahi hai.
-- ORDER BY DESC highest salary se lowest salary.


-- =====================================================
-- Q11. Manager's Team Salary
-- =====================================================

SELECT
    m.name AS manager_name,
    SUM(e.salary) AS total_team_salary
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.name
ORDER BY total_team_salary DESC;


-- CONCEPT:
-- Har manager ke direct employees ki salary SUM() ki.
--
-- Manager → Employees
--        ↓
--      SUM(salary)


-- =====================================================
-- Q12. Manager vs Employee Experience
-- =====================================================

SELECT
    e.name AS employee_name,
    e.experience_years AS employee_experience,
    m.name AS manager_name,
    m.experience_years AS manager_experience
FROM employees_hierarchy AS e
INNER JOIN employees_hierarchy AS m
    ON e.manager_id = m.employee_id
WHERE e.experience_years < m.experience_years;


-- CONCEPT:
-- Employee ki experience ko manager ki experience se compare kiya.
--
-- Employee Experience < Manager Experience


-- =====================================================
-- DAY 07 - SELF JOIN KEY PATTERN
-- =====================================================

-- Same table
--      ↓
-- employees_hierarchy AS e
-- employees_hierarchy AS m
--      ↓
-- ON e.manager_id = m.employee_id
--      ↓
-- Employee ↔ Manager relationship


-- =====================================================
-- END OF DAY 07 SOLUTIONS
-- =====================================================
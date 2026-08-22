-- =====================================================
-- DAY 07 - SELF JOIN
-- BUSINESS PROBLEMS
-- Table: employees_hierarchy
-- =====================================================


-- =====================================================
-- BUSINESS PROBLEM 1
-- Employee Manager Report
-- =====================================================

-- HR department ko complete employee-manager report chahiye.
--
-- Display:
-- Employee Name
-- Department
-- Manager Name
-- Manager Department
--
-- Requirement:
-- Har employee ko uske manager ke saath show karo.


-- =====================================================
-- BUSINESS PROBLEM 2
-- Salary Anomaly Detection
-- =====================================================

-- HR identify karna chahta hai ki kaunse employees
-- apne manager se zyada salary earn kar rahe hain.
--
-- Display:
-- Employee Name
-- Employee Salary
-- Manager Name
-- Manager Salary
-- Salary Difference
--
-- Sirf wahi employees show karo jinki salary
-- manager se zyada hai.


-- =====================================================
-- BUSINESS PROBLEM 3
-- Manager Workload Analysis
-- =====================================================

-- Management jaana chahta hai ki kaunse managers
-- sabse zyada employees handle kar rahe hain.
--
-- Display:
-- Manager Name
-- Department
-- Total Employees
--
-- Sirf managers jinke under 2 ya usse zyada
-- direct employees hain.
--
-- Highest employee count se sort karo.


-- =====================================================
-- BUSINESS PROBLEM 4
-- Team Salary Analysis
-- =====================================================

-- Finance team ko har manager ki direct team ki
-- total salary calculate karni hai.
--
-- Display:
-- Manager Name
-- Department
-- Total Team Salary
--
-- Highest total team salary wale manager ko
-- sabse upar show karo.


-- =====================================================
-- BUSINESS PROBLEM 5
-- Manager Experience Check
-- =====================================================

-- HR check karna chahta hai ki employees ke managers
-- unse kitne experienced hain.
--
-- Display:
-- Employee Name
-- Employee Experience
-- Manager Name
-- Manager Experience
-- Experience Difference
--
-- Sirf un employees ko show karo jinke manager ke paas
-- minimum 3 years extra experience hai.


-- =====================================================
-- BUSINESS PROBLEM 6
-- Same City Management
-- =====================================================

-- Company jaana chahti hai ki kaunse employees
-- apne manager ke same city mein work kar rahe hain.
--
-- Display:
-- Employee Name
-- Employee City
-- Manager Name
-- Manager City
--
-- Sirf same-city employees show karo.


-- =====================================================
-- BUSINESS PROBLEM 7
-- Department Management Analysis
-- =====================================================

-- Management ko department-wise managers identify karne hain.
--
-- Display:
-- Manager Name
-- Department
-- Number of Direct Employees
-- Average Team Salary
--
-- Sirf managers jinke under at least 2 employees hain.


-- =====================================================
-- BUSINESS PROBLEM 8
-- Low Salary Employee Identification
-- =====================================================

-- HR identify karna chahta hai ki kaunse employees
-- apne manager ki salary ke 70% se bhi kam earn kar rahe hain.
--
-- Display:
-- Employee Name
-- Employee Salary
-- Manager Name
-- Manager Salary
--
-- Requirement:
-- Employee salary < Manager salary ka 70%


-- =====================================================
-- BUSINESS PROBLEM 9
-- Employee Hierarchy
-- =====================================================

-- Management ko employee → manager → senior manager
-- hierarchy dekhni hai.
--
-- Display:
-- Employee Name
-- Manager Name
-- Senior Manager Name
--
-- Sirf un employees ko show karo jinke manager ka
-- bhi ek manager hai.


-- =====================================================
-- BUSINESS PROBLEM 10 🔥
-- Manager Performance Report
-- =====================================================

-- HR ek complete manager performance report banana chahta hai.
--
-- Display:
-- Manager Name
-- Department
-- Total Direct Employees
-- Average Team Salary
-- Highest Team Salary
-- Lowest Team Salary
--
-- Requirements:
-- 1. Manager ke under minimum 2 employees hone chahiye.
-- 2. Average team salary 55000 se zyada honi chahiye.
-- 3. Result average team salary ke descending order mein ho.


-- =====================================================
-- BUSINESS PROBLEM 11 🔥
-- IT Management Analysis
-- =====================================================

-- IT department ke managers ka analysis karo.
--
-- Display:
-- Manager Name
-- Total IT Employees
-- Average IT Team Salary
--
-- Sirf IT department ke employees ko consider karo.


-- =====================================================
-- BUSINESS PROBLEM 12 🔥🔥
-- Senior Management Analysis
-- =====================================================

-- Find employees jinke:
--
-- Employee → Manager → Senior Manager
-- relationship available hai.
--
-- Display:
-- Employee Name
-- Employee Salary
-- Manager Name
-- Manager Salary
-- Senior Manager Name
-- Senior Manager Salary
--
-- Sirf un employees ko show karo jinki salary
-- manager se kam hai.
--
-- Hint:
-- Same table ko 3 aliases ke saath use karna hoga.
--
-- e  = Employee
-- m  = Manager
-- sm = Senior Manager


-- =====================================================
-- SKILLS PRACTICED
-- =====================================================

-- SELF JOIN
-- INNER JOIN
-- LEFT JOIN
-- Multiple SELF JOIN
-- WHERE
-- GROUP BY
-- HAVING
-- COUNT()
-- SUM()
-- AVG()
-- MAX()
-- MIN()
-- ORDER BY
-- IN()
-- Salary comparison
-- Experience comparison
-- Employee hierarchy
-- Real-world HR analysis


-- =====================================================
-- END OF BUSINESS PROBLEMS
-- =====================================================
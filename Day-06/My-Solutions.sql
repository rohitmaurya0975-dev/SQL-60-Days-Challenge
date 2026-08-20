-- =====================================================
-- DAY 06 - MY SOLUTIONS
-- Topic: LEFT JOIN, RIGHT JOIN & JOIN COMPARISON
-- Tables: employee2 + departments
-- =====================================================


-- =====================================================
-- Q1 — Basic LEFT JOIN
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name
FROM employee2 AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id;

-- CONCEPT:
-- LEFT JOIN left table (employee2) ke saare records
-- return karta hai.
-- Matching department mile to department_name aata hai.


-- =====================================================
-- Q2 — LEFT JOIN + Salary Filter
-- =====================================================

SELECT
    e.name AS employee_name,
    e.salary,
    d.department_name
FROM employee2 AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary >= 60000;

-- CONCEPT:
-- LEFT JOIN ke baad WHERE salary ko filter karta hai.
-- Sirf 60000 ya usse greater salary wale employees
-- result mein aayenge.


-- =====================================================
-- Q3 — LEFT JOIN + Department
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary
FROM employee2 AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_name = 'IT';

-- CONCEPT:
-- LEFT JOIN ke baad right table ke department_name
-- par WHERE condition lagayi gayi hai.
--
-- Important:
-- WHERE d.department_name = 'IT' lagane ke baad
-- unmatched rows (NULL department) result mein nahi aayengi.


-- =====================================================
-- Q4 — Employees Without Matching Department
-- =====================================================

SELECT
    e.employee_id,
    e.name AS employee_name,
    e.department_id
FROM employee2 AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

-- CONCEPT:
-- LEFT JOIN unmatched employees ke liye
-- right table ki columns NULL hoti hain.
--
-- IS NULL se hum unmatched records find kar sakte hain.


-- =====================================================
-- Q5 — Basic RIGHT JOIN
-- =====================================================

SELECT
    d.department_name,
    e.name AS employee_name
FROM employee2 AS e
RIGHT JOIN departments AS d
    ON e.department_id = d.department_id;

-- CONCEPT:
-- RIGHT JOIN right table (departments) ke
-- saare records ko preserve karta hai.
--
-- Jis department ka employee nahi hai,
-- employee_name NULL ho sakta hai.


-- =====================================================
-- Q6 — Departments Without Employees
-- =====================================================

SELECT
    d.department_id,
    d.department_name
FROM employee2 AS e
RIGHT JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.employee_id IS NULL;

-- CONCEPT:
-- RIGHT JOIN departments ke saare records rakhta hai.
-- Agar employee match nahi hua to e.employee_id NULL hoga.
--
-- IS NULL se unmatched departments milte hain.


-- =====================================================
-- Q7 — INNER JOIN vs LEFT JOIN
-- =====================================================

-- INNER JOIN
SELECT
    e.name AS employee_name,
    d.department_name
FROM employee2 AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id;


-- LEFT JOIN
SELECT
    e.name AS employee_name,
    d.department_name
FROM employee2 AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id;

-- CONCEPT:
--
-- INNER JOIN:
-- Sirf matching records.
--
-- LEFT JOIN:
-- Left table ke saare records +
-- matching right table records.


-- =====================================================
-- Q8 — LEFT JOIN + AND
-- =====================================================

SELECT
    e.name AS employee_name,
    d.department_name,
    e.salary
FROM employee2 AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_name = 'IT'
  AND e.salary >= 65000;

-- CONCEPT:
-- AND ka matlab dono conditions TRUE honi chahiye:
--
-- Department = IT
-- AND
-- Salary >= 65000


-- =====================================================
-- Q9 — RIGHT JOIN + SORTING
-- =====================================================

SELECT
    d.department_name,
    e.name AS employee_name,
    e.salary
FROM employee2 AS e
RIGHT JOIN departments AS d
    ON e.department_id = d.department_id
ORDER BY
    d.department_name ASC,
    e.salary DESC;

-- CONCEPT:
-- RIGHT JOIN sabhi departments ko preserve karta hai.
--
-- ORDER BY:
-- 1. Department ascending
-- 2. Same department mein salary descending


-- =====================================================
-- Q10 — FINAL JOIN CHALLENGE
-- =====================================================

-- Requirement:
-- Har department report mein hona chahiye.
-- Employee salary >= 60000 ho to include karo.
-- Department ASC.
-- Salary DESC.

SELECT
    d.department_name,
    e.name AS employee_name,
    e.salary
FROM departments AS d
LEFT JOIN employee2 AS e
    ON d.department_id = e.department_id
   AND e.salary >= 60000
ORDER BY
    d.department_name ASC,
    e.salary DESC;

-- CONCEPT:
-- Yahan departments ko LEFT table banaya gaya hai
-- kyunki har department ko report mein rakhna hai.
--
-- Salary condition ON ke andar rakhi gayi hai.
-- Isse departments without qualifying employees
-- bhi report mein remain karte hain.
--
-- Ye LEFT JOIN ka important real-world use case hai.


-- =====================================================
-- DAY 06 — KEY CONCEPTS
-- =====================================================

-- INNER JOIN
-- → Only matching records

-- LEFT JOIN
-- → All records from LEFT table
-- → Matching records from RIGHT table

-- RIGHT JOIN
-- → All records from RIGHT table
-- → Matching records from LEFT table

-- IS NULL
-- → Unmatched records find karne ke liye useful

-- WHERE
-- → Result ko filter karta hai

-- ON
-- → Tables ke relationship/matching condition ko define karta hai

-- ORDER BY
-- → Result ko sort karta hai


-- =====================================================
-- IMPORTANT PATTERN
-- =====================================================

SELECT
    d.department_name,
    e.name,
    e.salary
FROM departments AS d
LEFT JOIN employee2 AS e
    ON d.department_id = e.department_id
WHERE e.salary >= 60000
ORDER BY e.salary DESC;
-- =========================================================
-- COMPANY EMPLOYEE ANALYTICS
-- 50 SQL QUESTIONS + ANSWERS
-- MySQL
-- =========================================================


-- Q1. Show all employees.
SELECT *
FROM company_employees;


-- Q2. Show employee name, department and salary.
SELECT employee_name, department, salary
FROM company_employees;


-- Q3. Show employees whose salary is greater than 50000.
SELECT *
FROM company_employees
WHERE salary > 50000;


-- Q4. Show employees whose salary is less than 30000.
SELECT *
FROM company_employees
WHERE salary < 30000;


-- Q5. Show employees who belong to the IT department.
SELECT *
FROM company_employees
WHERE department = 'IT';


-- Q6. Show employees who live in Mumbai.
SELECT *
FROM company_employees
WHERE city = 'Mumbai';


-- Q7. Show all Female employees.
SELECT *
FROM company_employees
WHERE gender = 'Female';


-- Q8. Show all Male employees.
SELECT *
FROM company_employees
WHERE gender = 'Male';


-- Q9. Show employees with Excellent performance rating.
SELECT *
FROM company_employees
WHERE performance_rating = 'Excellent';


-- Q10. Show employees whose status is Active.
SELECT *
FROM company_employees
WHERE status = 'Active';


-- Q11. Show employees with salary between 40000 and 70000.
SELECT *
FROM company_employees
WHERE salary BETWEEN 40000 AND 70000;


-- Q12. Show employees who work in Sales or IT.
SELECT *
FROM company_employees
WHERE department IN ('Sales', 'IT');


-- Q13. Show employees who are not Active.
SELECT *
FROM company_employees
WHERE status <> 'Active';


-- Q14. Show the highest salary.
SELECT MAX(salary) AS highest_salary
FROM company_employees;


-- Q15. Show the lowest salary.
SELECT MIN(salary) AS lowest_salary
FROM company_employees;


-- Q16. Show the average salary.
SELECT AVG(salary) AS average_salary
FROM company_employees;


-- Q17. Show the total salary of all employees.
SELECT SUM(salary) AS total_salary
FROM company_employees;


-- Q18. Count total number of employees.
SELECT COUNT(*) AS total_employees
FROM company_employees;


-- Q19. Count employees department-wise.
SELECT department, COUNT(*) AS employee_count
FROM company_employees
GROUP BY department;


-- Q20. Find average salary department-wise.
SELECT department, AVG(salary) AS average_salary
FROM company_employees
GROUP BY department;


-- Q21. Find maximum salary in each department.
SELECT department, MAX(salary) AS maximum_salary
FROM company_employees
GROUP BY department;


-- Q22. Find minimum salary in each department.
SELECT department, MIN(salary) AS minimum_salary
FROM company_employees
GROUP BY department;


-- Q23. Find total salary paid by each department.
SELECT department, SUM(salary) AS total_salary
FROM company_employees
GROUP BY department;


-- Q24. Count employees city-wise.
SELECT city, COUNT(*) AS employee_count
FROM company_employees
GROUP BY city;


-- Q25. Count employees gender-wise.
SELECT gender, COUNT(*) AS employee_count
FROM company_employees
GROUP BY gender;


-- Q26. Count employees based on performance rating.
SELECT performance_rating, COUNT(*) AS employee_count
FROM company_employees
GROUP BY performance_rating;


-- Q27. Count employees based on status.
SELECT status, COUNT(*) AS employee_count
FROM company_employees
GROUP BY status;


-- Q28. Show departments having more than 200 employees.
SELECT department, COUNT(*) AS employee_count
FROM company_employees
GROUP BY department
HAVING COUNT(*) > 200;


-- Q29. Show departments where average salary is greater than 60000.
SELECT department, AVG(salary) AS average_salary
FROM company_employees
GROUP BY department
HAVING AVG(salary) > 60000;


-- Q30. Show employees ordered by salary from highest to lowest.
SELECT *
FROM company_employees
ORDER BY salary DESC;


-- Q31. Show employees ordered by salary from lowest to highest.
SELECT *
FROM company_employees
ORDER BY salary ASC;


-- Q32. Show top 10 highest-paid employees.
SELECT *
FROM company_employees
ORDER BY salary DESC
LIMIT 10;


-- Q33. Show top 5 lowest-paid employees.
SELECT *
FROM company_employees
ORDER BY salary ASC
LIMIT 5;


-- Q34. Show employees whose name starts with 'A'.
SELECT *
FROM company_employees
WHERE employee_name LIKE 'A%';


-- Q35. Show employees whose name ends with 'a'.
SELECT *
FROM company_employees
WHERE employee_name LIKE '%a';


-- Q36. Show employees whose name contains 'an'.
SELECT *
FROM company_employees
WHERE employee_name LIKE '%an%';


-- Q37. Show employees who joined after 2022-01-01.
SELECT *
FROM company_employees
WHERE joining_date > '2022-01-01';


-- Q38. Show employees who joined before 2020-01-01.
SELECT *
FROM company_employees
WHERE joining_date < '2020-01-01';


-- Q39. Show employees who joined in 2023.
SELECT *
FROM company_employees
WHERE YEAR(joining_date) = 2023;


-- Q40. Count employees who joined in each year.
SELECT YEAR(joining_date) AS joining_year,
       COUNT(*) AS employee_count
FROM company_employees
GROUP BY YEAR(joining_date)
ORDER BY joining_year;


-- Q41. Find average salary by gender.
SELECT gender, AVG(salary) AS average_salary
FROM company_employees
GROUP BY gender;


-- Q42. Find average salary by city.
SELECT city, AVG(salary) AS average_salary
FROM company_employees
GROUP BY city;


-- Q43. Show Active employees with salary greater than 60000.
SELECT *
FROM company_employees
WHERE status = 'Active'
AND salary > 60000;


-- Q44. Show IT employees with Excellent performance.
SELECT *
FROM company_employees
WHERE department = 'IT'
AND performance_rating = 'Excellent';


-- Q45. Show employees who are Active OR have Excellent performance.
SELECT *
FROM company_employees
WHERE status = 'Active'
OR performance_rating = 'Excellent';


-- Q46. Find the second highest salary.
SELECT MAX(salary) AS second_highest_salary
FROM company_employees
WHERE salary < (
    SELECT MAX(salary)
    FROM company_employees
);


-- Q47. Show employees earning more than the average salary.
SELECT *
FROM company_employees
WHERE salary > (
    SELECT AVG(salary)
    FROM company_employees
);


-- Q48. Show employees earning the highest salary.
SELECT *
FROM company_employees
WHERE salary = (
    SELECT MAX(salary)
    FROM company_employees
);


-- Q49. Show employees earning less than the average salary.
SELECT *
FROM company_employees
WHERE salary < (
    SELECT AVG(salary)
    FROM company_employees
);


-- Q50. Find the department with the highest average salary.
SELECT department, AVG(salary) AS average_salary
FROM company_employees
GROUP BY department
ORDER BY average_salary DESC
LIMIT 1;
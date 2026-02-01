-- Aggregation examples

-- Total employees
SELECT COUNT(*) FROM employees;

-- Average salary
SELECT AVG(salary) FROM employees;

-- Aggregation by department
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department;

-- Departments with more than 1 employee
SELECT department, COUNT(*)
FROM employees
GROUP BY department
HAVING COUNT(*) > 1;

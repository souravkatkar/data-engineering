-- GROUP BY vs HAVING examples

-- Filter rows before grouping
SELECT department, COUNT(*)
FROM employees
WHERE salary > 55000
GROUP BY department;

-- Filter groups after aggregation
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 1;

-- Using both WHERE and HAVING
SELECT department, AVG(salary) AS avg_salary
FROM employees
WHERE joining_date >= '2021-01-01'
GROUP BY department
HAVING AVG(salary) > 60000;

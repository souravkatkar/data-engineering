-- Scalar subquery: salary above average
SELECT name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- Column subquery using IN
SELECT name, department
FROM employees
WHERE department IN (
    SELECT dept_name
    FROM departments
);

-- Subquery in FROM clause
SELECT department, avg_salary
FROM (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
WHERE avg_salary > 60000;

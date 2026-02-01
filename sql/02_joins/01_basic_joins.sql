-- INNER JOIN: return only employees whose department exists in departments table
SELECT
    e.emp_id,
    e.name,
    e.department,
    d.dept_id
FROM employees e
INNER JOIN departments d
    ON e.department = d.dept_name;



-- LEFT JOIN: return all employees, even if department mapping is missing
SELECT
    e.emp_id,
    e.name,
    e.department,
    d.dept_id
FROM employees e
LEFT JOIN departments d
    ON e.department = d.dept_name;


-- Find departments that have no employees assigned
SELECT
    d.dept_name
FROM departments d
LEFT JOIN employees e
    ON d.dept_name = e.department
WHERE e.emp_id IS NULL;


-- Find employees whose department does not exist in departments table
SELECT
    e.name,
    e.department
FROM employees e
LEFT JOIN departments d
    ON e.department = d.dept_name
WHERE d.dept_name IS NULL;


-- Aggregation after JOIN: employee count and average salary per department
SELECT
    e.department,
    COUNT(e.emp_id) AS emp_count,
    AVG(e.salary) AS avg_salary
FROM employees e
LEFT JOIN departments d
    ON e.department = d.dept_name
GROUP BY e.department;


-- JOIN with filtering: employees earning more than 60000 with department info
SELECT
    e.name,
    e.salary,
    d.dept_name
FROM employees e
INNER JOIN departments d
    ON e.department = d.dept_name
WHERE e.salary > 60000;



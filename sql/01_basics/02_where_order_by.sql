-- Filtering and sorting data

-- Filter by department
SELECT *
FROM employees
WHERE department = 'Engineering';

-- Sort by salary descending
SELECT *
FROM employees
ORDER BY salary DESC;

-- HR employees sorted by salary
SELECT name, salary
FROM employees
WHERE department = 'HR'
ORDER BY salary DESC;

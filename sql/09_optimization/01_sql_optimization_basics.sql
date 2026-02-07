
/* ---------------------------------------------------------
   1. Avoid SELECT *
   Fetch only required columns
   --------------------------------------------------------- */
-- ❌ Bad
-- SELECT * FROM employees;

-- ✅ Good
SELECT emp_id, name, salary
FROM employees;


/* ---------------------------------------------------------
   2. Filter Early (Reduce Data ASAP)
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    salary
FROM employees
WHERE salary >= 60000;


/* ---------------------------------------------------------
   3. Use WHERE instead of HAVING when possible
   --------------------------------------------------------- */
-- ❌ Inefficient
SELECT department, COUNT(*)
FROM employees
GROUP BY department
HAVING department = 'Engineering';

-- ✅ Efficient
SELECT department, COUNT(*)
FROM employees
WHERE department = 'Engineering'
GROUP BY department;


/* ---------------------------------------------------------
   4. Avoid Functions on Indexed Columns
   --------------------------------------------------------- */
-- ❌ Prevents index usage
-- SELECT * FROM employees WHERE DATE(joining_date) = '2022-01-01';

-- ✅ Better
SELECT *
FROM employees
WHERE joining_date >= '2022-01-01'
  AND joining_date < '2022-01-02';


/* ---------------------------------------------------------
   5. EXISTS vs IN (Conceptual Example)
   --------------------------------------------------------- */
-- ✅ Preferred for large subqueries
SELECT *
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM departments d
    WHERE d.dept_name = e.department
);


/* ---------------------------------------------------------
   6. LIMIT Results During Exploration
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    salary
FROM employees
ORDER BY salary DESC
LIMIT 3;


/* ---------------------------------------------------------
   7. Use Window Functions Instead of Self-Joins
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    salary,
    AVG(salary) OVER (PARTITION BY department) AS avg_salary
FROM employees;


/* ---------------------------------------------------------
   8. Avoid DISTINCT When Not Needed
   --------------------------------------------------------- */
-- ❌ Expensive
-- SELECT DISTINCT department FROM employees;

-- ✅ Better if grouping anyway
SELECT department
FROM employees
GROUP BY department;


/* ---------------------------------------------------------
   9. LEFT JOIN + WHERE Trap
   --------------------------------------------------------- */
-- ❌ Turns LEFT JOIN into INNER JOIN
SELECT e.emp_id, e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
    ON e.department = d.dept_name
WHERE d.dept_name = 'Engineering';

-- ✅ Correct
SELECT e.emp_id, e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
    ON e.department = d.dept_name
   AND d.dept_name = 'Engineering';


/* ---------------------------------------------------------
   10. Use EXPLAIN (Conceptual)
   --------------------------------------------------------- */
-- EXPLAIN QUERY PLAN
-- SELECT * FROM employees WHERE salary > 60000;

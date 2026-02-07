/* ---------------------------------------------------------
   1. Identify NULL Values
   --------------------------------------------------------- */
SELECT *
FROM employees
WHERE salary IS NULL;


/* ---------------------------------------------------------
   2. IS NULL vs = NULL
   --------------------------------------------------------- */
-- ❌ This will NOT work
-- SELECT * FROM employees WHERE salary = NULL;

-- ✅ Correct way
SELECT *
FROM employees
WHERE salary IS NULL;


/* ---------------------------------------------------------
   3. Replace NULL using COALESCE
   Returns first non-null value
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    COALESCE(salary, 0) AS salary_filled
FROM employees;


/* ---------------------------------------------------------
   4. COALESCE with Multiple Fallbacks
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    COALESCE(salary, bonus, 0) AS total_compensation
FROM employees;


/* ---------------------------------------------------------
   5. NULL Handling with CASE
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    salary,
    CASE
        WHEN salary IS NULL THEN 'Missing'
        ELSE 'Present'
    END AS salary_status
FROM employees;


/* ---------------------------------------------------------
   6. COUNT(column) vs COUNT(*)
   --------------------------------------------------------- */
SELECT
    COUNT(*) AS total_rows,
    COUNT(salary) AS non_null_salary_count
FROM employees;


/* ---------------------------------------------------------
   7. Aggregations Ignore NULLs
   --------------------------------------------------------- */
SELECT
    AVG(salary) AS avg_salary,
    SUM(salary) AS total_salary
FROM employees;


/* ---------------------------------------------------------
   8. NULL in JOIN Conditions (LEFT JOIN Example)
   --------------------------------------------------------- */
SELECT
    e.emp_id,
    e.name,
    d.dept_name
FROM employees e
LEFT JOIN departments d
    ON e.department = d.dept_name;


/* ---------------------------------------------------------
   9. Filtering NULLs After LEFT JOIN
   --------------------------------------------------------- */
SELECT
    e.emp_id,
    e.name,
    d.dept_name
FROM employees e
LEFT JOIN departments d
    ON e.department = d.dept_name
WHERE d.dept_name IS NULL;


/* ---------------------------------------------------------
   10. Treat NULL as Value for Comparisons
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    COALESCE(salary, 0) >= 60000 AS is_high_salary
FROM employees;
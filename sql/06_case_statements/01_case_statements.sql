/* ---------------------------------------------------------
   1. Salary Band Classification
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    salary,
    CASE
        WHEN salary >= 75000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_band
FROM employees;


/* ---------------------------------------------------------
   2. Department-wise Bonus Calculation
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    department,
    salary,
    CASE
        WHEN department = 'Engineering' THEN salary * 0.10
        WHEN department = 'Sales' THEN salary * 0.15
        ELSE salary * 0.05
    END AS bonus_amount
FROM employees;


/* ---------------------------------------------------------
   3. Employee Tenure Categorization
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    joining_date,
    CASE
        WHEN joining_date <= '2021-01-01' THEN 'Senior'
        WHEN joining_date <= '2022-01-01' THEN 'Mid'
        ELSE 'Junior'
    END AS tenure_category
FROM employees;


/* ---------------------------------------------------------
   4. CASE with Aggregation (Salary Bands Count)
   --------------------------------------------------------- */
SELECT
    CASE
        WHEN salary >= 75000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_band,
    COUNT(*) AS employee_count
FROM employees
GROUP BY salary_band;


/* ---------------------------------------------------------
   5. Conditional Aggregation (Interview Favorite)
   --------------------------------------------------------- */
SELECT
    department,
    SUM(CASE WHEN salary >= 75000 THEN 1 ELSE 0 END) AS high_paid_count,
    SUM(CASE WHEN salary BETWEEN 60000 AND 74999 THEN 1 ELSE 0 END) AS mid_paid_count,
    SUM(CASE WHEN salary < 60000 THEN 1 ELSE 0 END) AS low_paid_count
FROM employees
GROUP BY department;


/* ---------------------------------------------------------
   6. CASE inside ORDER BY (Custom Sorting)
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    department,
    salary
FROM employees
ORDER BY
    CASE
        WHEN department = 'Engineering' THEN 1
        WHEN department = 'Sales' THEN 2
        ELSE 3
    END,
    salary DESC;


/* ---------------------------------------------------------
   7. Flagging High Value Employees
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    salary,
    CASE
        WHEN salary >= 70000 THEN 'Y'
        ELSE 'N'
    END AS high_value_flag
FROM employees;
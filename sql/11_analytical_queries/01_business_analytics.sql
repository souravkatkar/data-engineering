
/* ---------------------------------------------------------
   1. Average Salary per Department
   --------------------------------------------------------- */
SELECT
    department,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department;


/* ---------------------------------------------------------
   2. Highest Paid Employee per Department
   --------------------------------------------------------- */
WITH ranked_employees AS (
    SELECT
        emp_id,
        name,
        department,
        salary,
        RANK() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS rnk
    FROM employees
)
SELECT
    emp_id,
    name,
    department,
    salary
FROM ranked_employees
WHERE rnk = 1;


/* ---------------------------------------------------------
   3. Salary Distribution by Band
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
   4. Department Cost Contribution
   --------------------------------------------------------- */
SELECT
    department,
    SUM(salary) AS total_salary,
    ROUND(
        SUM(salary) * 100.0 /
        (SELECT SUM(salary) FROM employees),
        2
    ) AS salary_percentage
FROM employees
GROUP BY department;


/* ---------------------------------------------------------
   5. Hiring Trend (Year-wise)
   --------------------------------------------------------- */
SELECT
    strftime('%Y', joining_date) AS year,
    COUNT(*) AS hires
FROM employees
GROUP BY year
ORDER BY year;

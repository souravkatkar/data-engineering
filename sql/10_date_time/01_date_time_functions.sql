
/* ---------------------------------------------------------
   1. Extract Year from Date
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    joining_date,
    strftime('%Y', joining_date) AS joining_year
FROM employees;


/* ---------------------------------------------------------
   2. Extract Month
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    joining_date,
    strftime('%m', joining_date) AS joining_month
FROM employees;


/* ---------------------------------------------------------
   3. Filter Employees Joined After 2021
   --------------------------------------------------------- */
SELECT *
FROM employees
WHERE joining_date >= '2021-01-01';


/* ---------------------------------------------------------
   4. Employees Joined in 2022
   --------------------------------------------------------- */
SELECT *
FROM employees
WHERE strftime('%Y', joining_date) = '2022';


/* ---------------------------------------------------------
   5. Calculate Experience in Years (Approx)
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    joining_date,
    ROUND(
        (julianday('now') - julianday(joining_date)) / 365,
        1
    ) AS experience_years
FROM employees;


/* ---------------------------------------------------------
   6. Month-wise Hiring Count
   --------------------------------------------------------- */
SELECT
    strftime('%Y-%m', joining_date) AS join_month,
    COUNT(*) AS hires
FROM employees
GROUP BY join_month
ORDER BY join_month;

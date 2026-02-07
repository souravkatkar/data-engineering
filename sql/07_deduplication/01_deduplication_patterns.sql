/* ---------------------------------------------------------
   1. Identify Duplicate Records
   (Same name + department appearing multiple times)
   --------------------------------------------------------- */
SELECT
    name,
    department,
    COUNT(*) AS record_count
FROM employees
GROUP BY name, department
HAVING COUNT(*) > 1;


/* ---------------------------------------------------------
   2. Assign Row Numbers to Duplicates
   Keeps highest salary per (name, department)
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    department,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY name, department
        ORDER BY salary DESC
    ) AS row_num
FROM employees;


/* ---------------------------------------------------------
   3. View Only Duplicate Rows (Except the One to Keep)
   --------------------------------------------------------- */
WITH ranked_employees AS (
    SELECT
        emp_id,
        name,
        department,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY name, department
            ORDER BY salary DESC
        ) AS row_num
    FROM employees
)
SELECT *
FROM ranked_employees
WHERE row_num > 1;


/* ---------------------------------------------------------
   4. Deduplicated Result Set (Keep One Record)
   --------------------------------------------------------- */
WITH ranked_employees AS (
    SELECT
        emp_id,
        name,
        department,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY name, department
            ORDER BY salary DESC
        ) AS row_num
    FROM employees
)
SELECT
    emp_id,
    name,
    department,
    salary
FROM ranked_employees
WHERE row_num = 1;


/* ---------------------------------------------------------
   5. Deduplicate Based on Latest Joining Date
   --------------------------------------------------------- */
WITH ranked_employees AS (
    SELECT
        emp_id,
        name,
        department,
        salary,
        joining_date,
        ROW_NUMBER() OVER (
            PARTITION BY name, department
            ORDER BY joining_date DESC
        ) AS row_num
    FROM employees
)
SELECT *
FROM ranked_employees
WHERE row_num = 1;


/* ---------------------------------------------------------
   6. Delete Duplicate Records (Reference Only)
   ⚠️ Use carefully in real systems
   --------------------------------------------------------- */
-- DELETE FROM employees
-- WHERE emp_id NOT IN (
--     SELECT emp_id
--     FROM (
--         SELECT
--             emp_id,
--             ROW_NUMBER() OVER (
--                 PARTITION BY name, department
--                 ORDER BY salary DESC
--             ) AS row_num
--         FROM employees
--     )
--     WHERE row_num = 1
-- );


/* ---------------------------------------------------------
   7. Deduplication Using GROUP BY (Limited Use)
   --------------------------------------------------------- */
SELECT
    name,
    department,
    MAX(salary) AS max_salary
FROM employees
GROUP BY name, department;
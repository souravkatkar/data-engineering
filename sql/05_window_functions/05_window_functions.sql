/* =========================================================
   Window Functions in SQL
   Database: SQLite
   Tables used: employees
   Purpose: Interview-focused window function examples
   ========================================================= */


/* ---------------------------------------------------------
   1. ROW_NUMBER()
   Assigns a unique row number within each department
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    department,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS row_num
FROM employees;


/* ---------------------------------------------------------
   2. RANK()
   Same salary → same rank, gaps allowed
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS rank_in_dept
FROM employees;


/* ---------------------------------------------------------
   3. DENSE_RANK()
   Same salary → same rank, NO gaps
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    department,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS dense_rank_in_dept
FROM employees;


/* ---------------------------------------------------------
   4. Highest Paid Employee(s) per Department
   Uses window function + filtering
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
   5. Running Total of Salary by Joining Date
   Cumulative sum example
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    joining_date,
    salary,
    SUM(salary) OVER (
        ORDER BY joining_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_salary
FROM employees;


/* ---------------------------------------------------------
   6. Average Salary per Department (without GROUP BY)
   Each row keeps its detail
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS avg_salary_in_dept
FROM employees;


/* ---------------------------------------------------------
   7. Compare Salary with Department Average
   Very common interview question
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    department,
    salary,
    salary - AVG(salary) OVER (
        PARTITION BY department
    ) AS diff_from_dept_avg
FROM employees;


/* ---------------------------------------------------------
   8. LEAD()
   Compare current employee salary with next joined employee
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    joining_date,
    salary,
    LEAD(salary) OVER (
        ORDER BY joining_date
    ) AS next_employee_salary
FROM employees;


/* ---------------------------------------------------------
   9. LAG()
   Compare current employee salary with previous joined employee
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    joining_date,
    salary,
    LAG(salary) OVER (
        ORDER BY joining_date
    ) AS previous_employee_salary
FROM employees;


/* ---------------------------------------------------------
   10. Salary Difference with Previous Employee
   Analytical comparison
   --------------------------------------------------------- */
SELECT
    emp_id,
    name,
    joining_date,
    salary,
    salary - LAG(salary) OVER (
        ORDER BY joining_date
    ) AS salary_diff
FROM employees;

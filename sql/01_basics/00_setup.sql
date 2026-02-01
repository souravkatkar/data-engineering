-- Create employees table
CREATE TABLE employees (
    emp_id INTEGER,
    name TEXT,
    department TEXT,
    salary INTEGER,
    joining_date DATE
);

-- Insert sample data
INSERT INTO employees VALUES
(1, 'Amit', 'Engineering', 80000, '2021-06-15'),
(2, 'Neha', 'Engineering', 75000, '2022-03-10'),
(3, 'Ravi', 'HR', 50000, '2020-01-20'),
(4, 'Pooja', 'HR', 55000, '2021-11-05'),
(5, 'Karan', 'Sales', 60000, '2023-02-01');


CREATE TABLE departments (
    dept_id INTEGER,
    dept_name TEXT
);


INSERT INTO departments VALUES
(101, 'Engineering'),
(102, 'HR'),
(103, 'Sales'),
(104, 'Finance');

create database rank_practice;
use rank_practice;


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    city VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'John Smith', 'Sales', 75000, '2020-03-15', 'New York'),
(2, 'Jane Doe', 'Sales', 82000, '2019-07-22', 'Chicago'),
(3, 'Robert Brown', 'Sales', 75000, '2021-01-10', 'New York'),
(4, 'Lisa White', 'IT', 95000, '2018-05-30', 'San Francisco'),
(5, 'Michael Johnson', 'IT', 88000, '2020-11-05', 'Chicago'),
(6, 'Sarah Davis', 'IT', 102000, '2017-12-18', 'New York'),
(7, 'David Wilson', 'HR', 65000, '2022-02-28', 'Chicago'),
(8, 'Emma Taylor', 'HR', 72000, '2021-08-14', 'New York'),
(9, 'James Miller', 'Marketing', 68000, '2020-06-20', 'San Francisco'),
(10, 'Olivia Clark', 'Marketing', 79000, '2019-09-11', 'Chicago');



-- Create students table
CREATE TABLE student_scores (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    subject VARCHAR(50),
    score INT,
    exam_date DATE,
    class VARCHAR(20)
);

INSERT INTO student_scores VALUES
(1, 'Alice Johnson', 'Mathematics', 85, '2023-05-10', 'A'),
(2, 'Bob Williams', 'Mathematics', 92, '2023-05-10', 'A'),
(3, 'Charlie Brown', 'Mathematics', 78, '2023-05-10', 'B'),
(4, 'Diana Prince', 'Mathematics', 92, '2023-05-10', 'B'),
(5, 'Edward Stark', 'Mathematics', 88, '2023-05-10', 'A'),
(6, 'Alice Johnson', 'Science', 90, '2023-05-12', 'A'),
(7, 'Bob Williams', 'Science', 85, '2023-05-12', 'A'),
(8, 'Charlie Brown', 'Science', 82, '2023-05-12', 'B'),
(9, 'Diana Prince', 'Science', 95, '2023-05-12', 'B'),
(10, 'Edward Stark', 'Science', 88, '2023-05-12', 'A'),
(11, 'Fiona Green', 'Mathematics', 76, '2023-05-10', 'B'),
(12, 'Fiona Green', 'Science', 81, '2023-05-12', 'B');


-- Create sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    salesperson VARCHAR(50),
    sale_amount DECIMAL(10,2),
    sale_date DATE,
    region VARCHAR(50)
);

INSERT INTO sales VALUES
(1, 'Laptop Pro', 'Electronics', 'John', 1500.00, '2023-01-15', 'North'),
(2, 'Smartphone X', 'Electronics', 'John', 800.00, '2023-01-16', 'North'),
(3, 'Desk Chair', 'Furniture', 'Sarah', 250.00, '2023-01-15', 'South'),
(4, 'Laptop Pro', 'Electronics', 'Mike', 1500.00, '2023-01-17', 'East'),
(5, 'Coffee Maker', 'Appliances', 'Sarah', 120.00, '2023-01-16', 'South'),
(6, 'Smartphone X', 'Electronics', 'Mike', 800.00, '2023-01-18', 'East'),
(7, 'Office Desk', 'Furniture', 'John', 450.00, '2023-01-19', 'North'),
(8, 'Blender', 'Appliances', 'Sarah', 80.00, '2023-01-20', 'South'),
(9, 'Tablet Air', 'Electronics', 'Mike', 600.00, '2023-01-21', 'East'),
(10, 'Gaming Chair', 'Furniture', 'John', 350.00, '2023-01-22', 'North'),
(11, 'Toaster', 'Appliances', 'Sarah', 60.00, '2023-01-23', 'South'),
(12, 'Monitor Ultra', 'Electronics', 'Mike', 400.00, '2023-01-24', 'East');



CREATE TABLE stock_prices (
    stock_id INT,
    stock_symbol VARCHAR(10),
    price_date DATE,
    closing_price DECIMAL(10,2),
    volume INT
);

INSERT INTO stock_prices VALUES
(1, 'AAPL', '2023-01-01', 150.00, 1000000),
(2, 'AAPL', '2023-01-02', 152.50, 1200000),
(3, 'AAPL', '2023-01-03', 151.75, 1100000),
(4, 'AAPL', '2023-01-04', 155.25, 1300000),
(5, 'GOOGL', '2023-01-01', 95.00, 800000),
(6, 'GOOGL', '2023-01-02', 96.50, 850000),
(7, 'GOOGL', '2023-01-03', 94.75, 820000),
(8, 'GOOGL', '2023-01-04', 97.25, 900000),
(9, 'MSFT', '2023-01-01', 250.00, 700000),
(10, 'MSFT', '2023-01-02', 253.00, 750000),
(11, 'MSFT', '2023-01-03', 251.50, 720000),
(12, 'MSFT', '2023-01-04', 255.75, 780000);


-- Rank employees by salary in descending order
select emp_id ,emp_name,department ,salary,hire_date ,city ,
rank() over ( order by salary) as'salary_rank'
from Employees;

-- Rank employees within each department by salary 
select emp_id ,emp_name,department ,salary,hire_date ,city ,
rank() over ( partition by department order by salary) as'salary_rank'
from Employees;

-- Find top 2 earner in each department
create view salary_grade1 as 
select emp_id ,emp_name,department ,salary,hire_date ,city ,
rank() over ( partition by department order by salary desc) as'rnk'
from Employees ;
select * from salary_grade1 where rnk<=2;
-- another way without view 
with dept_ranking as(
select emp_id ,emp_name,department ,salary,hire_date ,city ,
rank() over ( partition by department order by salary desc) as'rnk'
from Employees )
select * from dept_ranking where rnk<=2;

-- Rank employees by hire date (most recent first)

SELECT 
    emp_name,
    hire_date,
    RANK() OVER (ORDER BY hire_date DESC) as seniority_rank
FROM employees;


-- Rank employees within each city by salary

SELECT 
    emp_name,
    city,
    salary,
    RANK() OVER (PARTITION BY city ORDER BY salary DESC) as city_salary_rank
FROM employees;


--  Find employees with 2nd highest salary in each department**

WITH salary_ranks AS (
    SELECT 
        emp_name,
        department,
        salary,
        RANK() OVER (PARTITION BY department ORDER BY salary DESC) as rnk
    FROM employees
)
SELECT * FROM salary_ranks WHERE rnk = 2;


--  Rank employees by salary, showing ties clearly**
SELECT 
    emp_name,
    salary,
    RANK() OVER (ORDER BY salary DESC) as rank_with_ties,
    DENSE_RANK() OVER (ORDER BY salary DESC) as dense_rank_no_gaps
FROM employees;


-- Rank departments by average salary**
WITH dept_avg AS (
    SELECT 
        department,
        AVG(salary) as avg_salary
    FROM employees
    GROUP BY department
)
SELECT 
    department,
    avg_salary,
    RANK() OVER (ORDER BY avg_salary DESC) as dept_rank
FROM dept_avg;


-- Rank employees by salary within each department and city**

SELECT 
    emp_name,
    department,
    city,
    salary,
    RANK() OVER (PARTITION BY department, city ORDER BY salary DESC) as rank_in_dept_city
FROM employees;


-- Find employees who rank in bottom 3 by salary in their department**
WITH bottom_ranks AS (
    SELECT 
        emp_name,
        department,
        salary,
        RANK() OVER (PARTITION BY department ORDER BY salary ASC) as rnk
    FROM employees
)
SELECT * FROM bottom_ranks WHERE rnk <= 3;
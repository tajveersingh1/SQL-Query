-- Create a database
CREATE DATABASE offset_data;
USE offset_data;

-- Create a sample table
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);

-- Insert sample data
INSERT INTO employees (first_name, last_name, department, salary, hire_date) VALUES
('John', 'Doe', 'IT', 75000.00, '2020-01-15'),
('Jane', 'Smith', 'HR', 65000.00, '2019-05-22'),
('Michael', 'Johnson', 'IT', 82000.00, '2018-03-10'),
('Emily', 'Williams', 'Marketing', 58000.00, '2021-02-28'),
('Robert', 'Brown', 'Finance', 90000.00, '2017-11-05'),
('Sarah', 'Miller', 'HR', 67000.00, '2020-07-19'),
('David', 'Wilson', 'IT', 78000.00, '2019-09-12'),
('Jennifer', 'Taylor', 'Marketing', 62000.00, '2021-04-30'),
('Thomas', 'Anderson', 'Finance', 95000.00, '2016-08-15'),
('Lisa', 'Jackson', 'HR', 70000.00, '2018-12-03'),
('James', 'White', 'IT', 80000.00, '2017-06-25'),
('Patricia', 'Harris', 'Marketing', 60000.00, '2020-10-17'),
('Daniel', 'Martin', 'Finance', 88000.00, '2019-01-08'),
('Nancy', 'Thompson', 'HR', 68000.00, '2021-03-14'),
('Charles', 'Garcia', 'IT', 77000.00, '2018-07-22'),
('Karen', 'Martinez', 'Marketing', 63000.00, '2020-05-11'),
('Matthew', 'Robinson', 'Finance', 92000.00, '2017-04-19'),
('Betty', 'Clark', 'HR', 69000.00, '2019-11-27'),
('Anthony', 'Rodriguez', 'IT', 79000.00, '2018-09-05'),
('Margaret', 'Lewis', 'Marketing', 61000.00, '2021-01-30');

-- offset -- how many record you want to skip 
-- limit --how many record you want to show 
show tables;
select * from employees ;
-- select the first 5 employees from the table:
select * from employees limit 5;

-- get the top 3 highest paid employees;
select * from employees order by salary desc limit 3;

-- find  5 most recently hired employees
select * from employees order by hire_date desc limit 5;

-- display employees 6 through 10
select * from employees limit 5 offset 5;

-- show the next 5 employees after the first 10
select * from employees limit 5 offset 10;

-- get 4 to 6 highest paid employees 
select * from employees order by salary desc limit 3 offset 3;


-- find the 3 lowest paid employees in the it department:
select * from employees where department='it' order by salary limit 3;

-- get the 2 most senior employees in the marketing department ;
select * from employees  where department='marketing' order by hire_date limit 2;

-- second highest salary 
select * from employees order by salary desc limit 1 offset 1;



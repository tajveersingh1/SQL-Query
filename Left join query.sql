create database left_join_practice;
use left_join_practice;

-- 1. Create Departments Table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);

-- 2. Create Employees Table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    DeptID INT,
    Salary INT,
    JoinDate DATE
);

-- 3. Create Projects Table
CREATE TABLE Projects (
    ProjID VARCHAR(10) PRIMARY KEY,
    ProjName VARCHAR(50),
    EmpID INT,
    Budget INT
);

-- 4. Insert Data
INSERT INTO Departments VALUES 
(101, 'HR', 'New York'),
(102, 'IT', 'San Francisco'),
(103, 'Marketing', 'Chicago');

INSERT INTO Employees VALUES 
(1, 'Alice', 101, 70000, '2022-01-15'),
(2, 'Bob', 102, 60000, '2023-03-10'),
(3, 'Charlie', NULL, 55000, '2021-06-23'),
(4, 'Diana', 101, 80000, '2020-11-01');

INSERT INTO Projects VALUES 
('P1', 'Website', 2, 5000),
('P2', 'Recruiting', 1, 2000),
('P3', 'Server Upgrade', NULL, 10000);

-- left join
-- complete  data from left table and only match data from right data 
show tables;
select* from Departments;
select* from Employees;
select* from Projects;

-- All Employees and their department names
select e.name, d.Deptname
from employees e 
left join departments d on e.DeptID=D.DeptID;

-- All Employees and their department names
select e.name, d.Deptname
from departments d
left join employees e on e.DeptID=D.DeptID;

-- all PROJECT names and the assigned employee
select p.projname, e.name
from projects p 
left join employees e on p.empID=e.empID;


-- all employees and the assigned PROJECT name
select  e.name ,p.projname
from employees e
left join projects p  on e.empID=p.empID;

-- employees ,location and salary
select  e.name ,d.location, e.salary
from employees e
left join departments d  on e.deptID=d.deptID;


-- departments name and join date 
select  d.deptname, e.joindate
from departments d
left join employees e on d.deptID=e.deptID;


-- Employees and Project Budget
SELECT E.Name, P.Budget 
FROM Employees E 
LEFT JOIN Projects P ON E.EmpID = P.EmpID;


-- Departments and Salary of everyone there
SELECT D.DeptName, E.Salary 
FROM Departments D 
LEFT JOIN Employees E ON D.DeptID = E.DeptID;


-- Projects and the Department Name of the assigned employee
SELECT P.ProjName, D.DeptName 
FROM Projects P 
LEFT JOIN Employees E ON P.EmpID = E.EmpID
LEFT JOIN Departments D ON E.DeptID = D.DeptID;


-- Employees and Dept Names ordered by Name
SELECT E.Name, D.DeptName 
FROM Employees E 
LEFT JOIN Departments D ON E.DeptID = D.DeptID
ORDER BY E.Name ASC;

-- Handling NULLs (Finding non-matches)

-- Employees with NO department
SELECT E.Name 
FROM Employees E 
LEFT JOIN Departments D ON E.DeptID = D.DeptID
WHERE D.DeptID IS NULL;


-- Departments with NO employees
SELECT D.DeptName 
FROM Departments D 
LEFT JOIN Employees E ON D.DeptID = E.DeptID
WHERE E.EmpID IS NULL;


-- Projects with NO employee assigned
SELECT P.ProjName 
FROM Projects P 
LEFT JOIN Employees E ON P.EmpID = E.EmpID
WHERE E.EmpID IS NULL;

-- Employees NOT working on any project
SELECT E.Name 
FROM Employees E 
LEFT JOIN Projects P ON E.EmpID = P.EmpID
WHERE P.ProjID IS NULL;


-- Departments with employees, but those employees have no projects
SELECT D.DeptName 
FROM Departments D
LEFT JOIN Employees E ON D.DeptID = E.DeptID
LEFT JOIN Projects P ON E.EmpID = P.EmpID
WHERE E.EmpID IS NOT NULL AND P.ProjID IS NULL;


-- Employees in a dept but with no project
SELECT E.Name 
FROM Employees E 
LEFT JOIN Projects P ON E.EmpID = P.EmpID
WHERE E.DeptID IS NOT NULL AND P.ProjID IS NULL;


-- Employees with invalid/orphan DeptIDs
-- (Note: In our dataset, we used NULL for Charlie, but if Charlie had DeptID 999, this query finds him)
SELECT E.Name 
FROM Employees E 
LEFT JOIN Departments D ON E.DeptID = D.DeptID
WHERE E.DeptID IS NOT NULL AND D.DeptID IS NULL;


-- Projects where the assigned employee has left (Employee is NULL)
SELECT P.ProjName 
FROM Projects P 
LEFT JOIN Employees E ON P.EmpID = E.EmpID
WHERE P.EmpID IS NOT NULL AND E.EmpID IS NULL;

-- Aggregation & Grouping
-- Count Employees in each Department
-- Important: Count E.EmpID, not *. If you count *, a department with 0 people will show "1".
SELECT D.DeptName, COUNT(E.EmpID) as Total_Employees 
FROM Departments D 
LEFT JOIN Employees E ON D.DeptID = E.DeptID
GROUP BY D.DeptName;


-- Total Salary per Department
SELECT D.DeptName, COALESCE(SUM(E.Salary), 0) as Total_Salary 
FROM Departments D 
LEFT JOIN Employees E ON D.DeptID = E.DeptID
GROUP BY D.DeptName;


-- Count Projects per Employee
SELECT E.Name, COUNT(P.ProjID) as Project_Count 
FROM Employees E 
LEFT JOIN Projects P ON E.EmpID = P.EmpID
GROUP BY E.Name;


-- Average Salary per Department
SELECT D.DeptName, AVG(E.Salary) 
FROM Departments D 
LEFT JOIN Employees E ON D.DeptID = E.DeptID
GROUP BY D.DeptName;


-- Highest Salary per Department
SELECT D.DeptName, MAX(E.Salary) 
FROM Departments D 
LEFT JOIN Employees E ON D.DeptID = E.DeptID
GROUP BY D.DeptName;

-- Count Distinct Projects per Location
SELECT D.Location, COUNT(DISTINCT P.ProjID) as Proj_Count
FROM Departments D
LEFT JOIN Employees E ON D.DeptID = E.DeptID
LEFT JOIN Projects P ON E.EmpID = P.EmpID
GROUP BY D.Location;


-- Total Budget managed by each Employee
SELECT E.Name, COALESCE(SUM(P.Budget), 0) as Total_Budget
FROM Employees E 
LEFT JOIN Projects P ON E.EmpID = P.EmpID
GROUP BY E.Name;
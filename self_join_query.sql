create database self_join_practice;
use self_join_practice;

CREATE TABLE institute_staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT
);

INSERT INTO institute_staff (staff_id, staff_name, department, manager_id) VALUES
(101, 'Dr. Sharma', 'Management', NULL),
(102, 'Priya Singh', 'Admissions', 101),
(103, 'Rahul Verma', 'Admissions', 102),
(104, 'Neha Gupta', 'Data Science Faculty', 101),
(105, 'Amit Kumar', 'Data Science Faculty', 104),
(106, 'Sneha Rao', 'Marketing', 101),
(107, 'Vikram Das', 'Marketing', 106),
(108, 'Rohan Mehta', 'Admissions', 102);

select 
emp.staff_name as Employee,
mgr.staff_name as Manager 
from 
institute_staff emp
inner join 
institute_staff mgr on emp.manager_id=mgr.manager_id;
 
 select * from institute_staff;
 
 select 
emp.staff_name as Employee,
mgr.staff_name as Manager 
from 
institute_staff emp
left join 
institute_staff mgr on emp.manager_id=mgr.manager_id;


 select 
emp.staff_name as Employee,
mgr.staff_name as Manager 
from 
institute_staff emp
right join 
institute_staff mgr on emp.manager_id=mgr.manager_id;


 select 
s1.staff_name as Staff_1,
s2.staff_name as Staff_2,
s1.department 
from 
institute_staff s1
 join 
institute_staff s2
 on s1.department=s2.department
 and s1.staff_id<s2.staff_id;
-- Note: The condition s1. staff_id ‹ s2. staff_id is crucial.
-- It prevents a staff member from joining with themselves and ensures
-- unique pairs (e.g., it will output Rahul and Rohan,but not Rohan and Rahul again)

select
emp.staff_name as Employee,
mgr.staff_name as manager,
case
  when emp.manager_id is null then 'Executive'
when emp.manager_id=101 then 'Department Head'
else 'Team Member'
end as reporting_level
from
institute_staff emp
left join
institute_staff mgr on emp.manager_id=mgr.manager_id;



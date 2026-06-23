-- count employees in each department 
show tables;
select count(*) as 'No.of_employees' from employees
group by department ;
select department,count(*) as 'No.of_employees' from employees
group by department ;
-- find average salary by department 
 select department,avg(salary) as 'AVERAGE SALARY ' from employees
group by department ;

-- FIND TOTAL SALARY expenditure per department
select department,sum(salary) as 'toatSALARY ' from employees
group by department ;

-- find maximum salary in each department
select department,max(salary) as 'Maximum SALARY ' from employees
group by department ;

-- find department with more than 2 employees
select department,count(*) as 'toatSALARY ' from employees
group by department having count(*)>2 ;

-- find total quantity sold for each product 
select * from orders;
SELECT product_id,
       SUM(quantity) AS total_quantity_sold
FROM orders
GROUP BY product_id;

-- find average order value per person
SELECT customer_id,
       AVG(quantity*price) AS average_order_value
FROM orders
GROUP BY customer_id ;

-- count order by status
SELECT status,
       COUNT(*) AS total_orders
FROM orders
GROUP BY status;

-- find customer with total purchase > $1500
SELECT customer_id,
       SUM(quantity*price) AS total_spent
FROM orders
GROUP BY customer_id
HAVING total_spent  > 1500;

-- count products supplies by eaqch supplier
SELECT supplier,
       COUNT(product_id) AS total_products
FROM products
GROUP BY supplier;
SELECT supplier,
       COUNT(*) AS total_products
FROM products
GROUP BY supplier;

-- count student in each grade
SELECT grade,
       COUNT(*) AS total_students
FROM students
GROUP BY grade;

select*FROM students;
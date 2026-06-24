-- like query
show tables;
-- find all the coustomers whoes first name starts with 'j':**
select * from customers ;
select first_name from customers where first_name like 'j%'; 

-- retrieve all products whose name contain the word 'shirt':**
select*from products;
select*from products where product_name like '%shirt%';

-- find all the employees whose last names end with 'son':
select*from employees where last_name like '%son';

-- select all cities start with 'new' from the location table;
select*from locations;
select*from locations where city like 'new%';

-- list all book titles that contain the word data base
select*from books;
select*from books where title like '%database%';

-- find all coustomers whose phone number starts with '415'
select * from customers ;
select *  from customers where phone like '415%';

-- retrieve all email address from the users table that end with '@gmail.com':
select * from users ;
select *  from users where email like '%@gmail.com';

-- select all product codes that follow the pattern 'A-100_' where the last charcter can be any single chaRCter:
select*from products where product_code like 'A-100_';

-- find all orders ids that start with 'ord' followed by exactly 5 digits
select*from orders;
select*from orders where order_id like 'ord_____%';
select*from orders where order_id regexp '^ord[0-9]{5}$';

-- list all filename in a document table that have a '.pdf' extention
select*from files;
select*from documents where filename like '%.pdf';

-- find all customer whose first name do not start with 'a':
select*from customers  where first_name not like 'a%';


-- retrive all products whoes description don't contain the word 'used'
select*from products ;
select*from products where description not like '%used%';

-- select all email address that are not from 'yahoo.com' domain:

select * from users ;
select *  from users where email not like '%yahoo.com';

-- 

select*from locations;
select*from locations where city not like 'san%' and  city not like'los%';

-- find customer whoes first name starts with 'm' and whose last name ends with 'ez':
select*from customers  where first_name  like 'm%'and last_name  like '%ez';

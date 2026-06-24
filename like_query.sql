create database work_like;
use work_like;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);

INSERT INTO customers (first_name, last_name, email, phone, city) VALUES
('John', 'Smith', 'john.smith@email.com', '415-555-1234', 'San Francisco'),
('Jane', 'Doe', 'jane.doe@gmail.com', '212-555-5678', 'New York'),
('Maria', 'Gonzalez', 'maria.g@email.com', '415-555-9012', 'Los Angeles'),
('Michael', 'Johnson', 'michael.j@yahoo.com', '312-555-3456', 'Chicago'),
('Robert', 'Martinez', 'rob.martinez@email.com', '415-555-7890', 'San Jose'),
('Jessica', 'Williams', 'jess.w@gmail.com', '(213)-555-1122', 'Los Angeles'),
('James', 'Brown', 'james.b@email.com', '(415)-555-3344', 'Oakland'),
('Jennifer', 'Davis', 'jen.davis@yahoo.com', '312-555-5566', 'Chicago'),
('David', 'Rodriguez', 'david.r@gmail.com', '(212)-555-7788', 'New York'),
('Sarah', 'Wilson', 'sarah.wilson@email.com', '415-555-9900', 'Berkeley');


CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    product_code VARCHAR(20),
    description TEXT,
    price DECIMAL(10,2),
    sku VARCHAR(20)
);

INSERT INTO products (product_name, product_code, description, price, sku) VALUES
('Blue T-Shirt', 'A-1001', 'Comfortable cotton t-shirt', 19.99, 'DEP-12-TSH'),
('Denim Jacket', 'A-1002', 'Classic denim jacket with 100% cotton', 59.99, 'DEP-23-JKT'),
('Running Shoes', 'B-2001', 'Lightweight running shoes (used display model)', 79.99, 'DEP-34-SHO'),
('Winter Coat', 'A-1003', 'Warm winter coat with 50% off original price', 129.99, 'DEP-45-COA'),
('Baseball Cap', 'C-3001', 'Adjustable cap with team logo', 24.99, 'DEP-56-CAP'),
('Dress Shirt', 'A-1004', 'Formal dress shirt (size L)', 39.99, 'DEP-67-SHT'),
('Leather Gloves', 'B-2002', 'Genuine leather gloves - 30%* discount', 49.99, 'DEP-78-GLV'),
('Sports Shorts', 'C-3002', 'Breathable athletic shorts', 29.99, 'DEP-89-SHR'),
('Wool Sweater', 'A-1005', '100% wool sweater for winter', 89.99, 'DEP-90-SWT'),
('Silk Tie', 'B-2003', 'Elegant silk tie with _pattern_', 34.99, 'DEP-01-TIE');



CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE,
    department VARCHAR(50)
);

INSERT INTO employees (first_name, last_name, hire_date, department) VALUES
('William', 'Johnson', '2018-05-15', 'Sales'),
('Elizabeth', 'Smithson', '2019-11-22', 'Marketing'),
('Thomas', 'Wilson', '2020-03-10', 'IT'),
('Margaret', 'Anderson', '2017-08-05', 'HR'),
('Richard', 'Jackson', '2021-02-18', 'Finance'),
('Susan', 'Harrison', '2019-06-30', 'Operations'),
('Charles', 'Williamson', '2015-09-12', 'Management'),
('Patricia', 'Robertson', '2022-01-25', 'Customer Service'),
('Christopher', 'Thompson', '2018-12-03', 'IT'),
('Sarah', 'Robinson', '2020-07-19', 'Marketing');


CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,
    customer_id INT,
    order_date DATETIME,
    status VARCHAR(20),
    total_amount DECIMAL(10,2)
);

INSERT INTO orders (order_id, customer_id, order_date, status, total_amount) VALUES
('ORD10001', 1, '2023-01-05 10:15:22', 'completed', 99.97),
('ORD10002', 3, '2023-01-12 14:30:45', 'completed', 149.98),
('ORD10003', 5, '2023-01-18 09:45:33', 'pending', 79.99),
('ORD10004', 2, '2023-01-22 16:20:18', 'completed', 219.97),
('ORD10005', 4, '2023-02-03 11:10:55', 'shipped', 59.99),
('ORD20001', 6, '2023-01-15 13:25:40', 'completed', 89.99),
('ORD20002', 7, '2023-01-28 15:50:12', 'completed', 34.99),
('ORD20003', 8, '2023-02-10 10:05:30', 'processing', 129.99),
('ORD20004', 9, '2023-01-30 12:40:15', 'completed', 49.99),
('ORD20005', 10, '2023-01-08 17:35:20', 'completed', 29.99);

CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    author VARCHAR(100),
    isbn VARCHAR(20),
    published_year INT
);

INSERT INTO books (title, author, isbn, published_year) VALUES
('Database Systems Design', 'John Smith', '978-1-2345-6789-0', 2020),
('The Complete Guide to SQL', 'Alice Johnson', '978-2-3456-7890-1', 2021),
('Python Programming', 'Robert Brown', '978-3-4567-8901-2', 2019),
('Web Development Basics', 'Emily Davis', '978-4-5678-9012-3', 2022),
('Advanced Database Techniques', 'Michael Wilson', '978-5-6789-0123-4', 2021),
('JavaScript for Beginners', 'Sarah Miller', '978-6-7890-1234-5', 2020),
('The Art of Programming', 'David Taylor', '978-7-8901-2345-6', 2018),
('Database Optimization Guide', 'Jennifer Lee', '978-8-9012-3456-7', 2022),
('Cloud Computing Essentials', 'James Anderson', '978-9-0123-4567-8', 2021),
('Networking Fundamentals', 'Patricia Clark', '978-0-1234-5678-9', 2020);


CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),
    email VARCHAR(100),
    registration_date DATE
);

INSERT INTO users (username, email, registration_date) VALUES
('jsmith', 'john.smith@gmail.com', '2022-01-15'),
('mjohnson', 'mary.johnson@yahoo.com', '2022-02-20'),
('dwilson', 'david.wilson@email.com', '2022-03-10'),
('sbrown', 'sarah.brown@gmail.com', '2022-04-05'),
('tlee', 'thomas.lee@yahoo.com', '2022-05-12'),
('lclark', 'lisa.clark@gmail.com', '2022-06-18'),
('rroberts', 'robert.roberts@email.com', '2022-07-22'),
('jmiller', 'jennifer.miller@yahoo.com', '2022-08-30'),
('wadams', 'william.adams@gmail.com', '2022-09-14'),
('kwhite', 'karen.white@email.com', '2022-10-25');


CREATE TABLE documents (
    doc_id INT PRIMARY KEY AUTO_INCREMENT,
    filename VARCHAR(100),
    filetype VARCHAR(20),
    upload_date DATE
);

INSERT INTO documents (filename, filetype, upload_date) VALUES
('report_2022.pdf', 'pdf', '2023-01-10'),
('presentation.pptx', 'pptx', '2023-01-15'),
('budget_2023.xlsx', 'xlsx', '2023-01-20'),
('meeting_notes.docx', 'docx', '2023-01-25'),
('user_manual.pdf', 'pdf', '2023-02-01'),
('contract_agreement.pdf', 'pdf', '2023-02-05'),
('product_catalog.pdf', 'pdf', '2023-02-10'),
('financial_report.xlsx', 'xlsx', '2023-02-15'),
('project_timeline.pptx', 'pptx', '2023-02-20'),
('policy_guide.pdf', 'pdf', '2023-02-25');



CREATE TABLE locations (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);

INSERT INTO locations (city, state, country) VALUES
('New York', 'NY', 'USA'),
('San Francisco', 'CA', 'USA'),
('Los Angeles', 'CA', 'USA'),
('Chicago', 'IL', 'USA'),
('New Orleans', 'LA', 'USA'),
('San Diego', 'CA', 'USA'),
('Boston', 'MA', 'USA'),
('San Antonio', 'TX', 'USA'),
('Newark', 'NJ', 'USA'),
('Seattle', 'WA', 'USA');


CREATE TABLE blog_posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    content TEXT,
    views INT,
    publish_date DATE
);

INSERT INTO blog_posts (title, content, views, publish_date) VALUES
('MySQL Tutorial for Beginners', 'Learn basic MySQL commands...', 1250, '2023-01-05'),
('Advanced SQL Techniques', 'Explore complex queries...', 850, '2023-01-12'),
('Python Programming Guide', 'Introduction to Python...', 1500, '2023-01-18'),
('Web Development Tutorial', 'Build your first website...', 2100, '2023-01-25'),
('Database Optimization', 'Tips for faster queries...', 980, '2023-02-01'),
('JavaScript Basics', 'Learn JavaScript fundamentals...', 750, '2023-02-08'),
('CSS Styling Tutorial', 'Make your website beautiful...', 1100, '2023-02-15'),
('PHP for Beginners', 'Server-side scripting...', 650, '2023-02-22'),
('React Tutorial', 'Build modern web apps...', 1800, '2023-03-01'),
('Node.js Guide', 'Server-side JavaScript...', 950, '2023-03-08');


CREATE TABLE files (
    file_id INT PRIMARY KEY AUTO_INCREMENT,
    filename VARCHAR(100),
    filepath VARCHAR(255),
    upload_date DATE
);

INSERT INTO files (filename, filepath, upload_date) VALUES
('report_2023_Q1.csv', '/reports/2023/Q1', '2023-04-01'),
('report_2023_01.csv', '/reports/2023/monthly', '2023-02-01'),
('report_2023_02.csv', '/reports/2023/monthly', '2023-03-01'),
('data_export.xlsx', '/exports/2023', '2023-04-15'),
('report_2023_03.csv', '/reports/2023/monthly', '2023-04-01'),
('report_2023_Q2.csv', '/reports/2023/Q2', '2023-07-01'),
('report_2023_04.csv', '/reports/2023/monthly', '2023-05-01'),
('analysis_results.pdf', '/analyses/2023', '2023-04-10'),
('report_2023_05.csv', '/reports/2023/monthly', '2023-06-01'),
('report_2023_Q3.csv', '/reports/2023/Q3', '2023-10-01');


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

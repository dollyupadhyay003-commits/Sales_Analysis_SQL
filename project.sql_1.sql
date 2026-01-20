create database sale_analysis;
use sale_analysis;
create table customers(cust_id int primary key,cust_name varchar (33),city varchar(33));
create table products(pro_id int primary key ,pro_name varchar (33),price int);
create table orders(order_id int primary key ,cust_id int,pro_id int,quantity int
,order_date date,foreign key (cust_id) references 
customers(cust_id),foreign key(pro_id)references products(pro_id));
insert into customers(cust_id,cust_name,city) 
values(1,"ravi","delhi"),(2,"neha","mumbai"),(3,"amit","noida");
insert into products(pro_id ,pro_name,price) values 
(101,"laptop",50000),(102,"mouse",500),(103,"keyboard",1500);
insert into orders (order_id,cust_id,pro_id,quantity,order_date) 
values(1001,1,101,1,"2024-01-10"),(1002,2,102,2,"2024-01-12")
,(1003,1,103,1,"2024-01-15"),(1004,3,101,1,"2024-01-20");

select * from customers;
select * from products;
select * from orders;


--- total sales amount 


select sum(o.quantity * p.price) as total_sales from orders o 
join
products p on o.pro_id = p.pro_id;

--- customer- wise total purchase 
--- joining

select c.cust_name,sum(o.quantity * p.price) as total_amount from orders o 
join customers c on o.cust_id = c.cust_id
join products p on o.pro_id = p.pro_id 
group by c.cust_name; 

--- most expensive product
select pro_name,price from products where price = (select max(price) from products); 
--- city wise coustomer count

select city,count(*) as total_customers from customers group by city;

--- product wise total quantity sold 

select p.pro_name, sum(o.quantity) as total_quantity from orders o 
join products p on o.pro_id =p.pro_id group by p.pro_name;

----- complete project 

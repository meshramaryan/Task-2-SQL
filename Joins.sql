-- * Joins *
create table customers(customer_id serial primary key,
customer_name varchar,
city varchar,
phone_number bigint,	
email varchar,
registration_date date
);

create table orders(order_id serial primary key,	
customer_id	int references customers(customer_id),
order_date	date,
order_amount int,	
delivery_city varchar,
payment_mode varchar
);

create table products(product_id serial primary key,
product_name varchar,
category varchar,	
price int,
stock_quantity int,	
supplier_name varchar,
supplier_city varchar,	
supply_date date
);

create table order_items(order_item_id	serial primary key,
order_id int references orders(order_id),
product_id int references products(product_id),
quantity int,
total_price int
);

copy customers from 'D:\PostgreSQL\SQL Task-2\Table.1--customers.csv' delimiter ',' csv header;
copy orders from 'D:\PostgreSQL\SQL Task-2\Table.2--orders.csv' delimiter ',' csv header;
copy products from '  D:\PostgreSQL\SQL Task-2\Table.3--products.csv' delimiter ',' csv header;
copy order_items from ' D:\PostgreSQL\SQL Task-2\Table.4--order_items.csv' delimiter ',' csv header;


--TASK1: Retrieve the customer_name, city, and order_date for each customer who placed an order in 2023 by joining the customers and orders tables.
select c.customer_name, c.city, o.order_date from customers c
join orders o on c.customer_id = o.customer_id
where extract(year from o.order_date) = 2023;


--TASK2:Get a list of all products (with product_name, category, and total_price) ordered by customers living in Mumbai, by joining the customers, orders, order_items, and products tables.
select p.product_name, p.category, oi.total_price from customers c
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
where c.city = 'Mumbai';


--TASK3:Find all orders where customers paid using 'Credit Card' and display the customer_name, order_date, and total_price by joining the customers, orders, and order_items tables.
select c.customer_name, o.order_date, oi.total_price, o.payment_mode from customers c
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
where o.payment_mode = 'Credit Card';


--TASK4:Display the product_name, category, and the total_price for all products ordered in the first half of 2023 (January - June) by joining the orders, order_items, and products tables. 
select p.product_name, p.category, oi.total_price from orders o
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
where extract(year from o.order_date) = 2023 and
extract(month from o.order_date) between 1 and 6;


--TASK5:Show the total number of products ordered by each customer, displaying customer_name and total products ordered, using joins between customers, orders, and order_items.
select c.customer_name, sum(oi.quantity) as total_products_ordered from customers c
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
group by c.customer_name;






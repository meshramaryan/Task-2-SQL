-- * LIMIT & OFFSET *
--Task 1: Retrieve the first 10 rows from the customers table ordered by customer_name.
select * from customers order by customer_name limit 10;

--Task 2: Display the top 5 most expensive products (sorted by price in descending order).
select * from products order by price desc limit 5;

--Task 3: Get the orders for the 11th to 20th customers (using OFFSET and LIMIT), sorted by customer_id.
select * from customers order by customer_id limit 10 offset 10;

--Task 4: List the first 5 orders placed in 2023, displaying order_id, order_date, and customer_id.
select order_id, customer_id, order_date from orders
where extract(year from order_date) = 2023
order by order_date limit 5;

--Task 5: Fetch the next 10 distinct cities where orders were placed, using LIMIT and OFFSET.
select distinct delivery_city from orders limit 10 offset 10;


 




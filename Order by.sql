-- * ORDER BY *

--Task 1: List all customers sorted by customer_name in ascending order.
select * from customers order by customer_name;

--Task 2: Display all orders sorted by total_price in descending order.
select * from order_items order by total_price desc ;

--Task 3: Retrieve a list of products sorted by price in ascending order and then by category in descending order.
select * from products order by price,category desc; 

--Task 4: Sort all orders by order_date in descending order and display the order_id, customer_id, and order_date.
select order_date, order_id, customer_id from orders order by order_date desc;

--Task 5: Get the list of cities where orders were placed, sorted in alphabetical order, and display the total number of orders placed in each city.
select city, count(order_id) from customers c
join orders o on c.customer_id = o.customer_id group by city order by city asc;

 
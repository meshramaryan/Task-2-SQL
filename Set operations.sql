-- * SET OPERATIONS *

--Task 1: Get the list of customers who have placed orders in both 2022 and 2023 (use INTERSECT).
select customer_name from customers where customer_id in (select customer_id from orders where extract ( year from order_date)=2022
intersect
select customer_id from orders where extract ( year from order_date)=2023)

--Task 2: Find the products that were ordered in 2022 but not in 2023 (use EXCEPT).
select product_name from products where product_id in ( select product_id from orders o
join order_items oi on oi.order_id = o.order_id
where extract (year from order_date)= 2022)
EXCEPT
select product_name from products where product_id in ( select product_id from orders o
join order_items oi on oi.order_id = o.order_id
where extract (year from order_date)=2023);

--Task 3: Display the list of supplier_city from the products table that do not match any customer_city in the customers table (use EXCEPT).
select supplier_city from products
except
select city from customers

--Task 4: Show a combined list of supplier_city from products and city from customers (use UNION).
select supplier_city from products
union
select city from customers

--Task 5: Find the list of product_name from the products table that were ordered in 2023 (use INTERSECT with the orders and order_items tables).
select product_name from products where product_id in (select product_id from products
intersect
select product_id from order_items oi
join orders o on o.order_id = oi.order_id
where extract (year from order_date) = 2023)
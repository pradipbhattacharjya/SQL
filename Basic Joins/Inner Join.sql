--JOINING DATA
--Retrieve all data from customers and orders in two different results

SELECT *
FROM customers;

SELECT *
FROM orders;

--Inner Join
--Get all customers along with their orders,but oly for customers who have placed an order.

SELECT 
	C.id,
	C.first_name,
	C.country,
	C.score,
	O.order_id,
	O.order_date,
	O.sales
FROM customers AS C
INNER JOIN orders AS O
ON C.id = O.customer_id;

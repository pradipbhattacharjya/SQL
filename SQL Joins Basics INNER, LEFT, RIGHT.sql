-- SQL Joins Basics: INNER, LEFT, RIGHT
--Retrieve all data from customers and orders as separate results
USE MyDatabase;

SELECT *
FROM customers;

SELECT *
FROM orders;

-- INNER JOIN
/*Get all customers along with their orders, 
but only for customers who have placed an order*/

SELECT 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers AS c
INNER JOIN orders AS o
ON id = customer_id;

-- LEFT JOIN
/*Get all customers along with their orders,
including those without orders*/

SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id

--RIGHT JOIN
/*Get all customers along with their orders,
including orders without matchong customers.*/

SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id;

/*Get all customers along with their orders,
including orders without matching customers*/

SELECT 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM orders AS o
LEFT JOIN customers AS c
ON id = customer_id;

--FULL JOIN
/*Get all customers and all orders,
even if there's no match*/

SELECT 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers AS c
FULL JOIN orders AS o
ON c.id =o.customer_id;
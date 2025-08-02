--Advanced SQL JOINS: ANTI & CROSS
-- Get all customers who haven't placed any order 
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL;

--RIGHT ANTI JOIN
--Get all orders without matching customers
SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL;

--Get  all orders without matching customers
SELECT *
FROM orders AS o
LEFT JOIN customers AS c
ON c.id = o.customer_id
WHERE c.id IS NULL;

--FULL ANTI JOIN 
--Find customers without orders and orders without customers
SELECT *
FROM orders AS o
FULL JOIN customers AS c
ON c.id = o.customer_id
WHERE c.id IS NULL OR o.customer_id IS NULL;

--CHALLENGE
/*Get all customers along with their orders,
but only for customers who have placed an order 
Without using INNER JOIN! */

SELECT *
FROM customers AS c
LEFT JOIN orders AS  o
ON c.id = o.customer_id
WHERE o.customer_id IS NOT NULL;

-- CROSS JOIN 
-- Generate all possible combinations of customers and orders

SELECT *
FROM customers
CROSS JOIN orders
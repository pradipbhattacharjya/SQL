--CHALLENGE
/*Get all customers along with their orders,
but only for customers who have placed an order
(Without Using INNER JOIN*/

SELECT *
FROM customers AS C
LEFT JOIN orders AS O
ON C.id = O.customer_id
WHERE O.customer_id IS NOT NULL
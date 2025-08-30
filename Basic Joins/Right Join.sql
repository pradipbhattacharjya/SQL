--Right Join
--Returns All Rows from Right and Only Matching from Left.
--Get all customers along with their orders,including orders without metching customers.

SELECT
	C.id,
	C.first_name,
	O.customer_id,
	O.sales
FROM customers AS C
RIGHT JOIN orders AS O
ON C.id = O.customer_id;
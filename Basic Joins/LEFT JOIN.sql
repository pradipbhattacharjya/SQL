--LEFT JOIN
--Returns Allrows from Left and Only Matching from Right
--GET all customers along with their orders,including those without orders

SELECT 
	C.id,
	C.first_name,
	O.order_id,
	O.sales
FROM customers AS C
LEFT JOIN orders AS O
ON C.id = O.customer_id;

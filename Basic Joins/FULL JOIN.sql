--FULL JOIN
--Returns All Rows From Both Tables
--Get all customers and all orders, even if there's no match.

SELECT
	C.id,
	C.first_name,
	O.order_id,
	O.sales
FROM customers AS C
FULL JOIN orders AS O
ON C.id =O.customer_id;
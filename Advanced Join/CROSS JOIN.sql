--CROSS JOIN
--Combines Eveny Row from Left with Eveny row from Right
--generate all possible combinations of customers and orders.

SELECT *
FROM customers
CROSS JOIN orders;
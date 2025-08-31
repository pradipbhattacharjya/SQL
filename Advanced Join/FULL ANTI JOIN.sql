--FULL ANTI JOIN
--Returns Only Rows that Don't Match in either Tables
-- Find customers without orders and orders without customers

SELECT *
FROM orders AS O
FULL JOIN customers AS C
ON C.id = O.customer_id
WHERE C.id IS NULL
OR O.customer_id IS NULL;
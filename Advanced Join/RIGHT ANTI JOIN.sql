--RIght ANTI JOIN
--Returns Row from RIght that has NOMATCH in Left.
-- Get all orders without matching customers

SELECT*
FROM customers AS C
RIGHT JOIN orders AS O
ON C.id = O.customer_id
WHERE C.id IS NULL;
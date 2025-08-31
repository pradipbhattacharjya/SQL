--LEFT ANTI JOIN
--Returns Row from Left that has NOMATCH in Right
-- Get all customers who haven't placed any order.
SELECT *
FROM customers AS C
LEFT JOIN orders AS O
ON C.id =  O.customer_id
WHERE O.customer_id IS NULL;
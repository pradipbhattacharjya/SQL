-- Get all orders without matching customers
SELECT *
FROM orders AS O
LEFT JOIN customers AS C
ON C.id = O.customer_id
WHERE C.id IS NULL
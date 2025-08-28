-- Retrive the Top 3 Customers with the Highest Scores

SELECT TOP 3 *
FROM customers
ORDER BY score DESC;

-- Retrieve the Lowest 2 Customers based one Score
SELECT TOP 2 *
FROM customers
ORDER BY score ASC;
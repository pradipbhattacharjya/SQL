--Group By
--Find the total score for each country

SELECT
	country AS customer_country,
	SUM(score) AS total_score
FROM customers
GROUP BY country;
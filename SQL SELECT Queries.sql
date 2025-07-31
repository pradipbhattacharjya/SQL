--SQL SELECT Queries

USE MyDatabase

-- Retrieve All Customer Data 
SELECT *
FROM customers;

-- Retrieve All Order Data
SELECT *
FROM orders;

--Retrive each customer's name,country and score
SELECT
	first_name,
	country,
	score
FROM customers;

-- WHERE 
-- Retrive customers with a score not equal to 0
SELECT *
FROM customers
WHERE score != 0;
-- Retrieve customers from Germany
SELECT *
FROM customers
WHERE country = 'Germany';

-- ORDER BY
--Retrive all customers and sort the results by the highest score first

SELECT *
FROM customers
ORDER BY score DESC;
--Retrive all customers and sort the results by the lowest score first.

SELECT *
FROM customers
ORDER BY score ASC;

--(Nested) ORDER BY - Sort Your Data -
--Retrieve all customers and sort the results by the country and then by highest score
SELECT *
FROM customers
ORDER BY country ASC, score DESC;

-- GROUP BY
-- Find the total score for each country
SELECT 
	country,
	SUM(score) AS total_score
FROM  customers
GROUP BY country;

-- Find the total score and total number of customers for each country
SELECT
	country,
	SUM(score) AS total_score,
	COUNT(id) AS total_customers
FROM customers
GROUP BY country;

-- HAVING
/* Find the average score for each country
   considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 430 */
SELECT
    country,
    AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430

-- DISTINCT
-- Return Unique list of all countries
SELECT DISTINCT
	country
FROM customers;

  --TOP
-- Retrieve only 3 Customers

SELECT TOP 3
	*
FROM customers;

-- Retrieve the Top 3 Customers with the Highest Scores
SELECT TOP 3 *
FROM customers
ORDER BY score DESC;

-- Retrieve the Lowest 2 Customers based on the score
SELECT TOP 2 *
FROM customers
ORDER BY score ASC

-- Get the Two Most Recent Orders
SELECT TOP 2 *
FROM orders
ORDER BY order_date DESC;

-- All Together
/* Calculate the average score for each country 
   considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 430
   and sort the results by the highest average score first. */

SELECT
    country,
    AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430
ORDER BY AVG(score) DESC

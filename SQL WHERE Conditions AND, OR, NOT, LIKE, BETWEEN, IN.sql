--SQL WHERE Conditions | AND, OR, NOT, LIKE, BETWEEN, IN
--Comparison Operators
-- Retrive all customers from Germany
SELECT *
FROM customers
WHERE country = 'Germany';

-- Retrieve all customer who are not from Germany
SELECT *
FROM customers
WHERE country != 'Germany'

-- Retrieve all customers with a score greater than 500.
SELECT *
FROM customers
WHERE score > 500;

--Retrieve all customers with a score of 500 or more.
SELECT *
FROM customers
WHERE score >= 500;

--Retrive all customers with a score less than 500
SELECT *
FROM customers
WHERE score < 500;

--Retrive all customers with a score of 500 or less
SELECT *
FROM customers
WHERE score <= 500;

-- Logical Operators
--AND 
-- Retrive all customers who are from the USA AND have a score greater than 500
SELECT * 
FROM customers
WHERE country = 'USA' AND score > 500;

--OR
--Retrive all customers who are from the USA OR have a score greater than 500
SELECT *
FROM customers
WHERE country = 'USA' OR score > 500;

-- NOT
--Retrive all customers with a score NOT less than 500
SELECT *
FROM customers
WHERE NOT score < 500;

--Range Operator
--BETWEEN
--Retrive all customers whose score falls in the range between 100 and 500
SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500;

--Membership Operator
--IN
--Retrieve all customers from either Germany OR USA
SELECT *
FROM customers
WHERE country IN ('Germany','USA');

--Search Operator
--LIKE
--Find all customers whose first name starts with 'M'
SELECT *
FROM customers
WHERE first_name LIKE 'M%';

--Find all customers whose first name ends with 'n'
SELECT *
FROM customers
WHERE first_name LIKE '%n';

--Find all customers whose first name contains 'r'
SELECT *
FROM customers
WHERE first_name LIKE '%r%';

-- Find all customers whose first name has 'r' in the 3rd position
SELECT *
FROM customers
WHERE first_name LIKE '___r%';
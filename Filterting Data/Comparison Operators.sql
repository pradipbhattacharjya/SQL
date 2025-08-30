--Comparison Operators
--equal
-- Retrieve all customers from Germany
SELECT *
FROM customers
WHERE country = 'Germany';

--not equal
--Retrieve all customers who are not from Germany
SELECT *
FROM customers
WHERE country != 'Germany';

--greater than
--Retrive all customers with a score greater than 500
SELECT *
FROM customers
WHERE score > 500;

--greater than or equal to
-- Retrieve all customers with a score of 500 or mor
SELECT *
FROM customers
WHERE score >= 500;

--Retrive all customers with a score less than 500
SELECT *
FROM customers
WHERE score < 500;

-- Retrive all customers with a score of 500 or less
SELECT *
FROM customers
WHERE score <= 500;
--Multi-Queries
USE MyDatabase;

SELECT *
FROM customers;

SELECT *
FROM orders;

SELECT 123 AS static_number;

SELECT 'Hello' AS static_string;

--Highlight & Execute

SELECT *
FROM customers
WHERE country ='Germany';

SELECT * FROM orders;
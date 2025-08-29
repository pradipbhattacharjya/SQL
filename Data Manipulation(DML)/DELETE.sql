--DELETE
-- Delete all customers with an ID greater than 5

SELECT *
FROM customers
WHERE id > 5;

DELETE FROM customers
WHERE id > 5;

SELECT * FROM customers;

--Delete all data from the persons table

DELETE  FROM persons;

TRUNCATE TABLE persons;
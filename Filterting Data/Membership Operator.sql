--Membership Operator
--IN
--Retrieve all customers from either Germany or USA.

SELECT *
FROM customers
WHERE country IN ('Germany', 'USA');


--NOT IN

SELECT *
FROM customers
WHERE country NOT IN ('Germany','USA');


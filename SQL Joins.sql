-- SQL Joins
SELECT * FROM users t1
CROSS JOIN sql_cx_live.groups t2;

SELECT * FROM membership t1
INNER JOIN sql_cx_live.users t2
ON t1.user_id = t2.user_id;

SELECT * FROM sql_cx_live .membership t1
RIGHT JOIN sql_cx_live.users t2
ON t1.user_id = t2.user_id;

SELECT * FROM sql_cx_live .membership t1
LEFT JOIN sql_cx_live.users t2
ON t1.user_id = t2.user_id;

-- -------------------------------------
SELECT * FROM person1
UNION
SELECT * FROM person2;

SELECT * FROM person1
UNION ALL
SELECT * FROM person2;

SELECT * FROM person1
INTERSECT
SELECT * FROM person2;

SELECT * FROM person1
EXCEPT
SELECT * FROM person2;


SELECT * FROM sql_cx_live .membership t1
RIGHT JOIN sql_cx_live.users t2
ON t1.user_id = t2.user_id
UNION
SELECT * FROM sql_cx_live .membership t1
LEFT JOIN sql_cx_live.users t2
ON t1.user_id = t2.user_id;

-- SELF Joins
SELECT * FROM users t1
JOIN users t2
ON t1.emergency_contact = t2.user_id;


SELECT * FROM students t1
JOIN class t2
ON t1.class_id = t2.class_id 
AND t1.enrollment_year=t2.class_year;

-- 1 Find order name and corresponding category name
SELECT t1.order_id,t1.amount,t1.profit,t3.name,t2.order_date FROM order_details t1
JOIN orders t2
ON t1.order_id = t2.order_id
JOIN users t3
ON t2.user_id = t3.user_id;

-- Find order_id, name and city by joining users and orders

SELECT t1.order_id,t2.name,t2.city
FROM orders t1
JOIN users t2
ON t1.user_id = t2.user_id;

-- Find order_id,product categoru by joining order_details and categoty

SELECT t1.order_id,t2.vertical
FROM order_details t1
JOIN  category t2
ON t1.category_id = t2.category_id;

-- Find all orders placed in pune
SELECT * FROM orders t1
JOIN users t2
ON t1.user_id = t2.user_id
WHERE t2.city = 'Pune' AND t2.name ='Sarita';

-- FIND ALL orders under Chairs category
-- Find all profitable orders
SELECT t1.order_id,SUM(t2.profit) FROM orders t1
JOIN order_details t2
ON t1.order_id = t2.order_id
GROUP BY t1.order_id
HAVING SUM(t2.profit) > 0;


-- Find the customer who has placed the max number of orders

SELECT name,COUNT(*) AS 'num_orders'FROM orders t1
JOIN users t2
ON t1.user_id = t2.user_id
GROUP BY t2.name
ORDER BY num_orders DESC LIMIT 1;

-- Which is the most profitable category 
SELECT t2.vertical,sum(profit)  FROM order_details t1
JOIN category t2
ON t1.category_id = t2.category_id
GROUP BY t2.vertical
ORDER BY  sum(profit) DESC LIMIT 1;

-- Which is the most profitable state 
SELECT state,SUM(profit) FROM orders t1
JOIN order_details t2
ON t1.order_id =t2.order_id
JOIN users t3
ON t1.user_id = t3.user_id
GROUP BY state 
ORDER BY  SUM(profit) DESC LIMIT 1


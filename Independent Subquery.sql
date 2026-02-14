-- Independent Subquery - Row Subquery(One Col Multi Rows)
CREATE DATABASE zomato;
USE zomato;
-- 1. Find all users who never ordered.
SELECT * FROM users
WHERE user_id NOT IN (SELECT DISTINCT( user_id) FROM orders);

-- 2. Find all the movies made by top 3 directors(in terms of total gross income)
USE sql_cx_live;

WITH top_directors AS (
SELECT director
FROM movies
GROUP BY director
ORDER BY SUM(gross) DESC
LIMIT 3)

SELECT * FROM movies
WHERE director IN (SELECT * FROM top_ directors);

/*Find all movies of all those actors whose filmography's avg rating > 8.5(take
25000 votes as cutoff)*/
USE sql_cx_live;

SELECT * FROM movies
WHERE star IN (SELECT star FROM movies
WHERE votes > 25000
GROUP BY star
HAVING AVG(score) > 8.5);








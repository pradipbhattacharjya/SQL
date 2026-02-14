-- Subqueries in SQL

-- Find the movie with highest rating
SELECT * FROM movies;
SELECT * FROM movies
WHERE score = (SELECT MAX(score) FROM  movies);


-- 1. Find the movie with highest profit(vs order by)

SELECT * FROM movies
WHERE (gross - budget) = (SELECT MAX(gross - budget)
									FROM movies);
                                    
SELECT * FROM movies
ORDER BY (gross - budget) DESC LIMIT 1;

/*2 Find how many movies a rating > the avg of all the movie
 ratings(Find the count of above average movies)*/
 
 
SELECT COUNT(*) FROM movies
WHERE score > (SELECT AVG(score) FROM movies);

-- 3. Find the highest rated movie of 2000
SELECT * FROM movies
WHERE year = 2000 AND score =(SELECT MAX(score)
								FROM movies
                                WHERE year = 2000);


/* 4.Find the highest rated movie among all movies whose number of votes are >
the dataset avg votes */
SELECT * FROM movies
WHERE score =(SELECT MAX(score) FROM movies
WHERE votes > (SELECT AVG(votes) FROM movies));



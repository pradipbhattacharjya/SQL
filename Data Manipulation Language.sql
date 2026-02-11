CREATE DATABASE campusx;

CREATE TABLE users(
	user_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
    );
    
SELECT * FROM users;

INSERT INTO users (user_id,name,email,password)
VALUE (NULL, 'nitish','nitish@gmail.com', '1234');

INSERT INTO users
VALUE (NULL, 'ankit','ankit@gmail.com', '1234');

INSERT INTO users(name,email)
VALUE ('amit','amit@gmail.com');

INSERT INTO users
VALUES
(NULL,'rishabh','rishabh@gmail.com','12345'),
(NULL,'rohan','rohan@gmail.com','12345'),
(NULL,'rahul','rahul@gmail.com','12345');

SELECT * FROM smartphones;

SELECT model,price,rating FROM smartphones;

SELECT model,battery_capacity AS 'MAH',os AS 'Operating_System' FROM smartphones;

SELECT model,
SQRT(resolution_width*resolution_width + resolution_height*resolution_height) / screen_size AS PPI
FROM smartphones;

SELECT model,rating/10 FROM smartphones;

SELECT model, 'smartphone' AS 'type' FROM smartphones;

SELECT DISTINCT(brand_name) AS 'All brands' FROM smartphones;

SELECT DISTINCT(Processor_brand) AS 'All_processors'
FROM smartphones;

SELECT DISTINCT(os) AS 'All_processors'
FROM smartphones;

SELECT DISTINCT brand_name,processor_brand FROM smartphones;

SELECT * FROM smartphones
WHERE brand_name = 'samsung';

SELECT * FROM smartphones
WHERE price > 100000;

-- find all phones in the price range of 10000 and 20000

SELECT * FROM smartphones
WHERE price > 10000 AND price <  20000;

-- or

 SELECT * FROM smartphones
 WHERE price BETWEEN 10000 AND 20000;

SELECT * FROM smartphones
WHERE price > 25000 AND rating > 80;

-- find phones with rating > 80 and price < 25000

SELECT * FROM smartphones
WHERE price < 15000 AND rating > 80 AND processor_brand = 'snapdragon';

-- find all samsung phones with ram >8GB

SELECT * FROM smartphones
WHERE brand_name = 'samsung' AND ram_capacity > 8;

-- find all samsung phones with snapdragon processor
SELECT * FROM smartphones
WHERE brand_name = 'samsung' AND processor_brand ='snapdragan processor';

-- find brands who sell phones with price > 50000
SELECT DISTINCT(brand_name) FROM smartphones
WHERE price > 50000;

-- IN OR NOT

SELECT * FROM smartphones
WHERE processor_brand = 'snapdragoh' or
processor_brand = 'exynos' OR 
processor_brand = 'bionic';

SELECT * FROM smartphones 
WHERE processor_brand IN ('snapdragon','exynos','bionic','dimension');

UPDATE smartphones
SET processor_brand = 'dimensity'
WHERE processor_brand = 'mediatek';

SELECT * FROM smartphones
WHERE processor_brand ='mediatek';

SELECT * FROM users;

UPDATE users
SET email = 'nitish@yahoo.com.com',password ='123456'
WHERE name ='nitish';

SELECT * FROM smartphones
WHERE price > 200000;
DELETE FROM smartphones
WHERE price > 200000;

SELECT * FROM smartphones
WHERE battery_capacity > 70000;

SELECT * FROM smartphones;

DELETE FROM smartphones
WHERE primary_camera_rear >150 AND brand_name = 'samsung';

SELECT * FROM smartphones
WHERE primary_camera_rear >150 AND brand_name = 'samsung';

-- Functions
-- Aggregate Functions
-- Find the minimum and maximum price
SELECT MAX(price) FROM smartphones;

SELECT MAX(ram_capacity) FROM smartphones
WHERE brand_name = 'samsung' AND price = 163980;

SELECT AVG(rating) FROM smartphones
WHERE brand_name = 'xiaomi';

SELECT SUM(price) FROM smartphones;

SELECT COUNT(*) FROM smartphones
WHERE brand_name = 'oneplus';

SELECT COUNT(DISTINCT(brand_name)) FROM smartphones;

SELECT VARIANCE(screen_size) FROM smartphones;

SELECT model,
ROUND(SQRT(resoluution_width*resolution_width + resolution_height*resolution_height)/screen_sizze,2) AS 'ppi';


SELECT CEIL(screen_size) FROM smartphones


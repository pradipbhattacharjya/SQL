-- SQL Grouping and Sorting
-- find top 5 samsung phones with biggest screen size
SELECT model,screen_size FROM smartphones
WHERE brand_name = 'samsung'
ORDER BY screen_size DESC LIMIT 5;

-- sort all the phone with in decending order of number of total cameras
SELECT model, num_front_cameras + num_rear_cameras AS 'total_cameras' FROM  smartphones
ORDER BY total_cameras DESC;

-- Sort data on the basis of ppi in decreasing order
SELECT model,
SQRT((resolution_width*resolution_width + resolution_height*resolution_height)/screen_size) AS 'ppi'
FROM smartphones
ORDER BY PPI ASC;

-- fIND THE PHONE 2ND LARGEST BATTERY

SELECT model,battery_capacity
FROM smartphones
ORDER BY battery_capacity DESC LIMIT 1,1;

-- Find the name and rating of the worst rated aoole phone
SELECT model,rating
FROM smartphones
WHERE brand_name = 'apple'
ORDER BY rating ASC LIMIT 1;

-- GROUPING DATA
-- 1.Group smartphones by brand and get the count, average price, max rating, avg screen size, and avg battery capacity
SELECT brand_name,COUNT(*) AS 'num_phones',
ROUND(AVG(price)) AS 'avg_price',
MAX(rating) AS 'max_rating',
ROUND(AVG(battery_capacity)) AS 'avg battery capacity',
ROUND(AVG(screen_size),2) AS 'avg screen size'
FROM smartphones
GROUP BY brand_name
ORDER BY num_phones DESC LIMIT 5;

-- Group smartphones by whether they have an NFC and get the average price and rating Avg price of 5g phones vs avg price of non 5g phones
SELECT has_nfc,
AVG(price) AS 'avg price',
AVG(rating) AS 'rating'
FROM smartphones
GROUP BY has_nfc;

-- Group smartphones by the extended memory available and get the average price

SELECT extended_memory_available,
AVG(price) AS 'avg price',
AVG(rating) AS 'rating'
FROM smartphones
GROUP BY extended_memory_available;

-- Group smartphones by the brand, and find the brand with the highest number of models that have both NFC and an IR blaster
SELECT brand_name,
processor_brand,
COUNT(*) AS 'num phones',
AVG(primary_camera_rear) AS 'avg camera resolution'
FROM  smartphones
GROUP BY brand_name,processor_brand;

--  Find the top 5 most costly phone brands
SELECT brand_name, AVG(price) AS 'avg_price'
FROM smartphones
GROUP BY brand_name
ORDER BY avg_price DESC LIMIT 5;


SELECT brand_name, ROUND(AVG(price)) AS 'avg_screen_size'
FROM smartphones
GROUP BY brand_name
ORDER BY avg_screen_size DESC LIMIT 1;

-- Group smartphones by the brand, and find the brand with the highest number of models that have both NFC and an IR blaster

SELECT brand_name, COUNT(*) AS 'count'
FROM smartphones
WHERE has_nfc ='True' AND has_ir_blaster = 'True'
GROUP BY brand_name
ORDER BY count DESC LIMIT 1;

-- Find all Samsung 5g enabled smartphones and find out the avg price for NFC and Non-NFC phones
SELECT has_nfc, AVG(price) AS 'avg_price'
FROM smartphones
WHERE brand_name = 'samsung'
GROUP BY has_nfc;

SELECT COUNT(*)FROM ipl;

--  Having clause
-- Costliest Brand which has at least 20 phones
SELECT brand_name,
COUNT(*) AS 'count',
AVG(rating) AS 'avg_rating'
FROM smartphones
GROUP BY brand_name
HAVING count > 20
ORDER BY avg_rating DESC;

-- Find the top 3 brands with the highest avg ram that has a refresh rate of at least 90 Hz and fast charging available and don't consider brands that have less than 10 phones

SELECT brand_name,
AVG(ram_capacity) AS 'avg_ram'
FROM smartphones
WHERE refresh_rate > 90 AND fast_charging_available = 1
GROUP BY brand_name
HAVING COUNT(*) > 10
ORDER BY 'avg_ram' DESC LIMIT 3;

-- Find the avg price of all the phone brands with avg rating of 70 and num_phones more than 10 among all 5g enabled phones
SELECT brand_name, AVG(price) AS 'avg_price'
FROM smartphones
WHERE has_5g = 'True'
GROUP BY brand_name
HAVING AVG(rating) > 70 AND COUNT(*) > 10;

SELECT * FROM ipl;
-- find the top 5 batsmen in IPL
SELECT batter,SUM(batsman_run) AS 'runs'
FROM ipl
GROUP BY batter
ORDER BY runs DESC limit 5;

-- find the 2nd highest 6 hitters in IPL
SELECT batter,COUNT(*) AS 'num_sixes'
FROM ipl
WHERE batsman_run = 6
GROUP BY batter
ORDER BY num_sixes DESC LIMIT 1,1;

-- Find Virat Kohli's performance against all IPL teams [info not available- bowling team]
SELECT batter, ID,SUM(batsman_run) AS 'score'
FROM ipl
GROUP BY batter, ID 
HAVING score >= 100
ORDER BY batter DESC;







--SQL String Functions
--CONCAT
-- Concatenate first name and country into one column
SELECT
	first_name,
	country,
	CONCAT(first_name,'_',country) AS name_country
FROM customers;

-- LOWER & UPPER
-- Transfrom the customer's first name to lowercase
SELECT
	LOWER(first_name) AS low_name
FROM customers;

--Convert the first name to uppercase
SELECT
	UPPER(first_name) AS upper_name
FROM customers;

--TRIM 
-- Find customers whose first name contains leading or trailing spaces
SELECT
	first_name,
	LEN(first_name) len_name,
	LEN(TRIM(first_name)) len_trim_name
FROM customers
WHERE first_name != TRIM(first_name);

-- REPLACE
-- Remove dashes (-) from a phone number
SELECT
'123-456-7890'AS phone,
REPLACE('123-456-7890', '-','') AS Clean_phone;

--Replace File Extence from txt to csv
SELECT
	'report.txt' AS old_filename,
	REPLACE('report.txt','.txt','.csv') AS new_filename;

--LEN
--Calculate the length of each customer's first name
SELECT
	first_name,
	LEN(first_name) AS len_name
FROM customers;

--LEFT & RIGHT
--Retrive the first two characters of each first name
SELECT
	first_name,
	LEFT(TRIM(first_name),2) first_2_char
FROM customers;

--Retrieve the last two characters of each first name
SELECT
	first_name,
	LEFT(TRIM(first_name),2) first_2_char,
	RIGHT(first_name,2) last_2_char
FROM customers;

--SUBSTRING
-- Retrive a list of customers'first names removing the first character
SELECT
	first_name,
	SUBSTRING(TRIM(first_name),2,LEN(first_name)) AS sub_name
FROM customers;


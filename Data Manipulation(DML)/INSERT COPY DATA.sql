--INSERT COPY DATA
--Copy data from'customers' table into 'persons'
INSERT INTO persons (id, person_name, birth_date, phone)
SELECT 
id,
first_name,
NULL,
'Unknown'
FROM customers

SELECT * FROM persons
--Data Manipulation(DML)
--INSERT DATA
INSERT INTO customers(id,first_name,country,score)
VALUES 
(6, 'Anna','USA',NULL),
(7, 'Sam', NULL, 100)

SELECT * FROM customers;

INSERT INTO customers(id,first_name,country,score)
VALUES 
	(8,'USA', 'Max', NULL)

INSERT INTO customers
VALUES
	(9, 'Andreas','Germany', NULL)


INSERT INTO customers(id,first_name)
VALUES
	(10, 'Sahra')

SELECT * FROM customers
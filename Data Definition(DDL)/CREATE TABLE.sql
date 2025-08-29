--Data Definition(DDL)
/*Create a new table called persons 
with columns: id,person_name,birth_date, and phone*/

CREATE TABLE persons(
	id INT NOT NULL,
	person_name VARCHAR(50),
	birth_date DATE,
	phone VARCHAR(15) NOT NULL,
	CONSTRAINT pk_persons PRIMARY KEY (id)

)

SELECT * FROM persons;
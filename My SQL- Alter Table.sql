#Add a Column to an Existing Table

alter table employees
add column phone_number varchar(25);

SELECT * FROM employees;

#Adding multiple columns
alter table employees
add column middle_name varchar(25),
add column date_of_birth Date;

select * from employees;

##modify/alter the column

alter table employees
modify column phone_number varchar(20);

#changing the datatype
alter table employees
modify column Salary int;
insert into employees value(5,'pradip',Null,'pradipbhattacharjya@gmail.com',null,55000,9889999,'c','1997-08-09');

## Rename the colum
alter table employees
change column middle_name middleName varbinary(25);

select * from employees;

# alter table drop column

alter table employees
drop column date_of_birth ;

alter table employees
drop column phone_number,
drop column middleName;



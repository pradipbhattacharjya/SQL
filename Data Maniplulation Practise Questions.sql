##Data Manipulation Excercises and Practise
use companysdb;
create table customer_info(
	id int auto_increment primary key,
    first_name varchar(25),
    last_name varchar(25),
    salary integer
);


#insert into customer_info table
insert into customer_info(first_name, last_name,salary)
values
("Krish","Naik",50000);

insert into customer_info(first_name, last_name,salary)
values
("Darius","N",50000),
("Mahendra","B",50000),
("Ankit","Sharma",Null);

select * from customer_info;

## get the records of the customers who salary is missing

select first_name,last_name from customer_info where salary is null;

select first_name,last_name from customer_info where salary is not null;

## sql update statement to replace null values
update customer_info set salary=60000
where id= 4;

select * from customer_info;

## delete
delete from customer_info
where id = 3;

select * from customer_info;

## Alter Mysql
##Add column
alter table customer_info
add column dob Date;

# add multiple columns
alter table customer_info
add column email varbinary(25),
add column address varbinary(25);

select * from customer_info;

##see the chema of the table
desc customer_info;
##Modify the column
alter table customer_info
modify address varchar(30);

## drop a column
alter table customer_info drop column email;

select * from customer_info;


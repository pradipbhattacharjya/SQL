create database companysdb;
use companysdb;
create table employees(
EmployeeId int,
FirstName varchar(25),
LastName varchar(25),
Email varchar(100),
HireDate date,
Salary decimal(10,2)
);

##Insert some data in the table Employees

INSERT INTO employees(EmployeeId,FirstName,LastName,Email,HireDate,Salary)
VALUES
(1, 'John','Doe','john.doe@gmailcom','2020-10-15',60000.00),
(2, 'Jane','Smith','janesmith@gmail.com','2019-03-22',74000.00),
(3, 'Alice','Johnson','alice.jhohnson@gmail.com','2021-05-11',78000.00),
(4,  'Bob','Brown','bob.brown@example.com','2018-11-12',65000.00);

## Retireve the records
SELECT * FROM employees;

insert into employees values(5,'krish',Null,'krish06@gmail.com',null,55000.00);
## Retrieve records which are having null values
SELECT * FROM employees where LastName is null;
SELECT * FROM employees where LastName is null or HireDate is null;

##Mysql update Statement
update employees
set LastName='Das'
where employeeID=5;

select * from employees;

#updating a single Record
update employees  
set Salary=Salary +10000
Where employeeId=5;

select * from employees;

## Delete query- Remove records from a table

select * from employees;

## Deleting a single record
delete from Employees
where EmployeeID=1;

## Deleting Multiple Records
Delete from Employees
where salary<66000;

select * from employees;



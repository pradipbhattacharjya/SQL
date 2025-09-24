/*
Assignment
Create Your Own Database and Tables:

Task: Create a database named CompanyDB and 
tables Employees and Departments without any constraints.*/

CREATE DATABASE CompanyDB;

use companydb;

create table Employees(
	Employeeid int,
    EmployeeName varchar(25),
    salari int
);

create table Departments(
Departmentsid int,
tipe varchar(1),
cradit int
);

insert into employees(Employeeid,EmployeeName, salari)
values
(01,'pradipbhattacharjya',8000000),
(02,'subhabhattacharjya',8000000);

SELECT * FROM employees;

insert into departments(Departmentsid,tipe,cradit)
values
(101,'A',3),
(102,'A',3);

SELECT * FROM departments;
SHOW tables;

DROP table employees;
drop table Departments;
DROP DATABASE CompanyDB ;

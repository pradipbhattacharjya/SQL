##Create the database

CREATE DATABASE LibraryDb;

create database ecommercedb;

#MYSQL Create table without constraints

use librarydb;

create table Books(
BookID int,
Title varchar(25),
Author varchar(25),
Genre varchar(25),
PublicationYear INT
);

show databases;

SELECT * FROM Books;

## Insert data into table
insert into books(BookID,Title,Author,Genre,PublicationYear)
values
(1,"Twilight","KN","Romantic",2020),
(2,"Harry Potter","ALAS","scifi",2018);

## Drop the table
drop table books;
#Drop database ecommercedb;
drop database ecommercedb;

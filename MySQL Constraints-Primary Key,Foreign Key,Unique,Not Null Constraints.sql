use librarydb;

##primary key: Uniquely identifies each record in a table.
create table authors(
 Authorsid int primary key,
 Firstname varchar(25),
 Lastname varchar(25),
 email varchar(25)
);
insert into authors(Authorsid,Firstname,Lastname,email)
values
(1,"Krish","Naik","exmaple@gmail.com");

insert into authors(Authorsid,Firstname,Lastname,email)
values
(2,"Krish1","Naik1","exmaple1@gmail.com");

select * from authors;

desc authors;

## drop table authors;
drop table authors;

select * from authors where  Authorsid=1;
## Foreign Key:

create table books(
Bookid int primary key,
Title varchar(25) not null,
Authorsid int,
publicationyear int check (publicationyear>0),
Foreign key (Authorsid) references authors(Authorsid)
);

desc books;
select * from authors;
insert into books value(1,"Harry potter",1,2022);
insert into books value(2,"Harry potter2",2,2022);
insert into books value(3,"Harry potter3",null,2022);

select * from books;

##not null,unique
create table student(
	id int not null,
    first_name varchar(25),
    last_name varchar(25) not null,
    age int
);

desc student;

alter table student
modify age int not null;

## add primary key as a constraint
alter table student
modify id  int not null primary key;
##drop a primary key constraint
alter table student
drop primary key;

##Unique
create table person(
	id int auto_increment not null primary key,
    first_name varchar(25) not null, 
    last_name varchar(25) unique,
    age int not null
);

desc person;
insert into person values(1,"Krish","Naik",32);

select * from person;



#Default:Provides a default value for a column when none is spaecified during insetion.

create table members(
	id int Primary key,
    first_name varchar(25) not null,
    last_name varchar(25) not null,
    email varchar(25) unique,
    salary int default 22000
);
desc members;

insert into members(id,first_name,last_name,email)
values
(1,"Krish","Naik","example@exmaple.com");

select * from members;

##Index : Improves the sapeed of data retrieval operation on a table

create index idx_firstname on members(first_name);

select * from members where first_name='Krish';

desc members;

## Composite Key:

create table enrollment(
	studentid int,
    courseid int,
    enrollmentdate date,
    primary key(studentid,courseid)
    
);

desc enrollment;

insert into enrollment value(1,1,"2024-09-09");
select * from enrollment;

insert into enrollment value(1,2,"2024-09-10");





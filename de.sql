show databases

create database de_project;

use de_project;

create table test(sno int, name varchar(100));

select * from test;

insert into test(sno,name) values (1,'gowtham');

insert into test(sno,name) values (2,'nandhini');

update test set name='sbgowtham' where sno=1;

update test set name='sbgowtham', sno=3 where sno=1;

select * from test;

drop table test;

delete from test where sno=3;

truncate table test;

create table employees(
employee_id int primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
hire_date date not null,
salary decimal(10,2));


create table high_paid_employees as
select
employee_id,
first_name,
last_name,
salary
from employees
where salary > 60000;

create temporary table temp_high_paid_employees(
employee_id int,
salary decimal(10,2)
);

desc employees;

alter table employees
add email varchar(100);

alter table employees drop column last_name;

alter table employees remane to emp_123;

create database uber;

use uber;

create table rides(
ride_id int,
driver_id int,
rider_id int,
pickup_location varchar(100),
dropoff_location varchar(100),
ride_date datetime,
fare decimal(10,2)
);

insert into rides(ride_id,driver_id,rider_id,pickup_location,dropoff_location,ride_date,fare)
values
(1,101,201,'Chennai','Coimbatore','2024-12-29 08:00:00',500.00),
(2,102,202,'Bangalore','Hyderabad','2024-12-29 10:00:00',800.00),
(3,103,203,'Chennai','Madurai','2024-12-29 12:00:00',400.00),
(4,104,204,'Coimbatore','Chennai','2024-12-29 14:00:00',600.00),
(5,105,205,'Bangalore','Coimbatore','2024-12-29 16:00:00',700.00);

select * from uber.rides;

select * from uber.rides where fare > '500';

desc rides;

select * from uber.rides where fare > '500' order by fare desc;

select * from uber.rides where fare > '500' order by fare asc;

select * from uber.rides where fare > '500'and dropoff_location ='chennai' order by fare;

drop table rides;

create table rides(
ride_id int primary key,
driver_id int not null,
rider_id int not null,
pickup_location varchar(100) not null,
dropoff_location varchar(100) not null,
ride_date datetime not null,
fare decimal(10,2) not null
);

insert into rides(ride_id,driver_id,rider_id,pickup_location,dropoff_location,ride_date,fare)
values
(1,101,201,'Chennai','Coimbatore','2024-12-29 08:00:00',500.00);

select * from rides;

insert into rides(ride_id,driver_id,rider_id,pickup_location,dropoff_location,ride_date,fare)
values
(1,101,201,'Chennai','Coimbatore','2024-12-29 08:00:00',500.00);

create table rides(
ride_id int ,
driver_id int not null,
rider_id int not null,
pickup_location varchar(100) not null,
dropoff_location varchar(100) not null,
ride_date datetime not null,
fare decimal(10,2) not null,
primary key(ride_id,rider_id)
);

desc rides;

select * from rides;

insert into rides(ride_id,driver_id,rider_id,pickup_location,dropoff_location,ride_date,fare)
values
(1,101,201,'Chennai','Coimbatore','2024-12-29 08:00:00',500.00);

select * from rides;

insert into rides(ride_id,driver_id,rider_id,pickup_location,dropoff_location,ride_date,fare)
values
(1,101,202,'Chennai','Coimbatore','2024-12-29 08:00:00',500.00);

select * from rides;

insert into rides(ride_id,driver_id,rider_id,pickup_location,dropoff_location,ride_date,fare)
values
(2,101,202,'Chennai','Coimbatore','2024-12-29 08:00:00',500.00);

select * from rides;

create table users(
user_id int primary key,
email varchar(100) unique
);

insert into users (user_id, email) values (1,'user1@example.com');

select * from users;

desc users;

insert into users (user_id, email) values (2,'user2@example.com');

insert into users (user_id, email) values (3,null);

insert into users (user_id, email) values (null,'abc@gmail.com');

insert into users (user_id, email) values (4,'user2@example.com');

insert into users (user_id, email) values (4,null);

drop table rides;

create table rides(
ride_id int primary key,
driver_id int not null,
rider_id int,
pickup_location varchar(100) not null,
dropoff_location varchar(100) not null,
ride_date datetime not null,
fare decimal(10,2) not null
);

desc rides;

insert into rides(ride_id,driver_id,rider_id,pickup_location,dropoff_location,ride_date,fare)
values
(3,103,NULL,'Coimbatore','Chennai','2024-12-29 14:00:00',600.00);

insert into rides(ride_id,driver_id,rider_id,pickup_location,dropoff_location,ride_date,fare)
values
(4,103,NULL,null,'Chennai','2024-12-29 14:00:00',600.00);

insert into rides(ride_id,driver_id,rider_id,pickup_location,dropoff_location,ride_date,fare)
values
(3,103,NULL,'Karur','Chennai','2024-12-29 14:00:00',600.00);

drop table rides;

create table rides(
ride_id int primary key,
driver_id int not null,
rider_id int not null,
pickup_location varchar(100) not null,
dropoff_location varchar(100) not null,
ride_date datetime not null,
fare decimal(10,2) check (fare>0)
);

insert into rides(ride_id,driver_id,rider_id,pickup_location,dropoff_location,ride_date,fare)
values
(1,101,201,'Chennai','Coimbatore','2024-12-29 08:00:00',500.00);

select * from rides;

insert into rides(ride_id,driver_id,rider_id,pickup_location,dropoff_location,ride_date,fare)
values
(1,101,201,'Chennai','Coimbatore','2024-12-29 08:00:00',-100.00);

drop table if exists rides;
drop table if exists drivers;

create table drivers(
driver_id int primary key,
driver_name varchar(100),
license_number varchar(50) unique
);

create table rides(
ride_id int primary key,
driver_id int not null,
rider_id int not null,
pickup_location varchar(100),
dropoff_location varchar(100),
ride_date datetime,
fare decimal(10,2),
foreign key(driver_id) references drivers(driver_id)
);

desc drivers;

desc rides;

insert into drivers(driver_id, driver_name, license_number)
values
(101,'John Doe','XYZ12345'),
(102,'Jane Smith','ABC67890');

insert into rides(ride_id,driver_id,rider_id,pickup_location,dropoff_location,ride_date,fare)
values
(1,101,201,'Chennai','Coimbatore','2024-12-29 08:00:00',500.00),
(2,102,202,'Bangalore','Hyderabad','2024-12-29 10:00:00',800.00),
(3,103,203,'Chennai','Madurai','2024-12-29 12:00:00',400.00);


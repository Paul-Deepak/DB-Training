-- database creation
create database studentDB;
use studentDB;
rename database studentDB to studentDb1;

-- DDL COMMANDS:
-- table creation
create table student_details(stud_id int unique not null,stud_name varchar(20));
create table student_address(stud_id int,street varchar(20),state varchar(30),pincode int);
-- delete table
drop table student_details;
-- alter table
alter table student_details add age int;
alter table student_details add phoneNo varchar(10) first;
alter table student_details drop column phoneNo;
alter table student_details add phoneNo varchar(10) after stud_id;
ALTER TABLE student_details RENAME COLUMN phoneNo TO contactNo;
ALTER TABLE student_details RENAME TO student_details_main;  
-- truncate table:
truncate table student_details;


-- DML COMMANDS:
-- row insertion
insert into student_details(stud_id,stud_name)values('1','paul');
insert into student_details(stud_id,stud_name)values('4','deepak');
insert into student_address values('1','1st street','tamilnadu','641103');
insert into student_address(stud_id,street,state,pincode) values('2','2nd street','tamilnadu','641123');

select * from  student_address;
select * from student_details;

-- row updation
update student_address set street='3rd street', state='kerala' where stud_id='2';

-- row deletion
delete from student_address where stud_id='1';

-- TASK-1 (Using insert into select)
create table stud1(name varchar(20),age int,roll_no int);
create table stud2(name varchar(20),age int,roll_no int);
insert into stud1 values('Abc',18,123);
INSERT INTO stud2 (name, age, roll_no)
SELECT name, age, roll_no FROM stud1
WHERE name='ABC';
select * from stud2;

-- primary key & foreign key
create table employee_details(emp_id int primary key not null,emp_name varchar(20),emp_phoneNo varchar(10),emp_DOB date);
alter table employee_details drop primary key;
alter table employee_details add primary key (emp_id);
delete from employee_details;
insert into employee_details values(1,'arun','1234567890','2023-03-04');
select * from employee_details;
create table employee_teamlist(
    teamID int NOT NULL,
    OrderNumber int NOT NULL,
    empID int,
    PRIMARY KEY (teamID),
    FOREIGN KEY (empID) REFERENCES employee_details(emp_ID)
);
ALTER TABLE employee_teamlist ADD FOREIGN KEY (empID) REFERENCES employee_details(emp_ID);
select * from employee_teamlist;

-- case
SELECT stud_Name, stud_id
FROM student_details
ORDER BY
(CASE
    WHEN age IS NULL THEN stud_name
    ELSE stud_id
END);
insert into employee_details values(5,'arun','1234567890','2023-03-04');

select * from employee_details order by emp_name asc, emp_id desc;

-- task 2:
create table sampletable(id int, name varchar(20));
insert into sampletable values(101,'ajay'),(102,'ajay'),(103,'ajay'),(104,'sanjay'),(105,'vijay'),(106,'ajay');
select name,count(id) as 'No of occurences' from sampletable group by name having count(id)>1;

select name from sampletable where id in ('101','105');

-- Task3:
create table people(name varchar(20),id int);
create table contacts(id int,phoneNo varchar(10));
insert into people values('paul',101),('deepak',102),('vj',103);
insert into contacts values(101,'12345'),(111,'12345'),(121,'12345');
select name from people where id in(select id from contacts);

select id from people where id > ANY(SELECT id from contacts);
select id from people where id > ALL(SELECT id from contacts);

select * from people where name like 'd%';
alter table people MODIFY COLUMN id INT AUTO_INCREMENT PRIMARY KEY;




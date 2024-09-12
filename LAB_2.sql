create database universityDB;
use universityDB;
create table student(stu_id varchar(255),stu_name varchar(255),stu_dept varchar(255),phoneNumber varchar(255),DOB varchar (255),address varchar (255),fathers_name varchar (255),mothers_name varchar (255));
insert into student(stu_id,stu_name,stu_dept,phoneNumber,DOB,address,fathers_name,mothers_name)values('1','aman sharma','computer science','3564789455','15-04-2001','21 mg road,delhi','rajesh sharma','sunita sharma');
insert into student(stu_id,stu_name,stu_dept,phoneNumber,DOB,address,fathers_name,mothers_name)values('2','priya patel','mechanical','3564736966','10-12-2000','50 nehru street , mumbai','anil patel','meena patel');
insert into student(stu_id,stu_name,stu_dept,phoneNumber,DOB,address,fathers_name,mothers_name)values('3','ravi kumar','electrical','3564789455','22-07-1999','18 park avenue , bengaluru','suresh kumar','lakshmi kumar');
select * from student;


create table faculty(f_id varchar(255),f_name varchar(255));
insert into faculty(f_id,f_name)values('1','Dr. sunil gupta');
insert into faculty(f_id,f_name)values('2','prof. meena joshi');
insert into faculty(f_id,f_name)values('3','Dr. anil verma');
select *from faculty;


create table admin(s_id varchar(255),s_name varchar(255),fee varchar (255));
insert into admin(s_id,s_name,fee)values('1','arjun singh','18000');
insert into admin(s_id,s_name,fee)values('2','rekha yadav','20000');
insert into admin(s_id,s_name,fee)values('3','vikram mehta','22000');
select *from admin;


create table hostel(s_id varchar(255),hostel_num varchar(255));
insert into hostel(s_id,hostel_num)values('1','201');
insert into hostel(s_id,hostel_num)values('2','202');
insert into hostel(s_id,hostel_num)values('3','203');
select *from hostel;



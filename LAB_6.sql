USE manit;
create table customer(customerid int auto_increment primary key ,customername varchar(255),contactname varchar(255),country varchar(255));
insert into customer(customername,contactname,country)values
("Alfreds Futterkiste", "Maria Anders", "Germany"),
("Ana Trujillo Emparedados y helados ","Ana Trujillo", "Mexico"),
("Antonio Moreno Taquería", "Antonio Moreno", "Mexico");
select * from customer;
SELECT * FROM Customers ORDER BY Country, CustomerName;
SELECT * FROM Customers ORDER BY Country ASC, CustomerName DESC;



create table SalaryDetails (
SID int primary key,
PersonName Varchar(100),
PersonAge int ,
Salary int
);

insert into SalaryDetails (SID,PersonName,PersonAge,Salary) values (1,'Amit',24,25000);
insert into SalaryDetails (SID,PersonName,PersonAge,Salary) values (2,'Nitin',22,22000);
insert into SalaryDetails (SID,PersonName,PersonAge,Salary) values (3,'Aditya',25,15000);
insert into SalaryDetails (SID,PersonName,PersonAge,Salary) values (4,'Nitin',22,22000);
insert into SalaryDetails (SID,PersonName,PersonAge,Salary) values (5,'Amit',24,25000);

select * from SalaryDetails;
select PersonName,sum(Salary) from SalaryDetails group by PersonName;
select PersonName,sum(Salary) from SalaryDetails group by PersonName having sum(Salary)>40000;

create table branch (account_id int auto_increment unique,balance float, branch_name varchar(255));
insert into branch (balance,branch_name)values(1500.00,'mp nagar'),
(2500.00,'mp nagar'),
(3000.00,'mp nagar'),
(1800.00,'new market'),
(2200.00,'new market'),
(2600.00,'bhopal'),
(1700.00,'bhopal'),
(1900.00,'mp nagar'),
(2000.00,'bhopal'),
(2400.00,'new market');
select * from branch ;
create table cust (customer_id int auto_increment unique,customer_name varchar(255));
insert into cust(customer_name) values('alice smith'),
('bob johnson'),
('charlie brown'),
('david white'),
('eve black'),
('frank green'),
('grace miller'),
('helen davis'),
('ivy wilson'),
('jack moore');
select * from cust;
select customer_name,account_id from cust,branch where account_id=customer_id;
create table depositor(customer_name varchar(255), account_id int auto_increment primary key);
insert into depositor(customer_name) values("Alice Smith"),("Bob Johnson"),("Charlie Brown"),("David White"),("Eve Black"),("Frank Green"),("Grace Miller"),("Helen Davis"),("Ivy Wilson"),("Jack Moore");
select * from depositor;


select avg(balance) from branch where branch_name="MP Nagar";
select count(*) from cust;
select count(distinct customer_name )from depositor;

create table Employee_ (
EmployeeID int auto_increment primary key,
EmployeeName varchar(100),
Salary int 
);

insert into Employee_ (EmployeeName,Salary) values ('Amit',802);
insert into Employee_ (EmployeeName,Salary) values ('Bharat',403);
insert into Employee_ (EmployeeName,Salary) values ('Chetna',604);
insert into Employee_ (EmployeeName,Salary) values ('Deepak',705);
insert into Employee_ (EmployeeName,Salary) values ('Eesha',606);
insert into Employee_ (EmployeeName,Salary) values ('Farooq',null);
SELECT * FROM EMPLOYEE_;

select count(*) from Employee_;
select count(Salary) from Employee_;
select count(Distinct Salary) from Employee_;
select sum(salary) from Employee_;
select avg(salary) from Employee_;
select min(salary) from Employee_;
select max(salary) from Employee_;

select branch_name, count(distinct customer_name) from  branch,cust
where cust.customer_id = branch.account_id
group by branch_name;


select branch_name, avg(balance) from branch
group by branch_name
having avg(balance)>1200;
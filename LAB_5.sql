--LAB 5

create database manit;
use manit;
create table Orders(OrderID INT PRIMARY KEY ,CustomerID INT,OrderDate Date);
insert into Orders values(10308,2,"1996-09-18");
insert into Orders values(10309,37,"1996-09-19");
insert into Orders values(10310,77,"1996-09-20");

create table Customers(CustomerID INT PRIMARY KEY ,CustomerName VARCHAR(250),ContactName VARCHAR(250),Country VARCHAR(50));
INSERT INTO Customers VALUES(1,"Alfreds Futterkiste" ,"Maria Anders","Germany");
INSERT INTO Customers VALUES(2,"Ana Trujillo Emparedados y helados" ,"Ana Tujillo","Mexico");
INSERT INTO Customers VALUES(3,"Antonio Moreno Taqueria" ,"Antonio Moreno","Mexico");
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

create table customer1(customerid int  primary key, customername varchar(255),
contactname varchar(255),address varchar (255),city varchar(255),postalcode bigint, country varchar(255));

insert into customer1 (customerid,customername ,
contactname ,address ,city ,postalcode, country )
values(1,'Alfreds Futterkiste','Maria Anders','Obere Str.57','Berlin',12209,'germany'),
(2,'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.',05021 ,'Mexico'),
(3,'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', 05023, 'Mexico');

create table Orders1(OrderID int primary key,CustomerID int,EmployeeID int,OrderDate date, ShipperID int);
INSERT INTO Orders1(OrderID, CustomerID, EmployeeID, OrderDate, ShipperID) VALUES(10308, 2, 7, '1996-09-18', 3),(10309, 37, 3, '1996-09-19', 1), (10310, 77, 8, '1996-09-20', 2);
Select customer1.customername,Orders1.OrderID From customer1 LEFT JOIN Orders1 ON customer1.CustomerID=Orders1.CustomerID;

create table order2(orderid bigint primary key,customerid int , employeeid int, orderdate date, shipperid int);
insert into order2 values(10308,2,7,'1996-09-18',3),
(10309,37,3,'1996-09-19',1),
(10310,77,8,'1996-09-20',2);

create table employee (employeeid int auto_increment primary key, lastname varchar(255), firstname varchar(255),birthdate date, photo varchar(255));
insert into employee (lastname,firstname,birthdate,photo) values('Davolio ','Nancy','1968-12-08','EmpID1.pic'),
('fuller','andrew','1952-02-19','EmpID2.pic'),
('Leverling', 'Janet','1963-08-30','EmpID3.pic');

select * from order2;
select * from employee;
SELECT order2.orderid, employee.lastname, employee.firstname
FROM order2
RIGHT JOIN employee ON order2.employeeid = employee.employeeid;



SELECT customer1.customername, orders1.orderid
FROM customer1
CROSS JOIN orders1;
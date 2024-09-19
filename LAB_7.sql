use manit;
create table Doctors (
DoctorID int auto_increment primary key,
FirstName varchar(50),
LastName varchar (50),
Speciality varchar (50),
PhoneNumber varchar (50)
);

insert into Doctors (FirstName,LastName,Speciality,PhoneNumber) values ('Arjun','Sharma','Cardiology','9876543210');
insert into Doctors (FirstName,LastName,Speciality,PhoneNumber) values ('Priya','Iyer','Neurology','9876543267');
insert into Doctors (FirstName,LastName,Speciality,PhoneNumber) values ('Rohit','Verma','Rheumatology','9876543281');
insert into Doctors (FirstName,LastName,Speciality,PhoneNumber) values ('Neha','Gupta','Pediatrics','9876543234');
insert into Doctors (FirstName,LastName,Speciality,PhoneNumber) values ('Amit','Joshi','Dermatology','9876543211');
insert into Doctors (FirstName,LastName,Speciality,PhoneNumber) values ('Anjali','Deshmukh','General Surgery','9879543210');

create table Patients (
PatientID int auto_increment primary key,
FirstName varchar(50),
LastName varchar(50),
Gender varchar(1),
DOB date,
ContactNumber varchar (50),
Address varchar(100)
);

insert into Patients (FirstName,LastName,Gender,DOB,ContactNumber,Address) values ('Ramesh','Kumar','M','1985-04-20','9876101234','15 MG Road, Delhi');
insert into Patients (FirstName,LastName,Gender,DOB,ContactNumber,Address) values ('Sunita','Yadav','F','1985-04-21','9876051234','32 Lajpat Nagar, Delhi');
insert into Patients (FirstName,LastName,Gender,DOB,ContactNumber,Address) values ('Aditi','Singh','F','1985-04-23','9876001434','8 Nehru Place, Mumbai');
insert into Patients (FirstName,LastName,Gender,DOB,ContactNumber,Address) values ('Vijay','Thakur','M','1985-04-10','9076001234','23 Vasant Kunj, Mumbai');
insert into Patients (FirstName,LastName,Gender,DOB,ContactNumber,Address) values ('Pooja','Nair','F','1985-04-29','9871001234','45 koregoan park, Pune');
insert into Patients (FirstName,LastName,Gender,DOB,ContactNumber,Address) values ('Suresh','Patil','M','1985-04-22','9476001234','16 Shivaji Park, Pune');
insert into Patients (FirstName,LastName,Gender,DOB,ContactNumber,Address) values ('Kavita','Menon','F','1985-04-19','9276001234','10 Nariman Point, Mumbai');
insert into Patients (FirstName,LastName,Gender,DOB,ContactNumber,Address) values ('Deepak','Reddy','M','1985-04-15','9376001234','75 Outer Ring Road, Bangalore');
insert into Patients (FirstName,LastName,Gender,DOB,ContactNumber,Address) values ('Meera','Das','F','1985-04-14','9876001134','42 Salt Lake Kolkata');
insert into Patients (FirstName,LastName,Gender,DOB,ContactNumber,Address) values ('Raj','Chawla','M','1985-04-11','9876001239','19 Vikas Puri, New Delhi');

CREATE table Appointments ( AppointmentID INT auto_increment primary key,PatientID INT,DoctorID int,AppointmentDate date, AppointmentTime time);
insert into Appointments (PatientID,DoctorID,AppointmentDate,AppointmentTime)values(1, 1, '2024-10-15', '09:00:00'),
(2, 2, '2024-10-16' ,'10:30:00'),
(3, 3 ,'2024-10-17', '11:45:00'),
(4, 4, '2024-10-18', '14:00:00'),
( 5, 5, '2024-10-19', '15:15:00'),
(6 ,1, '2024-10-20' ,'09:30:00'),
(7, 2, '2024-10-21' ,'10:00:00'),
( 8, 3, '2024-10-22' ,'11:00:00'),
(9 ,4 ,'2024-10-23' ,'12:15:00'),
( 10 ,5 ,'2024-10-24', '13:30:00'),
(1 ,1 ,'2024-08-25' ,'10:00:00'),
(2, 2, '2024-08-26', '11:30:00'),
(3 ,3 ,'2024-08-27' ,'09:00:00'),
( 1 ,4 ,'2024-08-28' ,'14:00:00'),
(2 ,5 ,'2024-08-29' ,'15:30:00');
Select * From Appointments;

CREATE VIEW DoctorSpecialties AS
SELECT DoctorID, FirstName, LastName, Speciality
FROM Doctors;

SELECT * FROM DoctorSpecialties;

CREATE VIEW PatientContacts AS
SELECT PatientID, FirstName, LastName, ContactNumber, Address
FROM Patients;

SELECT * FROM PatientContacts;

CREATE VIEW UpcomingAppointments AS
SELECT AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime
FROM Appointments
WHERE AppointmentDate >= CURDATE();

SELECT * FROM UpcomingAppointments;

CREATE VIEW Cardiologists AS
SELECT DoctorID, FirstName, LastName, PhoneNumber
FROM Doctors
WHERE Speciality = 'Cardiology';

SELECT * FROM Cardiologists;

CREATE VIEW PatientAge AS
SELECT PatientID, FirstName, LastName,
TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS Age
FROM Patients;
SELECT * FROM PatientAge;

CREATE VIEW PatientAppointments AS
SELECT
p.PatientID,
p.FirstName,
p.LastName,
a.AppointmentDate,
a.AppointmentTime
FROM Patients p
INNER JOIN Appointments a ON p.PatientID = a.PatientID;
SELECT * FROM PatientAppointments;

CREATE VIEW DoctorPatientList AS
SELECT
d.DoctorID,
d.FirstName AS DoctorFirstName,

d.LastName AS DoctorLastName,
p.FirstName AS PatientFirstName,
p.LastName AS PatientLastName,
a.AppointmentDate
FROM Doctors d
LEFT JOIN Appointments a ON d.DoctorID = a.DoctorID
LEFT JOIN Patients p ON a.PatientID = p.PatientID;
SELECT * FROM DoctorPatientList;

CREATE VIEW DoctorAppointmentCount AS
SELECT
d.DoctorID,
d.FirstName,
d.LastName,
COUNT(a.AppointmentID) AS TotalAppointments
FROM Doctors d
LEFT JOIN Appointments a ON d.DoctorID = a.DoctorID
GROUP BY d.DoctorID, d.FirstName, d.LastName;
SELECT * FROM DoctorAppointmentCount;

CREATE VIEW UpcomingAppointments1 AS
SELECT
p.FirstName AS PatientFirstName,
p.LastName AS PatientLastName,
d.FirstName AS DoctorFirstName,
d.LastName AS DoctorLastName,
a.AppointmentDate,
a.AppointmentTime
FROM Appointments a
INNER JOIN Patients p ON a.PatientID = p.PatientID
INNER JOIN Doctors d ON a.DoctorID = d.DoctorID
ORDER BY a.AppointmentDate ASC;
SELECT * FROM UpcomingAppointments1;

CREATE VIEW DoctorPatientRightJoin AS
SELECT
p.PatientID,
p.FirstName AS PatientFirstName,
p.LastName AS PatientLastName,
d.FirstName AS DoctorFirstName,
d.LastName AS DoctorLastName,
a.AppointmentDate
FROM Doctors d
RIGHT JOIN Appointments a ON d.DoctorID = a.DoctorID

RIGHT JOIN Patients p ON a.PatientID = p.PatientID;
SELECT * FROM DoctorPatientRightJoin;
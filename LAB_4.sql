create database Hospital;
use Hospital;
create Table Patients(
PatientID INT auto_increment primary KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) not null,
Gender CHAR(1) CHECK (Gender IN ('M','F')) NOT NULL,
DateOfBirth DATE NOT NULL,
ContactNumber varchar(15) Unique Not Null,
Address VARCHAR(255) not null
);

create Table Doctors(
DoctorID INT auto_increment primary key,
FirstName VARCHAR(50) not null,
LastName VARCHAR(50) NOT NULL,
Specialty VARCHAR(100) NOT NULL,
PhoneNumber VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE Appointments(
AppointmentID INT auto_increment primary KEY,
PatientID INT NOT NULL,
DoctorID INT NOT NULL,
AppointmentDate DATE NOT NULL,
AppointmentTime TIME NOT NULL,
Foreign key (PatientID) References Patients(PatientID),
Foreign key (DoctorID) References Doctors(DoctorID)
);

Insert Into Patients(FirstName,LastName,Gender,DateOfBirth,ContactNumber ,Address) values('John','Doe','M','1985-05-15','1234567890','123 Elm Street');
Insert Into Patients(FirstName,LastName,Gender,DateOfBirth,ContactNumber ,Address) values('Jane','Smith','F','1990-08-20','0987654321','456 Oak Street');
Insert Into Patients(FirstName,LastName,Gender,DateOfBirth,ContactNumber ,Address) values('Micheal','Brown','M','1978-03-10','5555555555','789 Maple Avenue');
Insert Into Patients(FirstName,LastName,Gender,DateOfBirth,ContactNumber ,Address) values('Alice','Johnson','F','1992-12-30','6666666666','101 Pine Street');
Insert Into Patients(FirstName,LastName,Gender,DateOfBirth,ContactNumber ,Address) values('David','Wilson','M','1980-07-22','7777777777','202 Birch Street');
Insert Into Patients(FirstName,LastName,Gender,DateOfBirth,ContactNumber ,Address) values('Emily','Clark','F','1987-11-15','8888888888','303 Cedar Lane');
Insert Into Patients(FirstName,LastName,Gender,DateOfBirth,ContactNumber ,Address) values('Robert','King','M','1985-09-05','9999999999','404 Oakwood Avenue');
Insert Into Patients(FirstName,LastName,Gender,DateOfBirth,ContactNumber ,Address) values('Sophia','Taylor','F','2000-06-18','1111111111','505 	Wllow Street');
Insert Into Patients(FirstName,LastName,Gender,DateOfBirth,ContactNumber ,Address) values('James','Anderson','M','1973-02-25','2222222222','606 Elmwood Drive');
Insert Into Patients(FirstName,LastName,Gender,DateOfBirth,ContactNumber ,Address) values('Oivia','Martin','F','1982-04-30','3333333333','707 Spruce Way');


select * from patients;



INSERT INTO Doctors (DoctorID, FirstName, LastName, Specialty, PhoneNumber)
VALUES
(1, 'Emily', 'Clark', 'Cardiology', '5551112222'),
(2, 'Michael', 'Brown', 'Neurology', '5553334444'),
(3, 'David', 'Wilson', 'Orthopedics', '5555556666'),
(4, 'Sarah', 'Johnson', 'Pediatrics', '5557778888'),
(5, 'James', 'Anderson', 'Dermatology', '5559990000'),
(6, 'Olivia', 'Martin', 'General Surgery', '5552223333'),
(7, 'Sophia', 'Taylor', 'Ophthalmology', '5554445555'),
(8, 'John', 'Doe', 'Psychiatry', '5556667777'),
(9, 'Jane', 'Smith', 'Gastroenterology', '5558889999'),
(10, 'Robert', 'King', 'Urology', '5550001111');


select * from doctors;



INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime)
VALUES
( 1, 8, '2024-09-01', '09:00:00'),  
( 2, 9, '2024-09-02', '10:30:00'),  
( 3, 2, '2024-09-03', '11:00:00'),  
( 4, 4, '2024-09-04', '14:00:00'), 
( 5, 3, '2024-09-05', '15:30:00');  

SELECT * FROM APPOINTMENTS;

UPDATE Doctors Set Specialty='Rheumatology' where DoctorID=3;
UPDATE Patients Set Address='789 Birch Street' where PatientID=1;
UPDATE Patients Set ContactNumber='1231231234' where PatientID=2;
Update Appointments Set AppointmentTime='16:00:00' where AppointmentID=4;
SELECT * FROM PATIENTS WHERE GENDER='F';
Select *From Doctors where Specialty='Cardiology';


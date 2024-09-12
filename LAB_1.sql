CREATE database MANIT;
Use MANIT;
CREATE TABLE authors (id INT, name VARCHAR(20), email VARCHAR(20));
INSERT INTO authors (id,name,email) VALUES(1,"Vivek","xuz@abc.com");



INSERT INTO authors (id,name,email) VALUES(3,"Tom","tom@yahoo.com");

SELECT * FROM authors;


SELECT * FROM authors where name="Priya";
SELECT email FROM authors;
SELECT email FROM authors where name="Priya";
SELECT * FROM authors where id=2;
CREATE TABLE CSEMANIT1 as Select *from authors where name="Vivek"; 
Select * From CSEMANIT1;
CREATE TABLE Books_Details( BookID INT PRIMARY KEY, Title VARCHAR(100), id INT,Author VARCHAR(50), PublicationYear INT, Price DECIMAL(10, 2));

Update authors Set name="Priya Sharma" WHERE name="Priya";




--LAB 3

create database library;
use library;
create table LibraryBooks(BookID INT AUTO_INCREMENT PRIMARY KEY,Title VARCHAR(100) NOT NULL,Author VARCHAR(50) NOT NULL ,Genre CHAR(20) not null,PageCount SMALLINT NOT NULL,Price DECIMAL(6,2)NOT NULL,PublishDate DATE NOT NULL,AddedToLibrary TIME NOT NULL,isAvailable BOOLEAN NOT NULL,ISBN INT UNIQUE NOT NULL);
INSERT INTO LibraryBooks(Title,Author ,Genre,PageCount,Price,PublishDate,AddedToLibrary,isAvailable,ISBN)Value('The Great Gatsbay','F.Scott Fitzgerald','Classic',218,10.99,'1925-04-10','09:00:00',True,12);
INSERT INTO LibraryBooks(Title,Author ,Genre,PageCount,Price,PublishDate,AddedToLibrary,isAvailable,ISBN)Value('To Kill a Mockingbird','Harper Lee','Fiction',324,12.50,'1960-07-11','10:30:00',True,23);
INSERT INTO LibraryBooks(Title,Author ,Genre,PageCount,Price,PublishDate,AddedToLibrary,isAvailable,ISBN)Value('Moby Dick','Herman Melville','Adventure',635,15.20,'1851-10-18','12:00:00',True,45); 
INSERT INTO LibraryBooks(Title,Author ,Genre,PageCount,Price,PublishDate,AddedToLibrary,isAvailable,ISBN)Value('1984','George Orwell','Dystopian',328,9.99,'1949-06-08','11:00:00',True,34);
INSERT INTO LibraryBooks(Title,Author ,Genre,PageCount,Price,PublishDate,AddedToLibrary,isAvailable,ISBN)Value('War and peace','Leo Tolstoy','Hisorical',1225,20.00,'1869-01-01','13:00:00',True,56);
INSERT INTO LibraryBooks(Title,Author ,Genre,PageCount,Price,PublishDate,AddedToLibrary,isAvailable,ISBN)Value('Pride and Prejudice','Jane Austen','Romance',279,8.50,'1813-01-28','14:00:00',True,67);    


create Table Members(MemberID INT AUTO_INCREMENT PRIMARY KEY,FirstName VARCHAR(50) NOT NULL,LastName VARCHAR(50),Email VARCHAR(100)unique not null,DateofBirth DATE NOT NULL,MembershipStartDate DAteTime NOT null,BorrowedBookID int,Foreign Key(BorrowedBookID) References LibraryBooks(BookID)); 
iNSERT INTO Members(FirstName,LastName,Email,DateOfBirth ,MembershipStartDate,BorrowedBookID)VALUES("Alice","Johnson","alice.johnson@example.com",'1990-01-15',NOW(),1);
iNSERT INTO Members(FirstName,LastName,Email,DateOfBirth ,MembershipStartDate,BorrowedBookID)VALUES("Bob","Smith","bob.smith@example.com",'1985-06-20',NOW(),2);
iNSERT INTO Members(FirstName,LastName,Email,DateOfBirth ,MembershipStartDate,BorrowedBookID)VALUES("Carol","Williams","carol.williams@example.com",'1995-03-12',NOW(),4);
iNSERT INTO Members(FirstName,LastName,Email,DateOfBirth ,MembershipStartDate,BorrowedBookID)VALUES("David","Brown","david.brown@example.com",'1980-07-12',NOW(),4);
iNSERT INTO Members(FirstName,LastName,Email,DateOfBirth ,MembershipStartDate,BorrowedBookID)VALUES("Eva","Davis","eva.davis@example.com",'1992-09-30',NOW(),NULL);
iNSERT INTO Members(FirstName,LastName,Email,DateOfBirth ,MembershipStartDate,BorrowedBookID)VALUES("Frank","Miller","frank.miller@example.com",'1975-05-05',NOW(),5);
iNSERT INTO Members(FirstName,LastName,Email,DateOfBirth ,MembershipStartDate,BorrowedBookID)VALUES("Grace","Wilson","grace.wislon@example.com",'1988-11-22',NOW(),6);

update Members Set Email="saksham@gmail.com" WHERE MemberID=1;
UPDATE Members set BorrowedBookID=4 where MemberID=2;
update Members Set LastName="Aditya" where MemberID=3;
UPDATE mEMBERS SET LastName="Gupta" Where MemberID=5;


Select * from Members;
Select * from Members Where LastName="Smith";
Select * from Members Where BorrowedBookId=3;
Select * from Members Where Email LIKE "%example.com";
Select * from Members Where DateOfBirth<"1990-01-01";
Select distinct eMAIL from Members ; 
Select * from Members Where BorrowedBookId is null;


Select * from LibraryBooks where isAvailable=true;
Select * from Members Where BorrowedBookId=4;
Select *from members where BorrowedBookId Is null;
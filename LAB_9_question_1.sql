
use  manit;
CREATE TABLE Author (
    Author_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    City VARCHAR(50),
    Country VARCHAR(50)
);

CREATE TABLE Publisher (
    Publisher_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    City VARCHAR(50),
    Country VARCHAR(50)
);

CREATE TABLE Category (
    Category_ID VARCHAR(10) PRIMARY KEY,
    Description VARCHAR(100) NOT NULL
);

CREATE TABLE Book (
    Book_ID VARCHAR(10) PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Author_ID VARCHAR(10),
    Publisher_ID VARCHAR(10),
    Category_ID VARCHAR(10),
    Year INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID),
    FOREIGN KEY (Publisher_ID) REFERENCES Publisher(Publisher_ID),
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);

CREATE TABLE Member (
    Member_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Pin VARCHAR(10),
    Phone VARCHAR(15),
    E_mail VARCHAR(100)
);


CREATE TABLE Order_Summary (
    Order_No VARCHAR(10) PRIMARY KEY,
    Member_ID VARCHAR(10),
    Order_Date DATE,
    Amount DECIMAL(10, 2),
    Order_Status VARCHAR(50),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID)
);

CREATE TABLE Order_Details (
    Order_No VARCHAR(10),
    Book_ID VARCHAR(10),
    Quantity INT,
    PRIMARY KEY (Order_No, Book_ID),
    FOREIGN KEY (Order_No) REFERENCES Order_Summary(Order_No),
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);


INSERT INTO Author (Author_ID, Name, City, Country) VALUES
('A01', 'Charles Dickens', 'Portsmouth', 'UK'),
('A02', 'Charlotte Bronte', 'Thornton', 'UK'),
('A03', 'C.S. Lewis', 'Belfast', 'UK'),
('A04', 'Mark Twain', 'Missouri', 'USA');

INSERT INTO Publisher (Publisher_ID, Name, City, Country) VALUES
('P01', 'Simon & Schuster', 'New York', 'USA'),
('P02', 'Dell Books', 'New York', 'USA'),
('P03', 'Penguin Books', 'London', 'UK'),
('P04', 'HarperCollins', 'New York', 'USA');

INSERT INTO Category (Category_ID, Description) VALUES
('C01', 'Fiction'),
('C02', 'Literature'),
('C03', 'Science Fiction'),
('C04', 'Biography');

INSERT INTO Book (Book_ID, Title, Author_ID, Publisher_ID, Category_ID, Year, Price) VALUES
('B01', 'Great Expectations', 'A01', 'P01', 'C01', 1997, 250),
('B02', 'Jane Eyre', 'A02', 'P02', 'C02', 1997, 300),
('B03', 'The Chronicles of Narnia', 'A03', 'P03', 'C03', 1998, 450),
('B04', 'Adventures of Huckleberry Finn', 'A04', 'P04', 'C01', 2000, 150);


INSERT INTO Member (Member_ID, Name, Address, City, State, Pin, Phone, E_mail) VALUES
('M01', 'Alice Johnson', '123 Main St', 'New York', 'NY', '10001', '123-456-7890', 'alice@example.com'),
('M02', 'Bob Smith', '456 Park Ave', 'Los Angeles', 'CA', '90001', '234-567-8901', 'bob@example.com'),
('M03', 'Charlie Brown', '789 Elm St', 'Chicago', 'IL', '60601', '345-678-9012', 'charlie@example.com');

INSERT INTO Order_Summary (Order_No, Member_ID, Order_Date, Amount, Order_Status) VALUES
('O01', 'M01', '2023-01-15', 500, 'Completed'),
('O02', 'M02', '2023-02-10', 750, 'Pending'),
('O03', 'M03', '2023-03-05', 600, 'Completed');

INSERT INTO Order_Details (Order_No, Book_ID, Quantity) VALUES
('O01', 'B01', 2),
('O02', 'B02', 1),
('O03', 'B03', 1);

SELECT b.Title, b.Year, b.Price, a.Name, p.Name AS Publisher
 FROM Book b
 JOIN Author a ON b.Author_ID = a.Author_ID
 JOIN Publisher p ON b.Publisher_ID = p.Publisher_ID
 WHERE b.Year = 1997
 AND b.Price > 200
 AND (p.Name = 'Simon & Schuster' OR p.Name = 'Dell Books')
 AND a.Name LIKE 'C%'
 AND b.Book_ID != 'A02';
 
 SELECT p.Name AS Publisher, 
       AVG(b.Price) AS Avg_Price, 
       MAX(b.Price) AS Max_Price, 
       MIN(b.Price) AS Min_Price
 FROM Book b
 JOIN Publisher p ON b.Publisher_ID = p.Publisher_ID
 GROUP BY p.Publisher_ID
 HAVING COUNT(b.Book_ID) > 2;
 
 SELECT DISTINCT b.Title
 FROM Book b
 JOIN Order_Details od ON b.Book_ID = od.Book_ID;
 
 SELECT a.Name, b.Title, b.Year, b.Price
 FROM Author a
 JOIN Book b ON a.Author_ID = b.Author_ID
 WHERE b.Price > (SELECT AVG(Price) FROM Book)
 AND b.Year > 1995
 GROUP BY a.Author_ID
 HAVING COUNT(b.Book_ID) >= 2;
 
 SELECT m.Name, os.Amount
 FROM Member m
 JOIN Order_Summary os ON m.Member_ID = os.Member_ID
 WHERE os.Amount = (
    SELECT DISTINCT Amount 
    FROM Order_Summary 
    ORDER BY Amount DESC 
    LIMIT 1 OFFSET 2
 );



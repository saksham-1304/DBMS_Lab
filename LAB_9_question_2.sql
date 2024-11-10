CREATE TABLE Customer (
    CustomerID VARCHAR(10) PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Manufacturer (
    ManufacturerID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(50)
);

CREATE TABLE Product (
    ProductID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT,
    ManufacturerID VARCHAR(10),
    FOREIGN KEY (ManufacturerID) REFERENCES Manufacturer(ManufacturerID)
);

CREATE TABLE OrderSummary (
    OrderID VARCHAR(10) PRIMARY KEY,
    CustomerID VARCHAR(10),
    OrderDate DATE,
    OrderAmount DECIMAL(10, 2),
    OrderStatus VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity INT,
    TotalPrice DECIMAL(10, 2),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES OrderSummary(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);


INSERT INTO Customer (CustomerID, FirstName, LastName, Address, City, Phone, Email) VALUES
('C01', 'David', 'Miller', '101 Green St', 'Mumbai', '987-654-3210', 'david@example.com'),
('C02', 'Eva', 'Jones', '202 Red St', 'Delhi', '876-543-2109', 'eva@example.com'),
('C03', 'Frank', 'Wilson', '303 Blue St', 'Mumbai', '765-432-1098', 'frank@example.com'),
('C04', 'Grace', 'Lee', '404 White St', 'Chennai', '654-321-0987', 'grace@example.com');


INSERT INTO Manufacturer (ManufacturerID, Name, Country) VALUES
('M01', 'Apple', 'USA'),
('M02', 'Samsung', 'South Korea'),
('M03', 'Nike', 'USA'),
('M04', 'Adidas', 'Germany');

INSERT INTO Product (ProductID, Name, Category, Price, StockQuantity, ManufacturerID) VALUES
('P01', 'iPhone', 'Electronics', 8000, 50, 'M01'),
('P02', 'Galaxy', 'Electronics', 7000, 60, 'M02'),
('P03', 'Air Max', 'Footwear', 300, 100, 'M03'),
('P04', 'Jordan', 'Footwear', 350, 120, 'M03'),
('P05', 'MacBook', 'Electronics', 12000, 30, 'M01'),
('P06', 'T-Shirt', 'Clothing', 100, 200, 'M03'),
('P07', 'Ultraboost', 'Footwear', 400, 80, 'M04'),
('P08', 'Smartwatch', 'Electronics', 5000, 70, 'M02');


INSERT INTO OrderSummary (OrderID, CustomerID, OrderDate, OrderAmount, OrderStatus) VALUES
('O101', 'C01', '2023-05-01', 8500, 'Completed'),
('O102', 'C02', '2023-05-10', 1500, 'Pending'),
('O103', 'C03', '2023-05-20', 9000, 'Completed'),
('O104', 'C04', '2023-06-15', 2000, 'Shipped');


INSERT INTO OrderDetails (OrderID, ProductID, Quantity, TotalPrice) VALUES
('O101', 'P01', 1, 8000),
('O101', 'P02', 1, 7000),
('O102', 'P03', 2, 600),
('O103', 'P05', 1, 12000),
('O104', 'P07', 2, 800),
('O103', 'P08', 1, 5000);



SELECT AVG(Price) AS AvgPrice, MAX(Price) AS MaxPrice, MIN(Price) AS 
MinPrice
 FROM Product
 WHERE Category = 'Footwear'
 AND ManufacturerID IN (SELECT ManufacturerID
                       FROM Product
                       GROUP BY ManufacturerID
                       HAVING COUNT(ProductID) > 2);
                       
SELECT Name
 FROM Product
 WHERE ProductID IN (SELECT ProductID FROM OrderDetails);
 
SELECT ManufacturerID, Name, Country
 FROM Manufacturer
 WHERE ManufacturerID IN (SELECT ManufacturerID
                         FROM Product
                         WHERE Category = 'Clothing'
                         AND Price > (SELECT AVG(Price) FROM Product)
                         GROUP BY ManufacturerID
                         HAVING COUNT(ProductID) > 2);


SELECT CustomerID, FirstName, LastName
 FROM Customer
 WHERE CustomerID IN (SELECT CustomerID
                     FROM OrderSummary
                     WHERE OrderAmount = (SELECT MAX(OrderAmount)
                                         FROM OrderSummary
                                         WHERE OrderAmount < (SELECT MAX(OrderAmount)
                                                              FROM OrderSummary)));
 SELECT ProductID, Name, Price, ManufacturerID
 FROM Product
 WHERE Category = 'Electronics'
 AND Price > 5000
 AND ManufacturerID IN (SELECT ManufacturerID FROM Manufacturer WHERE 
Name IN ('Apple', 'Samsung'))
 AND ProductID != 'P102'
 AND ProductID IN (SELECT ProductID FROM OrderDetails WHERE OrderID IN 
                  (SELECT OrderID FROM OrderSummary WHERE CustomerID IN 
                   (SELECT CustomerID FROM Customer WHERE City = 'Mumbai')));
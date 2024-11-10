create database manit123;
use manit123;
CREATE TABLE Customers (
CustomerID INT AUTO_INCREMENT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(100) UNIQUE NOT NULL,
ContactNumber VARCHAR(15),
Address VARCHAR(255),
DateOfBirth DATE
);
CREATE TABLE Products (
ProductID INT AUTO_INCREMENT PRIMARY KEY,
ProductName VARCHAR(100) NOT NULL,
Category VARCHAR(50) NOT NULL,
Price DECIMAL(10, 2) NOT NULL,
StockQuantity INT NOT NULL
);

CREATE TABLE Orders (
OrderID INT AUTO_INCREMENT PRIMARY KEY,
CustomerID INT NOT NULL,
ProductID INT NOT NULL,
OrderDate DATE NOT NULL,
Quantity INT NOT NULL,
TotalAmount DECIMAL(10, 2),
FOREIGN KEY (CustomerID) REFERENCES
Customers(CustomerID),
FOREIGN KEY (ProductID) REFERENCES
Products(ProductID)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, ContactNumber, Address, DateOfBirth)
VALUES
(1, 'Ravi', 'Patel', 'ravi.patel@example.com', '9876543210', 'Mumbai', '1990-05-15'),
(2, 'Neha', 'Sharma', 'neha.sharma@example.com', NULL, 'Delhi', '1988-12-22'),
(3, 'Amit', 'Mehta', 'amit.mehta@example.com', '9876543211', 'Chennai', '1992-07-19'),
(4, 'Anjali', 'Kapoor', 'anjali.kapoor@example.com', '9876543212', 'Bangalore', '1995-01-05'),
(5, 'Rahul', 'Singh', 'rahul.singh@example.com', '9876543213', 'Hyderabad', NULL),
(6, 'Priya', 'Verma', 'priya.verma@example.com', '9999999999', 'Pune', '1991-10-12'),
(7, 'Sanjay', 'Kumar', 'sanjay.kumar@example.com', NULL, 'Kolkata', '1985-03-05'),
(8, 'Kiran', 'Nair', 'kiran.nair@example.com', '8888888888', 'Mumbai', '1990-07-23'),
(9, 'Deepa', 'Malik', 'deepa.malik@example.com', '7777777777', 'Jaipur', '1993-11-10'),
(10, 'Rajesh', 'Shah', 'rajesh.shah@example.com', '6666666666', 'Ahmedabad', '1989-04-17');
Select * from customers;

INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity)
VALUES
(1, 'iPhone 14', 'Electronics', 99999.00, 50),
(2, 'Samsung Galaxy S23', 'Electronics', 84999.00, 30),
(3, 'Nike Running Shoes', 'Footwear', 6999.00, 100),
(4, 'Dell Laptop', 'Electronics', 74999.00, 25),
(5, 'Puma Sports T-shirt', 'Clothing', 1999.00, 150),
(6, 'Adidas Sneakers', 'Footwear', 7999.00, 120),
(7, 'Sony Headphones', 'Electronics', 19999.00, 60),
(8, 'Levi''s Jeans', 'Clothing', 2999.00, 200),
(9, 'HP Omen Gaming Laptop', 'Electronics', 129999.00, 15),
(10, 'Reebok Training Shoes', 'Footwear', 4999.00, 80);
Select * from Products;

INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity, TotalAmount)
VALUES
(1, 1, 1, '2024-09-10', 2, 199998.00),
(2, 2, 3, '2024-09-12', 1, 6999.00),
(3, 3, 4, '2024-09-15', 1, 74999.00),
(4, 4, 2, '2024-09-18', 1, 84999.00),
(5, 5, 5, '2024-09-20', 3, 5997.00),
(6, 6, 2, '2024-09-22', 2, 169998.00),
(7, 3, 1, '2024-09-25', 1, 99999.00),
(8, 1, 3, '2024-09-28', 4, 27996.00),
(9, 2, 4, '2024-09-30', 1, 74999.00),
(10, 4, 5, '2024-10-02', 2, 3998.00);
Select * from Orders;

SELECT FirstName, LastName, Address
FROM Customers
WHERE Address LIKE '%Mumbai%';

SELECT FirstName, LastName, Email
FROM Customers
WHERE ContactNumber IS NULL;

SELECT SUM(Quantity) AS TotalProductsOrdered,
SUM(TotalAmount) AS TotalRevenue FROM Orders;

SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS
TotalOrders
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

SELECT ProductName, Price
FROM Products
ORDER BY Price DESC;

SELECT p.ProductName, SUM(o.Quantity) AS TotalSold
FROM Products p
INNER JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.ProductID, p.ProductName;

SELECT AVG(TotalAmount) AS AverageOrderAmount
FROM Orders
WHERE TotalAmount IS NOT NULL;

CREATE VIEW CustomerOrderSummary AS
SELECT c.FirstName, c.LastName, SUM(o.TotalAmount) AS
TotalSpent
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

SELECT O.OrderID, P.ProductName, O.TotalAmount
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
WHERE O.CustomerID = 1;

SELECT CustomerID, SUM(TotalAmount) AS TotalSpent,
OrderDate
FROM Orders
GROUP BY CustomerID, OrderDate
ORDER BY TotalSpent DESC;

SELECT OrderID, CustomerID, Quantity, TotalAmount
FROM Orders
WHERE Quantity > 2;

SELECT C.FirstName, C.LastName, P.ProductName
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
JOIN Products P ON O.ProductID = P.ProductID
WHERE P.Category = 'Electronics';

SELECT P.ProductName, O.TotalAmount
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
ORDER BY O.TotalAmount DESC
LIMIT 1;

SELECT OrderID, CustomerID, ProductID, OrderDate,
TotalAmount
FROM Orders
WHERE OrderDate BETWEEN '2024-09-01' AND '2024-09-30';

SELECT P.ProductName, SUM(O.Quantity) AS TotalQuantity
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
GROUP BY P.ProductName;


create database uy;
use uy;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ContactEmail VARCHAR(100),
    ContactNumber VARCHAR(15)
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    StockQuantity INT
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- 2. Insert sample data into Customers table

INSERT INTO Customers (CustomerName, ContactEmail, ContactNumber)
VALUES 
('Alice Johnson', 'alice@example.com', '1234567890'),
('Bob Smith', 'bob@example.com', '0987654321'),
('Charlie Brown', 'charlie@example.com', '1122334455');

-- 3. Insert sample data into Products table

INSERT INTO Products (ProductName, Price, StockQuantity)
VALUES 
('Laptop', 800.00, 10),
('Smartphone', 500.00, 20),
('Headphones', 50.00, 50);

-- 4. Insert sample data into Orders table

INSERT INTO Orders (CustomerID, ProductID, OrderDate, Quantity)
VALUES 
(1, 1, '2024-09-01', 1), -- Alice buys a Laptop
(2, 2, '2024-09-02', 2), -- Bob buys 2 Smartphones
(3, 3, '2024-09-03', 3); -- Charlie buys 3 Headphones

-- Query 1: Retrieve all orders and related customer and product information

SELECT Orders.OrderID, Customers.CustomerName, Products.ProductName, Orders.Quantity, Orders.OrderDate
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Products ON Orders.ProductID = Products.ProductID;

-- Query 2: Calculate total sales for each product

SELECT Products.ProductName, SUM(Orders.Quantity) AS TotalSold, SUM(Orders.Quantity * Products.Price) AS TotalSales
FROM Orders
JOIN Products ON Orders.ProductID = Products.ProductID
GROUP BY Products.ProductName;

-- Query 3: Retrieve the details of all customers who have made an order

SELECT DISTINCT Customers.CustomerName, Customers.ContactEmail
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- Query 4: Find the total number of products sold for each customer

SELECT Customers.CustomerName, SUM(Orders.Quantity) AS TotalProductsOrdered
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerName;

# Customer Orders Management System Using SQL

## Description: 
This project implements a basic **Customer Orders Management System** using SQL. It demonstrates how to create, insert, and query data for managing customers, products, and orders in an e-commerce-like platform. The system uses relational database concepts to manage interactions between `Customers`, `Products`, and `Orders` tables.

## Features
- **Customer Table**: Stores customer details like name, email, and contact number.
- **Product Table**: Stores product details such as name, price, and stock quantity.
- **Orders Table**: Records customer orders, including order date, product, and quantity ordered.
- **SQL Queries**: Includes queries to fetch all orders, calculate total sales per product, and find the total products ordered by each customer.

## Tables strucutre 
1. **Customers**
   - `CustomerID` (Primary Key)
   - `CustomerName`: The name of the customer.
   - `ContactEmail`: Email for communication.
   - `ContactNumber`: Customer's contact number.

2. **Products**
   - `ProductID` (Primary Key)
   - `ProductName`: The name of the product.
   - `Price`: Price of the product.
   - `StockQuantity`: Available stock for the product.

3. **Orders**
   - `OrderID` (Primary Key)
   - `CustomerID` (Foreign Key from `Customers`)
   - `ProductID` (Foreign Key from `Products`)
   - `OrderDate`: Date when the order was placed.
   - `Quantity`: Quantity of the product ordered.
  
  ## SQL Queries
1. **Retrieve all orders with customer and product details**:
   ```sql
   SELECT Orders.OrderID, Customers.CustomerName, Products.ProductName, Orders.Quantity, Orders.OrderDate
   FROM Orders
   JOIN Customers ON Orders.CustomerID = Customers.CustomerID
   JOIN Products ON Orders.ProductID = Products.ProductID;

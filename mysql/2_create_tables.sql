USE northwind_traders;
-- Step 2, create the necessary tables and define their columns' data types

-- Dim table categories, data from categories.csv
CREATE TABLE categories (
	categoryID INT,
    categoryName VARCHAR(255),
	description TEXT,
    PRIMARY KEY(categoryID)
);

-- Dim table customers, data from customers.csv
CREATE TABLE customers (
	customerID VARCHAR(255),
    companyName VARCHAR(255),
    contactName VARCHAR(255),
    contactTitle VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(255),
    PRIMARY KEY(customerID)
);

-- Dim table employees, data from employees.csv
CREATE TABLE employees (
	employeeID INT,
    employeeName VARCHAR(255),
    title VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(255),
    reportsTo INT,
    PRIMARY KEY(employeeID)
);

-- Dim table order_details, data from order_details.csv
CREATE TABLE order_details (
	orderID INT,
    productID INT,
    unitPrice DECIMAL(6, 2),
	quantity INT,
    discount DECIMAL(3, 2),
    PRIMARY KEY (orderID, productID)
);

-- Fact table orders, data from orders.csv
CREATE TABLE orders (
	orderID INT,
    customerID VARCHAR(255),
    employeeID INT,
    orderDate DATE,
    requiredDate DATE,
    shippedDate DATE,
    shipperID INT,
    freight DECIMAL(6, 2),
    PRIMARY KEY(orderID)
);

-- Dim table products, data from products.csv
CREATE TABLE products (
	productID INT,
    productName VARCHAR(255),
    quantityPerUnit VARCHAR(255),
    unitPrice DECIMAL(5, 2),
    discontinued BOOL,
    categoryID INT,
    PRIMARY KEY(productID)
);

-- Dim table shippers, data from shippers.csv
CREATE TABLE shippers (
	shipperID INT,
    companyName VARCHAR(255),
    PRIMARY KEY(shipperID)
);
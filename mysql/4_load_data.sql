USE northwind_traders;
-- Step 4, load the data from the CSV files in /data into the database

-- Load data into categories
LOAD DATA LOCAL INFILE '../data/categories.csv'
INTO TABLE categories
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(categoryID, categoryName, description);

-- Load data into customers
LOAD DATA LOCAL INFILE '../data/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customerID, companyName, contactName, contactTitle, city, country);

-- Load data into employees
LOAD DATA LOCAL INFILE '../data/employees.csv'
INTO TABLE employees
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(employeeID, employeeName, title, city, country, reportsTo);

-- Load data into order_details
LOAD DATA LOCAL INFILE '../data/order_details.csv'
INTO TABLE order_details
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(orderID, productID, unitPrice, quantity, discount);

-- Load data into orders
-- Handle this edge case for Date columns
LOAD DATA LOCAL INFILE '../data/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(orderID, customerID, employeeID, @orderDate, @requiredDate, @shippedDate, shipperID, freight)
SET orderDate = STR_TO_DATE(@orderDate, '%m/%d/%Y'),
    requiredDate = STR_TO_DATE(@requiredDate, '%m/%d/%Y'),
    shippedDate = STR_TO_DATE(@shippedDate, '%m/%d/%Y');

-- Load data into products
LOAD DATA LOCAL INFILE '../data/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(productID, productName, quantityPerUnit, unitPrice, dicsountinued, categoryID);

-- Load data into shippers
LOAD DATA LOCAL INFILE '../data/shippers.csv'
INTO TABLE shippers
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(shipperID, companyName);
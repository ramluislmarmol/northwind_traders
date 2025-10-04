USE northwind_traders;
-- Step 4, load the data from the CSV files in /data into the database

SET FOREIGN_KEY_CHECKS = 0; -- Sets this off first so that we can insert to the table

-- Load data into categories
LOAD DATA LOCAL INFILE '<insert absolute path here>'
INTO TABLE categories
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(categoryID, categoryName, description);

-- Load data into customers
LOAD DATA LOCAL INFILE '<insert absolute path here>'
INTO TABLE customers
CHARACTER SET latin1 -- Customer names contains special characters that MySQL cannot import, this normalizes it
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(customerID, companyName, contactName, contactTitle, city, country);

-- Load data into employees
LOAD DATA LOCAL INFILE '<insert absolute path here>'
INTO TABLE employees
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(employeeID, employeeName, title, city, country, @reportsTo)
SET reportsTo = NULLIF(@reportsTo, ''); -- Handle edge case for blank reportsTo (is the owner of the company)

-- Load data into order_details
LOAD DATA LOCAL INFILE '<insert absolute path here>'
INTO TABLE order_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(orderID, productID, unitPrice, quantity, discount);

-- Load data into orders
LOAD DATA LOCAL INFILE '<insert absolute path here>'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(orderID, customerID, employeeID, orderDate, requiredDate, @shippedDate, shipperID, freight)
SET shippedDate = NULLIF(@shippedDate, ''); -- Handle edge case for blank shippedDate (order not yet shipped)

-- Load data into products
LOAD DATA LOCAL INFILE '<insert absolute path here>'
INTO TABLE products
CHARACTER SET latin1 -- Customer names contains special characters that MySQL cannot import, this normalizes it
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(productID, productName, quantityPerUnit, unitPrice, discontinued, categoryID);

-- Load data into shippers
LOAD DATA LOCAL INFILE '<insert absolute path here>'
INTO TABLE shippers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(shipperID, companyName);

SET FOREIGN_KEY_CHECKS = 1; -- Set it back to true for future queries
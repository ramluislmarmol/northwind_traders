USE northwind_traders;
-- Step 3, assign the foreign keys (FK) to the created tables from step 2

-- order_details contains orderID (from orders) and productID (from products), which are both composite keys
ALTER TABLE order_details
ADD FOREIGN KEY(orderID) REFERENCES orders(orderID),
ADD FOREIGN KEY(productID) REFERENCES products(productID);

-- orders contains customerID (
ALTER TABLE orders
ADD FOREIGN KEY(customerID) REFERENCES customers(customerID),
ADD FOREIGN KEY(employeeID) REFERENCES employees(employeeID),
ADD FOREIGN KEY(shipperID) REFERENCES shippers(shipperID);

ALTER TABLE products 
ADD FOREIGN KEY(categoryID) REFERENCES categories(categoryID);
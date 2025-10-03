USE northwind_traders;

ALTER TABLE employees
ADD FOREIGN KEY (reportsTo) REFERENCES employees(employeeID);

ALTER TABLE order_details
ADD FOREIGN KEY(orderID) REFERENCES orders(orderID),
ADD FOREIGN KEY(productID) REFERENCES products(productID);

ALTER TABLE orders
ADD FOREIGN KEY(customerID) REFERENCES customers(customerID),
ADD FOREIGN KEY(employeeID) REFERENCES employees(employeeID),
ADD FOREIGN KEY(shipperID) REFERENCES shippers(shipperID);

ALTER TABLE products 
ADD FOREIGN KEY(categoryID) REFERENCES categories(categoryID);


-- Insert sample data into Users table
INSERT INTO Users (Username, Password, Role, Email, PhoneNumber) VALUES
('john_doe', 'password123', 'Customer', 'john@example.com', '123-456-7890'),
('jane_smith', 'password456', 'Vendor', 'jane@example.com', '098-765-4321'),
('admin_user', 'adminpass', 'Admin', 'admin@example.com', '111-222-3333');

-- Insert sample data into Vendors table
INSERT INTO Vendors (UserID, StoreName, Location, ContactEmail, ContactPhone) VALUES
(2, 'Jane\'s Store', 'Cape Town', 'jane_store@example.com', '098-765-4321');

-- Insert sample data into Products table
INSERT INTO Products (ProductName, VendorID, Category, Price, StockQuantity) VALUES
('Product A', 1, 'Category 1', 100.00, 50),
('Product B', 1, 'Category 2', 150.00, 30);

-- Insert sample data into Orders table
INSERT INTO Orders (CustomerID, TotalAmount, PaymentStatus, ShippingStatus) VALUES
(1, 250.00, 'Paid', 'Shipped');

-- Insert sample data into OrderDetails table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 2, 100.00),
(1, 2, 1, 150.00);

-- Insert sample data into Payments table
INSERT INTO Payments (OrderID, PaymentMethod, PaymentAmount) VALUES
(1, 'Credit Card', 250.00);

-- Insert sample data into Shipping table
INSERT INTO Shipping (OrderID, ShippingAddress, ShippingMethod, ShippingCost) VALUES
(1, '123 Main St, Johannesburg', 'Standard', 20.00);

-- Insert sample data into Wishlists table
INSERT INTO Wishlists (CustomerID, ProductID) VALUES
(1, 1);

-- Insert sample data into Reviews table
INSERT INTO Reviews (ProductID, CustomerID, Rating, ReviewText) VALUES
(1, 1, 5, 'Great product!'),
(2, 1, 4, 'Good quality.');

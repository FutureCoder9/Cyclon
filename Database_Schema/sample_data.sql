
-- Sample data for Users table
INSERT INTO Users (Username, Password, Role, Email, PhoneNumber) VALUES 
('johndoe', 'password1', 'Customer', 'john.doe@example.com', '082-123-4567'),
('janesmith', 'password2', 'Vendor', 'jane.smith@example.com', '083-234-5678'),
('michaeldavis', 'password50', 'Admin', 'michael.davis@example.com', '084-345-6789');

-- Sample data for Vendors table
INSERT INTO Vendors (UserID, StoreName, Location, ContactEmail, ContactPhone) VALUES 
(2, 'Jane''s Cycles', 'Cape Town', 'jane.smith@example.com', '083-234-5678'),
(4, 'CycleWorld', 'Durban', 'peter.brown@example.com', '083-456-7890'),
(50, 'Bike Haven', 'Johannesburg', 'susan.clark@example.com', '082-567-8901');

-- Sample data for Products table
INSERT INTO Products (ProductName, VendorID, Category, Price, StockQuantity) VALUES 
('Mountain Bike', 2, 'Bikes', 15000.00, 20),
('Helmet', 4, 'Accessories', 500.00, 100),
('Water Bottle', 50, 'Accessories', 150.00, 200);

-- Sample data for Orders table
INSERT INTO Orders (CustomerID, TotalAmount, PaymentStatus, ShippingStatus) VALUES 
(1, 15500.00, 'Paid', 'Shipped'),
(3, 2500.00, 'Pending', 'Pending'),
(49, 7500.00, 'Paid', 'Shipped');

-- Sample data for OrderDetails table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES 
(1, 1, 1, 15000.00),
(2, 2, 5, 500.00),
(50, 10, 2, 150.00);

-- Sample data for Payments table
INSERT INTO Payments (OrderID, PaymentMethod, PaymentAmount) VALUES 
(1, 'Credit Card', 15500.00),
(2, 'PayPal', 2500.00),
(50, 'EFT', 7500.00);

-- Sample data for Shipping table
INSERT INTO Shipping (OrderID, ShippingAddress, ShippingMethod, ShippingCost) VALUES 
(1, '123 Main St, Johannesburg', 'Standard', 100.00),
(2, '456 Elm St, Cape Town', 'Express', 200.00),
(50, '789 Pine St, Durban', 'Standard', 100.00);

-- Sample data for Wishlists table
INSERT INTO Wishlists (CustomerID, ProductID) VALUES 
(1, 3),
(2, 5),
(50, 8);

-- Sample data for Reviews table
INSERT INTO Reviews (ProductID, CustomerID, Rating, ReviewText) VALUES 
(1, 1, 5, 'Excellent bike!'),
(2, 2, 4, 'Good quality helmet.'),
(50, 50, 3, 'Average product.');

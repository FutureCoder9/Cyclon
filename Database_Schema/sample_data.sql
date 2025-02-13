-- Sample data for Users table (Customers, Vendors, Admins)
INSERT INTO Users (Username, Password, Role, Email, PhoneNumber) VALUES 
('johndoe', 'password1', 'Customer', 'john.doe@example.com', '082-123-4567'),
('janesmith', 'password2', 'Vendor', 'jane.smith@example.com', '083-234-5678'),
('michaeldavis', 'password50', 'Admin', 'michael.davis@example.com', '084-345-6789'),
('paulr', 'password3', 'Customer', 'paul.r@example.com', '085-456-7890'),
('lucyb', 'password4', 'Vendor', 'lucy.b@example.com', '086-567-8901'),
('emilyj', 'password5', 'Customer', 'emily.j@example.com', '087-678-9012'),
('robm', 'password6', 'Customer', 'rob.m@example.com', '088-789-0123'),
('jessicak', 'password7', 'Customer', 'jessica.k@example.com', '089-890-1234'),
('brians', 'password8', 'Customer', 'brian.s@example.com', '090-901-2345'),
('richardt', 'password9', 'Customer', 'richard.t@example.com', '091-012-3456'),
('susanw', 'password10', 'Customer', 'susan.w@example.com', '092-123-4567'),
('tomh', 'password11', 'Admin', 'tom.h@example.com', '093-234-5678');


-- Sample data for Vendors table
INSERT INTO Vendors (UserID, StoreName, Location, ContactEmail, ContactPhone) 
VALUES 
(2, 'Jane''s Cycles', 'Cape Town', 'jane.smith@example.com', '083-234-5678'),
(5, 'Lucy''s Electronics', 'Durban', 'lucy.b@example.com', '086-567-8901'),
(12, 'Tom''s Furniture', 'Johannesburg', 'tom.h@example.com', '093-234-5678');


-- Sample data for Products table
INSERT INTO Products (ProductName, VendorID, Category, Price, StockQuantity) VALUES 
('Mountain Bike', 2, 'Bikes', 15000.00, 20),
('Helmet', 2, 'Accessories', 500.00, 100),
('Water Bottle', 2, 'Accessories', 150.00, 200),
('Smartphone', 1, 'Electronics', 5000.00, 50),
('Laptop', 1, 'Electronics', 12000.00, 30),
('Sofa', 3, 'Furniture', 8000.00, 15),
('Dining Table', 3, 'Furniture', 6000.00, 20),
('Chair', 3, 'Furniture', 1200.00, 50);

-- Sample data for Orders table
INSERT INTO Orders (CustomerID, TotalAmount, PaymentStatus, ShippingStatus) VALUES 
(1, 15500.00, 'Paid', 'Shipped'),
(2, 2500.00, 'Pending', 'Pending'),
(3, 7500.00, 'Paid', 'Shipped'),
(4, 12000.00, 'Paid', 'Shipped'),
(5, 5000.00, 'Pending', 'Pending'),
(6, 6000.00, 'Paid', 'Shipped'),
(7, 2000.00, 'Paid', 'Shipped'),
(8, 10000.00, 'Pending', 'Pending'),
(9, 8000.00, 'Paid', 'Shipped'),
(10, 4000.00, 'Paid', 'Shipped');


-- Sample data for OrderDetails table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES 
(1, 17, 1, 15000.00),
(1, 18, 1, 500.00),
(2, 19, 2, 150.00),
(3, 20, 1, 5000.00),
(3, 21, 1, 12000.00),
(4, 22, 1, 8000.00),
(4, 23, 1, 6000.00),
(5, 24, 2, 1200.00),
(6, 17, 1, 5000.00),
(7, 18, 1, 2000.00);

-- Sample data for Payments table
INSERT INTO Payments (OrderID, PaymentMethod, PaymentAmount) VALUES 
(1, 'Credit Card', 15500.00),
(2, 'PayPal', 2500.00),
(3, 'EFT', 7500.00),
(4, 'Credit Card', 12000.00),
(5, 'PayPal', 5000.00),
(6, 'EFT', 6000.00),
(7, 'Credit Card', 2000.00),
(8, 'PayPal', 10000.00),
(9, 'EFT', 8000.00),
(10, 'Credit Card', 4000.00);


-- Sample data for Shipping table
INSERT INTO Shipping (OrderID, ShippingAddress, ShippingMethod, ShippingCost) VALUES 
(1, '123 Main St, Johannesburg', 'Standard', 100.00),
(2, '456 Elm St, Cape Town', 'Express', 200.00),
(3, '789 Pine St, Durban', 'Standard', 100.00),
(4, '101 Oak St, Pretoria', 'Express', 150.00),
(5, '202 Birch St, Bloemfontein', 'Standard', 100.00),
(6, '303 Maple St, East London', 'Express', 200.00),
(7, '404 Cedar St, Port Elizabeth', 'Standard', 100.00),
(8, '505 Willow St, Nelspruit', 'Express', 200.00),
(9, '606 Fir St, Polokwane', 'Standard', 100.00),
(10, '707 Pine St, Mbombela', 'Express', 200.00);



-- Sample data for Reviews table
INSERT INTO Reviews (ProductID, CUSTOMERID, Rating, ReviewText, CREATEDAT) VALUES 
(17, 1, 5, 'Excellent bike, smooth ride and durable.', TO_TIMESTAMP('2025-02-13', 'YYYY-MM-DD')),
(18, 4, 4, 'Good helmet, but could use better padding.', TO_TIMESTAMP('2025-02-13', 'YYYY-MM-DD')),
(19, 6, 5, 'Great water bottle, keeps my drinks cool for hours!', TO_TIMESTAMP('2025-02-13', 'YYYY-MM-DD')),
(20, 7, 4, 'Nice phone, but battery life could be better.', TO_TIMESTAMP('2025-02-13', 'YYYY-MM-DD')),
(21, 8, 5, 'Laptop is fast and powerful, highly recommend it!', TO_TIMESTAMP('2025-02-13', 'YYYY-MM-DD')),
(22, 9, 3, 'Sofa is comfortable but a bit too firm for my liking.', TO_TIMESTAMP('2025-02-13', 'YYYY-MM-DD')),
(23, 10, 4, 'Dining table looks great, but the assembly was difficult.', TO_TIMESTAMP('2025-02-13', 'YYYY-MM-DD')),
(24, 11, 5, 'Chair is very comfortable and stylish.', TO_TIMESTAMP('2025-02-13', 'YYYY-MM-DD'));


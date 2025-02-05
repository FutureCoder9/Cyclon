CREATE OR REPLACE PROCEDURE ProcessOrder (
    p_CustomerID IN NUMBER,
    p_TotalAmount IN NUMBER
) AS
    v_OrderID NUMBER;
BEGIN
    INSERT INTO Orders (CustomerID, TotalAmount, PaymentStatus, ShippingStatus)
    VALUES (p_CustomerID, p_TotalAmount, 'Pending', 'Pending')
    RETURNING OrderID INTO v_OrderID;

    -- Additional logic for order processing, e.g., updating stock levels
END;


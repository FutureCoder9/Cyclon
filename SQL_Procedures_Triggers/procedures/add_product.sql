CREATE OR REPLACE PROCEDURE AddProduct (
    p_ProductName IN VARCHAR2,
    p_VendorID IN NUMBER,
    p_Category IN VARCHAR2,
    p_Price IN NUMBER,
    p_StockQuantity IN NUMBER
) AS
BEGIN
    INSERT INTO Products (ProductName, VendorID, Category, Price, StockQuantity)
    VALUES (p_ProductName, p_VendorID, p_Category, p_Price, p_StockQuantity);
END;


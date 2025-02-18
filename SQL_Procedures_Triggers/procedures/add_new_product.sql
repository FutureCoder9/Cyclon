--Procedure 1
--Procedure Name: add_new_product
--Purpose: Inserts a new product into the Products table while validating input data.

CREATE OR REPLACE PROCEDURE add_new_product(
    p_productid NUMBER,
    p_productname VARCHAR2,
    p_vendorid NUMBER,
    p_category VARCHAR2,
    p_price NUMBER,
    p_stockquantity NUMBER
) AS
BEGIN
    -- Validate input parameters
    IF p_stockquantity < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Stock quantity cannot be negative.');
    END IF;

    -- Insert product into products table
    INSERT INTO products (productid, productname, vendorid, category, price, stockquantity)
    VALUES (p_productid, p_productname, p_vendorid, p_category, p_price, p_stockquantity);

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'An error occurred: ' || SQLERRM);
END add_new_product;
/

-- Call the procedure in an anonymous block
BEGIN
    add_new_product(12, 'lamp', 3, 'Furniture', 350, 50);
END;
/

-- Verify the inserted record
SELECT * FROM products WHERE productid = 12;



------------------

CREATE OR REPLACE PROCEDURE update_product_stock (
    p_productid NUMBER,
    p_quantity_change NUMBER
) AS
    current_stock NUMBER;
BEGIN
    -- Check if the product exists
    SELECT stockquantity INTO current_stock
    FROM products
    WHERE productid = p_productid;

    -- Calculate the new stock quantity
    current_stock := current_stock + p_quantity_change;

    -- Ensure stock quantity is not negative
    IF current_stock < 0 THEN
        current_stock := 0;
    END IF;

    -- Update the stock quantity in the products table
    UPDATE products
    SET stockquantity = current_stock
    WHERE productid = p_productid;


EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Product with ID ' || p_productid || ' not found.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'An error occurred: ' || SQLERRM);
END update_product_stock;
/


------Explanation:
---Parameters: The procedure takes two input parameters:

--p_productid (NUMBER): The ID of the product to update.

--p_quantity_change (NUMBER): The amount by which to change the stock quantity (can be positive or negative).

Check Product Existence: The procedure first checks if the product exists by selecting the current stockquantity from the products table. If the product does not exist, a NO_DATA_FOUND exception is raised.

Calculate New Stock Quantity: The procedure calculates the new stock quantity by adding the p_quantity_change to the current stock.

Ensure Non-Negative Stock: The procedure checks if the calculated stock quantity is negative. If it is, the stock quantity is set to 0.

Update Stock Quantity: The procedure updates the stockquantity in the products table for the specified productid.

Exception Handling: The procedure includes exception handling for the following cases:

NO_DATA_FOUND: If the product ID does not exist in the products table.

OTHERS: For any other errors that may occur.

How to Use the Procedure:
  
  --To use the procedure, you can call it with the productid and the desired quantity_change. For example, to add 10 items to product ID 12:

sql
BEGIN
    update_product_stock(12, 10);
END;
/

--To remove 5 items from product ID 12:

sql
BEGIN
    update_product_stock(12, -5);
END;
/

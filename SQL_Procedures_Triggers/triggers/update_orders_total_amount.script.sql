
----Creating the UPDATE_ORDERS_TOTAL_AMOUNT Trigger:
----(Here’s how you can update your trigger to handle all three events (INSERT, UPDATE, and DELETE) using a compound trigger.  Purpose: Updates the TotalAmount in the Orders table whenever a row is inserted, updated, or deleted in the OrderDetails table)


CREATE OR REPLACE TRIGGER update_orders_total_amount
FOR INSERT OR UPDATE OR DELETE ON OrderDetails
COMPOUND TRIGGER
    -- Declare a variable to hold order totals
    TYPE order_total_map IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    order_totals order_total_map;

    -- Before Statement Section
    BEFORE STATEMENT IS
    BEGIN
        -- Initialize the map
        order_totals := order_total_map();
    END BEFORE STATEMENT;

    -- After Each Row Section
    AFTER EACH ROW IS
    BEGIN
        -- Accumulate totals in memory for each OrderID based on event type
        IF INSERTING OR UPDATING THEN
            IF order_totals.EXISTS(:NEW.OrderID) THEN
                order_totals(:NEW.OrderID) := order_totals(:NEW.OrderID) + (:NEW.Quantity * :NEW.Price);
            ELSE
                order_totals(:NEW.OrderID) := (:NEW.Quantity * :NEW.Price);
            END IF;
        ELSIF DELETING THEN
            IF order_totals.EXISTS(:OLD.OrderID) THEN
                order_totals(:OLD.OrderID) := order_totals(:OLD.OrderID) - (:OLD.Quantity * :OLD.Price);
            ELSE
                order_totals(:OLD.OrderID) := -(:OLD.Quantity * :OLD.Price);
            END IF;
        END IF;
    END AFTER EACH ROW;

    -- After Statement Section
    AFTER STATEMENT IS
    BEGIN
        -- Update Orders table with calculated totals after all rows are processed
        FOR i IN order_totals.FIRST .. order_totals.LAST LOOP
            UPDATE Orders
            SET TotalAmount = (
                SELECT SUM(Quantity * Price)
                FROM OrderDetails 
                WHERE OrderID = i -- Recalculate total for this OrderID only
            )
            WHERE OrderID = i;
        END LOOP;
    END AFTER STATEMENT;
END;
/

------Insert a Valid Product into OrderDetails:
  INSERT INTO OrderDetails (ORDERDETAILID, ORDERID, PRODUCTID, QUANTITY, PRICE)
VALUES (11, 1, 1, 2, 15000);

------Verify the Insert :
SELECT * 
FROM OrderDetails
WHERE ORDERID = 1;

------Check Total Amount in Orders
SELECT ORDERID, TOTALAMOUNT
FROM Orders
WHERE ORDERID = 1;


----------- I had an error during this step due to invalid productid 22 entered in the Step "updating OrderDetails " and had to fix this in order to 

DELETE FROM OrderDetails
WHERE ORDERDETAILID = 22;






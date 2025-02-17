--Procedure 3. calculate_order_total that calculates the total amount of an order based on the items in the order_items table and updates the totalamount in the orders table.

------ 1. Create the order_items table (if it doesn't exist)
CREATE TABLE order_items (
    orderid NUMBER NOT NULL,
    productid NUMBER NOT NULL,
    quantity NUMBER NOT NULL,
    price_per_unit NUMBER(10, 2) NOT NULL,
    CONSTRAINT order_items_pk PRIMARY KEY (orderid, productid)
);

-- 2. Create the calculate_order_total procedure (if it doesn't exist)
CREATE OR REPLACE PROCEDURE calculate_order_total (
    p_orderid NUMBER
) AS
    v_total_amount NUMBER := 0;
BEGIN
    SELECT SUM(quantity * price_per_unit)
    INTO v_total_amount
    FROM order_items
    WHERE orderid = p_orderid;

    UPDATE orders
    SET totalamount = v_total_amount
    WHERE orderid = p_orderid;

    COMMIT;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Order with ID ' || p_orderid || ' not found or has no items.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'An error occurred: ' || SQLERRM);
END calculate_order_total;
/

-- 3. Insert a row into the orders table
INSERT INTO orders (orderid, userid, orderdate, totalamount, paymentstatus, shippingstatus, shippingaddress)
VALUES (11, 1, SYSDATE, 0, 'Pending', 'Pending', 'Some Address');

-- 4. Insert a row into the order_items table
INSERT INTO order_items (orderid, productid, quantity, price_per_unit) VALUES (11, 12, 2, 350);

-- 5. Execute the calculate_order_total procedure
BEGIN
    calculate_order_total(11);
END;
/

-- 6. Verify the results
SELECT orderid, totalamount FROM orders WHERE orderid = 11;

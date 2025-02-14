---- Create a trigger that prevents a vendor from being deleted from the Vendors table if there are any products associated with that vendor in the Products table.
---Table: Vendors
---Triggering Event: BEFORE DELETE

-----LOGIC:  (The trigger will fire before a row is deleted from the Vendors table.
-----The trigger will check if there are any products in the Products table where the VendorID matches the VendorID of the vendor being deleted.
-----If there are associated products, the trigger will raise an exception, preventing the deletion.
----If there are no associated products, the trigger will allow the deletion to proceed)


CREATE OR REPLACE TRIGGER prevent_vendor_deletion
BEFORE DELETE ON Vendors
FOR EACH ROW
DECLARE
    product_count NUMBER;
BEGIN
    -- Check if there are any products associated with this vendor
    SELECT COUNT(*)
    INTO product_count
    FROM Products
    WHERE VendorID = :OLD.VendorID;

    -- If there are associated products, raise an exception
    IF product_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Cannot delete vendor. There are associated products.');
    END IF;
END;
/

------------------------------------------
----to  Verify that the trigger has been created successfully by running:

SELECT TRIGGER_NAME, TRIGGER_TYPE, TRIGGERING_EVENT, STATUS
FROM USER_TRIGGERS
WHERE TRIGGER_NAME = 'PREVENT_VENDOR_DELETION';

-----to TEST the Trigger _Attempt to Delete a Vendor : 

DELETE FROM Vendors WHERE VendorID = 2;


----Outcome:

Error at Command Line : 39 Column : 13
Error report -
SQL Error: ORA-20001: Cannot delete vendor. There are associated products.

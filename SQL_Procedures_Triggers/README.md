# SQL Procedures & Triggers

🚀 Part of the Cyclon Oracle Project

This project demonstrates the use of stored procedures and triggers to automate database tasks, enforce data integrity, and encapsulate business logic within the Cyclon e-commerce platform. SQL triggers are automated code blocks that execute when specific events occur on a table or view, such as inserts, updates, or deletes . Triggers are special types of stored procedures that automatically run when an event occurs in the database server .

## 🎯 Goals

*   Implement stored procedures for common database operations (e.g., adding products, updating stock, calculating order totals).
*   Create triggers to automate tasks, enforce data integrity, and log changes.
*   Showcase PL/SQL programming skills.

## 🗂️ Files

*   **`procedures/`:** Contains SQL scripts for stored procedures.
*   **`triggers/`:** Contains SQL scripts for triggers.
*   **`examples/`:** Contains example usage of procedures and triggers, including sample calls and demonstration of trigger effects.

## 🛠️ Implemented Procedures

*   **`add_new_product.sql`:** A stored procedure to add a new product to the `Products` table. It validates input data and handles potential errors.
*   **`update_product_stock.sql`:** A stored procedure to update the `StockQuantity` in the `Products` table, preventing negative stock values.
*   **`calculate_order_total.sql`:** A stored procedure to calculate the total amount for an order based on the items in `OrderDetails`.

## ⚙️ Implemented Triggers

*   **`update_orders_total_amount.sql`:** A trigger that automatically updates the `TotalAmount` in the `Orders` table whenever a new item is added or an existing item is updated in the `OrderDetails` table.
*   **`prevent_vendor_deletion.sql`:** A trigger that prevents deleting a vendor from the `Vendors` table if the vendor has associated products in the `Products` table.  This maintains data integrity.
*   **`log_product_changes.sql`:** A trigger that logs all changes (inserts, updates, deletes) to the `Products` table in a separate `Product_Log` audit table. This is useful for auditing and tracking data modifications .
    *  Logs changes to a table is important for auditing and maintaining a history of data modifications .
*   **Consider to implement Recursive Triggers:** With indirect recursion, an application updates table T1. This fires trigger TR1, updating table T2. Trigger T2 then fires and updates table T1( TO DO !!!!) 

## 🧪 How to Use

1.  Navigate to the `procedures/` or `triggers/` folder.
2.  Run the SQL scripts to create the procedures or triggers in your Oracle database.
3.  Refer to the `examples/` folder for usage examples, including:
    *   Sample calls to the stored procedures with different input values.
    *   Demonstration of how the triggers automatically respond to data changes.
    *   Examples of error handling and exception handling.
4.  **Displaying existing triggers:** You can view existing triggers in a database using specific queries based on your SQL database management system (DBMS). For instance, in MySQL: `SHOW TRIGGERS;` 

## 🔑 Key Concepts Demonstrated

*   **PL/SQL Programming:** Demonstrates proficiency in writing PL/SQL code for stored procedures, functions, and triggers.
*   **Data Integrity:** Enforces data integrity through the use of triggers and stored procedures that validate data and prevent invalid operations.
*   **Automation:** Automates database tasks using triggers, reducing the need for manual intervention.
*   **Auditing:** Implements auditing mechanisms using triggers to track changes to important tables.
*   **Modularization:** Encapsulates business logic in stored procedures, making the code more modular and maintainable.

## 📜 Syntax and Structure of SQL Triggers

The basic syntax of an SQL trigger includes the creation statement, the event that activates the trigger, and the SQL statements that define the trigger's actions . Here’s a general template for creating a trigger (example for MySQL and Oracle) :

```sql
CREATE TRIGGER trigger_name
[BEFORE | AFTER] [INSERT | UPDATE | DELETE]
ON table_name
FOR EACH ROW
BEGIN
-- SQL statements
END; 
```


## 📄 License
This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

🚀 **Feedback and contributions welcome!**  
🔗 **Connect on [LinkedIn](https://www.linkedin.com/in/nadiya-kost/).**



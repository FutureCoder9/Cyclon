
-- Original Query
-- This query calculates the total sales per customer by summing the total_amount from the orders table.
-- It joins the orders table with the customers table on the customer_id and groups the results by customer details.
-- The results are ordered by total_sales in descending order.
SELECT c.customer_id, c.first_name, c.last_name,
       SUM(o.total_amount) AS total_sales
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_sales DESC;

-- EXPLAIN PLAN for Original Query
-- This command generates the execution plan for the original query, which helps identify performance bottlenecks.
-- The execution plan shows how Oracle will execute the query, including the steps and operations involved.
EXPLAIN PLAN FOR
SELECT c.customer_id, c.first_name, c.last_name,
       SUM(o.total_amount) AS total_sales
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_sales DESC;

-- Display the execution plan
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- Create Indexes
-- These commands create indexes on the customer_id and total_amount columns in the orders table.
-- Indexes improve query performance by allowing faster data retrieval, especially for join and aggregation operations.
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_total_amount ON orders(total_amount);

-- Create Materialized View
-- This command creates a materialized view that precomputes the total sales per customer.
-- Materialized views store the results of a query and can be refreshed periodically, reducing the need to recompute the data.
CREATE MATERIALIZED VIEW mv_customer_sales AS
SELECT customer_id, SUM(total_amount) AS total_sales
FROM orders
GROUP BY customer_id;

-- Optimized Query
-- This query retrieves the total sales per customer from the materialized view, which already contains the precomputed data.
-- It joins the materialized view with the customers table on the customer_id and orders the results by total_sales in descending order.
-- Using the materialized view significantly reduces the query runtime for reporting purposes.
SELECT c.customer_id, c.first_name, c.last_name,
       m.total_sales
FROM mv_customer_sales m
JOIN customers c ON m.customer_id = c.customer_id
ORDER BY m.total_sales DESC;




# SQL Query Optimization Project

🔗 **Part of the [Cyclon Oracle Project](https://github.com/yourusername/Cyclon)**

## 🚀 Overview
This subproject demonstrates practical SQL tuning techniques to optimize a slow SQL query in an Oracle database. The goal is to improve performance using execution plan analysis, indexing, and materialized views.

---

## 📌 Problem
The following SQL query, which calculates total sales per customer, is running slowly due to full table scans and inefficient aggregation:

```sql
SELECT 
    u.UserID, 
    u.Username, 
    SUM(od.Quantity * od.Price) AS TotalSales
FROM 
    Users u
JOIN 
    Orders o ON u.UserID = o.UserID
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
GROUP BY 
    u.UserID, u.Username
ORDER BY 
    TotalSales DESC;  -- Ordering by Total Sales in descending order



```

### 🔍 Issues:
- **Full table scan** in execution plan.
- No indexes on `USERID` in `orders` table.
- Slow aggregation `(SUM( TotalSales))` on a large dataset.

---

## 🛠 Optimization Steps

### **1️⃣ Analyze Performance**
```sql
EXPLAIN PLAN FOR
SELECT 
    u.UserID, 
    u.Username, 
    SUM(od.Quantity * od.Price) AS TotalSales
FROM 
    Users u
JOIN 
    Orders o ON u.UserID = o.UserID
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
GROUP BY 
    u.UserID, u.Username
ORDER BY 
    TotalSales DESC;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);



```

🔹 **Findings:** Full table scan (`TABLE ACCESS FULL`).


---

### **2️⃣ Add Indexes**
Created indexes to speed up joins and aggregation:

```sql

CREATE INDEX idx_order_user_id ON Orders(UserID);
CREATE INDEX idx_orderdetails_order_id ON OrderDetails(OrderID);
CREATE INDEX idx_orderdetails_product_id ON OrderDetails(ProductID);  -- If needed



```

✅ **Impact:** Faster joins and reduced aggregation time.

---

### **3️⃣ Use Materialized View**
Created a materialized view to precompute sales totals:

```sql
CREATE MATERIALIZED VIEW mv_total_sales_per_customer
AS
SELECT 
    u.UserID, 
    u.Username, 
    SUM(od.Quantity * od.Price) AS TotalSales
FROM 
    Users u
JOIN 
    Orders o ON u.UserID = o.UserID
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
GROUP BY 
    u.UserID, u.Username;

-- Refresh the materialized view every hour
ALTER MATERIALIZED VIEW mv_total_sales_per_customer 
REFRESH FAST ON DEMAND;


```

Optimized query:

```sql

EXPLAIN PLAN FOR 
SELECT o.UserID, SUM(o.TotalAmount) AS TotalSales
FROM Orders o
GROUP BY o.UserID;


```

✅ **Impact:** Precomputed data reduces runtime for reporting.

---

## 📊 Performance Comparison
| Query Version          | Execution Time       | Improvement |
|------------------------|----------------------|-------------|
| Original Query         | **Slow** (Full Table Scan) | ❌         |
| Query with Indexes     | **Faster** (Index Scan)   | ✅         |
| Query with Materialized View | **Fastest** (Precomputed Data) | 🚀 |

---

## 📂 Deliverables
- SQL scripts (original query, indexes, materialized view, optimized query).
- `EXPLAIN PLAN` output (before/after optimizations)
- Performance metrics with screenshots 

---


## 📄 License
MIT License. See [LICENSE](LICENSE) for details.

---

🚀 **Feedback and contributions welcome!**  
🔗 **Connect on [LinkedIn](https://www.linkedin.com/in/nadiya-kost/).**

---





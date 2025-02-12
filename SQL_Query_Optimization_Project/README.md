

# SQL Query Optimization Project

🔗 **Part of the [Cyclon Oracle Project](https://github.com/yourusername/Cyclon)**

## 🚀 Overview
This subproject demonstrates practical SQL tuning techniques to optimize a slow SQL query in an Oracle database. The goal is to improve performance using execution plan analysis, indexing, and materialized views.

---

## 📌 Problem
The following SQL query, which calculates total sales per customer, is running slowly due to full table scans and inefficient aggregation:

```sql
SELECT u.USERID, u.Username, u.Email, 
       SUM(o.TOTALAMOUNT) AS total_sales
FROM orders o
JOIN users u ON o.CUSTOMERID = u.USERID
GROUP BY u.USERID, u.Username, u.Email
ORDER BY total_sales DESC;


```

### 🔍 Issues:
- **Full table scan** in execution plan.
- No indexes on `customer_id` in `orders` table.
- Slow aggregation `(SUM(total_amount))` on a large dataset.

---

## 🛠 Optimization Steps

### **1️⃣ Analyze Performance**
```sql
EXPLAIN PLAN FOR
SELECT u.USERID, 
       u.USERNAME, 
       u.EMAIL, 
       SUM(o.TOTALAMOUNT) AS TOTAL_SALES
FROM ORDERS o
JOIN USERS u ON o.CUSTOMERID = u.USERID
GROUP BY u.USERID, u.USERNAME, u.EMAIL
ORDER BY TOTAL_SALES DESC;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);


```

🔹 **Findings:** Full table scan (`TABLE ACCESS FULL`).


---

### **2️⃣ Add Indexes**
Created indexes to speed up joins and aggregation:

```sql

CREATE INDEX idx_orders_customer ON orders(CUSTOMERID);
CREATE INDEX idx_orders_total_amount ON orders(TOTALAMOUNT);


```

✅ **Impact:** Faster joins and reduced aggregation time.

---

### **3️⃣ Use Materialized View**
Created a materialized view to precompute sales totals:

```sql
CREATE MATERIALIZED VIEW mv_customer_sales
AS
SELECT CUSTOMERID, SUM(TOTALAMOUNT) AS total_sales
FROM orders
GROUP BY CUSTOMERID;
```

Optimized query:

```sql
SELECT u.USERID, u.USERNAME, u.EMAIL, 
       m.total_sales
FROM mv_customer_sales m
JOIN USERS u ON m.customerid = u.USERID
ORDER BY m.total_sales DESC;
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





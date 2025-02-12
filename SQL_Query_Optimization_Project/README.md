

# SQL Query Optimization Project

🔗 **Part of the [Cyclon Oracle Project](https://github.com/yourusername/Cyclon)**

## 🚀 Overview
This subproject demonstrates practical SQL tuning techniques to optimize a slow SQL query in an Oracle database. The goal is to improve performance using execution plan analysis, indexing, and materialized views.

---

## 📌 Problem
The following SQL query, which calculates total sales per customer, is running slowly due to full table scans and inefficient aggregation:

```sql
SELECT c.customer_id, c.first_name, c.last_name,
       SUM(o.total_amount) AS total_sales
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_sales DESC;
```

### 🔍 Issues:
- **Full table scan** in execution plan.
- No indexes on `customer_id` in `orders` table.
- Slow aggregation `(SUM(total_amount))` on a large dataset.

---

## 🛠 Optimization Steps

### **1️⃣ Analyze Performance**
with `EXPLAIN PLAN`:

```sql
EXPLAIN PLAN FOR
SELECT c.customer_id, c.first_name, c.last_name,
       SUM(o.total_amount) AS total_sales
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_sales DESC;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
```

🔹 **Findings:** Full table scan (`TABLE ACCESS FULL`).


---

### **2️⃣ Add Indexes**
Created indexes to speed up joins and aggregation:

```sql
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_total_amount ON orders(total_amount);
```

✅ **Impact:** Faster joins and reduced aggregation time.

---

### **3️⃣ Use Materialized View**
Created a materialized view to precompute sales totals:

```sql
CREATE MATERIALIZED VIEW mv_customer_sales AS
SELECT customer_id, SUM(total_amount) AS total_sales
FROM orders
GROUP BY customer_id;
```

Optimized query:

```sql
SELECT c.customer_id, c.first_name, c.last_name,
       m.total_sales
FROM mv_customer_sales m
JOIN customers c ON m.customer_id = c.customer_id
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





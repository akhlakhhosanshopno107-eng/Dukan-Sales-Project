-- ==========================================
-- Dukan Sales Data Analysis - SQL Queries
-- Database: PostgreSQL
-- ==========================================

-- 1. Create the Table
CREATE TABLE data (
    date DATE,
    customer_name VARCHAR(100),
    item_type VARCHAR(50),
    measurements VARCHAR(100),
    total_amount INT,
    paid_amount INT,
    due_amount INT
);

-- 2. View all data (ordered by highest total amount)
SELECT * FROM data 
ORDER BY "total_amount" DESC;

-- 3. Find all transactions where the total amount is greater than 1000 BDT
SELECT * FROM data 
WHERE "total_amount" > 1000;

-- 4. Calculate Total Revenue and Total Due
SELECT 
    SUM("total_amount") AS total_revenue,
    SUM("due_amount") AS total_due
FROM data;

-- 5. Group by Item Type to see which product sells the most
SELECT 
    item_type, 
    SUM("total_amount") AS total_sales 
FROM data 
GROUP BY item_type 
ORDER BY total_sales DESC;

-- 6. Find top 5 VIP customers based on total purchase
SELECT 
    customer_name, 
    SUM("total_amount") AS total_spent
FROM data
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;


-- Sales Trend Analysis Using Aggregations
-- Objective: Analyze monthly revenue and order volume using SQLite

-- 1. Extract Year and Month from Order Date (First 5 rows)
SELECT 
    strftime('%Y', Date) AS year,
    strftime('%m', Date) AS month
FROM online_sales
LIMIT 5;

-- 2. Group by Year and Month
SELECT
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month,
    SUM(revenue) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month;

--  3. Calculate Total Revenue for All Time
SELECT
    SUM(revenue) AS total_revenue
FROM online_sales;

--  4. Count Total Distinct Orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales;


--  5. Order Results by Year and Month
SELECT
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month,
    SUM(revenue) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year ASC, month ASC;


--  6. Monthly Revenue and Order Volume for 2024 Only
SELECT
    strftime('%Y', Date) AS year,
    strftime('%m', Date) AS month,
    SUM(CAST("Unit Price" AS REAL)) AS total_revenue,
    COUNT(DISTINCT "Transaction Id") AS order_volume
FROM online_sales
WHERE strftime('%Y', Date) = '2024'
GROUP BY year, month
ORDER BY year ASC, month ASC;
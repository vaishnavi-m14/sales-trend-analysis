# sales-trend-analysis
SQLite project to analyze monthly revenue and order volume.

## Description

This project performs a sales trend analysis using SQLite by aggregating monthly revenue and order volume from an online sales dataset. The goal is to practice SQL techniques for:

- Extracting year and month from dates
- Grouping data by time periods
- Using aggregate functions like SUM() and COUNT()
- Sorting and filtering query results

---

## Dataset Information

The `online_sales` table includes these key columns:

| Column Name       | Details                     |
|-------------------|-----------------------------|
| Transaction ID    | Unique order identifier      |
| Date              | Order date (YYYY-MM-DD)      |
| Total Revenue     | Revenue generated per order  |

---

## Key SQL Queries

- Extract year and month from the `Date` field.
- Calculate total monthly revenue and count of unique orders.
- Filter data by year to analyze specific periods.

Example query:

```sql
SELECT
    strftime('%Y', Date) AS year,
    strftime('%m', Date) AS month,
    SUM("Total Revenue") AS total_revenue,
    COUNT(DISTINCT "Transaction ID") AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year, month;

# Sales Revenue SQL Analysis

## Project Overview
This project analyzes a simulated retail sales database in MySQL. The goal was to explore customer activity, product performance, order workflow, and payment outcomes using SQL queries.

The database includes four related tables: `customers`, `products`, `orders`, and `payments`.

## Business Questions
- Which products and categories generate the most sales?
- Which customers have the highest paid spending?
- How are orders distributed by status?
- Which payments were completed, incomplete, cancelled, or refunded?
- Which orders may need follow-up because payment was not completed?
- How can order values be grouped into small, medium, and large orders?

## Database Structure

| Table | Purpose |
|---|---|
| `customers` | Stores customer names, locations, and customer type. |
| `products` | Stores products, categories, and unit prices. |
| `orders` | Stores customer orders, quantities, dates, and order status. |
| `payments` | Stores payment amounts, payment dates, and payment status. |

## SQL Skills Demonstrated
- Creating databases and tables
- Using primary keys and foreign keys
- Inserting data with `INSERT INTO`
- Joining multiple tables with `JOIN` and `LEFT JOIN`
- Filtering data with `WHERE` and `IN`
- Summarizing data with `COUNT`, `SUM`, and `AVG`
- Grouping data with `GROUP BY`
- Sorting results with `ORDER BY`
- Categorizing records with `CASE`
- Identifying incomplete or pending payments

## Key Findings
- The database contains 8 customers, 6 products, 10 orders, and 10 payments.
- The project includes Retail, Online, and VIP customer types.
- Order records include Completed, Pending, Shipped, Processing, Cancelled, and Refunded statuses.
- Payment records include Paid, Incomplete, Cancelled, and Refund statuses.
- Pending orders with incomplete payments represent transactions that may need operational follow-up.
- This project demonstrates how SQL can be used to support reporting, sales analysis, and business decision-making.

## Tools Used
- MySQL
- MySQL Workbench
- GitHub

## Project Files
The SQL scripts in this repository are organized in the order they should be run:

1. `01_create_database.sql`
2. `02_create_tables.sql`
3. `03_insert_data.sql`
4. `04_sales_revenue_analysis.sql`

> Note: This project uses simulated data for learning and portfolio purposes.

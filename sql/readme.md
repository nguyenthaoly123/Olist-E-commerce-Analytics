# SQL – Exploratory & Business Analysis

Exploratory analysis of the Olist dataset in **T-SQL (SQL Server)**. [`Business_question.sql`](Business_question.sql) contains 9 business questions about sales, products, customers, delivery and sellers. 

## Setup
1. Run `notebooks/01_data_cleaning.ipynb` to produce the cleaned CSV files.
2. Import them into SQL Server as `[dbo].[order_cleaned]`, `[order_items_cleaned]`, `[products_cleaned]`, `[customer_cleaned]`, `[review_cleaned]`, `[payments_cleaned]`, `[sellers_cleaned]`.
3. Run `Business_question.sql`. Each query starts with a comment containing its question number and text.

## Overview

| # | Question | Tables | SQL techniques |
|---|---|---|---|
| 1 | Revenue, number of orders, AOV | order_items, order | JOIN, SUM, COUNT DISTINCT |
| 2 | Top 10 categories by items sold | order_items, products, order | JOIN, GROUP BY, TOP |
| 3 | Share of orders with review score ≤ 3 | order, review | LEFT JOIN, CASE WHEN |
| 4 | Top 3 customers by total spend in each state | customer, order, order_items | CTE, RANK() OVER (PARTITION BY) |
| 5 | Most popular payment type and average installments | payments | GROUP BY, AVG |
| 6 | Delivery vs estimate by review score | order, review | DATEDIFF, GROUP BY |
| 7 | Repeat purchase rate | customer, order | CTE, LEFT JOIN, conditional aggregation |
| 8 | New (one-time) vs repeat customers: spending | customer, order, order_items | 2 CTEs, CASE segmentation |
| 9 | Seller segmentation (review, volume, late rate) | sellers, order_items, order, review | 3 CTEs, CROSS JOIN, CASE |

---

## Query details

### Q1 – Revenue, orders and AOV
- **Logic:** join `order_items` to `order`, keep `order_status = 'delivered'`; `Revenue = SUM(price)`, `So_don = COUNT(DISTINCT order_id)`, `AOV = Revenue / So_don`.
- **Output:** `Revenue`, `So_don`, `AOV`.
- **Note:** revenue excludes freight.
- **Result:** Revenue X, orders X, AOV X.

### Q2 – Top 10 categories by quantity sold
- **Logic:** join `order_items` → `products` → `order` (delivered only), count rows per English category name, sort descending, `TOP 10`.
- **Output:** `product_name_english`, `count_product`.
- **Result:** the best-selling categories are X, X, X.

### Q3 – Share of orders with review ≤ 3
- **Logic:** `LEFT JOIN` orders to reviews; `SUM(review_score <= 3) / COUNT(order_id) × 100`.
- **Output:** `ty_le_review` (one number).
- **Note:** all order statuses are included, and orders without a review stay in the denominator.
- **Result:** X% of orders.

### Q4 – Top customers by spend in each state
- **Logic:** spend per customer = `SUM(price + freight_value)` on delivered orders, grouped by state and `customer_unique_id`; ranked inside each state with `RANK() OVER (PARTITION BY customer_state ...)`; keep rank ≤ 3.
- **Output:** `customer_state`, `customer_unique_id`, `total_spent`, `rank_customer`.
- **Result:** the highest-value customers are concentrated in X.

### Q5 – Payment methods
- **Logic:** group `payments` by `payment_type`; count orders and average the number of installments.
- **Output:** `payment_type`, `so_luong_order`, `avg_installments`.
- **Result:** the most used method is X; average installments X.

### Q6 – Delivery performance vs review score
- **Logic:** for delivered orders, `DATEDIFF(DAY, estimated_date, delivered_date)` (negative = earlier than promised), averaged per `review_score`.
- **Output:** `review_score`, `ngay_doi`.
- **Result:** 5-star orders are delivered on average **about 13 days earlier** than estimated, while 1-star orders are only **about 4 days earlier**. Delivery that is early or on time is associated with higher customer satisfaction.
- **Caveat:** this shows an association, not proof that late delivery causes low scores.

### Q7 – Repeat purchase rate
- **Logic:** count orders per `customer_unique_id` (not `customer_id`, which changes for every order); customers with ≤ 1 order vs ≥ 2 orders.
- **Output:** `so_luong_churn` (1 order), `so_luong_kochurn` (2+ orders), `ty_le_khach_mua_lai` (%).
- **Result:** only about **3%** of customers place a second order.
- **Note:** all order statuses are counted here, while Q8 uses delivered orders only.

### Q8 – New vs repeat customers
- **Logic:** order value (`price + freight_value`) per order → summary per customer (number of orders, total spent, average order value) → group by "bought once" vs "bought more than once".
- **Output:** `nhom_khach`, `so_khach`, `avg_total_spent`, `avg_order_value`.
- **Result:**

| Group | Average total spent |
|---|---|
| One-time customers | 160.74 |
| Repeat customers | 308.53 (almost 2×) |


### Q9 – Seller segmentation
- **Logic:** per seller: number of orders (`volume_order`), average review score, revenue (`SUM(price)`) and late rate (% of rows delivered after the estimate), on delivered orders. Sellers are split into 4 segments by comparing volume and review score with the **average** of all sellers.
- **Output:** per segment: `so_luong_seller`, `avg_volume`, `avg_review`, `avg_late_rate`.

| Segment | Sellers | Avg volume | Avg review | Late rate |
|---|---|---|---|---|
| High Review – High Volume | X | X | X | X |
| High Review – Low Volume | X | X | X | X |
| Low Review – High Volume | X | X | X | X |
| Low Review – Low Volume | X | X | X | X |

---

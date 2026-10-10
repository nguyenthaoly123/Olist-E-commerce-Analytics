# Notebooks

Python pipeline for the Olist Brazilian e-commerce project. Central business question: **why is the repeat purchase rate so low, and can we predict which customers will buy again?**

Run the notebooks in order; each one uses the output of the previous one.

```
raw CSVs ─► 1_clean_data ─► cleaned CSVs ─┬─► 2_EDA
                                          ├─► 3_customer_unique_id ─► customer_unique_id.csv ─► Power BI
                                          └─► 4_customer_ML ────────► customer_ml.csv ─► model (train_test)
```

| # | Notebook | Purpose | Main output |
|---|---|---|---|
| 1 | `1_clean_data.ipynb` | Check data quality and clean the 9 raw tables | cleaned CSVs |
| 2 | `2_EDA.ipynb` | Load tables and prepare the order–category link for EDA | `df_price_category` |
| 3 | `3_customer_unique_id.ipynb` | Build a one-row-per-customer table for Power BI | `customer_unique_id.csv` (96,074 × 13+2) |
| 4 | `4_customer_ML.ipynb` | Build the modelling table and the `repeat_90d` target | `customer_ml.csv` (75,304 rows) |
| 5 | `5_train_test.ipynb` | Train and compare models on `customer_ml.csv` | model, metrics |

---

## 1 – Data Quality Check & Cleaning
**Input:** 9 raw Olist CSV files  |  **Output:** cleaned tables

**Quality check (before cleaning):** for every table, count missing values and exact duplicate rows.

| Table | Finding |
|---|---|
| geolocation | 261,831 exact duplicate rows |
| review | Missing comment title/message; 814 duplicated `review_id` (same ID, different `order_id`) |
| order | Missing approval/delivery dates |
| products | Column names contain stray quotes/spaces; missing category names |
| category | 2 categories missing from the translation file (`pc_gamer`, `portateis_cozinha_e_preparadores_de_alimentos`) |
| customer, order_items, payments, sellers | No missing values, no duplicates |

**Cleaning steps**

| Table | Action | Reason |
|---|---|---|
| review | Drop rows with blank `review_id`/`order_id` | Cannot be joined without IDs |
| review | Fill missing title/message with `No Title` / `No Comment` | Keep the row; the score is the useful field |
| review | Convert date columns to datetime | Time calculations |
| order | Drop `delivered` orders that miss any of 3 date columns | A delivered order must have all dates |
| order | Convert 5 timestamp columns to datetime | Delivery-time metrics |
| products / category | Strip spaces and quotes from column names and values | Raw file formatting problem |
| products | Add English category names; add the 2 missing categories manually; label the rest `unknown` | Reporting in English |
| order_items | `order_item_id` → string; `shipping_limit_date` → datetime | ID is a label, not a number |
| geolocation | Drop duplicate rows | 261,831 exact duplicates |

**Validation:** after cleaning, the same NULL/duplicate/dtype check is re-run on all tables. Products: (32,951 × 10), 74 Portuguese ↔ 74 English categories, 0 missing English names. Review: (99,224 × 7), 0 missing values.

---

## 2 – EDA (setup)
**Input:** tables loaded into a dictionary; column names cleaned for all 9 tables.

**What it does now:** links `order_items` to `products` to get the category of every sold item (`df_price_category`), the basis for revenue-by-category analysis.

**Status:** in progress. Planned analyses: revenue over time, top categories, customers by state, delivery performance, review score vs late delivery.

---

## 3 – Customer Unique ID Table
**Purpose:** repeat purchase is a customer behaviour, so orders are aggregated to one row per `customer_unique_id` (one person can have several `customer_id`s).

**Input:** cleaned order, order_items, review, customer, products, category

**Steps**
1. `order_value` and `item_count` per order (sum of item prices).
2. `delivery_days` = delivered date − purchase date; `is_late` = delivered after estimated date.
3. Join orders to customers, order values and review scores.
4. Aggregate per customer: number of orders, total spend, average review, average delivery days, late orders, last purchase date.
5. Derived metrics: `AOV` = spend / orders, `repeat_customer` = more than 1 order, `recency` = days since last purchase (reference date = latest purchase in the data), `frequency` = number of orders.
6. First-order features for the dashboard: `first_order_value`, `first_order_category` (category with the highest value in the first order).

**Validation:** no duplicated `customer_unique_id`; no missing first-order columns.

**Used for:** Power BI Page 2 (Customer Retention): repeat rate by first order value, recency band and first category.

---

## 4 – Customer ML Table
**Purpose:** build the dataset for predicting whether a customer buys again within 90 days of their first order.

**Input:** cleaned order, customer, order_items, products, review, payments

**Steps**
1. Keep **delivered** orders only, sort by purchase time and take each customer's **first order** → 93,336 customers.
2. Build features from the first order only:

| Feature | Definition |
|---|---|
| `first_order_value` | sum of price + freight of the order |
| `first_category` | English category of the first item (`unknown` if missing) |
| `first_review_score` | earliest review of the order |
| `first_delivery_days` | purchase → delivery, in days |
| `first_late_order` | 1 if delivered after estimated date |
| `customer_state` | state of the customer |
| `first_payment_type`, `first_payment_installments` | payment with the largest value in the order |

3. **Target `repeat_90d`:** 1 if the customer places another order 1–90 days after the first order.
4. **Follow-up window:** keep only customers whose first order is at least 90 days before the dataset end date (2018-08-29) → **75,304 customers**. Customers with a shorter window would be wrongly labelled as non-repeat.
5. Missing values: categorical → `unknown`; numeric → median; `first_late_order` → 0.

**Result:** 75,304 rows, no duplicate customers. Class balance: **73,790 non-repeat (97.99%) vs 1,514 repeat (2.01%)**, a heavily imbalanced target.

---

## Key decisions
- Customers are identified by `customer_unique_id`, not `customer_id`.
- ML features use only first-order information, so the model predicts future behaviour without data leakage.
- Repeat rate in notebook 3 (customers with more than 1 order, whole period) is higher than `repeat_90d` in notebook 4 (repeat within 90 days only). They are different definitions.

## How to run
1. Download the dataset from Kaggle and place the CSVs in `data/raw/`.
2. `pip install -r requirements.txt`
3. Run the notebooks in order (`Restart & Run All`).

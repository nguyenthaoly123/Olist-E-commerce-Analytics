# Notebooks

Python pipeline for the Olist Brazilian e-commerce project. Central business question: **why is the repeat purchase rate so low, and can we predict which customers will buy again?**

Run the notebooks in order; each one uses the output of the previous one.

```
raw CSVs ─► 1_clean_data ─► cleaned CSVs ─┬─► sql/  (EDA & business analysis)
                                          ├─► 2_customer_unique_id ─► customer_unique_id.csv ─► Power BI
                                          └─► 3_customer_ML ─► customer_ml.csv ─► 4_train_test
```
## Notebook Overview

| # | Notebook | Purpose | Main Output |
|---|---|---|---|
| 1 | `1_clean_data.ipynb` | Check data quality and clean the 9 raw tables | Cleaned CSV files |
| 2 | `2_customer_unique_id.ipynb` | Build a one-row-per-customer table for Power BI | `customer_unique_id.csv` (96,074 rows, 13+2 columns) |
| 3 | `3_customer_ML.ipynb` | Build the modeling table and the `repeat_90d` target | `customer_ml.csv` (75,304 rows) |
| 4 | `4_train_test.ipynb` | Train and compare models on `customer_ml.csv` | Models and evaluation metrics |

---

## 1. Data Quality Check and Cleaning

**Input:** 9 raw Olist CSV files  
**Output:** Cleaned tables

### Quality Check Before Cleaning

For every table, missing values and exact duplicate rows were checked.

| Table | Finding |
|---|---|
| Geolocation | 261,831 exact duplicate rows |
| Review | Missing comment titles/messages; 814 duplicated `review_id` values associated with different `order_id` values |
| Order | Missing approval and delivery timestamps |
| Products | Column names contained extra quotes or spaces; some category names were missing |
| Category | Two categories were missing from the translation file: `pc_gamer` and `portateis_cozinha_e_preparadores_de_alimentos` |
| Customer, order items, payments, sellers | No missing values or duplicate rows reported in the initial checks |

### Cleaning Steps

| Table | Action | Reason |
|---|---|---|
| Review | Drop rows with blank `review_id` or `order_id` | These rows cannot be reliably joined without identifiers |
| Review | Fill missing titles/messages with `No Title` and `No Comment` | Preserve rows where the review score remains useful |
| Review | Convert date columns to datetime | Enable time-based calculations |
| Order | Drop delivered orders missing any of the three required delivery-related dates | Ensure complete timestamps for delivery analysis |
| Order | Convert five timestamp columns to datetime | Support delivery-time calculations |
| Products / Category | Strip extra spaces and quotes from column names and values | Standardize raw file formatting |
| Products | Add English category names, manually map the two missing categories, and label remaining unmapped categories as `unknown` | Support reporting in English |
| Order Items | Convert `order_item_id` to string and `shipping_limit_date` to datetime | Treat the item ID as a label and enable date calculations |
| Geolocation | Drop exact duplicate rows | Remove redundant records |

### Validation After Cleaning

The NULL, duplicate, and data type checks were repeated after cleaning.

- **Products:** 32,951 rows × 10 columns.
- **Product categories:** 74 Portuguese categories mapped to 74 English categories.
- **Missing English category names:** 0.
- **Reviews:** 99,224 rows × 7 columns, with 0 missing values.

---

## 2. Customer Unique ID Table

### Purpose

Repeat purchase is a customer-level behavior. Therefore, orders are aggregated by `customer_unique_id`, because one person may have multiple `customer_id` values.

**Input:** Cleaned orders, order items, reviews, customers, products, and categories.

### Feature Engineering Steps

1. Calculate `order_value` and `item_count` for each order. `order_value` is calculated as the sum of item prices.
2. Calculate `delivery_days` as delivery date minus purchase date.
3. Create `is_late`, indicating whether delivery occurred after the estimated delivery date.
4. Join orders with customer information, order values, and review scores.
5. Aggregate data by customer to calculate the number of orders, total spend, average review score, average delivery time, late orders, and last purchase date.
6. Derive customer-level metrics:
   - `AOV` = total spend / number of orders.
   - `repeat_customer` = 1 if the customer has more than one order; otherwise 0.
   - `recency` = days since the last purchase, using the latest purchase date in the dataset as the reference date.
   - `frequency` = number of orders.
7. Create first-order features for the dashboard, including `first_order_value` and `first_order_category`, defined as the category with the highest value in the first order.

### Validation

- No duplicated `customer_unique_id` values.
- No missing values in the required first-order columns.

**Main output:** `customer_unique_id.csv` (96,074 rows).

---

## 3. Customer ML Table

### Purpose

Build a customer-level dataset to predict whether a customer places another order within 90 days of their first order.

**Input:** Cleaned orders, customers, order items, products, reviews, and payments.

### 3.1 Customer Selection

1. Keep delivered orders only.
2. Sort orders by purchase timestamp and select each customer's first order.
3. This produces an initial population of 93,336 customers.
4. Keep only customers whose first order occurred at least 90 days before the dataset end date, 2018-08-29. This ensures every customer has a complete 90-day observation window.

**Final dataset:** 75,304 customers.

### 3.2 Feature Engineering

All predictive features are derived from the first order.

| Feature | Definition |
|---|---|
| `first_order_value` | Sum of item price and freight value for the first order |
| `first_category` | English category of the first item; `unknown` if missing |
| `first_review_score` | Earliest review score associated with the first order |
| `first_delivery_days` | Number of days between purchase and delivery |
| `first_late_order` | 1 if the order was delivered after the estimated date; otherwise 0 |
| `customer_state` | Customer's state |
| `first_payment_type` | Payment type with the largest payment value in the order |
| `first_payment_installments` | Installment count associated with the payment having the largest value |

### 3.3 Target Definition

The target is `repeat_90d`:

- `1`: The customer places another order between 1 and 90 days after the first order.
- `0`: The customer does not place another order within that window.

Customers without a complete 90-day observation window are excluded to avoid incorrectly labeling them as non-repeat customers.

### 3.4 Missing Values

- Categorical features: fill missing values with `unknown`.
- Numeric features: fill missing values with the median.
- `first_late_order`: fill missing values with `0`.

### 3.5 Class Distribution

| Target | Number of Customers | Percentage |
|---|---:|---:|
| Non-repeat (`0`) | 73,790 | 97.99% |
| Repeat (`1`) | 1,514 | 2.01% |
| **Total** | **75,304** | **100%** |

The target is highly imbalanced, so accuracy alone is not sufficient to evaluate model performance.

---

## 4. Train_test

### Purpose

Predict whether a customer places another order within 90 days of their first order (`repeat_90d`), using only information available from the first order.

**Input:** `customer_ml.csv` (75,304 customers, 9 features plus target).  
**Output:** Model evaluation metrics and threshold analysis.

### 4.1 Preprocessing and Modeling Pipeline

1. Load the dataset, strip whitespace from column names, convert numeric columns to numeric types, and replace missing categorical values with `unknown`.
2. Calculate correlations between numeric features and the target and visualize them in a bar chart.
3. Split the data into training and test sets using a stratified 80/20 split:
   - Training set: 60,243 customers.
   - Test set: 15,061 customers.
   - Positive cases in the test set: 303 repeat customers.
4. Apply median imputation using training-set medians only.
5. Apply one-hot encoding to `first_category`, `customer_state`, and `first_payment_type`, aligning test columns with the training columns.
6. Fit `StandardScaler` on the training set and apply it to the test set.
7. Apply SMOTE to the training set only. The class counts change from 59,032 non-repeat and 1,211 repeat customers to 59,032 samples in each class. The test set retains its original class distribution.
8. Train and compare three models:
   - Logistic Regression — baseline model.
   - Random Forest.
   - HistGradientBoosting.
9. Tune the Logistic Regression classification threshold using out-of-fold training probabilities from 5-fold cross-validation, with SMOTE applied inside each fold. Select the threshold that maximizes F2, which gives greater weight to recall than precision.
10. Tune Logistic Regression hyperparameters using `GridSearchCV` over `C`, `solver`, and `class_weight`, with 5-fold cross-validation and SMOTE inside the pipeline.

### 4.2 Model Evaluation Results

The following results are from the test set.

| Model | Accuracy | Precision | Recall | F1 | ROC-AUC | PR-AUC |
|---|---:|---:|---:|---:|---:|---:|
| Logistic Regression + SMOTE | 0.533 | 0.024 | 0.568 | 0.047 | 0.588 | 0.032 |
| Random Forest + SMOTE | 0.811 | 0.025 | 0.218 | 0.044 | 0.564 | 0.025 |
| HistGradientBoosting + SMOTE | 0.916 | 0.022 | 0.073 | 0.034 | 0.550 | 0.027 |
| Logistic Regression, threshold 0.54 | 0.680 | 0.026 | 0.422 | 0.050 | 0.588 | 0.032 |
| Tuned Logistic Regression (`C=5`) | 0.532 | 0.024 | 0.568 | 0.047 | 0.588 | 0.032 |

**Reference performance for a random model:** ROC-AUC = 0.50 and PR-AUC approximately 0.020, corresponding to the positive class rate.

### 4.3 Interpretation

- **Accuracy is misleading:** predicting every customer as non-repeat would already achieve approximately 98% accuracy. HistGradientBoosting has the highest accuracy among the tested models but the lowest recall.
- **Logistic Regression performs best overall among the tested models:** it achieves ROC-AUC of approximately 0.59 and PR-AUC of 0.032, indicating limited predictive power.
- **Precision remains low:** precision is approximately 2–3%, so most customers flagged by the models are not actual repeat customers.
- **Hyperparameter tuning provides little improvement:** the tuned Logistic Regression has nearly the same ROC-AUC as the baseline.
- **Threshold selection involves a trade-off:** at a threshold of 0.54, recall decreases from approximately 0.57 to 0.42, while the number of non-repeat customers flagged decreases from 6,917 to 4,710. The reported F2 score at this threshold is 0.106.

### 4.4 Conclusion

First-order information—including order value, product category, review score, delivery time, payment method, and customer state—provides only a weak signal for predicting repeat purchases within 90 days.

The current model should be treated as a baseline rather than a reliable customer-targeting solution. The results suggest that additional behavioral and marketing information may be needed to improve prediction.

These findings complement the SQL and Power BI analyses by highlighting the difficulty of predicting customer retention from first-order information alone.

### 4.5 Limitations and Next Steps

**Limitations**

- The dataset covers a single marketplace during 2016–2018.
- Only 1,514 customers in the modeling population are positive cases.
- Browsing behavior, voucher usage, email campaigns, and other marketing interactions are unavailable.

**Potential improvements**

- Add features such as item count, freight-to-order-value ratio, seller information, and product weight.
- Compare SMOTE with class-weighted models.
- Use PR-AUC, recall, precision, and F2 to assess performance under class imbalance.

---

## Key Decisions

- Use `customer_unique_id` rather than `customer_id` to represent customers.
- Build predictive features from the first order only to avoid using future information.

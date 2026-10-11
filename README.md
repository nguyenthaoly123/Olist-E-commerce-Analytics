# Olist E-Commerce Analytics & Repeat Purchase Prediction

An end-to-end e-commerce analytics project that uses SQL, Python, Power BI, and machine learning to understand customer retention, identify repeat-purchase patterns, and support data-driven business decisions for Olist.

## 1. Business Problem

Olist is a Brazilian e-commerce marketplace connecting customers and sellers. Although the platform processes a large volume of orders, its observed repeat purchase rate is only **3.12%**.

This project investigates the following business questions:

- Why is the repeat purchase rate low?
- Which customer segments and first-order characteristics are associated with repeat purchasing?
- How do product categories, delivery performance, customer reviews, and geographic markets relate to customer retention?
- How can Olist improve customer retention and seller performance through data-driven actions?
- Can machine learning help identify customers with a higher likelihood of making a repeat purchase?

**Project objective:** Transform raw e-commerce data into actionable business insights, interactive dashboards, and a baseline repeat-purchase prediction model.

## 2. Key Findings

- **Low customer retention:** The overall repeat purchase rate is **3.12%**, with approximately **2,996 repeat customers** compared with **93K non-repeat customers**.
- **Category-level differences:** Repeat rates vary by first-order category. Cuisine records approximately **14.29%**, while Bed, Bath & Table records approximately **4.64%** in the displayed category analysis.
- **Delivery experience requires further investigation:** Repeat customers have a late-delivery rate of **12.48%**, compared with **7.95%** for non-repeat customers. Average delivery duration is similar at **11.90 days** and **12.11 days**, respectively.
- **Revenue concentration:** Health & Beauty generates approximately **1.26M BRL**, followed by Watches & Gifts at **1.21M BRL** and Bed, Bath & Table at **1.04M BRL**.

These findings indicate opportunities for targeted retention campaigns, category-specific recommendations, and seller performance monitoring. They describe observed patterns and do not establish causation.

## 3. Dashboard Preview

### Page 1 — Overview

<img width="1045" height="608" alt="Page1_Overview" src="https://github.com/user-attachments/assets/fae5534c-1464-48e9-95fd-eaf31283813c" />

This page summarizes revenue, order volume, average order value, review scores, repeat rate, order status, product category performance, and delivery performance.

### Page 2 — Customer Retention
<img width="1056" height="604" alt="Page2_Customer Analysis" src="https://github.com/user-attachments/assets/132dec0a-3f07-45bb-998c-248fa4d32608" />

This page compares repeat and non-repeat customers and examines retention patterns by first-order value, recency, and product category.

### Page 3 — Customer Experience
<img width="1055" height="606" alt="Page3_Customer Experience" src="https://github.com/user-attachments/assets/da576660-a879-48ed-9c9e-1f4c0d0915ac" />

This page explores delivery duration, late-delivery rates, review scores, and customer retention across geographic markets.

### Page 4 — Product & Seller Performance
<img width="1057" height="609" alt="Page4_Product   Seller Performance" src="https://github.com/user-attachments/assets/2e2bc643-2a69-4521-8d24-a8468e330411" />


This page compares category revenue and seller-level performance using revenue, order volume, late-delivery rate, and review scores.


## 4. Tech Stack

| Technology | Purpose |
|---|---|
| SQL Server | Data querying, joins, aggregations, and business metric validation |
| Python | Data cleaning, feature engineering, exploratory data analysis, and machine learning |
| pandas | Data manipulation and preprocessing |
| scikit-learn | Model training, evaluation, and preprocessing pipelines |
| imbalanced-learn | SMOTE-based class imbalance handling, where appropriate |
| Power BI | Interactive dashboards, KPI monitoring, and business analysis |
| Git & GitHub | Version control and project documentation |

## 5. Project Structure

```text
Olist-E-Commerce-Analytics/
│
├── data/
│   ├── data_dictionary.md                 
│   └── readme.md            
│
├── notebooks/
│   ├── 01_data_cleaning.ipynb
│   ├── 02_customer_unique_id.ipynb
│   ├── 03_customer_ML.ipynb
│   ├── 04_train_test.ipynb
│   └── readme.md
│
├── sql/
│   ├── business_question.sql
|   ├── readme.md
│  
│   
│
├── powerbi/
│   ├── screenshots
|       ├── Page1_Overview.png
│       ├── Page2_Customer_Retention.png
│       ├── Page3_Customer_Experience.png
│       └── Page4_Seller_Performance.png
│   ├──kpi.definitions.md
│   
│   
│   
│
├── reports/
│   └── business_insights.md
|   ├── recommendations.pdf
│
└── README.md
```

### Directory and File Descriptions

| Directory / File | Description |
|---|---|
| `data/` | Documents the datasets used in the project and their data structure. |
| `data/data_dictionary.md` | Describes dataset columns, data types, definitions, and relevant business meanings. |
| `data/readme.md` | Explains the data source, download instructions, and dataset organization. |
| `notebooks/` | Contains the Python workflow for data preparation, customer feature engineering, and machine learning. |
| `notebooks/01_data_cleaning.ipynb` | Checks data quality, handles missing values and duplicates, and prepares cleaned datasets. |
| `notebooks/02_customer_unique_id.ipynb` | Aggregates customer behavior using `customer_unique_id` and creates customer-level analytical features. |
| `notebooks/03_customer_ML.ipynb` | Prepares the customer-level modeling dataset, including input features and the `repeat_90d` target. |
| `notebooks/04_train_test.ipynb` | Splits the data, trains and evaluates classification models, and compares model performance. |
| `notebooks/readme.md` | Documents the notebook execution order and explains the purpose of each notebook. |
| `sql/` | Contains SQL queries for answering business questions and validating analytical findings. |
| `sql/business_question.sql` | Uses SQL joins, aggregations, and filtering to investigate revenue, customer retention, delivery performance, and seller performance. |
| `sql/readme.md` | Explains the SQL scripts, database setup, and how to execute the queries. |
| `powerbi/` | Contains the Power BI dashboard documentation and exported report screenshots. |
| `powerbi/screenshots/` | Stores screenshots of the four dashboard pages for previewing the project on GitHub. |
| `powerbi/kpi.definitions.md` | Defines dashboard KPIs, calculation logic, and business interpretations. |
| `reports/` | Contains the project's business findings and recommended actions. |
| `reports/business_insights.md` | Summarizes key findings using the Finding → Evidence → So what structure. |
| `reports/recommendations.pdf` | Presents actionable recommendations for customer retention, remarketing, delivery performance, and seller management. |
| `README.md` | Introduces the project, business problem, key findings, technology stack, workflow, and results. |

## 6. Machine Learning Results

### Objective

Predict whether a customer will make a repeat purchase within the defined observation window.

**Target variable:** `repeat_90d`

- `1`: Customer makes a repeat purchase within 90 days, according to the project's target definition.
- `0`: Customer does not make a qualifying repeat purchase within that window.

The exact target construction must account for customer eligibility and the available observation period to avoid labeling customers as non-repeat simply because insufficient follow-up time is available.

### Modeling Workflow

1. Create customer-level features using information available at the prediction point.
2. Define the repeat-purchase target and exclude customers without sufficient observation time.
3. Split the data into training and test sets.
4. Fit preprocessing transformations using training data only.
5. Apply SMOTE to the training data only, if appropriate for the chosen model and validation strategy.
6. Train and compare baseline classification models.
7. Evaluate performance on untouched validation/test data.
8. Save the selected model and preprocessing pipeline for Streamlit deployment.

### Model Comparison

| Model | Accuracy | Precision | Recall | F1-score | ROC-AUC | PR-AUC |
|---|---:|---:|---:|---:|---:|---:|
| Logistic Regression | 0.5332 | 0.0243 | 0.5676 | 0.0467 | 0.588 | 0.0321 |
| Random Forest | 0.8109 | 0.0247 | 0.2178 | 0.0443 | 0.5636 | 0.0251 |
| HistGradientBoosting | 0.9158 | 0.0218 | 0.0726 | 0.0335 | 0.5495 | 0.0274 |

**Best model:** Logistic Regression .

**Primary evaluation metric:** PR-AUC, supported by Recall, Precision, F1-score, and ROC-AUC.

Because repeat purchases are relatively rare, accuracy alone may be misleading. PR-AUC helps evaluate the trade-off between precision and recall for the positive class. The final model should be selected according to the business objective and the cost of false positives versus missed repeat buyers.

### Limitations

- The model identifies statistical patterns rather than proving why customers return.
- Customer behavior may change over time, so performance should be validated on a temporally separate test set where feasible.
- SMOTE and preprocessing must be applied within the training pipeline to prevent data leakage.
- Customer-level features must not contain information observed after the prediction point.
- Repeat-purchase labels depend on the chosen time window and customer eligibility rules.
- Model performance on historical Olist data may not generalize to other marketplaces or future customer populations.



## 8. Reports and Documentation

- [Business Insights](reports/business_insights.md) — Findings, supporting evidence, and explanations of potential retention challenges.
- [Business Recommendations](recommendations.pdf) — Proposed customer retention, remarketing, and seller performance actions.
- [KPI Definitions](kpi_definitions.md) — Business definitions, formulas, and calculation rules for dashboard metrics.
- [Power BI Dashboard](powerbi/Olist_Dashboard.pbix) — Interactive dashboard for exploring the analysis.

## 9. Data Source

Olist Brazilian E-Commerce Public Dataset, available on Kaggle:

https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

The dataset contains historical Brazilian e-commerce transactions and related customer, product, seller, payment, delivery, and review information.

## 10. Author

**Nguyen Thao Ly**

Information Technology Student | Aspiring Data Analyst / Data Scientist

GitHub: [github.com/nguyenthaoly123](https://github.com/nguyenthaoly123)


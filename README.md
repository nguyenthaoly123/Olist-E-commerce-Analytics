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
│   ├── raw/                  # Original Kaggle datasets
│   └── cleaned/              # Cleaned datasets for analysis
│
├── notebooks/
│   ├── 01_data_quality_check.ipynb
│   ├── 02_data_cleaning.ipynb
│   ├── 03_exploratory_data_analysis.ipynb
│   ├── 04_customer_features.ipynb
│   └── 05_repeat_purchase_model.ipynb
│
├── sql/
│   ├── business_analysis.sql
│  
│   
│
├── powerbi/
│   ├──
│   ├── Page1_Overview.png
│   ├── Page2_Customer_Retention.png
│   ├── Page3_Customer_Experience.png
│   └── Page4_Seller_Performance.png
│
├── reports/
│   └── business_insights.md
│
├── models/
│   └── repeat_purchase_model.pkl
│
|
├── requirements.txt
├── kpi_definitions.md
├── recommendations.pdf
└── README.md
```

**Directory descriptions**

- `data/raw/`: Original datasets downloaded from Kaggle.
- `data/cleaned/`: Cleaned and validated data used in SQL, Power BI, and machine learning.
- `notebooks/`: Sequential notebooks for data quality checks, cleaning, EDA, customer feature engineering, and model development.
- `sql/`: SQL scripts for data validation, joins, business questions, and KPI verification.
- `powerbi/`: Power BI report and exported dashboard screenshots.
- `reports/`: Business insights and analytical findings.
- `models/`: Saved model artifacts and, where necessary, preprocessing objects.
- `app.py`: Streamlit application for repeat-purchase prediction.
- `requirements.txt`: Python dependencies required to run the project.
- `kpi_definitions.md`: Definitions and calculation logic for dashboard KPIs.
- `recommendations.pdf`: Business recommendations derived from the analysis.

*The structure above is the intended project layout. Keep only files and folders that actually exist in the published repository.*

## 6. How to Run

### Prerequisites

- Python 3.10 or a compatible version supported by the project's dependencies.
- Git.
- SQL Server and SSMS if you want to execute the SQL scripts.
- Power BI Desktop if you want to open and explore the `.pbix` report.

### Step 1 — Clone the repository

```bash
git clone https://github.com/<your-username>/<your-repository>.git
cd Olist-E-Commerce-Analytics
```

Replace the repository URL and directory name with your actual GitHub repository details.

### Step 2 — Download the datasets

Download the Olist Brazilian E-Commerce Public Dataset from Kaggle:

[Kaggle — Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

Place the original CSV files in `data/raw/`.

The raw files should include the relevant customer, order, order item, payment, review, product, seller, and product-category translation datasets.

Do not commit large raw datasets to GitHub unless their licensing, repository size, and distribution requirements permit it.

### Step 3 — Install dependencies

Create and activate a virtual environment:

```bash
python -m venv .venv
```

Windows:

```bash
.venv\Scripts\activate
```

Install the required packages:

```bash
pip install -r requirements.txt
```

### Step 4 — Run the notebooks in order

Execute the notebooks sequentially:

1. `01_data_quality_check.ipynb` — Inspect data types, missing values, duplicates, and key constraints.
2. `02_data_cleaning.ipynb` — Clean and validate the source datasets.
3. `03_exploratory_data_analysis.ipynb` — Explore customer, order, product, delivery, and review patterns.
4. `04_customer_features.ipynb` — Build customer-level features and the repeat-purchase target.
5. `05_repeat_purchase_model.ipynb` — Train, tune, and evaluate the classification models.

Ensure that output paths in the notebooks point to the directories used in your local environment.

### Step 5 — Run the SQL analysis

Import the relevant cleaned datasets into SQL Server and execute the scripts in `sql/`.

Update connection settings and database names as required by your environment. Validate the SQL outputs against the corresponding Power BI measures.

### Step 6 — Open the Power BI dashboard

Open `powerbi/Olist_Dashboard.pbix` in Power BI Desktop.

Update the data source paths or database connection, refresh the model, and check that slicers and measures work correctly.

### Step 7 — Run the Streamlit application

After training the model and saving the model artifact:

```bash
streamlit run app.py
```

The application should load the saved model and its associated preprocessing pipeline to generate predictions from customer features.

**Important:** The saved model, preprocessing objects, and `app.py` must use the same feature names, column order, and transformations as the training pipeline.

## 7. Machine Learning Results

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
| Logistic Regression | TBD | TBD | TBD | TBD | TBD | TBD |
| Random Forest | TBD | TBD | TBD | TBD | TBD | TBD |
| HistGradientBoosting | TBD | TBD | TBD | TBD | TBD | TBD |

**Best model:** To be determined after evaluation.

**Primary evaluation metric:** PR-AUC, supported by Recall, Precision, F1-score, and ROC-AUC.

Because repeat purchases are relatively rare, accuracy alone may be misleading. PR-AUC helps evaluate the trade-off between precision and recall for the positive class. The final model should be selected according to the business objective and the cost of false positives versus missed repeat buyers.

### Limitations

- The model identifies statistical patterns rather than proving why customers return.
- Customer behavior may change over time, so performance should be validated on a temporally separate test set where feasible.
- SMOTE and preprocessing must be applied within the training pipeline to prevent data leakage.
- Customer-level features must not contain information observed after the prediction point.
- Repeat-purchase labels depend on the chosen time window and customer eligibility rules.
- Model performance on historical Olist data may not generalize to other marketplaces or future customer populations.
- Predicted probabilities should not be treated as calibrated probabilities unless calibration has been evaluated.

**Results will be added after the final model comparison.** No model performance is claimed until the test-set metrics have been calculated.

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

This project demonstrates an end-to-end analytics workflow, from data quality checks and SQL analysis to dashboard development, customer-level modeling, and business recommendations. 

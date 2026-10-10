
# Data Documentation

## 1. Data Source

This project uses the **Brazilian E-Commerce Public Dataset by Olist**, available on Kaggle.

- **Dataset:** [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Source:** Olist / Kaggle
- **Data type:** Historical e-commerce transactional data
- **Purpose:** Sales analysis, customer behavior analysis, product performance analysis, and delivery experience analysis.

## 2. Dataset Structure

The original dataset contains the following tables:

| Table | Description |
|---|---|
| `olist_customers_dataset` | Customer identifiers and geographic information |
| `olist_orders_dataset` | Order status and order lifecycle timestamps |
| `olist_order_items_dataset` | Products purchased, sellers, prices, and freight costs |
| `olist_order_payments_dataset` | Payment methods, installments, and payment values |
| `olist_order_reviews_dataset` | Customer review scores and review text |
| `olist_products_dataset` | Product attributes and product categories |
| `olist_sellers_dataset` | Seller identifiers and geographic information |
| `product_category_name_translation` | Portuguese-to-English product category translations |

## 3. Data Processing

The raw datasets are processed using Python before being used for SQL analysis and Power BI visualization.

Main data preparation steps include:

- Inspecting data types, missing values, and duplicate records.
- Standardizing column values and converting data types.
- Processing date and time fields.
- Handling missing product attributes and review text values where appropriate.
- Validating primary keys, foreign key relationships, and orphan records.
- Preparing cleaned datasets for downstream analysis.

Refer to the notebooks in the `notebooks/` directory for implementation details.


## 4. How to Obtain the Data

1. Download the dataset from [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).
2. Extract the CSV files into the local `data/raw/` directory.
3. Run the data preparation notebooks in the `notebooks/` directory.
4. Follow the SQL setup instructions to load the required datasets into SQL Server.
5. Configure the data source paths in Power BI if necessary.

Update local file paths and database connection settings according to your environment.


## 5. Reproducibility Notes

The analysis results depend on the dataset version, data cleaning decisions, and metric definitions.

For consistent results, use the same source dataset and follow the documented preprocessing steps. Refer to the project README, notebooks, and SQL scripts for further details.


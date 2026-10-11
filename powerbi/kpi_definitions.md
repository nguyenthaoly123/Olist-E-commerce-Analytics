# Olist E-Commerce Performance Dashboard

### Project Objective

Analyze Olist's Brazilian e-commerce performance to understand sales trends, customer retention, customer experience, and seller performance. The dashboard aims to identify business opportunities to improve repeat purchases, delivery performance, and revenue generation.

### Dashboard Structure

The Power BI dashboard contains four pages:

| Page | Name | Main Focus |
|---|---|---|
| 1 | Overview | Overall sales performance, order status, product category revenue, and delivery time |
| 2 | Customer Analysis | Customer retention, repeat rate, spending behavior, and first-order characteristics |
| 3 | Customer Experience | Repeat purchase behavior by state, delivery duration, late delivery, and review scores |
| 4 | Product & Seller Performance | Category revenue, seller performance, late delivery, and seller review scores |

### Global Filters

- `Year`: Filter data by year.
- `Monthnumber`: Filter data by month.
- `customer_state` or `seller_state`: Filter by customer or seller location, depending on the page.

The KPI values and charts change according to the selected filters.

---

# I.Page 1 – Overview 
<img width="1045" height="608" alt="Page1_Overview" src="https://github.com/user-attachments/assets/8711a974-bbd8-40f4-b57a-251ddb76116f" />


## 1. Key Performance Indicators (KPIs)

### 1.1. Revenue
- **Value:** 13.59M
- **Definition:** Total revenue generated from product sales.
- **Unit:** BRL (Brazilian Real).
- **Insight:** Revenue increased from approximately 0.7M in Q1 2017 to 2.9M in Q2 2018, indicating substantial growth in sales activity during the observed period.

### 1.2. Total Order
- **Value:** 99K
- **Definition:** Total number of unique orders.
- **Insight:** Order volume generally increased alongside revenue, suggesting that growth was driven partly by an increase in the number of orders.

### 1.3. Average Order Value (AOV)
- **Value:** 136.71 BRL
- **Definition:** Average product revenue generated per order.
- **Insight:** Customers spent an average of 136.71 BRL per order. This metric helps distinguish revenue growth driven by order volume from growth driven by spending per order.

### 1.4. Average Review Score
- **Value:** 4.09 / 5
- **Definition:** Average customer review rating.
- **Insight:** The average rating of 4.09 indicates generally positive customer feedback, although the remaining gap to the maximum score of 5 suggests opportunities to improve the shopping and delivery experience.

### 1.5. Repeat Rate
- **Value:** 3.12%
- **Definition:** Percentage of unique customers who made repeat purchases, based on the current model's definition.
- **Calculation:** Repeat Customers / Total Unique Customers × 100%.
- **Insight:** Only 3.12% of customers were classified as repeat customers. This is a potential retention challenge and suggests opportunities to encourage second purchases through targeted promotions, better delivery experiences, and post-purchase engagement.

---

## 2. Chart Definitions and Key Findings

### 2.1. Revenue and Total Order by Year and Quarter
- **Chart Type:** Combo Chart (Column and Line).
- **Metrics:** Revenue and Total Orders.
- **Dimensions:** Year and Quarter.

**Key findings:**
- Q1 2017 generated approximately **0.7M BRL** in revenue.
- Revenue increased to approximately **1.3M BRL** in Q2 2017 and **1.7M BRL** in Q3 2017.
- Revenue reached approximately **2.4M BRL** in Q4 2017.
- In 2018, revenue reached approximately **2.8M BRL** in Q1 and peaked at **2.9M BRL** in Q2.
- Revenue declined to approximately **1.7M BRL** in Q3 2018.
- The Q3 2018 value may reflect a partial reporting period, so it should not automatically be interpreted as a sustained business decline.

**Business implication:** The business experienced strong growth from 2017 into the first half of 2018.

### 2.2. Count of Orders by Review Score
- **Chart Type:** Column Chart.
- **Metric:** Count of records by review score.
- **Dimension:** Review Score (1–5).

**Values shown in the dashboard:**

| Review Score | Count |
|---|---:|
| 1 star | 11K |
| 2 stars | 3K |
| 3 stars | 8K |
| 4 stars | 19K |
| 5 stars | 57K |
| **Total displayed** | **98K** |

**Key findings:**
- Five-star reviews account for approximately **58.2%** of the displayed review records.
- Four- and five-star reviews together account for approximately **77.6%**.
- One-star reviews account for approximately **11.2%**.
- Two-star reviews represent approximately **3.1%**.
- The displayed distribution indicates that positive reviews substantially outnumber negative reviews.

**Business implication:** Although customer feedback is generally positive, the 11K one-star reviews represent a meaningful group of dissatisfied customers.

### 2.3. Total Orders by Order Status
- **Chart Type:** Pie Chart.
- **Metric:** Number of orders.
- **Dimension:** Order Status.

**Values shown in the dashboard:**

| Order Status | Approximate Count | Share |
|---|---:|---:|
| Delivered | 96K | 97.02% |
| Other statuses combined | 3K | 2.98% |
| **Total** | **99K** | **100%** |

Other statuses include shipped, canceled, unavailable, invoiced, processing, and created.

**Key findings:**
- Approximately **97.02%** of orders reached the delivered status.
- Approximately **2.98%** remained in other statuses.
- The chart indicates a high delivery completion rate across the observed orders.

**Business implication:** The overall completion rate is high, but the remaining orders should be examined separately to distinguish normal processing orders from canceled, unavailable, or delayed orders.

### 2.4. Revenue by Product Category
- **Chart Type:** Horizontal Bar Chart.
- **Metric:** Revenue.
- **Dimension:** English Product Category.

**Top categories shown in the dashboard:**

| Rank | Product Category | Revenue |
|---:|---|---:|
| 1 | Health & Beauty | 1.26M BRL |
| 2 | Watches & Gifts | 1.21M BRL |
| 3 | Bed, Bath & Table | 1.04M BRL |
| 4 | Sports & Leisure | 0.99M BRL |
| 5 | Computers & Accessories | 0.91M BRL |
| 6 | Furniture & Decor | 0.73M BRL |
| 7 | Cool Stuff | 0.64M BRL |
| 8 | Housewares | 0.63M BRL |
| 9 | Auto | 0.59M BRL |
| 10 | Garden Tools | 0.49M BRL |


**Key findings:**
- Health & Beauty leads the displayed categories with approximately **1.26M BRL**.
- Watches & Gifts follows closely at **1.21M BRL**, a difference of approximately **50K BRL**.
- Bed, Bath & Table generates approximately **1.04M BRL**.
- The top five categories each generate around **0.91M BRL or more**.
- Telephony generates approximately **0.32M BRL**, less than one-third of Health & Beauty revenue.

**Business implication:** Health & Beauty and Watches & Gifts are important revenue contributors. The business could investigate their best-selling products, order frequency, and repeat-purchase behavior to identify opportunities for further growth.

### 2.5. Average Delivery Days by Customer State
- **Chart Type:** Column Chart.
- **Metric:** Average delivery duration in days.
- **Dimension:** Customer State.

**Values shown in the dashboard:**

| State | Average Delivery Days |
|---|---:|
| RR | 29 days |
| AP | 27 days |
| AM | 26 days |
| AL | 24 days |
| PA | 23 days |
| SE | 21 days |
| MA | 21 days |
| CE | 21 days |
| PI | 21 days |
| TO | 20 days |
| RO | 20 days |
| BA | 19 days |
| PB | 19 days |
| RN | 19 days |
| PE | 19 days |
| AC | 19 days |
| GO | 19 days |
| MT | 19 days |
| MS | 19 days |
| ES | 18 days |

**Key findings:**
- RR has the longest displayed average delivery time at approximately **29 days**.
- AP follows at **27 days**, while AM averages approximately **26 days**.
- ES has the shortest average among the displayed states at approximately **18 days**.
- The difference between RR and ES is approximately **11 days**.
- Several states have average delivery durations above 24 days, suggesting potential regional logistics challenges.

**Business implication:** Logistics improvement efforts could prioritize states with the longest delivery durations. However, the analysis should also account for order volume, geographic distance, and the proportion of late deliveries before drawing conclusions about logistics performance.


---

## 3. Business Insights

### Insight 1: Revenue Grew Significantly Before Declining in Q3 2018
- Revenue increased from approximately **0.7M BRL in Q1 2017** to **2.9M BRL in Q2 2018**.
- Revenue declined to approximately **1.7M BRL in Q3 2018**.
- The peak quarter generated over four times the revenue recorded in Q1 2017.

### Insight 2: Order Fulfillment Performance Is High
- Approximately **97.02% of orders** reached the delivered status.
- Approximately **2.98% of orders** remained in other statuses.
- The high delivery completion rate suggests that most recorded orders reached customers successfully.

### Insight 3: Customer Reviews Are Generally Positive
- The average review score is **4.09/5**.
- Approximately **77.6% of displayed review records** have four or five stars.
- Approximately **11.2% of displayed review records** have one star.


### Insight 4: Customer Retention Remains a Challenge
- The overall repeat rate is **3.12%**.
- This indicates that only a small proportion of customers are classified as repeat buyers under the current metric definition.
- A high order delivery completion rate does not necessarily translate into repeat purchases.


### Insight 5: Revenue Is Concentrated in Leading Product Categories
- Health & Beauty generates approximately **1.26M BRL** in revenue.
- Watches & Gifts follows at approximately **1.21M BRL**.
- Bed, Bath & Table ranks third at approximately **1.04M BRL**.
- The revenue difference between Health & Beauty and Watches & Gifts is approximately **50K BRL**.


### Insight 6: Delivery Duration Varies Across Customer States
- Average delivery duration ranges from approximately **18 days to 29 days** across the displayed states.
- RR has the longest displayed average at approximately **29 days**.
- ES has the shortest displayed average among the visible states at approximately **18 days**.
- The difference between these states is approximately **11 days**.

## 4. Filter Definitions

| Filter | Definition |
|---|---|
| Year | Filters metrics and charts by purchase year. |
| Month Number | Filters metrics and charts by purchase month. |
| Customer State | Filters metrics and charts by customer location. |


---

# II. Page 2 – Customer Analysis
<img width="1056" height="604" alt="Page2_Customer Analysis" src="https://github.com/user-attachments/assets/fb6e3a29-b960-4b96-a218-60ad3c21d38d" />


## 1. Key Performance Indicators (KPIs)

### 1.1. Repeat Rate
- **Value:** 3.12%
- **Definition:** Percentage of unique customers who made repeat purchases according to the project's customer classification.
- **Insight:** The repeat rate is only 3.12%, indicating that the customer base is dominated by one-time buyers. This highlights a potential opportunity to improve customer retention and encourage second purchases.

### 1.2. Total Customer
- **Repeat Customers:** 2,996
- **Non-Repeat Customers:** 93K
- **Definition**: Number of unique customers classified as repeat or non-repeat buyers.
- **Insight:** The large difference between repeat and non-repeat customers suggests that acquiring customers does not necessarily translate into long-term customer relationships.

### 1.3. Average Order Value (AOV)
- **Repeat Customers:** 122.80 BRL
- **Non-Repeat Customers:** 137.66 BRL
- **Definition:** Average order value for each customer group.
- **Insight:** Repeat customers have an AOV approximately 10.8% lower than non-repeat customers. This suggests that customers who return may place smaller orders on average, although order frequency and cumulative customer spending should also be considered.

### 1.4. Customer Spend
- **Repeat Customers:** 382.93 BRL
- **Non-Repeat Customers:** 138.23 BRL
- **Definition:** Average cumulative spending per customer within each customer group
- **Insight:** Repeat customers spend approximately 2.77 times as much per customer as non-repeat customers. Despite their lower AOV, their additional purchases result in higher cumulative spending.

### 1.5. Average Review Score
- **Repeat Customers:** 4.12 / 5
- **Non-Repeat Customers:** 4.08 / 5
- **Definition:** Average customer review score for each customer group.
- **Insight:** Repeat customers have a slightly higher average review score, with a difference of 0.04 points. The small gap suggests that average review score alone may not sufficiently explain repeat-purchase behavior.

---

## 2. Chart Definitions and Key Findings

### 2.1. Repeat Rate and Total Customer by First Order Value Band
- **Chart Type:** Combo Chart (Line and Area Chart).
- **Metrics:** Repeat Rate and Total Customers.
- **Dimension:** First Order Value Band.

**Values shown in the dashboard:**

| First Order Value Band | Total Customers | Repeat Rate |
|---|---:|---:|
| < 100 BRL | 56K | 3.3% |
| 200–499 BRL | 11K | 2.93% |
| 100–199 BRL | 25K | 2.86% |
| 500–999 BRL | 3K | 2.32% |
| > 1000 BRL | 1K | 1.84% |

**Key findings:**
- The `< 100 BRL` segment contains the largest customer base, with approximately 56K customers and a repeat rate of 3.3%.
- Customers with a first order value of 200–499 BRL have a repeat rate of 2.93%.
- The 100–199 BRL segment has a repeat rate of 2.86%.
- Repeat rate decreases to 2.32% for the 500–999 BRL segment.
- Customers spending over 1,000 BRL on their first order have the lowest displayed repeat rate, at 1.84%.

**Business insight:** Higher first-order spending does not necessarily lead to stronger customer retention. Customers making expensive initial purchases may not have a recurring need for the same products, so retention strategies should consider product type and purchase frequency rather than relying on order value alone.


### 2.2. Average Delivery Days by Customer State
- **Chart Type:** Column Chart.
- **Metric:** Average Delivery Days.
- **Dimension:** Customer State.

**Values shown in the dashboard:**

| Customer Group | Average Delivery Days |
|---|---:|
| 1 order | Approximately 93K customers shown |
| 2 orders | Approximately 3K customers shown |
| 3 orders | Less than 1K customers shown |
| 4 orders | Less than 1K customers shown |


**Key findings:** Approximately 93K customers belong to the one-order group, while around 3K belong to the two-order group. The very large difference highlights the dominance of one-time buyers.

### 2.3. Repeat Rate by First Order Category
- **Chart Type:** Horizontal Bar Chart.
- **Metric:** Repeat Rate.
- **Dimension:** First Order Category.

**Values shown in the dashboard:**

| Rank | First Order Category | Repeat Rate |
|---:|---|---:|
| 1 | Cuisine | 14.29% |
| 2 | Fashion Female Clothing | 13.04% |
| 3 | Home Appliances | 10.89% |
| 4 | Arts and Craftsmanship | 9.09% |
| 5 | Fashion Male Clothing | 8.00% |
| 6 | Drinks | 6.36% |
| 7 | Fashion Bags and Accessories | 6.07% |
| 8 | Fashion Shoes | 5.80% |
| 9 | Furniture and Decor | 4.88% |
| 10 | Diapers and Hygiene | 4.75% |
| 11 | Home Comfort | 4.75% |
| 12 | Bed, Bath and Table | 4.64% |

**Key findings:**
- Cuisine has the highest displayed repeat rate at 14.29%.
- Fashion Female Clothing follows at 13.04%.
- Home Appliances reaches 10.89%.
- Fashion Male Clothing has a repeat rate of 8.00%.
- Furniture and Decor and Bed, Bath and Table have repeat rates below 5%.
- The gap between Cuisine and Bed, Bath and Table is approximately 9.65 percentage points.

**Business insight:** Repeat-purchase behavior differs substantially by first-order category. Categories with higher repeat rates may involve more frequent or complementary purchases, while categories such as furniture and home furnishings may have longer replacement cycles.



### 2.4. Repeat Rate by Recency Band
- **Chart Type:** Column Chart.
- **Metric:** Repeat Rate.
- **Dimension:** Recency Band.

**Values shown in the dashboard:**

| Recency Band | Repeat Rate |
|---|---:|
| 0–30 days | 77.78% |
| 31–60 days | 4.62% |
| 61–90 days | 3.37% |
| 91–180 days | 3.41% |
| > 180 days | 2.96% |

**Key findings:**
- The 0–30 day band has a displayed repeat rate of 77.78%, far higher than all other bands.
- The 31–60 day band drops to 4.62%.
- The 61–90 day band has a repeat rate of 3.37%.
- The 91–180 day band records 3.41%, slightly above the 61–90 day band.
- The >180 day band has the lowest displayed repeat rate, at 2.96%.

**Business insight:** Customers who purchase again within 30 days appear much more likely to be repeat buyers. However, the unusually high 77.78% rate should be validated against the recency definition, customer population, and calculation logic.

**Business implication:** If the metric is correctly defined, the first 30 days after an initial purchase may be a useful window for follow-up communication and personalized recommendations. The company should test these interventions rather than assuming that early outreach will cause repeat purchases.

---

## 3. Key Business Insights

### Insight 1: Customer Retention Is a Major Opportunity
- The repeat rate is only **3.12%**.
- Approximately **2,996 customers** are classified as repeat buyers, compared with approximately **93K non-repeat customers**.
- The customer base is heavily concentrated among one-time buyers.


### Insight 2: Repeat Customers Spend More Over Time
- Repeat customer AOV is **122.80 BRL**, compared with **137.66 BRL** for non-repeat customers.
- Average customer spend is **382.93 BRL** for repeat customers, compared with **138.23 BRL** for non-repeat customers.
- Repeat customers spend approximately **2.77 times as much cumulatively per customer**.


### Insight 3: First-Order Value Alone Does Not Guarantee Retention
- Customers in the `< 100 BRL` band have a repeat rate of **3.3%**.
- Customers in the `> 1000 BRL` band have a repeat rate of only **1.84%**.
- Repeat rate generally declines across the higher first-order value bands displayed.


### Insight 4: Retention Varies by Product Category
- Cuisine has the highest displayed repeat rate at **14.29%**.
- Fashion Female Clothing reaches **13.04%**.
- Home Appliances reaches **10.89%**.
- Bed, Bath and Table has a displayed repeat rate of **4.64%**.


### Insight 5: The First 30 Days May Be an Important Retention Window
- The displayed repeat rate for the 0–30 day recency band is **77.78%**.
- The next band, 31–60 days, records **4.62%**.
- The >180 day band records **2.96%**.


### Insight 6: Review Scores Differ Only Slightly Between Customer Groups
- Repeat customers have an average review score of **4.12**.
- Non-repeat customers have an average review score of **4.08**.
- The difference is only **0.04 points**.

## 4. Filter Definitions

| Filter | Definition |
|---|---|
| Year | Filters metrics and charts by purchase year. |
| Month Number | Filters metrics and charts by purchase month. |
| Customer State | Filters metrics and charts by customer location. |

---
# III.Page 3 – Customer Experience
<img width="1055" height="606" alt="Page3_Customer Experience" src="https://github.com/user-attachments/assets/88219cf8-c65a-4a34-828d-b56207d69c4c" />


## 1. Key Performance Indicators (KPIs)

### 1.1. Repeat Rate
- **Value:** 3.12%
- **Definition:** Percentage of unique customers who made repeat purchases according to the project's customer classification.
- **Purpose:** Measures customer retention and helps evaluate whether the customer experience encourages customers to purchase again.

### 1.2. Total Customer
- **Repeat Customers:** 2,996
- **Non-Repeat Customers:** Approximately 93K
- **Definition:** Number of unique customers classified as repeat or non-repeat buyers.
- **Purpose:** Provides context for comparing customer experience metrics between repeat and non-repeat groups.

### 1.3. Delivery Days
- **Repeat Customers:** 11.90 days
- **Non-Repeat Customers:** 12.11 days
- **Definition:** Average number of days between order purchase and customer delivery.
- **Purpose:** Evaluates delivery performance and compares the delivery experience of repeat and non-repeat customers.

### 1.4. Late Rate
- **Repeat Customers:** 12.48%
- **Non-Repeat Customers:** 7.95%
- **Definition:** Percentage of orders classified as late according to the project's delivery-delay rule.
- **Purpose:** Measures delivery reliability and helps identify potential relationships between late deliveries and repeat-purchase behavior.

### 1.5. Average Review Score
- **Repeat Customers:** 4.12 / 5
- **Non-Repeat Customers:** 4.08 / 5
- **Definition:** Average customer review score for each customer group.
- **Purpose:** Measures perceived customer satisfaction and supports comparisons between customer groups.

---

## 2. Chart Definitions and Key Findings

### 2.1. Repeat Rate by Customer State
- **Chart Type:** Column Chart.
- **Metric:** Repeat Rate.
- **Dimension:** Customer State.
- **Definition:** Compares the percentage of repeat customers across Brazilian states.

**Key findings:**
- AC has the highest displayed repeat rate at approximately **5.19%**.
- RO follows at approximately **4.18%**.
- MT records approximately **3.43%**.
- RJ and GO have displayed repeat rates of approximately **3.33%** and **3.24%**, respectively.
- SP has a repeat rate of approximately **3.06%**.
- CE has the lowest displayed repeat rate at approximately **1.68%**.
- The difference between AC and CE is approximately **3.51 percentage points**.


### 2.2. Count of Customers by Customer State
- **Chart Type:** Horizontal Bar Chart.
- **Metric:** Count of Unique Customers.
- **Dimension:** Customer State.
- **Definition:** Displays the distribution of unique customers across Brazilian states.

**Key findings:**
- SP has approximately **42K customers**, making it the largest customer market in the displayed chart.
- RJ follows with approximately **13K customers**.
- MG has approximately **12K customers**.
- RS and PR each have approximately **5K customers**.
- SC has approximately **4K customers**.
- BA has approximately **3K customers**.
- Most remaining states have substantially smaller customer bases.


### 2.3. Average Delivery Days and Average Review Score by Customer State
- **Chart Type:** Combo Chart (Line Chart).
- **Metrics:** Average Delivery Days and Average Review Score.
- **Dimension:** Customer State.
- **Definition:** Compares average delivery duration and customer review scores across Brazilian states.

**Key findings:**
- Average delivery duration varies considerably across states, with several regions showing averages near or above **20 days**.
- The displayed delivery-duration line declines from approximately **30 days** in some early categories to below **10 days** in the final category.
- Average review scores fluctuate across states, generally ranging between approximately **3.6 and 4.2**.
- Some states show relatively high review scores despite longer delivery durations, indicating that delivery time alone may not explain customer satisfaction.


### 2.4. Late Rate and Average Review Score by Customer State
- **Chart Type:** Combo Chart (Line Chart).
- **Metrics:** Late Rate and Average Review Score.
- **Dimension:** Customer State.
- **Definition:** Compares the percentage of late orders with average customer review scores across Brazilian states.

**Key findings:**
- The overall late rate is **12.48% for repeat customers**, compared with **7.95% for non-repeat customers**.
- The difference is **4.53 percentage points**.
- Repeat customers have an average review score of **4.12**, compared with **4.08** for non-repeat customers.
- State-level late rates and review scores fluctuate, suggesting potential regional differences in delivery experience and customer feedback.


---

## 3. Business Insights

### Insight 1: Repeat Customers Have a Higher Late Rate
- The late rate is **12.48% for repeat customers**, compared with **7.95% for non-repeat customers**.
- This represents a difference of **4.53 percentage points**.
- Despite the higher late rate, repeat customers have a slightly higher average review score of **4.12**, compared with **4.08** for non-repeat customers.


### Insight 2: Average Delivery Duration Is Similar Across Customer Groups
- Repeat customers receive orders in an average of **11.90 days**.
- Non-repeat customers receive orders in an average of **12.11 days**.
- The difference is only **0.21 days**, or approximately five hours.


### Insight 3: Customer Retention Varies Across States
- AC has the highest displayed repeat rate at approximately **5.19%**.
- RO follows at approximately **4.18%**.
- SP has a displayed repeat rate of approximately **3.06%**.
- CE has the lowest displayed repeat rate at approximately **1.68%**.


### Insight 4: The Customer Base Is Concentrated in a Few Major States
- SP contains approximately **42K customers**.
- RJ has approximately **13K customers**, while MG has approximately **12K customers**.
- SP therefore has more than three times the customer count of RJ in the displayed chart.


### Insight 5: Review Scores Are Similar Despite Differences in Late Rates
- Repeat customers have an average review score of **4.12/5**.
- Non-repeat customers have an average review score of **4.08/5**.
- The difference is only **0.04 points**, even though the repeat group has a higher late rate.

---

## 4. Filter Definitions

| Filter | Definition |
|---|---|
| Year | Filters customer experience metrics by the selected year, based on the date relationship configured in the data model. |
| Month Number | Filters metrics and charts by the selected purchase month. |
| Customer State | Filters customer experience metrics and charts by the customer's state. |

# Page 4 – Product & Seller Performance
<img width="1057" height="609" alt="Page4_Product   Seller Performance" src="https://github.com/user-attachments/assets/436f3d09-1a7e-446a-8774-191fea0ee7fb" />


## 1. Key Performance Indicators (KPIs)

### 1.1. Revenue
- **Value:** 13.59M BRL
- **Definition:** Total revenue generated from product sales.
- **Purpose:** Measures overall sales performance and provides a basis for comparing product categories and seller performance.

### 1.2. Total Order
- **Value:** Approximately 99K
- **Definition:** Total number of unique orders in the dataset.
- **Purpose:** Measures order volume and helps evaluate the sales contribution of different sellers.

### 1.3. Total Seller
- **Value:** 3,095
- **Definition:** Number of unique sellers represented in the dataset.
- **Purpose:** Measures the size of the seller network and provides context for evaluating seller-level performance.

### 1.4. Total Category
- **Value:** 74
- **Definition:** Number of distinct product categories represented in the dataset.
- **Purpose:** Measures product assortment breadth and helps identify opportunities to expand or optimize category coverage.

### 1.5. Average Review Score
- **Value:** 4.09 / 5
- **Definition:** Average customer review score across valid reviews.
- **Purpose:** Evaluates customer satisfaction and provides context for comparing product and seller performance.

---

## 2. Chart Definitions and Key Findings

### 2.1. Top 10 Revenue by Product Category
- **Chart Type:** Horizontal Bar Chart.
- **Metric:** Revenue.
- **Dimension:** Product Category.
- **Definition:** Ranks the ten product categories generating the highest revenue.

**Key findings:**

| Rank | Product Category | Revenue |
|---:|---|---:|
| 1 | Health & Beauty | 1.26M BRL |
| 2 | Watches & Gifts | 1.21M BRL |
| 3 | Bed, Bath & Table | 1.04M BRL |
| 4 | Sports & Leisure | 0.99M BRL |
| 5 | Computers & Accessories | 0.91M BRL |
| 6 | Furniture & Decor | 0.73M BRL |
| 7 | Cool Stuff | 0.64M BRL |
| 8 | Housewares | 0.63M BRL |
| 9 | Auto | 0.59M BRL |
| 10 | Garden Tools | 0.49M BRL |

- Health & Beauty leads with approximately **1.26M BRL** in revenue.
- Watches & Gifts follows at **1.21M BRL**, approximately 50K BRL below the leading category.
- The top five categories each generate approximately **0.91M BRL or more**.
- Garden Tools generates approximately **0.49M BRL**, less than half the revenue of Health & Beauty.


### 2.2. Late Rate and Average Review Score
- **Chart Type:** Scatter Plot.
- **Metrics:** Late Rate and Average Review Score.
- **Definition:** Examines the relationship between delivery lateness and customer review scores across the displayed observations.

**Key findings:**
- Many observations cluster around late rates below **20%**.
- Most visible review scores fall approximately between **3 and 5**.
- Some observations have late rates above **40%**, including points near **60–100%**.
- Review scores vary among observations with similar late rates, suggesting that lateness may not be the only factor associated with customer feedback.

### 2.3. Seller Performance Table
- **Chart Type:** Table.
- **Dimensions:** Seller State and Seller.
- **Metrics:** Revenue, Late Rate, Average Review Score, Total Order, and Seller AOV.
- **Definition:** Compares individual sellers using sales, delivery reliability, customer feedback, and order-value metrics.

**Examples visible in the dashboard:**

| Seller State | Revenue (BRL) | Late Rate | Avg Review Score | Total Order | Seller AOV (BRL) |
|---|---:|---:|---:|---:|---:|
| SP | 229,472.63 | 11.57% | 4.13 | 1,132 | 202.71 |
| BA | 222,776.05 | 4.31% | 4.13 | 358 | 622.28 |
| SP | 200,472.92 | 11.00% | 3.83 | 1,806 | 111.00 |
| SP | 194,042.03 | 10.21% | 4.34 | 585 | 331.70 |
| SP | 187,923.89 | 10.07% | 3.49 | 982 | 191.37 |
| SP | 176,431.87 | 5.64% | 4.21 | 336 | 525.09 |
| SP | 160,236.57 | 7.63% | 4.18 | 1,314 | 121.95 |
| SP | 147,145.75 | 5.95% | 4.24 | 1,160 | 122.19 |
| SP | 138,968.55 | 10.11% | 3.99 | 915 | 151.88 |
| SP | 135,171.70 | 7.77% | 4.16 | 1,287 | 105.03 |

**Key findings:**
- The highest displayed seller revenue is approximately **229.5K BRL**, followed by approximately **222.8K BRL**.
- The BA seller shown has a late rate of **4.31%**, an average review score of **4.13**, and a seller AOV of **622.28 BRL**.
- One SP seller generates approximately **200.5K BRL** across **1,806 orders**, with a late rate of **11.00%** and an average review score of **3.83**.
- Another SP seller generates approximately **187.9K BRL** across **982 orders**, with an average review score of **3.49** and a late rate of **10.07%**.
- The displayed seller observations show that high revenue does not always coincide with lower late rates or higher review scores.


---

## 3. Business Insights

### Insight 1: Revenue Is Concentrated in Leading Product Categories
- Health & Beauty generates approximately **1.26M BRL**.
- Watches & Gifts follows at **1.21M BRL**.
- Bed, Bath & Table generates approximately **1.04M BRL**.
- The difference between the first- and second-ranked categories is approximately **50K BRL**.


### Insight 2: Seller Revenue Does Not Guarantee a Better Customer Experience
- One displayed SP seller generates approximately **200.5K BRL** from **1,806 orders**, with an **11.00% late rate** and a **3.83 average review score**.
- Another displayed SP seller generates approximately **187.9K BRL**, with a **10.07% late rate** and a **3.49 average review score**.
- The seller table therefore includes high-revenue observations with potential delivery or satisfaction concerns.


### Insight 3: Seller Performance Varies Across Observations
- The displayed seller table includes late rates ranging from approximately **4.31% to 11.57%** among the first few rows.
- Average review scores in those rows range from **3.49 to 4.34**.
- Seller AOV also varies considerably, from approximately **105.03 BRL to 622.28 BRL** in the displayed examples.


### Insight 4: Delivery Lateness May Be Associated With Lower Review Scores
- The scatter plot contains observations with late rates above **40%**, including some near **100%**.
- Review scores vary across the displayed late-rate range.
- The chart does not show a perfectly consistent relationship between lateness and review score.


### Insight 5: A Large Seller Network Requires Consistent Monitoring
- The dashboard includes **3,095 sellers**.
- It covers **74 product categories**.
- Total revenue is approximately **13.59M BRL**, with around **99K orders**.


---

## 4. Filter Definitions

| Filter | Definition |
|---|---|
| Year | Filters revenue, orders, and seller performance by the selected year, based on the date relationship configured in the data model. |
| Month Number | Filters metrics and charts by the selected purchase month. |
| Seller State | Filters seller-related metrics and performance by the seller's state. |




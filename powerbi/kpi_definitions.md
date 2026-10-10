# Olist E-Commerce Performance Dashboard

## 1. Dashboard Overview

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

# Page 1 – Overview

## 2. Purpose

Provide a high-level view of Olist's sales performance, order fulfillment, customer reviews, product category revenue, and delivery duration.

## 2.1 Key Performance Indicators

### Revenue

- **Displayed value:** 13.59M
- **Definition:** Total revenue from order items.
- **Suggested DAX:**

```dax
Revenue =
SUM(order_items_cleaned[price])
```

**Business purpose:**
- Monitor overall sales performance.
- Compare revenue across quarters and product categories.
- Identify periods of growth or decline.

### Total Order

- **Displayed value:** 99K
- **Definition:** Number of distinct orders.

```dax
Total Order =
DISTINCTCOUNT(order_cleaned[order_id])
```

**Business purpose:**
- Measure order volume.
- Track changes in purchasing activity.
- Compare sales performance across periods.

### Average Order Value (AOV)

- **Displayed value:** 136.71
- **Definition:** Average revenue per order.

```dax
AOV =
DIVIDE(
    [Revenue],
    [Total Order],
    0
)
```

**Business purpose:**
- Measure the average revenue generated per order.
- Compare order value across customer groups and periods.
- Support product bundling and cross-selling decisions.

### Average Review Score

- **Displayed value:** 4.09
- **Definition:** Average customer review score on a five-point scale.

```dax
Avg Review Score =
AVERAGE(review_cleaned[review_score])
```

**Business purpose:**
- Monitor customer satisfaction.
- Identify potential service quality issues.
- Support analysis of the relationship between reviews and retention.

### Repeat Rate

- **Displayed value:** 3.12%
- **Definition:** Percentage of unique customers who placed more than one order during the available dataset period.

The exact DAX should match the customer-level table and repeat flag used in the report.

**Business purpose:**
- Measure customer retention.
- Identify opportunities to encourage customers to return.
- Provide context for the customer analysis page.

**Important distinction:** This page's `Repeat Rate` uses the `repeat_customer` definition over the available dataset period. It is not the same as `repeat_90d`, which measures repeat purchasing within 90 days of the first order.

## 2.2 Supporting Visualizations

### Revenue and Total Orders by Year and Quarter

**Chart type:** Combination chart.

**Purpose:**
- Compare quarterly revenue and order-volume trends.
- Identify changes in sales performance.
- Support further investigation into seasonal or operational factors.

**Observed values in the displayed chart:**

| Period | Approximate Revenue |
|---|---:|
| Q1 2017 | 0.7M |
| Q2 2017 | 1.3M |
| Q3 2017 | 1.7M |
| Q4 2017 | 2.4M |
| Q1 2018 | 2.8M |
| Q2 2018 | 2.9M |
| Q3 2018 | 1.7M |

**Insight:** Revenue generally increased from early 2017 through Q2 2018, followed by a decline in Q3 2018.

**Business implication:** Investigate the Q3 decline by comparing order volume, AOV, and category-level revenue. Check data coverage before concluding that the decline represents a complete-quarter performance change.

### Number of Orders by Review Score

**Chart type:** Column chart.

**Purpose:**
- Understand the distribution of customer ratings.
- Identify the most frequent review scores.
- Support customer experience analysis.

**Observed insight:** Review score 5 has the highest count, followed by score 4.

**Business implication:** High review counts do not necessarily imply high retention. Compare review scores with delivery performance and repeat purchase behavior to investigate potential relationships.

### Orders by Order Status

**Chart type:** Donut chart.

**Purpose:**
- Monitor order fulfillment outcomes.
- Understand the distribution of order statuses.
- Identify cancellations and other unsuccessful order outcomes.

**Observed insight:** Approximately 97.02% of orders in the displayed view are delivered.

**Business implication:** Most displayed orders are delivered successfully. The remaining order statuses should be monitored to identify possible fulfillment issues.

### Revenue by Product Category

**Chart type:** Horizontal bar chart.

**Purpose:**
- Rank product categories by revenue.
- Identify major revenue contributors.
- Support category-level business decisions.

**Observed values in the displayed chart:**

| Product Category | Approximate Revenue |
|---|---:|
| Health and beauty | 1.26M |
| Watches and gifts | 1.21M |
| Bed, bath and table | 1.04M |
| Sports and leisure | 0.99M |
| Computers and accessories | 0.91M |
| Furniture and decor | 0.73M |
| Cool stuff | 0.64M |
| Housewares | 0.63M |
| Auto | 0.59M |
| Garden tools | 0.49M |

**Insight:** Health and beauty and watches and gifts are the leading revenue categories in the displayed view.

**Business implication:** Analyze these categories further using order volume, AOV, review scores, and repeat purchase rates. High revenue alone does not establish high customer loyalty.

### Average Delivery Days by Customer State

**Chart type:** Bar chart.

**Purpose:**
- Compare delivery duration across customer states.
- Identify locations with longer delivery times.
- Support logistics performance analysis.

**Observed insight:** Average delivery duration varies by state, with values in the chart ranging from approximately 18 to 29 days.

**Business implication:** Investigate states with longer delivery durations and compare shipping distance, seller location, and late-delivery rates.

## 2.3 Page 1 Summary

- Revenue and order volume provide an overview of marketplace performance.
- Health and beauty and watches and gifts are among the highest-revenue categories.
- Delivered orders dominate the displayed order-status distribution.
- The repeat rate is relatively low at 3.12%, motivating a deeper customer retention analysis.
- Delivery time differs across states and warrants further investigation.

---

# Page 2 – Customer Analysis

## 3. Purpose

Analyze customer retention and spending behavior to understand which customer groups are more likely to purchase again.

This page focuses on repeat rate, first-order value, recency, first-order category, and the differences between repeat and non-repeat customers.

## 3.1 Key Performance Indicators

### Repeat Rate

- **Displayed value:** 3.12%
- **Definition:** Percentage of unique customers who placed more than one order during the available dataset period.

**Business purpose:** Establish the overall retention baseline for customer-level comparisons.

### Total Customer

The dashboard separates customers into two groups:

| Customer Group | Displayed Count |
|---|---:|
| Repeat | 2,996 |
| Non-repeat | 93K |

**Definition:**
- **Repeat:** Customers who placed more than one order.
- **Non-repeat:** Customers who placed only one order during the available dataset period.

**Business purpose:** Compare customer group sizes and understand the scale of the retention challenge.

### AOV by Customer Group

| Customer Group | Displayed AOV |
|---|---:|
| Repeat | 122.80 |
| Non-repeat | 137.66 |

**Definition:** Average order value calculated separately for repeat and non-repeat customers.

**Insight:** The displayed AOV is lower for repeat customers than for non-repeat customers.

**Business implication:** Higher initial or average spending does not necessarily translate into repeat purchasing. Investigate first-order value, product category, and other customer characteristics before deciding which group to target.

### Customer Spend

| Customer Group | Displayed Value |
|---|---:|
| Repeat | 382.93 |
| Non-repeat | 138.23 |

**Definition:** The displayed customer-level spending measure for each group.

**Insight:** Repeat customers have a higher displayed customer spend value than non-repeat customers.

**Business implication:** Customers who return may generate more cumulative spending even when their average order value is lower. Confirm the exact spend calculation and whether it represents total spend per customer.

### Average Review Score by Customer Group

| Customer Group | Displayed Score |
|---|---:|
| Repeat | 4.12 |
| Non-repeat | 4.08 |

**Definition:** Average review score for each customer group.

**Insight:** Repeat customers have a slightly higher average review score than non-repeat customers in the displayed view.

**Business implication:** The difference is small. Review score alone should not be treated as a sufficient explanation of repeat purchase behavior.

## 3.2 Supporting Visualizations

### Repeat Rate and Total Customers by First Order Value Band

**Chart type:** Combination chart.

**Purpose:**
- Compare repeat rate across first-order value bands.
- Show the number of customers in each band.
- Investigate whether initial spending is associated with repeat purchasing.

**Observed repeat rates:**

| First Order Value Band | Repeat Rate |
|---|---:|
| Less than 100 | 3.30% |
| 100–199 | 2.86% |
| 200–499 | 2.93% |
| 500–999 | 2.32% |
| Greater than 1000 | 1.84% |

**Insight:** The displayed repeat rate generally declines in the higher first-order value bands, although the pattern is not strictly monotonic.

**Business implication:** A high-value first purchase does not guarantee another purchase. Consider category, product durability, purchase intent, and the number of items bought when investigating retention.

### Repeat Rate by Recency Band

**Chart type:** Column chart.

**Purpose:**
- Compare customer counts or activity across recency bands.
- Understand how recently customers purchased.
- Support customer segmentation and re-engagement analysis.

**Important interpretation note:** The screenshot shows the following percentages:

| Recency Band | Displayed Value |
|---|---:|
| 0–30 days | 77.78% |
| 31–60 days | 4.62% |
| 61–90 days | 3.41% |
| 91–180 days | 3.37% |
| Greater than 180 days | 2.96% |

These values should be interpreted according to the actual measure used in Power BI. The first value is substantially higher than the others, so verify whether the chart shows repeat rate, customer distribution, or another percentage measure before using it as a business conclusion.

### Repeat Rate by First Order Category

**Chart type:** Horizontal bar chart.

**Purpose:**
- Rank product categories by customer repeat rate.
- Identify categories associated with higher observed repeat purchasing.
- Support category-specific retention strategies.

**Observed values in the displayed chart:**

| First Order Category | Approximate Repeat Rate |
|---|---:|
| Cuisine | 14.29% |
| Fashion female clothing | 13.04% |
| Home appliances | 13.04% |
| Arts and craftmanship | 9.09% |
| Fashion male clothing | 8.00% |
| Drinks | 6.36% |
| Fashion bags and accessories | 6.07% |
| Fashion shoes | 5.80% |
| Furniture and decor | 4.88% |
| Diapers and hygiene | 4.76% |
| Home comfort | 4.75% |
| Bed, bath and table | 4.64% |

**Insight:** Repeat rates vary across first-order categories. Several categories have higher displayed repeat rates than the overall 3.12% baseline.

**Business implication:** Categories with higher repeat rates may be useful candidates for further investigation. Check customer counts for each category because small groups can produce volatile percentages.

### Average Delivery Days by Number of Orders

**Chart type:** Column chart.

**Purpose:**
- Compare the distribution of customers by order count.
- Identify how many customers made one, two, three, or four orders.

**Observed insight:** The displayed chart shows approximately 93K customers with one order and substantially fewer customers with two or more orders.

**Business implication:** Most customers purchase only once in the available dataset period. Retention efforts could focus on encouraging a second purchase after the first order.

## 3.3 Page 2 Summary

- The displayed repeat rate is 3.12%.
- Non-repeat customers greatly outnumber repeat customers.
- Repeat customers have higher displayed total customer spend but lower AOV.
- Repeat rates differ by first-order value band and category.
- Verify the recency visual's measure before using its percentages in business reporting.

---

# Page 3 – Customer Experience

## 4. Purpose

Investigate how customer location, delivery duration, late delivery, and review scores relate to repeat purchase behavior.

This page compares repeat and non-repeat customers and highlights geographical differences in retention and delivery performance.

## 4.1 Key Performance Indicators

### Repeat Rate

- **Displayed value:** 3.12%
- **Definition:** Percentage of unique customers who placed more than one order during the available dataset period.

### Total Customer

| Customer Group | Displayed Count |
|---|---:|
| Repeat | 2,996 |
| Non-repeat | 93K |

### Delivery Days

| Customer Group | Displayed Average |
|---|---:|
| Repeat | 11.90 days |
| Non-repeat | 12.11 days |

**Insight:** The displayed average delivery duration is slightly lower for repeat customers.

**Business implication:** The difference is small and does not prove that faster delivery causes repeat purchases. Further analysis should control for other customer and order characteristics.

### Late Rate

| Customer Group | Displayed Late Rate |
|---|---:|
| Repeat | 12.48% |
| Non-repeat | 7.95% |

**Definition:** Percentage of orders classified as late under the dashboard's delivery-date logic.

**Insight:** The displayed late rate is higher for repeat customers than for non-repeat customers.

**Business implication:** This result does not support the simple assumption that repeat customers always experience fewer late deliveries. Repeat customers may differ in order frequency, location, or other characteristics. Validate the calculation and investigate these differences before drawing conclusions.

### Average Review Score

| Customer Group | Displayed Score |
|---|---:|
| Repeat | 4.12 |
| Non-repeat | 4.08 |

**Insight:** Repeat customers have a slightly higher average review score.

**Business implication:** The small difference suggests that review score alone may not explain the retention gap.

## 4.2 Supporting Visualizations

### Repeat Rate by Customer State

**Chart type:** Column chart.

**Purpose:**
- Compare repeat rate across Brazilian states.
- Identify locations with higher observed retention.
- Examine geographical differences in customer behavior.

**Observed insight:** The displayed repeat rate varies across states. AC and RO appear among the states with the highest rates, while several other states have lower rates.

The dashboard notes that SP and RJ account for a large share of customers, with approximately 42K customers in SP and 13K in RJ in the displayed customer distribution.

**Business implication:** High repeat rates in states with smaller customer populations should be interpreted carefully. Compare both repeat rate and customer count before prioritizing a location.

### Customer Count by State

**Chart type:** Horizontal bar chart.

**Purpose:**
- Show the distribution of customers across states.
- Identify the largest customer markets.
- Provide context for state-level repeat rate comparisons.

**Observed insight:** SP has the largest customer count in the displayed chart, followed by RJ and MG.

**Business implication:** Large customer markets may offer greater potential impact for retention initiatives, even when their repeat rate is not the highest.

### Late Rate and Average Review Score by Customer State

**Chart type:** Line chart.

**Purpose:**
- Compare late-delivery rates and average review scores across states.
- Identify locations where delivery performance and customer feedback may warrant investigation.
- Support geographical service improvement analysis.

**Observed insight:** Late rates and average review scores vary by state.

**Business implication:** Investigate states with both relatively high late rates and lower review scores. The chart indicates an association between state-level metrics only; it does not establish that late delivery causes lower ratings.

### Average Delivery Days and Average Review Score by Customer State

**Chart type:** Combination chart.

**Purpose:**
- Compare average delivery duration with review scores across states.
- Identify possible geographical differences in customer experience.
- Support logistics and service-quality analysis.

**Observed insight:** Average delivery days and review scores differ across states.

**Business implication:** Investigate states with longer delivery durations and compare their review scores, late rates, and customer counts to determine whether operational improvements may be warranted.

## 4.3 Page 3 Summary

- Repeat customers have a slightly lower displayed average delivery duration than non-repeat customers.
- The late rate is higher for repeat customers in the displayed comparison; this needs validation and further investigation.
- Repeat rate varies across states.
- SP has the largest customer population in the displayed state distribution.
- Delivery duration, late rate, and review score should be analyzed together rather than interpreted independently.

---

# Page 4 – Product & Seller Performance

## 5. Purpose

Evaluate product category revenue and seller-level performance to identify major revenue contributors, potential delivery issues, and differences in customer feedback.

## 5.1 Key Performance Indicators

### Revenue

- **Displayed value:** 13.59M
- **Definition:** Total revenue generated from order items.

### Total Order

- **Displayed value:** 99K
- **Definition:** Number of distinct orders.

### Total Seller

- **Displayed value:** 3,095
- **Definition:** Number of sellers represented in the report.

**Suggested DAX:**

```dax
Total Seller =
DISTINCTCOUNT(sellers_cleaned[seller_id])
```

Confirm the actual table name in the Power BI model.

### Total Category

- **Displayed value:** 74
- **Definition:** Number of product categories represented in the report.

**Suggested DAX:**

```dax
Total Category =
DISTINCTCOUNT(products_cleaned[product_category_name_english])
```

Confirm that blank or `unknown` categories are handled consistently with your existing measure.

### Average Review Score

- **Displayed value:** 4.09
- **Definition:** Average customer review score.

## 5.2 Supporting Visualizations

### Top 10 Revenue by Product Category

**Chart type:** Column chart.

**Purpose:**
- Rank product categories by revenue.
- Identify major contributors to total sales.
- Support category prioritization.

**Observed insight:** Health and beauty, watches and gifts, bed, bath and table, and sports and leisure are among the leading categories in the displayed chart.

**Business implication:** High-revenue categories should be evaluated alongside customer retention, average order value, and review scores. Revenue ranking alone does not measure profitability or customer loyalty.

### Seller Performance Table

**Displayed columns:**
- `seller_state`
- `Revenue`
- `Late Rate`
- `Avg Review Score`
- `Total Order`
- `AOV_sellers`

**Purpose:**
- Compare sellers across sales and service indicators.
- Identify sellers with high revenue or order volume.
- Examine late-delivery rates and review scores.
- Support seller performance monitoring.

**Observed insight:** The displayed table contains seller-state and seller-level performance records, with differences in revenue, order volume, late rate, average review score, and AOV.

**Business implication:** Sellers with high revenue and high late rates may require further operational investigation. Sellers with lower review scores should be assessed using order volume and other contextual factors before being classified as underperforming.

### Late Rate and Average Review Score

**Chart type:** Scatter plot.

**Purpose:**
- Examine the relationship between late-delivery rate and average review score.
- Identify potential outliers.
- Compare seller-level service performance.

**Observed insight:** The scatter plot shows variation in late rates and review scores across the plotted observations.

**Business implication:** Investigate observations with high late rates and low review scores. Confirm the level of aggregation for each point and consider order volume before interpreting outliers.

## 5.3 Page 4 Summary

- Health and beauty and watches and gifts are among the leading revenue categories.
- The dashboard covers 3,095 sellers and 74 product categories in the displayed view.
- Seller performance varies across revenue, order volume, late rate, average review score, and AOV.
- The scatter plot can help identify sellers or groups requiring further review.
- Seller evaluation should consider both sales results and service quality.

---

# 6. Cross-Page Business Insights

The four pages provide complementary views of marketplace performance.

## 6.1 Customer Retention Is a Key Area for Investigation

The overall repeat rate shown on the dashboard is 3.12%. The customer analysis page shows a much larger non-repeat group than repeat group.

**Recommended action:** Investigate first-order category, first-order value, recency, and customer location to identify segments for retention experiments.

## 6.2 Revenue Is Concentrated in Leading Categories

Health and beauty and watches and gifts are among the largest revenue contributors in the displayed category charts.

**Recommended action:** Compare category revenue with repeat rate, AOV, review scores, and order volume to distinguish categories that generate high sales from categories associated with repeat purchasing.

## 6.3 Delivery Performance Varies Geographically

Average delivery duration and late rates vary across customer states.

**Recommended action:** Prioritize further investigation of states with longer delivery durations or high late rates, considering customer counts and seller locations.

## 6.4 Review Scores Should Be Interpreted with Other Metrics

The overall average review score is 4.09. Repeat customers have a slightly higher displayed average score than non-repeat customers.

**Recommended action:** Examine review scores together with delivery duration, late rate, category, and order volume. Avoid assuming that a small difference in average ratings explains customer retention.

## 6.5 Seller Performance Requires Multiple Measures

The seller page combines revenue, order volume, AOV, late rate, and review score.

**Recommended action:** Use a balanced set of indicators to investigate seller performance rather than ranking sellers by revenue alone.

---

# 7. KPI Definitions Summary

| KPI | Definition | Unit |
|---|---|---|
| Revenue | Total order-item revenue | Currency |
| Total Order | Number of distinct orders | Orders |
| AOV | Revenue divided by distinct order count | Currency per order |
| Avg Review Score | Average customer review score | Score from 1 to 5 |
| Repeat Rate | Percentage of unique customers with more than one order | Percentage |
| Total Customer | Number of unique customers | Customers |
| Customer Spend | Customer-level spending measure; confirm the exact calculation | Currency |
| Delivery Days | Average time between purchase and delivery | Days |
| Late Rate | Percentage of orders classified as late | Percentage |
| Total Seller | Number of distinct sellers | Sellers |
| Total Category | Number of distinct product categories | Categories |

---

# 8. Validation Notes and Limitations

- KPI values depend on the selected filters and the report's relationships.
- Confirm whether Revenue includes item price only or also freight charges.
- Use distinct `order_id` values when counting orders.
- Confirm the aggregation level used for review scores, delivery days, and late rates.
- Define the customer population and repeat-purchase period explicitly.
- `repeat_customer` and `repeat_90d` measure different behaviors and should not be treated as interchangeable.
- Check the recency chart's percentage measure before interpreting its values.
- State-level and seller-level patterns describe associations and do not establish causation.
- Revenue does not represent profit unless costs are included in the calculation.
- Confirm all DAX expressions against the actual Power BI data model before using them in production.


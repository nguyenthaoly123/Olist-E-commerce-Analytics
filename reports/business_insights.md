# Business Insights – Olist E-Commerce

## Business Question

**Why is the repeat purchase rate low, and what can Olist do to improve customer retention?**

The dashboard reports an overall repeat rate of **3.12%**, with approximately **2,996 repeat customers** compared with **93K non-repeat customers**. This indicates that the customer base is dominated by one-time buyers.

The following insights investigate potential factors associated with low repeat purchasing, including first-order category, order value, delivery experience, and customer satisfaction.

---

## Insight 1: Customer Retention Is the Main Business Challenge

### Finding
Olist has a large customer base, but only a small proportion of customers are classified as repeat buyers.

### Evidence
- Overall repeat rate: **3.12%**.
- Repeat customers: **2,996**.
- Non-repeat customers: approximately **93K**.
- The customer-count chart shows approximately **93K customers with one order**, compared with around **3K customers with two orders**.

### So what?
Olist may be acquiring customers without successfully converting enough first-time buyers into repeat customers. This limits opportunities to generate additional revenue from the existing customer base.

---

## Insight 2: First-Order Value Does Not Guarantee Repeat Purchasing

### Finding
Customers with higher first-order spending do not necessarily have higher repeat rates.

### Evidence

| First Order Value | Repeat Rate |
|---|---:|
| Below 100 BRL | 3.30% |
| 100–199 BRL | 2.86% |
| 200–499 BRL | 2.93% |
| 500–999 BRL | 2.32% |
| Above 1,000 BRL | 1.84% |

- Customers spending below 100 BRL have the highest displayed repeat rate, at **3.30%**.
- Customers spending above 1,000 BRL have the lowest displayed repeat rate, at **1.84%**.
- The relationship is not perfectly monotonic, but the higher-value bands generally show lower repeat rates.

### So what?
A high-value first purchase may reflect a one-time need rather than an intention to shop regularly. For example, some products may have long replacement cycles or may not naturally encourage frequent purchases.

---

## Insight 3: Repeat Purchasing Varies Significantly by Product Category

### Finding
The probability of repeat purchasing differs substantially depending on the customer's first-order category.

### Evidence

| First Order Category | Repeat Rate |
|---|---:|
| Cuisine | 14.29% |
| Fashion Female Clothing | 13.04% |
| Home Appliances | 10.89% |
| Arts and Craftsmanship | 9.09% |
| Fashion Male Clothing | 8.00% |
| Drinks | 6.36% |
| Fashion Bags and Accessories | 6.07% |
| Furniture and Decor | 4.88% |
| Bed, Bath and Table | 4.64% |

- Cuisine has the highest displayed repeat rate, at **14.29%**.
- Fashion Female Clothing follows at **13.04%**.
- Bed, Bath and Table has a repeat rate of **4.64%**, while Furniture and Decor records **4.88%**.
- The gap between Cuisine and Bed, Bath and Table is **9.65 percentage points**.

### So what?
Product category may be associated with repeat-purchase behavior. Some categories may naturally support more frequent or complementary purchases, while furniture and home products may have longer replacement cycles.

However, category differences may also reflect customer mix, price, seller quality, or the number of customers in each segment.



---

## Insight 4: Delivery Delays Are Associated With Customer Group Differences, but Do Not Yet Explain Low Retention

### Finding
Repeat customers have a higher late-order rate than non-repeat customers, while their average delivery duration is nearly the same.

### Evidence

| Metric | Repeat Customers | Non-Repeat Customers |
|---|---:|---:|
| Average Delivery Days | 11.90 | 12.11 |
| Late Rate | 12.48% | 7.95% |
| Average Review Score | 4.12 / 5 | 4.08 / 5 |

- The late rate is **4.53 percentage points higher** among repeat customers.
- Average delivery duration differs by only **0.21 days**.
- Repeat customers have a slightly higher average review score, with a difference of **0.04 points**.

### So what?
These results do not support the simple assumption that repeat customers necessarily experience faster delivery or that late delivery alone explains low repeat purchasing.

The higher late rate among repeat customers could reflect differences in order volume, product category, seller mix, or how orders are counted. The group-level averages also do not reveal whether late deliveries are concentrated among particular customers or sellers.


---

## Insight 5: Average Review Score Alone May Not Explain Repeat Purchasing

### Finding
Repeat and non-repeat customers have similar average review scores.

### Evidence
- Repeat customers: **4.12 / 5**.
- Non-repeat customers: **4.08 / 5**.
- Difference: **0.04 points**.
- The overall dashboard reports an average review score of **4.09 / 5**.

### So what?
The small difference suggests that average review score alone may not be sufficient to explain repeat-purchase behavior.

A customer may leave a positive review but have no reason to purchase the same product again. Conversely, an unsatisfactory delivery experience may affect future behavior even when the overall average review score remains high.

---

## Insight 6: Customer Retention Differs Across Geographic Markets

### Finding
Repeat rates vary across Brazilian states, and the largest customer markets do not necessarily have the highest repeat rates.

### Evidence

| State | Repeat Rate | Approximate Customer Count |
|---|---:|---:|
| AC | 5.19% | Below 1K |
| RO | 4.18% | Below 1K |
| RJ | 3.33% | Approximately 13K |
| SP | 3.06% | Approximately 42K |
| CE | 1.68% | Below 1K |

- AC has the highest displayed repeat rate, at **5.19%**.
- SP contains approximately **42K customers**, but its repeat rate is around **3.06%**.
- CE has the lowest displayed repeat rate, at **1.68%**.
- The difference between AC and CE is **3.51 percentage points**.

### So what?
Customer retention varies geographically, but a higher repeat rate in a small market does not necessarily mean that market contributes more repeat customers overall.

Regional differences may reflect product preferences, customer composition, seller availability, or delivery conditions.

---

## Overall Conclusion

The dashboard suggests that Olist's low repeat rate is associated with several patterns:

1. **A large one-time customer base:** Approximately 93K customers are classified as non-repeat buyers, compared with 2,996 repeat customers.
2. **Different purchasing patterns by first-order value:** Higher initial spending does not guarantee a higher repeat rate.
3. **Category-level variation:** Repeat rates differ substantially across first-order categories.
4. **Mixed delivery signals:** Repeat customers have a higher late rate, but similar average delivery duration and slightly higher review scores.
5. **Geographic differences:** Repeat rates vary across states, while customer volumes are concentrated in major markets.




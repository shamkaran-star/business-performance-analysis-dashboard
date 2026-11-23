# Business Performance Analysis Dashboard

**Beginner Data Analyst Portfolio Project | Power BI • SQL • Excel / Google Sheets**

A two-page interactive Power BI report analyzing a fictional retail business (**DemoMart**) using **840 simulated orders** from **January–October 2026**. The report helps users examine revenue, order-level profit, monthly sales trends, geographic performance, product categories, and sales channels.

> **Data disclosure:** All records are synthetic, created for learning and portfolio demonstration. This is not real employer or customer data, and results should not be interpreted as real-world market performance.

## Dashboard previews

### Page 1 — Business overview
![Power BI Business Overview](Screenshots/Dashboard_Overview.png)

### Page 2 — Product & channel analysis
![Power BI Detailed Analysis](Screenshots/Dashboard_Detailed_Analysis.png)

## Business questions

- What are the total revenue, profit, profit margin, and number of orders?
- How does sales performance change from month to month?
- Which regions and product categories generate the most revenue and order-level profit?
- Which channels bring in revenue, and where are returns more common?

## Key performance indicators

| Metric | Value |
|---|---:|
| Net revenue | ₹10,57,070.50 |
| Order-level profit | ₹3,96,475.50 |
| Profit margin (order-level) | 37.51% |
| Total orders | 840 |
| Delivered orders | 771 |
| Returned orders | 69 |
| Return rate | 8.21% |

The displayed profit is **not audited net income**: the synthetic model excludes taxes, fixed overhead, and some real-world costs. Returned orders contribute zero revenue and incur simplified handling/shipping expenses.

## Verified findings

1. **Chennai leads regional revenue** with **₹4,62,945.95**, about **43.8%** of the total. Bengaluru is second at ₹2,65,125.35.
2. **June has the highest monthly revenue** at **₹1,20,200.80**; October is the lowest at **₹89,433.80**. Each month contains 84 simulated orders, so this difference should not be claimed as evidence of a change in customer demand.
3. **Electronics generates the most revenue** (**₹5,63,155.65**) and the most order-level profit (**₹2,01,040.65**).
4. **Office Supplies has the highest category-level profit margin** (**42.94%**), even though it has the smallest category revenue (**₹1,45,697.85**). Revenue rank and margin rank are different.
5. **Website is the largest sales channel** with **₹5,12,472.95** in revenue (~48.5% of total). **Marketplace has the highest return rate** (**10.61%**), compared with Website (**7.09%**).

### Potential business actions (hypotheses to test)

- Investigate the product mix and price/discount patterns in months with lower revenue. The sample alone does not establish the cause.
- Test whether high-margin Office Supplies items deserve additional promotion, while evaluating demand and acquisition costs.
- Review return reasons and fulfillment quality for Marketplace orders before recommending operational changes.

## Tools and skills

- **SQL (SQLite):** Aggregation, `GROUP BY`, `ORDER BY`, conditional counts, `LAG()` for month-over-month comparisons.
- **Power BI:** CSV import, DAX measures, KPI cards, line/bar/column/donut charts, slicer interaction, and report formatting.
- **Excel / Google Sheets:** Dataset review and supplementary spreadsheet analysis.
- **Business analysis:** KPI interpretation, regional/category/channel comparisons, actionable hypotheses.

### Example DAX measures

```dax
Net Revenue = SUM('business_orders_2026'[Net_Revenue_INR])
Total Profit = SUM('business_orders_2026'[Profit_INR])
Total Orders = DISTINCTCOUNT('business_orders_2026'[Order_ID])
Profit Margin = DIVIDE([Total Profit], [Net Revenue], 0)
```

*The PBIX file may use built-in card aggregations for the first three metrics, with a standalone DAX measure for Profit Margin.*

## Project files

```text
Business_Performance_Analysis_Project_Complete/
├── Business_Performance_Dashboard.pbix
├── business_orders_2026.csv
├── business_analysis_queries.sql
├── business_performance.db
├── Business_Performance_Analysis_Dashboard.xlsx
├── README_Project_Guide.md
├── README.md
└── Screenshots/
    ├── Dashboard_Overview.png
    └── Dashboard_Detailed_Analysis.png
```

## How to use the project

1. Download or clone the repository.
2. Open `Business_Performance_Dashboard.pbix` in **Power BI Desktop** (Windows).
3. If the source CSV isn't found because the folder is in a different location, open **Home → Transform data → Data source settings** and update the CSV file path to `business_orders_2026.csv`, then **Refresh**.
4. Explore Page 1 (business overview) and Page 2 (category/channel analysis). Use the **Region** slicer on Page 2 to filter the detailed visuals; clear its selection to return to all regions.
5. Open `business_performance.db` in **DB Browser for SQLite** or another SQLite tool, then run statements from `business_analysis_queries.sql` to reproduce the aggregations.

> A Power BI report file (`.pbix`) is best viewed in Power BI Desktop; screenshots are included for quick browsing on GitHub. The example dataset is synthetic and may be reused for practice.

## Portfolio / interview description

> I built a two-page Business Performance Analysis Dashboard with Power BI and SQLite using 840 simulated retail orders. I analyzed monthly revenue, region and category performance, order-level profitability, and sales channel patterns. I used SQL aggregations, a DAX profit-margin measure, charts, and an interactive Region slicer. I then summarized findings and potential business actions while clearly separating synthetic-data results from real business claims.

---
**Project type:** Self-directed beginner portfolio project · **Dataset:** Synthetic · **Period:** Jan–Oct 2026 · **Currency:** INR

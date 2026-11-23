# Business Performance Analysis Dashboard — Beginner Data Analyst Portfolio Project

**Company:** DemoMart (fictional e-commerce + retail business)
**Period:** January to October 2026
**Data:** 840 simulated customer orders (not real customer/business records)
**Currency:** Indian Rupees (INR)

## 1) Business problem
Management wants to know whether the company is growing, which products and cities make money, and whether product returns reduce profit.

## 2) Key performance indicators (KPIs)
- Net revenue: ₹1,057,070
- Total profit: ₹396,475
- Profit margin: 37.5%
- Total orders: 840
- Delivered orders: 771
- Return rate: 8.2%
- Average delivered order value: ₹1,371

## 3) Sample data-backed insights
- Best revenue month: 2026-06 (₹120,201)
- Most profitable category: Electronics (₹201,041 profit)
- Highest-revenue region: Chennai (₹462,946)
- Channel with the highest return rate: Marketplace (10.6%)

These are **synthetic-data findings**, not market or company facts. Propose improvements as hypotheses to test; this dataset alone cannot prove causes.

## 4) Files supplied
- `business_orders_2026.csv` — clean source data (Google Sheets / Power BI import)
- `Business_Performance_Analysis_Dashboard.xlsx` — prepared dashboard + analysis + raw rows + project guide
- `business_performance.db` — ready-to-query SQLite database
- `business_analysis_queries.sql` — 7 practice queries

## 5) Free tool workflow (do this in sequence)
1. **Google Sheets**: Upload the XLSX to Google Drive or open CSV in Sheets. Review the 18 columns. In the workbook, explore Dashboard, Analysis, Orders, Project Guide. Excel license not needed.
2. **SQL**: Install a free SQLite app such as DB Browser for SQLite; open `business_performance.db`. Run SQL queries from `business_analysis_queries.sql` one by one.
3. **Power BI Desktop (free, Windows)**: Get Data → Text/CSV → select `business_orders_2026.csv` → Load. Validate numeric fields and `Order_Date` (Date).
4. Add measures:

   ```dax
   Net Revenue = SUM(business_orders_2026[Net_Revenue_INR])
   Total Profit = SUM(business_orders_2026[Profit_INR])
   Profit Margin % = DIVIDE([Total Profit], [Net Revenue], 0)
   Total Orders = DISTINCTCOUNT(business_orders_2026[Order_ID])
   Delivered Orders = CALCULATE([Total Orders], business_orders_2026[Order_Status] = "Delivered")
   Returned Orders = CALCULATE([Total Orders], business_orders_2026[Order_Status] = "Returned")
   Return Rate % = DIVIDE([Returned Orders], [Total Orders], 0)
   Average Order Value = DIVIDE([Net Revenue], [Delivered Orders], 0)
   ```

5. Make 4 KPI cards: Net Revenue, Total Profit, Profit Margin %, Total Orders.
6. Create visuals: **Line chart** (Month vs Net Revenue), **Bar chart** (Category vs Profit), **Bar chart** (Region vs Net Revenue), **Column chart** (Sales Channel vs Net Revenue).
7. Add slicers for Month, Region, Category, Channel. Format money as INR and margin as percentage.
8. Write 3 insights and 2 action recommendations on the report (label recommendations as hypotheses).

## 6) Important data definitions
- Delivered order: full discounted order value is recognized as net revenue. Cost = product cost + shipping.
- Returned order: revenue is ₹0; assume item is returned to saleable stock, with only shipping + ₹120 handling as expense. No separate inventory/COGS is charged for the returned unit.
- This project does not model tax, fixed operating overhead, partial refunds, payment fees, or cash flow.
- The dashboard's margin is **contribution / order-level profit margin** under these simplified assumptions, not audited accounting net margin.
- Values in source CSV are pre-calculated. Formulas in the XLSX Analysis tab reaggregate the CSV data in the Orders tab.

## 7) Resume line
**Business Performance Analysis Dashboard | Excel/Google Sheets, SQL, Power BI:** Analyzed 840 simulated customer orders to evaluate revenue, order-level profit, monthly trends, regional sales, category performance, and return rates; built KPI visualizations and SQL queries to identify performance opportunities.

## 8) Interview explanation (easy English)
'I created a Business Performance Analysis Dashboard using sample retail order data. I cleaned and organized the data, wrote SQL queries, and built KPIs such as revenue, profit, profit margin and return rate. The dashboard helps a business compare monthly, regional and product-category performance. It uses synthetic data for learning, not real company data.'

## 9) Suggested folder / GitHub repository title
`business-performance-analysis-dashboard`

## 10) Tanglish project summary
'Idhu oru fictional company-oda sales, costs, profit, returns eppadi perform aagudhu-nu analyse panna beginner Data Analyst project. CSV + free Google Sheets + SQLite + free Power BI Desktop use panni complete panna mudiyum.'

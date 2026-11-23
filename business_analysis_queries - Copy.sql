-- BUSINESS PERFORMANCE ANALYSIS DASHBOARD | SQL PROJECT (SQLite syntax)
-- You can open business_performance.db with SQLite or DB Browser for SQLite.
-- All monetary amounts are INR; revenue/cost/profit exclude recoverable stock cost for returned goods.

-- 1. Overall KPIs
SELECT ROUND(SUM(Net_Revenue_INR),2) AS Revenue,
       ROUND(SUM(Profit_INR),2) AS Profit,
       ROUND(100.0*SUM(Profit_INR)/NULLIF(SUM(Net_Revenue_INR),0),2) AS Profit_Margin_Pct,
       COUNT(*) AS Total_Orders,
       SUM(CASE WHEN Order_Status='Delivered' THEN 1 ELSE 0 END) AS Delivered_Orders,
       ROUND(100.0*SUM(CASE WHEN Order_Status='Returned' THEN 1 ELSE 0 END)/COUNT(*),2) AS Return_Rate_Pct
FROM orders;

-- 2. Month-by-month performance
SELECT Month, ROUND(SUM(Net_Revenue_INR),2) AS Revenue,
       ROUND(SUM(Total_Cost_INR),2) AS Cost,
       ROUND(SUM(Profit_INR),2) AS Profit,
       COUNT(*) AS Orders
FROM orders GROUP BY Month ORDER BY Month;

-- 3. Most profitable product categories
SELECT Category, ROUND(SUM(Net_Revenue_INR),2) AS Revenue,
       ROUND(SUM(Profit_INR),2) AS Profit,
       ROUND(100.0*SUM(Profit_INR)/NULLIF(SUM(Net_Revenue_INR),0),2) AS Margin_Pct
FROM orders GROUP BY Category ORDER BY Profit DESC;

-- 4. Region performance
SELECT Region, COUNT(*) AS Orders, ROUND(SUM(Net_Revenue_INR),2) AS Revenue,
       ROUND(SUM(Profit_INR),2) AS Profit
FROM orders GROUP BY Region ORDER BY Revenue DESC;

-- 5. Sales channel performance + return rate
SELECT Sales_Channel, COUNT(*) AS Orders,
       ROUND(SUM(Net_Revenue_INR),2) AS Revenue,
       ROUND(SUM(Profit_INR),2) AS Profit,
       ROUND(100.0*SUM(CASE WHEN Order_Status='Returned' THEN 1 ELSE 0 END)/COUNT(*),2) AS Return_Rate_Pct
FROM orders GROUP BY Sales_Channel ORDER BY Revenue DESC;

-- 6. Top products by profit
SELECT Product, ROUND(SUM(Net_Revenue_INR),2) AS Revenue,
       ROUND(SUM(Profit_INR),2) AS Profit
FROM orders GROUP BY Product ORDER BY Profit DESC LIMIT 5;

-- 7. Monthly trend and growth percent
WITH monthly AS (
 SELECT Month, SUM(Net_Revenue_INR) AS revenue FROM orders GROUP BY Month
)
SELECT Month, ROUND(revenue,2) AS Revenue,
       ROUND(100.0*(revenue-LAG(revenue) OVER (ORDER BY Month)) /
             NULLIF(LAG(revenue) OVER (ORDER BY Month),0), 2) AS Revenue_Growth_Pct
FROM monthly ORDER BY Month;

/*
-- Project Name: This project is used for upskilling my Snowflake skills in terms of DDL and DML
-- Author: Lynne Yi
-- Changelog:
 -- Draft Created on 16/05/2024 by Lynne
 -- v0.1 Created on <DD/MM/YYYY> by Lynne for <Reason>
 -- v0.2 Created on <DD/MM/YYYY> by Lynne for calculating KPI
*/

---------------Script Start Here------------------
SELECT 
  SUM(total_price) AS Total_Revenue 
From PIZZASUMMARY.PIZZASUMMARY.pizza_sales 
;

SELECT PIZZA_ID
FROM PIZZASUMMARY.PIZZASUMMARY.pizza_sales
;

SELECT ORDER_ID
FROM PIZZASUMMARY.PIZZASUMMARY.pizza_sales
;

-- Task 1 SQl Query for KPIs
-- 1.1 Total Revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizzasummary.pizzasummary.pizza_sales;
-- 1.2 Average Orde Results
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Average_Order_Value FROM pizzasummary.pizzasummary.pizza_sales;

-- 1.3 Total Pizzas Sold
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizzasummary.pizzasummary.pizza_sales;

-- 1.4 Order Details
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizzasummary.pizzasummary.pizza_sales;

-- 1.5 Average Pizzas Per Order
SELECT  CAST(SUM(quantity) / COUNT(DISTINCT order_id) AS DECIMAL(10,2))
AS Average_pizza_Per_Order FROM pizzasummary.pizzasummary.pizza_sales;

-- Task 2 Daily Trend for Total Orders
SELECT to_date(order_date,'DD-MM-YYYY') AS order_date, COUNT(DISTINCT order_id) AS daily_total_orders
FROM pizzasummary.pizzasummary.pizza_sales
GROUP BY order_date;

-- Task 3 Monthly Trend for orders
SELECT MONTH(TO_DATE(order_date, 'DD-MM-YYYY')) AS Month_Name, COUNT(DISTINCT order_id) AS monthly_total_orders
FROM pizzasummary.pizzasummary.pizza_sales
GROUP BY MONTH(TO_DATE(order_date, 'DD-MM-YYYY'));

-- Task 4 % of Sales by Pizza Category
SELECT pizza_category, 
CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM (total_price) FROM pizzasummary.pizzasummary.pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizzasummary.pizzasummary.pizza_sales
GROUP BY pizza_category;

-- Task 5 % of Sales by Pizza Size
SELECT pizza_size,
CAST(SUM(total_price) AS DECIMAL(10,2))AS total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizzasummary.pizzasummary.pizza_sales) AS DECIMAL(10,2))AS PCT
FROM pizzasummary.pizzasummary.pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

-- Task 6 Total Pizzas Sold by Pizza Category
SELECT pizza_category,
SUM(quantity) AS total_pizza_sold
FROM pizzasummary.pizzasummary.pizza_sales
GROUP BY pizza_category;

-- Task 6 Total Pizzas Sold by Pizza Category in Month 2
SELECT pizza_category,
SUM(quantity) AS total_pizza_sold
FROM pizzasummary.pizzasummary.pizza_sales
WHERE MONTH(TO_DATE(order_date, 'DD-MM-YYYY')) = 2
GROUP BY pizza_category
ORDER BY total_pizza_sold DESC;

-- Task 7 Top 5 Pizzas by Revenue
SELECT pizza_name,
SUM(total_price) AS total_revenue
FROM pizzasummary.pizzasummary.pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;


-- Task 8 Bottom 5 Pizzas by Revenue
SELECT pizza_name,
SUM(total_price) AS total_revenue
FROM pizzasummary.pizzasummary.pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC
LIMIT 5;

-- Task 9 Top 5 Pizzas by Quantity
SELECT pizza_name,
SUM(quantity) AS total_quantity
FROM pizzasummary.pizzasummary.pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 5;

-- Task 10 Bottom 5 Pizzas by Quantity
SELECT pizza_name,
SUM(quantity) AS total_quantity
FROM pizzasummary.pizzasummary.pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity ASC
LIMIT 5;

-- Task 11 Top 5 Pizzas by Total Orders
SELECT pizza_name,
COUNT(DISTINCT order_id) AS total_orders
FROM pizzasummary.pizzasummary.pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;

-- Task 12 Bottom 5 Pizzas by Total Orders
SELECT pizza_name,
COUNT(DISTINCT order_id) AS total_orders
FROM pizzasummary.pizzasummary.pizza_sales
GROUP BY pizza_name
ORDER BY total_orders ASC
LIMIT 5;
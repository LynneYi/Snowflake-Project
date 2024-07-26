
-- This is test case for showing Lynne how to get data from Pizza Summary

-- Task 1 SQl Query for KPIs
-- 1.1 Total Revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizzasummary.pizzasummary.pizza_sales;
-- test
-- 1,2 Average Order Results
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales;

-- 1.3 Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;

-- 1.4 Order Details
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

-- 1.5 Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;

-- Task 2 Daily Trend for Total Orders
SELECT to_date(order_date, 'DD-MM-YYYY') as order_date,  COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY order_date;

-- Task 3 Monthly Trend for orders
SELECT MONTH(TO_DATE(order_date, 'DD-MM-YYYY')) AS Month_Name,
       COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY MONTH(TO_DATE(order_date, 'DD-MM-YYYY'));
;
-- Task 4 % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category
;
-- Task 5 % of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size
;
-- Task 6 Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(TO_DATE(order_date, 'DD-MM-YYYY')) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC
;
-- Task 7 Top 5 Pizzas by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
limit 5;

-- Task 8 Bottom 5 Pizzas by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
limit 5;

-- Task 9 Top 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
limit 5;

-- Task 10 Bottom 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
limit 5;

-- Task 11 Top 5 Pizzas by Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
limit 5;

-- Task 12 Bottom 5 Pizzas by Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
limit 5;

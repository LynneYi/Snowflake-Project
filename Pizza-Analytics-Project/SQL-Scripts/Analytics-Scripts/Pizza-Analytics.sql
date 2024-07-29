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


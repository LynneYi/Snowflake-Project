/*
-- Project Name: This project is used for upskilling my Snowflake skills in terms of DDL and DML
-- Author: Lynne Yi
-- Changelog:
 -- Draft Created on 16/05/2024 by Lynne
 -- v0.1 Created on <DD/MM/YYYY> by Lynne for <Reason>
 -- v0.2 Created on <DD/MM/YYYY> by Lynne for calculating total revenue
*/

---------------Script Start Here------------------
SELECT 
  SUM(total_price) AS Total_Revenue 
From pizza_sales 

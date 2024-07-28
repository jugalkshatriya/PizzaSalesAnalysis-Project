select * from pizza_sales limit 10;

select SUM(total_price) AS Total_Revenue from pizza_sales;

select SUM(total_price)/COUNT(DISTINCT order_id) as Avg_Order_Value from pizza_sales;

select SUM(quantity) as Total_Pizza_Sold from pizza_sales;

select COUNT(DISTINCT order_id) as Total_Orders from pizza_sales;

select CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL (10,2)) AS Avg_Pizzas_Per_Order from pizza_sales;

SELECT DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d')) FROM pizza_sales;

SELECT DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d')) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d'));

SELECT monthname(STR_TO_DATE(order_date, '%Y-%m-%d')) AS Total_Orders, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY monthname(STR_TO_DATE(order_date, '%Y-%m-%d'));

select pizza_category, round(sum(total_price),2) as Total_Revenue, round(sum(total_price) * 100/(select SUM(total_price) from pizza_sales),2) as PCT from pizza_sales
group by pizza_category;

select pizza_category, round(sum(total_price),2) as Total_Revenue, round(sum(total_price) * 100/(select SUM(total_price) from pizza_sales where month(STR_TO_DATE(order_date, '%Y-%m-%d')) =1),2) as PCT from pizza_sales
where month(STR_TO_DATE(order_date, '%Y-%m-%d')) =1
group by pizza_category;

select pizza_size, round(sum(total_price),2) as Total_Revenue, round(sum(total_price) * 100/(select SUM(total_price) from pizza_sales),2) as PCT from pizza_sales
group by pizza_size;

select pizza_category, SUM(quantity) as Total_Quantity_Sold from pizza_sales group by pizza_category ;

select pizza_name, SUM(total_price) as Revenue from pizza_sales group by pizza_name order by SUM(total_price) desc limit 5; 

select pizza_name, SUM(total_price) as Revenue from pizza_sales group by pizza_name order by SUM(total_price) asc limit 5; 

select pizza_name, COUNT(quantity) as Quantity from pizza_sales group by pizza_name order by COUNT(quantity) desc limit 5; 

select pizza_name, COUNT(quantity) as Quantity from pizza_sales group by pizza_name order by COUNT(quantity) asc limit 5; 

select pizza_name, COUNT(distinct order_id) as Total_Orders from pizza_sales group by pizza_name order by COUNT(order_id) desc limit 5; 

select pizza_name, COUNT(distinct order_id) as Total_Orders from pizza_sales group by pizza_name order by COUNT(order_id) asc limit 5; 
Select * from pizza_sales

--1.Total Revenue
SELECT SUM(total_price) as Total_Revenue   from pizza_sales



--2.Average Order value
SELECT  SUM(total_price)/ COUNT(distinct(order_id)) as avg_order_value from pizza_sales

--3.Total Pizza sold

SELECT SUM(quantity) as Total_pizza_sold from pizza_sales

--4.Total Orders
SELECT COUNT(distinct(order_id)) as total_order from pizza_sales

--5.Total pizza sold per orders
SELECT CAST(CAST(SUM(quantity) AS decimal(10,2))/
cast(COUNT(distinct order_id) AS decimal(10,2)) AS decimal(10,2))as average_pizzas_per_order  from pizza_sales

--charts
--6.Daily Trend(calculate the order for all day)

SELECT DATENAME(DW,order_date) as order_day,count(distinct(order_id)) as total_orders
from pizza_sales
GROUP BY DATENAME(DW,order_date)
ORDER BY total_orders 

--7.Monthly trends
SELECT DATENAME(MONTH,order_date) as order_month,count(distinct(order_id)) as total_orders
from pizza_sales
GROUP BY DATENAME(MONTH,order_date)
ORDER BY total_orders desc

--8.Percentage of sales in pizza category
SELECT pizza_category,sum(total_price) as total_sales,sum(total_price)*100/(select sum(total_price) from pizza_sales WHERE MONTH(order_date)=1) AS percentage_total_sales
from pizza_sales
WHERE MONTH(order_date)=1
group by pizza_category

--9.% sales by pizza size
SELECT pizza_size,cast(sum(total_price) as decimal(10,2)) as total_sales,cast(sum(total_price)*100/(select sum(total_price) from pizza_sales WHERE DATEPART(QUARTER,order_date)=1)as DECIMAL(10,2))
AS percentage_total_sales
from pizza_sales
WHERE DATEPART(QUARTER,order_date)=1
group by pizza_size
Order by percentage_total_sales desc

--10.maximum selling name-- top 5 pizza..best seller

SELECT top 5 pizza_name,sum(total_price)as total_revenue from pizza_sales
GROUP BY pizza_name
order by total_revenue desc

--11.bottom5.
SELECT top 5 pizza_name,sum(total_price)as total_revenue from pizza_sales
GROUP BY pizza_name
order by total_revenue asc

--12.top 5 pizza based on quantity sold
SELECT top 5 pizza_name,sum(quantity)as total_quantity from pizza_sales
GROUP BY pizza_name
order by total_quantity desc

--13.
SELECT top 5 pizza_name,sum(quantity)as total_quantity from pizza_sales
GROUP BY pizza_name
order by total_quantity asc

--14.based on orderid--best seller
SELECT top 5 pizza_name,count(distinct quantity)as total_orders from pizza_sales
GROUP BY pizza_name
order by total_orders desc
 --15.Bottom 5
 SELECT top 5 pizza_name,count(distinct quantity)as total_orders from pizza_sales
GROUP BY pizza_name
order by total_orders asc







Select * from pizza_sales

--1.Total Revenue
SELECT SUM(total_price) as Total_Revenue   from pizza_sales



--2.Average Order value
SELECT  SUM(total_price)/ COUNT(distinct(order_id)) as avg_order_value from pizza_sales

--3.Total Pizza sold

SELECT SUM(quantity) as Total_pizza_sold from pizza_sales

--4.Total Orders
SELECT COUNT(distinct(order_id)) as total_order from pizza_sales

--5.Total pizza sold per orders
SELECT CAST(CAST(SUM(quantity) AS decimal(10,2))/
cast(COUNT(distinct order_id) AS decimal(10,2)) AS decimal(10,2))as average_pizzas_per_order  from pizza_sales

--charts
--6.Daily Trend(calculate the order for all day)

SELECT DATENAME(DW,order_date) as order_day,count(distinct(order_id)) as total_orders
from pizza_sales
GROUP BY DATENAME(DW,order_date)
ORDER BY total_orders 

--7.Monthly trends
SELECT DATENAME(MONTH,order_date) as order_month,count(distinct(order_id)) as total_orders
from pizza_sales
GROUP BY DATENAME(MONTH,order_date)
ORDER BY total_orders desc

--8.Percentage of sales in pizza category
SELECT pizza_category,sum(total_price) as total_sales,sum(total_price)*100/(select sum(total_price) from pizza_sales WHERE MONTH(order_date)=1) AS percentage_total_sales
from pizza_sales
WHERE MONTH(order_date)=1
group by pizza_category

--9.% sales by pizza size
SELECT pizza_size,cast(sum(total_price) as decimal(10,2)) as total_sales,cast(sum(total_price)*100/(select sum(total_price) from pizza_sales WHERE DATEPART(QUARTER,order_date)=1)as DECIMAL(10,2))
AS percentage_total_sales
from pizza_sales
WHERE DATEPART(QUARTER,order_date)=1
group by pizza_size
Order by percentage_total_sales desc

--10.maximum selling name-- top 5 pizza..best seller

SELECT top 5 pizza_name,sum(total_price)as total_revenue from pizza_sales
GROUP BY pizza_name
order by total_revenue desc

--11.bottom5.
SELECT top 5 pizza_name,sum(total_price)as total_revenue from pizza_sales
GROUP BY pizza_name
order by total_revenue asc

--12.top 5 pizza based on quantity sold
SELECT top 5 pizza_name,sum(quantity)as total_quantity from pizza_sales
GROUP BY pizza_name
order by total_quantity desc

--13.
SELECT top 5 pizza_name,sum(quantity)as total_quantity from pizza_sales
GROUP BY pizza_name
order by total_quantity asc

--14.based on orderid--best seller
SELECT top 5 pizza_name,count(distinct quantity)as total_orders from pizza_sales
GROUP BY pizza_name
order by total_orders desc
 --15.Bottom 5
 SELECT top 5 pizza_name,count(distinct quantity)as total_orders from pizza_sales
GROUP BY pizza_name
order by total_orders asc








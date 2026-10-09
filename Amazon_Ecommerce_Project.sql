create database amazon_ecommerce;
use amazon_ecommerce;
show tables;
select count(*) as total_records
from amazon_ecommerce_cleaned;

select count(distinct `Order ID`) as unique_orders
from amazon_ecommerce_cleaned;

select count(distinct `Category`)as unique_category
from amazon_ecommerce_cleaned;

select round(sum(amount),2) as total_sales
from amazon_ecommerce_cleaned;

select sum(Qty) as total_quantity
from amazon_ecommerce_cleaned;

select Category, round(sum(Amount),2) as total_sales
from amazon_ecommerce_cleaned
group by Category
Order by total_sales DESC;

select Category, sum(Qty) as total_quantity
from amazon_ecommerce_cleaned
group by Category
order by total_quantity desc;

select date_format(`date`,'%Y-%m') as sales_month,
round(sum(amount),2) as total_sales
from amazon_ecommerce_cleaned
group by date_format(`date`,'%Y-%m')
order by sales_month;

select `ship-state`, round(sum(amount),2) as total_sales
from amazon_ecommerce_cleaned
group by `ship-state`
order by total_sales desc;

select `ship-state`, round(sum(amount),2) as total_sales
from amazon_ecommerce_cleaned
group by `ship-state`
order by total_sales desc
limit 10;

select `ship-city`, round(sum(amount),2) as total_sales
from amazon_ecommerce_cleaned
group by `ship-city`
order by total_sales desc;

select `ship-city`, round(sum(amount),2) as total_sales
from amazon_ecommerce_cleaned
group by `ship-city`
order by total_sales desc
limit 10;

select `Status`, count(`Order ID`) as total_records
from amazon_ecommerce_cleaned
group by `Status`
order by total_records desc;

select `Status`, round(sum(amount),2) as total_sales
from amazon_ecommerce_cleaned
group by `Status`
order by total_sales desc;

select status,count(*) as total_records
from amazon_ecommerce_cleaned
group by Status;

select lower(trim(status)) as status_value,
count(*) as total_records
from amazon_ecommerce_cleaned
group by lower(trim(status))
order by total_records desc;

select round(sum(case when lower(trim(status)) like '%cancel%' then 1 else 0
end)*100.0/ count(*),2) as cancellation_rate_percentage
from amazon_ecommerce_cleaned;

select B2B,round(sum(amount),2) as total_sales
from amazon_ecommerce_cleaned
group by B2B
order by total_sales DESC;

Select SKU, round(sum(amount),2) as total_sales
from amazon_ecommerce_cleaned
group by SKU
order by total_sales desc
limit 10;

select `promotion-ids`, round(sum(amount),2) as total_sales
from amazon_ecommerce_cleaned
group by `promotion-ids`
order by total_sales desc;

select `ship-service-level` as shipping_service_level,
round(sum(amount),2) as total_sales
from amazon_ecommerce_cleaned
group by `ship-service-level`
order by total_sales desc;

select `Size`,round(sum(amount),2) as total_sales
from amazon_ecommerce_cleaned
group by `Size`
order by total_sales desc;

select date_format(`Date`,'%Y-%m') as order_month,
count(distinct `Order ID`) as total_orders
from amazon_ecommerce_cleaned
group by date_format(`Date`,'%Y-%m')
order by order_month;

select round(sum(Qty)/count(distinct `Order ID`),2) AS average_quality_per_order
from amazon_ecommerce_cleaned;

select round(sum(amount)/count(distinct `Order ID`),2) AS average_order_value
from amazon_ecommerce_cleaned;

select* from amazon_ecommerce_cleaned
limit 1;
show columns from
amazon_ecommerce_cleaned like '%Courier%';

select `Sales Channel` as sales_channel,
round(sum(amount),2) as total_sales
from amazon_ecommerce_cleaned
group by `Sales Channel`
Order by total_sales desc;
select category,round(sum(case when lower(trim(Status))like'%cancel%'
then 1 else 0 end)*100.0/count(*),2) as cancellation_rate_percentage
from amazon_ecommerce_cleaned
group by Category
order by cancellation_rate_percentage desc;

select `ship-state` as state,
count(*) as cancelled_records
from amazon_ecommerce_cleaned
where lower(trim(Status))like '%cancel%'
group by `ship-state`
order by cancelled_records desc; 

select date_format(`date`,'%Y-%m') as cancellation_month,
count(*) as cancelled_records 
from amazon_ecommerce_cleaned
where lower(trim(status))like'%cancel%'
group by date_format(`Date`,'%Y-%m')
order by cancellation_month;

select count(*) as total_records,
 count(distinct `Order ID`) as unique_orders,
count(distinct category) as unique_category,
round(sum(amount),2) as total_sales,
sum(Qty) as total_quantity,
sum(case when lower(trim(status))like'%cancel%'
then 1 else 0 end) as cancelled_records,
round(sum(case when lower(trim(status))like'%cancel%'
then 1 else 0 end )*100.0/count(*),2) as cancellation_rate_percentage,
round(sum(amount)/NULLIF(count(distinct `Order ID`),0),2) AS average_order_value
from amazon_ecommerce_cleaned;
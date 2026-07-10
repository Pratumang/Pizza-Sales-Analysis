create database Pizza_Sales_Analysis_Report;
use Pizza_Sales_Analysis_Report;

# Q1 Monthly Sales (August has the highest number of orders)
select `Order Month`, count(*) as total_order from pizza_sales
group by `Order Month` 
order by total_order desc;

# Q2 Popular Pizzas (Non-veg pizzas dominate the orders)
select `Pizza Type`, count(*) as popular_pizza from pizza_sales
group by `Pizza Type`
order by popular_pizza desc;

# Q3 Weekend weekday (weekdays has more sales)
select case
when `Is Weekend` = 'TRUE' 
then 'weekend' else 'weekdays'
end as day_type, count(*) as order_count from pizza_sales
group by day_type
order by order_count;

# Q4 Peak Hour Trends (Orders spike around 19 PM)
select `Order Hour`, count(*) as order_count from pizza_sales
group by `Order Hour`
order by order_count desc;

# Q5 Delay Patterns (All orders are marked delayed (<=30 min)
select case
when `Delivery Duration (min)` <= 30
then 'on time' else 'delay'
end as delivery_time, count(*) as total_order from pizza_sales
group by delivery_time
order by total_order;

# Q6 Topping Preferences (Most customers prefer 3 toppings on their pizza.)
select `Toppings Count`, count(*) as total_order from pizza_sales
group by `Toppings Count` 
order by total_order desc;

# Q7 Best Locations (Atlanta has the higest order)
select `Location`, count(*) as total_sales from pizza_sales
group by `Location`
order by total_sales desc;

# Q8 Traffic Impact (High traffic areas show the highest avg delay)
select `Traffic Level`,`Is Peak Hour`,
count(*) as total_order,
round(avg(`Delivery Duration (min)`),2) as avg_delivery_time,
round(avg(`Delay (min)`), 2) as avg_delay from pizza_sales
group by `Traffic Level`,`Is Peak Hour`
order by avg_delay desc;

# Q9 Payment Method (card payment are mostly used over cash)
select `Payment Method`, count(*) as total_order from pizza_sales
group by `Payment Method`
order by total_order desc;

# Q10 Pizza Size (Medium size pizza are mostly ordered)
select `Pizza Size`, count(*) as total_sales from pizza_sales
group by `Pizza Size`
order by total_sales desc;

# Q11 Delivery Efficiency (high traffic zones are less efficient)
select case
when `Traffic Level` = 'high'
then 'less efficiency'
else 'high efficiency'
end as efficiency_level, count(*) as total_order from pizza_sales
group by efficiency_level
order by total_order;

# Q12 Worst Deliveries (
select * from pizza_sales;
select `Order ID`,`Restaurant Name`,`Location`,
`Distance (km)`,`Delivery Duration (min)`,
`Traffic Level`,
(`Delivery Duration (min)`/ `Distance (km)`) as mint_per_km from pizza_sales
where `Distance (km)` >1
order by mint_per_km desc limit 10;
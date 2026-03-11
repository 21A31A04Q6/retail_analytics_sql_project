use retail_analytics;
create table silver_products as
(select product_id,product_name,category,price as selling_price,
case
when price<100 then price-10
when price between 100 and 200 then price-25 
when price between 201 and 400 then price-35
else price-50
end as actual_price
from bronze_products

);

select * from silver_products;
show tables;
use retail_analytics;
create table silver_sales as
(select bs.sale_id, bs.customer_id, bs.product_id, bs.quantity, bs.sale_date, (sp.selling_price * bs.quantity) as sale_amount,
(sp.selling_price - sp.actual_price) * (bs.quantity) as profit
from bronze_sales as bs
join silver_products as sp on bs.product_id=sp.product_id
);
drop table silver_sales;

select * from silver_sales;

show tables;
use retail_analytics;

create table gold_customer_ltv as(
    select sc.customer_id, sc.customer_name, sum(sa.sale_amount) as ltv
    from silver_customers as sc  
    join silver_sales as sa on sc.customer_id = sa.customer_id
    join silver_products s on sa.product_id = s.product_id
    group by sc.customer_id ,sc.customer_name
);
select * from gold_customer_ltv;
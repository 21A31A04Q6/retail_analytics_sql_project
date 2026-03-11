use retail_analytics;
create table gold_category_metrics as(
    select s.category as product_category,
    count (sa.sale_id) as  No_Of_Transactions,
    sum(sa.sale_amount) as total_amount,
    sum(sa.profit) as total_profit
    from silver_products as S 
    join silver_sales as sa on s.product_id=sa.product_id
    group by s.category
);

select * from gold_category_metrics;
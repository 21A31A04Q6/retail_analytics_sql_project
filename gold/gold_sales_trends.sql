use retail_analytics;
create table gold_sales_trends as(
    select month(sa.sale_date) as monthly_sales,
    year(sa.sale_date) as yearly_sales,
    count(sa.quantity) as No_Of_Purchases,
    sum(sa.profit) as tot_profit
    from silver_sales Sa 
    group by month(sa.sale_date), year(sa.sale_date)
);
select * from gold_sales_trends;
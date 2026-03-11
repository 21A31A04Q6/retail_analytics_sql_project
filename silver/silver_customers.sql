use retail_analytics;
create table silver_customers as(
    select customer_id,customer_name,age,
    CASE 
        WHEN gender='Male' THEN "M"
        when gender='Female' then "F"  
    END as gender,
    signup_date,
    CASE 
        WHEN age<18 THEN 'age group 0' 
        when age between 18 and 25 then 'age group 1'
        when age between 26 and 40 then 'age group 2'
        when age between 41 and 60 then 'age group 3'
        ELSE  'age group 4'
    END as age_group
    from bronze_customers
);

select * from silver_customers;
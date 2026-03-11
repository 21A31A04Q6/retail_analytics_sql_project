USE retail_analytics;

-- =====================================================
-- QUERY 01
-- Find the product category that generated the highest revenue
-- =====================================================

SELECT 
sp.category,
SUM(ss.sale_amount) AS total_revenue
FROM silver_products sp
JOIN silver_sales ss
ON sp.product_id = ss.product_id
GROUP BY sp.category
ORDER BY total_revenue DESC;



-- =====================================================
-- QUERY 02
-- Find the top 5 customers based on lifetime value
-- =====================================================

SELECT 
customer_id,
customer_name,
ltv
FROM gold_customer_ltv
ORDER BY ltv DESC
LIMIT 5;



-- =====================================================
-- QUERY 03
-- Find the average sale amount per transaction grouped by gender
-- =====================================================

SELECT 
sc.gender,
AVG(ss.sale_amount) AS avg_sale_amount
FROM silver_customers sc
JOIN silver_sales ss
ON sc.customer_id = ss.customer_id
GROUP BY sc.gender;



-- =====================================================
-- QUERY 04
-- Calculate the average profit per category per month
-- Also calculate profit percentage
-- =====================================================

SELECT 
sp.category,
MONTH(ss.sale_date) AS months,
AVG(ss.profit) AS avg_profit,
(SUM(ss.profit) / SUM(sp.actual_price)) * 100 AS profit_percentage
FROM silver_products sp
JOIN silver_sales ss
ON sp.product_id = ss.product_id
GROUP BY sp.category, MONTH(ss.sale_date);




-- =====================================================
-- QUERY 05
-- Correlation between age group and product category preference
-- Retrieve only the top product category preference per age group
-- using CTE and ROW_NUMBER
-- =====================================================

WITH category_count AS (
    SELECT 
        sc.age_group,
        bp.category,
        COUNT(*) AS purchase_count
    FROM silver_customers sc
    JOIN bronze_sales bs
        ON bs.customer_id = sc.customer_id
    JOIN bronze_products bp
        ON bp.product_id = bs.product_id
    GROUP BY sc.age_group, bp.category
),
ranked_category AS (
    SELECT
        age_group,
        category,
        purchase_count,
        ROW_NUMBER() OVER(
            PARTITION BY age_group
            ORDER BY purchase_count DESC
        ) AS rn
    FROM category_count
)
SELECT
    age_group,
    category AS top_category,
    purchase_count
FROM ranked_category
WHERE rn = 1;


-- =====================================================
-- QUERY 06
-- Calculate the percentage change in total revenue
-- from one month to the next month for the year 2025
-- using LAG function
-- =====================================================


SELECT 
    monthly_sales,
    yearly_sales,
    tot_profit,

    LAG(tot_profit) OVER (ORDER BY yearly_sales, monthly_sales) AS prev_month_profit,

    ROUND(
        (tot_profit - LAG(tot_profit) OVER (ORDER BY yearly_sales, monthly_sales))
        / NULLIF(LAG(tot_profit) OVER (ORDER BY yearly_sales, monthly_sales),0)
        * 100, 2
    ) AS percentage_change

FROM gold_sales_trends
WHERE yearly_sales = 2025
ORDER BY monthly_sales;




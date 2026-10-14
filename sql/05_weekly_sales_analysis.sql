-- Weekly sales and engagement
SELECT week_no,
       COUNT(DISTINCT basket_id) AS total_baskets,
       COUNT(DISTINCT household_key) AS active_customers,
       ROUND(SUM(sales_value)::numeric,2) AS weekly_sales,
       SUM(quantity) AS units_sold,
       ROUND((SUM(sales_value)/NULLIF(COUNT(DISTINCT basket_id),0))::numeric,2) AS average_basket_value
FROM vw_clean_sales
GROUP BY week_no ORDER BY week_no;

-- Compare dataset's first 10 weeks with remaining 92 weeks.
WITH weekly_sales AS (
    SELECT week_no, SUM(sales_value) AS sales,
           COUNT(DISTINCT household_key) AS customers
    FROM vw_clean_sales GROUP BY week_no
)
SELECT CASE WHEN week_no <= 10 THEN 'Weeks 1-10' ELSE 'Weeks 11-102' END AS period,
       COUNT(*) AS weeks,
       ROUND(AVG(sales)::numeric,2) AS avg_weekly_sales,
       ROUND(AVG(customers),0) AS avg_weekly_customers
FROM weekly_sales GROUP BY 1 ORDER BY 1;

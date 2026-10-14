-- Revenue and household reach by department
SELECT department,
       ROUND(SUM(sales_value)::numeric,2) AS sales,
       COUNT(DISTINCT household_key) AS customers
FROM vw_clean_sales
GROUP BY department
ORDER BY sales DESC
LIMIT 10;

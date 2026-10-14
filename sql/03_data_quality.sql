-- Data-quality checks against raw staging transactions
SELECT COUNT(*) AS raw_rows,
       COUNT(*) FILTER (WHERE product_id IS NULL) AS missing_product_id,
       COUNT(*) FILTER (WHERE household_key IS NULL) AS missing_household_key,
       COUNT(*) FILTER (WHERE sales_value IS NULL) AS missing_sales_value,
       COUNT(*) FILTER (WHERE quantity <= 0) AS nonpositive_quantity,
       COUNT(*) FILTER (WHERE sales_value < 0) AS negative_sales_value
FROM stg_transactions;

SELECT quantity, COUNT(*) AS rows, ROUND(SUM(sales_value)::numeric,2) AS sales_value
FROM stg_transactions
WHERE quantity <= 0
GROUP BY quantity ORDER BY quantity;

SELECT COUNT(*) AS cleaned_rows,
       ROUND(SUM(sales_value)::numeric,2) AS sales_value,
       COUNT(DISTINCT household_key) AS unique_households,
       COUNT(DISTINCT basket_id) AS unique_baskets
FROM vw_clean_sales;

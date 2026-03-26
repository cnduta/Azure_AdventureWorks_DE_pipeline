SELECT TOP 5 * FROM sales_enriched

SELECT TOP 5 * FROM revenue_by_territory

SELECT TOP 5 * FROM revenue_by_product
SELECT TOP 5 * FROM customer_summary
SELECT TOP 5 * FROM returns_analysis

-- TEST VIEWS
SELECT * FROM vw_monthly_revenue ORDER BY sales_year, Month_No
SELECT * FROM vw_top_products
SELECT * FROM vw_customer_segments
--CREATE VIEWS THAT SIT ON EXTERNAL TABLES

-- monthly revenue trend
CREATE VIEW vw_monthly_revenue AS
SELECT
    sales_year,
    Month_No,
    Month_Name,
    Country,
    SUM(Revenue) AS TotalRevenue,
    SUM(OrderQuantity) AS TotalOrders
FROM sales_enriched
GROUP BY sales_year, Month_No, Month_Name, Country

-- top 10 products by revenue
CREATE VIEW vw_top_products AS
SELECT TOP 10
    ProductName,
    CategoryName,
    SUM(Revenue) AS TotalRevenue,
    SUM(OrderQuantity) AS TotalQuantity
FROM sales_enriched
GROUP BY ProductName, CategoryName
ORDER BY TotalRevenue DESC

-- customer segments
CREATE VIEW vw_customer_segments AS
SELECT
    Occupation,
    Country,
    COUNT(DISTINCT CustomerName) AS CustomerCount,
    SUM(TotalRevenue) AS SegmentRevenue,
    AVG(TotalRevenue) AS AvgRevenuePerCustomer
FROM customer_summary
GROUP BY Occupation, Country

-- returns rate by territory
CREATE VIEW vw_returns_by_territory AS
SELECT
    r.Country,
    r.Region,
    SUM(r.TotalReturns) AS TotalReturns,
    SUM(t.TotalQuantity) AS TotalSold
FROM returns_analysis r
LEFT JOIN revenue_by_territory t
    ON r.Country = t.Country
    AND r.Region = t.Region
GROUP BY r.Country, r.Region
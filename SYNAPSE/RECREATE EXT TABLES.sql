-- drop the existing table
DROP EXTERNAL TABLE sales_enriched

-- recreate with correct types
CREATE EXTERNAL TABLE sales_enriched (
    OrderNumber VARCHAR(50),
    OrderDate VARCHAR(50),
    sales_year INT,
    Month_No INT,
    Month_Name VARCHAR(10),
    CustomerName VARCHAR(150),
    AnnualIncome VARCHAR(50),
    Occupation VARCHAR(50),
    Country VARCHAR(50),
    Region VARCHAR(50),
    ProductName VARCHAR(100),
    ProductSKU VARCHAR(50),
    CategoryName VARCHAR(50),
    OrderQuantity INT,
    OrderLineItem INT,
    Revenue FLOAT
)
WITH (
    LOCATION = 'sales_enriched/',
    DATA_SOURCE = AdventureWorksStorage,
    FILE_FORMAT = DeltaFormat
)

DROP EXTERNAL TABLE revenue_by_territory

CREATE EXTERNAL TABLE revenue_by_territory (
    Country VARCHAR(50),
    Region VARCHAR(50),
    sales_year INT,
    Month_Name VARCHAR(10),
    Month_No INT,
    TotalRevenue FLOAT,
    TotalQuantity INT
)
WITH (
    LOCATION = 'revenue_by_territory/',
    DATA_SOURCE = AdventureWorksStorage,
    FILE_FORMAT = DeltaFormat
)

DROP EXTERNAL TABLE revenue_by_product

CREATE EXTERNAL TABLE revenue_by_product (
    ProductName VARCHAR(100),
    ProductSKU VARCHAR(50),
    CategoryName VARCHAR(50),
    sales_year INT,
    TotalRevenue FLOAT,
    TotalQuantity INT
)
WITH (
    LOCATION = 'revenue_by_product/',
    DATA_SOURCE = AdventureWorksStorage,
    FILE_FORMAT = DeltaFormat
)

DROP EXTERNAL TABLE customer_summary

CREATE EXTERNAL TABLE customer_summary (
    CustomerName VARCHAR(150),
    AnnualIncome VARCHAR(50),
    Occupation VARCHAR(50),
    Country VARCHAR(50),
    TotalRevenue FLOAT,
    TotalOrders INT
)
WITH (
    LOCATION = 'customer_summary/',
    DATA_SOURCE = AdventureWorksStorage,
    FILE_FORMAT = DeltaFormat
)
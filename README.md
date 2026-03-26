# Adventure Works Azure Data Engineering Project

## Project Overview
An end-to-end data engineering pipeline built on Microsoft Azure, 
ingesting Adventure Works sales data from GitHub, transforming it 
through a medallion architecture, and serving it via Azure Synapse 
Analytics for business intelligence reporting.

## Architecture
GitHub (REST API) → Azure Data Factory → ADLS Gen2 → 
Azure Databricks → Azure Synapse Analytics → Power BI

## Tech Stack
- **Orchestration:** Azure Data Factory
- **Storage:** Azure Data Lake Storage Gen2
- **Transformation:** Azure Databricks (PySpark)
- **Serving:** Azure Synapse Analytics (Serverless SQL Pool)
- **Visualisation:** Power BI / Synapse Charts
- **Security:** Azure Key Vault, Managed Identity, RBAC
- **Format:** Delta Lake (silver & gold layers)

## Medallion Architecture
| Layer | Location | Description |
|-------|----------|-------------|
| Bronze | ADLS /bronze | Raw CSV files ingested from GitHub via ADF |
| Silver | ADLS /silver | Cleaned, typed, enriched Delta tables |
| Gold | ADLS /gold | Aggregated business-ready Delta tables |

## Datasets
Adventure Works sales data including:
- Sales transactions (2015, 2016, 2017)
- Customer demographics
- Product catalogue and categories
- Territory/region mapping
- Returns data
- Calendar dimensions

## Key Transformations
- Extracted Month, Year, Month Name from Calendar date column
- Created Full Name from customer Prefix, FirstName, LastName
- Split ProductSKU and ProductName to first segment only
- Unioned Sales 2015/2016/2017 using wildcard path read
- Calculated Revenue as OrderQuantity × OrderLineItem
- Standardised OrderNumber format (S → T prefix)
- Converted StockDate to timestamp format

## Gold Layer Tables
- `sales_enriched` — main fact table joining all dimensions
- `revenue_by_territory` — sales aggregated by country and region
- `revenue_by_product` — performance by product and category
- `customer_summary` — revenue and orders per customer
- `returns_analysis` — return volumes by product and territory

## Synapse Views
- `vw_monthly_revenue` — monthly revenue trends by year
- `vw_top_products` — top 10 products by revenue
- `vw_customer_segments` — customer breakdown by occupation
- `vw_returns_by_territory` — return rates by region

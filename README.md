# Adventure Works Azure Data Engineering Project

![Azure](https://img.shields.io/badge/Azure-Data%20Engineering-0078D4?style=flat&logo=microsoftazure&logoColor=white)
![ADF](https://img.shields.io/badge/Azure%20Data%20Factory-0078D4?style=flat&logo=microsoftazure&logoColor=white)
![Databricks](https://img.shields.io/badge/Databricks-FF3621?style=flat&logo=databricks&logoColor=white)
![Synapse](https://img.shields.io/badge/Azure%20Synapse-0078D4?style=flat&logo=microsoftazure&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-Green)

## 📌 Project Overview
An end-to-end data engineering pipeline built on Microsoft Azure, 
ingesting Adventure Works sales data from GitHub, transforming it 
through a medallion architecture, and serving it via Azure Synapse 
Analytics for business intelligence reporting.

## 🏗️ Architecture
GitHub (REST API) → Azure Data Factory → ADLS Gen2 → 
Azure Databricks → Azure Synapse Analytics → Power BI
![AW_ARCHITECTURE](https://github.com/user-attachments/assets/538c9d02-4637-4487-8af8-905276baeb6e)


## 🛠️ Tech Stack
- **Ingestion & Orchestration:** Azure Data Factory / Pipeline scheduling and data movement
- **Storage:** Azure Data Lake Storage Gen2
- **Transformation:** Azure Databricks (PySpark)
- **Serving:** Azure Synapse Analytics (Serverless SQL Pool)
- **Visualisation:** Power BI / Synapse Charts
- **Security:** Azure Key Vault, Managed Identity, RBAC
- **Format:** Parquet & Delta Lake (silver & gold layers)

## 🥉🥈🥇 Medallion Architecture
| Layer | Location | Description |
|-------|----------|-------------|
| Bronze | ADLS /bronze | Raw CSV files ingested from GitHub via ADF |
| Silver | ADLS /silver | Cleaned, typed, enriched Delta tables |
| Gold | ADLS /gold | Aggregated business-ready Delta tables |

## 📊 Dataset

**Adventure Works** is a sample dataset representing a fictional bicycle manufacturer. It includes:

- Customer demographics
- Sales orders and order details
- Product catalogue
- Territory and regional data

Source: [ Adventure Works Sample Data](https://www.kaggle.com/datasets/ukveteran/adventure-works)

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

## 💡 Lessons Learned
- Managed identity RBAC assignments require 5-10 minutes to propagate
- Azure Key Vault access policies vs RBAC mode behave differently
- Parquet physical types must match Synapse external table definitions

## Setup Instructions
1. Create resource group in Azure
2. Provision ADLS Gen2, ADF, Databricks, Synapse in same region
3. Assign managed identity RBAC roles on storage account
4. Configure ADF linked services and pipeline
5. Run Databricks bronze_to_silver notebook
6. Run Databricks silver_to_gold notebook
7. Execute Synapse SQL scripts in order
8. Connect visualisation layer

## 📫 Author
Caroline Nduta <br>
Data Engineer <br>
www.linkedin.com/in/caroline-nduta-data

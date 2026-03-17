# Azure AdventureWorks Data Engineering Pipeline

![Azure](https://img.shields.io/badge/Azure-Data%20Engineering-0078D4?style=flat&logo=microsoftazure&logoColor=white)
![ADF](https://img.shields.io/badge/Azure%20Data%20Factory-0078D4?style=flat&logo=microsoftazure&logoColor=white)
![Databricks](https://img.shields.io/badge/Databricks-FF3621?style=flat&logo=databricks&logoColor=white)
![Synapse](https://img.shields.io/badge/Azure%20Synapse-0078D4?style=flat&logo=microsoftazure&logoColor=white)
![Status](https://img.shields.io/badge/Status-In%20Progress-yellow)

---

## 📌 Project Overview

This project demonstrates a **production-style, end-to-end data engineering pipeline** built on the Microsoft Azure ecosystem, using the Adventure Works dataset — a fictional bicycle manufacturing company commonly used in data engineering and analytics scenarios.

The pipeline ingests raw CSV data, transforms it through a **Medallion Architecture** (Bronze → Silver → Gold), and serves clean, aggregated data for reporting via Azure Synapse Analytics.

---

## 🏗️ Architecture

```
Raw CSV Files (GitHub)
        │
        ▼
┌──────────────────┐
│  Azure Data      │  ← Ingestion & Orchestration
│  Factory (ADF)   │
└──────────────────┘
        │
        ▼
┌──────────────────┐
│  ADLS Gen2       │  ← Data Lake Storage
│  (Bronze Layer)  │     Raw data lands here
└──────────────────┘
        │
        ▼
┌──────────────────┐
│  Databricks      │  ← Transformation
│  Silver Layer    │     Cleaned, typed, deduplicated
│  Gold Layer      │     Aggregated, business-ready
└──────────────────┘
        │
        ▼
┌──────────────────┐
│  Azure Synapse   │  ← Serving Layer
│  Analytics       │     SQL queries & reporting
└──────────────────┘
```

---

## 📂 Repository Structure

```
Azure_AdventureWorks_DE_pipeline/
│
├── README.md                        ← You are here
├── architecture-diagram.png         ← Visual pipeline diagram
│
├── data/
│   └── raw/                         ← Source Adventure Works CSV files
│       ├── customers.csv
│       ├── sales_orders.csv
│       ├── products.csv
│       └── ...
│
├── adf/
│   └── pipelines/                   ← Exported ADF pipeline JSON configs
│
├── databricks/
│   └── notebooks/                   ← PySpark transformation notebooks
│       ├── 01_bronze_to_silver.py   ← Cleaning & standardisation
│       ├── 02_silver_to_gold.py     ← Aggregations & business logic
│       └── utils/
│
├── synapse/
│   └── sql_scripts/                 ← SQL scripts for the serving layer
│
└── docs/
    └── notes.md                     ← Architecture decisions & learnings
```

---

## 🛠️ Tools & Technologies

| Layer | Tool | Purpose |
|---|---|---|
| Ingestion & Orchestration | Azure Data Factory | Pipeline scheduling and data movement |
| Storage | ADLS Gen2 | Data lake with Bronze/Silver/Gold containers |
| Transformation | Databricks + PySpark | Data cleaning, typing, and aggregation |
| Serving | Azure Synapse Analytics | SQL-based querying and reporting |
| Source Control | GitHub | Version control for notebooks, configs, and data |

---

## 🥉🥈🥇 Medallion Architecture

This project implements the **Medallion (Lakehouse) Architecture**:

- **Bronze** — Raw data as ingested from source CSVs. No transformation. Exact copy of source.
- **Silver** — Cleaned and standardised data. Nulls handled, data types corrected, duplicates removed.
- **Gold** — Business-ready aggregations. Fact and dimension tables optimised for reporting.

---

## 📊 Dataset

**Adventure Works** is a sample dataset representing a fictional bicycle manufacturer. It includes:

- Customer demographics
- Sales orders and order details
- Product catalogue
- Territory and regional data

Source: [ Adventure Works Sample Data](https://www.kaggle.com/datasets/ukveteran/adventure-works)
---

## 🚧 Project Status

This project is actively being built. Progress:

- [ x] Upload raw Adventure Works CSV files
- [ ] Configure ADLS Gen2 containers (bronze/silver/gold)
- [ ] Build ADF ingestion pipeline (CSV → Bronze)
- [ ] Databricks: Bronze → Silver transformation
- [ ] Databricks: Silver → Gold aggregation
- [ ] Synapse: Serving layer SQL scripts
- [ ] Architecture diagram
- [ ] Final documentation & write-up

---

## 💡 Key Learnings

*(To be updated as the project progresses)*

---

## 📫 About Me

I'm a data professional transitioning into Data Engineering, with a background in SQL, Python, and Power BI. Currently building hands-on Azure DE skills and looking for **Data Engineer roles in the UK**.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Caroline%20Nduta-0077B5?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/caroline-nduta-data)
[![Email](https://img.shields.io/badge/Email-ndutacaroline13.cn%40gmail.com-D14836?style=flat&logo=gmail&logoColor=white)](mailto:ndutacaroline13.cn@gmail.com)
[![Portfolio](https://img.shields.io/badge/Portfolio-PORTFOLIO--PROJECTS-181717?style=flat&logo=github&logoColor=white)](https://github.com/cnduta/PORTFOLIO-PROJECTS)

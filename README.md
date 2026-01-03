# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** 🚀  
This repository showcases a complete end-to-end implementation of a modern data warehouse and analytics solution. Built as a portfolio project, it reflects real-world data engineering practices—from raw data ingestion to analytics-ready datasets—focused on clarity, scalability, and analytical performance.

---

## 🏗️ Data Architecture

The project is designed using the **Medallion Architecture**, consisting of **Bronze**, **Silver**, and **Gold** layers to ensure clean data flow and separation of responsibilities.

1. **Bronze Layer**  
   Stores raw data ingested directly from source systems. CSV files from ERP and CRM systems are loaded into a SQL Server database without transformation.

2. **Silver Layer**  
   Handles data cleansing, standardization, and normalization. This layer improves data quality and prepares datasets for analytical use.

3. **Gold Layer**  
   Contains business-ready data modeled using a star schema, optimized for reporting and analytical queries.

---

## 📖 Project Overview

This project covers the following key components:

1. **Data Architecture Design**  
   Implementation of a modern data warehouse using the Medallion Architecture (Bronze, Silver, Gold).

2. **ETL Pipelines**  
   End-to-end extraction, transformation, and loading processes to move data from source systems into the warehouse.

3. **Data Modeling**  
   Creation of fact and dimension tables structured for efficient analytics and reporting.

4. **Analytics & Reporting**  
   SQL-based analysis to generate meaningful insights and support data-driven decision-making.

---

## 🚀 Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Build a modern SQL Server–based data warehouse that consolidates sales data from multiple sources to support analytical reporting and business insights.

#### Specifications
- **Data Sources**: ERP and CRM data provided as CSV files.
- **Data Quality**: Identification and resolution of data quality issues before analysis.
- **Integration**: Unified data model combining multiple source systems.
- **Scope**: Analysis based on the latest available data; historical tracking is out of scope.
- **Documentation**: Clear and structured documentation to support analytics and business users.

---

### BI: Analytics & Reporting (Data Analysis)

#### Objective
Develop SQL-driven analytics to gain insights into:
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

These analytics provide key metrics to support strategic and operational decision-making.

For detailed requirements, refer to [docs/requirements.md](docs/requirements.md).

---

## 📂 Repository Structure
```
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.drawio                      # Draw.io file shows all different techniquies and methods of ETL
│   ├── data_architecture.drawio        # Draw.io file shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio                # Draw.io file for the data flow diagram
│   ├── data_models.drawio              # Draw.io file for data models (star schema)
│   ├── naming-conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
├── .gitignore                          # Files and directories to be ignored by Git
└── requirements.txt                    # Dependencies and requirements for the project

## 🛡️ License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.




# retail_analytics_sql_project
# Retail Analytics SQL Project (Medallion Architecture)

This project demonstrates a Retail Analytics data pipeline built using the Medallion Architecture (Bronze, Silver, Gold). The pipeline transforms raw retail data into business-level insights using SQL.

Architecture Used
Medallion Architecture

Bronze Layer
Raw ingestion layer containing source data for:
- Customers
- Products
- Sales

Silver Layer
Data cleaning and transformation layer where:
- Data types are standardized
- Derived columns such as age_group are created
- Pricing transformations are applied
- Sales amount and profit are calculated

Gold Layer
Business-level aggregated tables used for analytics such as:
- Category performance metrics
- Customer Lifetime Value (CLV)
- Monthly sales trends

Key Analytical Queries
1. Total revenue by product category
2. Top customers by revenue
3. Monthly sales trends
4. Customer Lifetime Value (CLV)
5. Age group vs product category preference
6. Month-to-month revenue change using LAG()

Technologies Used
SQL
VS Code
GitHub

Project Structure
retail-analytics-sql-project
│
├── bronze_tables.sql
├── silver_tables.sql
├── gold_tables.sql
├── analysis_queries.sql
└── README.md

Learning Outcomes
- Implemented Medallion Architecture for data pipelines
- Practiced SQL transformations and joins
- Used window functions like LAG and ROW_NUMBER
- Performed business analytics on retail data

Author
Your Name

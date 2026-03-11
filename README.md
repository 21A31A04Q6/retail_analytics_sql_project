# Retail Analytics with Medallion Architecture in Teradata

## 📌 Project Overview
This project implements the Medallion Architecture (Bronze → Silver → Gold) using Teradata SQL to simulate a retail analytics pipeline.

The system processes raw sales, customer, and product data and transforms it into meaningful business insights.

---

## 🏗 Architecture

### 🥉 Bronze Layer (Raw Data)
- bronze_sales
- bronze_customers
- bronze_products

### 🥈 Silver Layer (Cleaned & Transformed)
- Data validation and cleaning
- Derived columns (Revenue, Profit)
- Customer age group classification
- Standardized product information

Tables:
- silver_sales
- silver_customers
- silver_products

### 🥇 Gold Layer (Business Insights)
Aggregated analytical tables for reporting:

- gold_category_metrics
- gold_customer_ltv
- gold_sales_trends

---

## 📊 Business Problems Solved

1. Top revenue-generating product categories (Last Month)
2. Top 5 customers by Lifetime Value
3. Average sale amount per transaction by gender
4. Monthly average profit per category
5. Age group vs product category preference (CTE + ROW_NUMBER)
6. Month-over-month revenue growth using LAG()

---

## 🛠 Tech Stack
- Teradata
- SQL
- CTEs
- Window Functions
- Aggregations & Joins
- Medallion Architecture

---

## 🚀 Key Learning Outcomes
- Implemented multi-layer data architecture
- Practiced advanced SQL analytics
- Built end-to-end retail data pipeline
# 📊 Loan Default Risk Analysis

## Executive Summary

### 📈 Business Impact

### 🚀 Key Next Steps

## 📌 Business Problem Statement
Horizon Financial Group has issued over 600 personal loans across 2024 and 2025. The company has noticed that roughly 1 in 4 loans are defaulting, which is well above their target of 12%. Management is concerned about the rising default rate on personal loans and wants data-driven insights to improve the underwriting process.

## 🎯 Objective
To analyze borrower demographics, loan characteristics, and repayment outcomes to identify the key risk factors that predict loan defaults.

## 🛠️ Tools

### Data Source :
Source : [analystbuilder.com](https://www.analystbuilder.com/projects/loan-default-risk-analysis-Vjfdl?tab=overview) 

Data Coverage : Historical loan application and borrower profile data

Dataset composition :

- `loan_applications.csv` - consist of loan request details, application status and default indicators

- `borrower_profiles.csv` - consist of demographic, credit and employment information

### Tools :
- **SQL** : Data extraction, transformation and aggregation

- **Power BI** : Data visualization and business intelligence dahsboard

- **CSV data files** : Standardized data format for analysis and integration

## 📂 Methodology
**Phase 1 : Database Initialization, Table Creation and EDA**
- created a database and uploaded both CSV files.
- checked for nulls, invalid dates, negative numbers and unwanted white spaces.
- joined the two tables based on primary key (borrower_id) to create master table.
  
**Phase 2 : Segment Analysis**
Created risk segments based on
- credit score tiers (<520, 520-500, 600-649, 650-699, 700-749, 750+)
- debt-to-income ratios (<20, 20-29, 30-39, 40-49, 50-59, 60+)
- interest rate tiers (06-08, 09-10, 11-12, 13-14, 15+
- years employed bucket (<2, 3-5, 6-10, 11-15, 16+)
- segmented by loan purpose categories (Wedding, etc) and employment (Part-time, etc)

**Phase 3 : Correlation Analysis** 
- examined default rates across each segment.
- indentified patterns and correlation between borrowers characteristics and default behaviour.
- calculated default rate percentage by comparative analysis.
  Default Rate % = (Total Nr. of Loan / Total Nr. of Defaults) * 100
- evaluated segment performance metrics.

**Phase 4 : Visualization & Reporting**  
- created comprehensive dashboards in Power BI
- visualized default rates by each segment
- developed comparative analysis charts
- produced actionable insights and recommendations

# Results & Business Recommendations

## 📈 Key Insights & Results
The overall default rate across all loan application is 24.29%.
1. Credit Score
- high risk segment : The highest default rate coming from credit score '520-599' around 49.14%.
- low risk segment : The default rate decreases as the credit score increases more than 600+ range from 12% to 29%.

2. Debt-to-Income Ratio
- there is a clear correlation between DTI ratio to default rate.
- borrowers coming from lower DTI range (eg. 30-39) shows lower default rate around 12%. However, the highest default rate (33%) is coming from DTI more than 50+.
- the cut-off DTI recommendation for loan approval should be less than 40%.

3. Loan Purpose
- the top 3 highest default rate goes to wedding (32.14%), home improvement (28.57%) and automotive loan (27.12%).
- the average loan amount comparison between defaulted and non-defaulted

4. Employment Status

## 📊 Business Recommendations

## 🚀 Future Improvements

## Project Structure
```
loan-default-risk-analysis/
├── README.md                         # Project documentation (this file)
├── script                            # Folder contains SQL scripts
  ├── init_db.sql                     # Initialization for database and table
  ├── EDA_joined_master_table.sql     # EDA checking and creating master table
  ├── loan_analysis_queries.sql       # Main SQL analytical views
├── datasets                          # Folder contains the datasets
  ├── loan_applications.csv           # Loan application data
  │   ├── Contains: loan_id, borrower_id, application_date, loan_purpose, loan_amount, term_months, interest_rate, monthly_payment, dti_ratio, loan_status, days_delinquent, defaulted
  │   └── Records: Historical loan request information
  ├── borrower_profiles.csv           # Borrower demographic & credit data
  │   ├── Contains: borrower_id, age, state, education, employment, years_employed, annual_income, credit_score, home_ownership, dependents, existing_monthly_debt
  │   └── Records: Borrower profile information linked to applications
└── visualization
```


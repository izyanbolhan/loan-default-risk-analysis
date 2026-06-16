# Loan Default Risk Analysis

## Business Problem Statement
Horizon Financial Group has issued over 600 personal loans across 2024 and 2025. The company has noticed that roughly 1 in 4 loans are defaulting, which is well above their target of 12%. Management is concerned about the rising default rate on personal loans and wants data-driven insights to improve the underwriting process.

## Objective
To analyze borrower demographics, loan characteristics, and repayment outcomes to identify the key risk factors that predict loan defaults.

## Data Summary



## Methodology & Tools

### Data Source :
Source : analystbuilder.com

Data Coverage : Historical loan application and borrower profile data

Dataset composition :

- **loan_application.csv** - consist of loan request details, application status and default indicators

- **borrower_profiles.csv** - consist of demographic, credit and employment information

### Tools :
- **SQL** : Data extraction, transformation and aggregation

- **Power BI** : Data visualization and business intelligence dahsboard

- **CSV data files** : Standardized data format for analysis and integration

### Workflow :
1. Created a database and uploaded both CSV files. Checked for nulls, invalid dates, negative numbers and unwanted white spaces. Joined the two tables based on primary key (borrower_id).
2. Segment analysis : Created credit score, Debt-to-Income (DTI), interest rate and years employed buckets and calculate default rates for each segment.
   Default Rate % = Total loan/total default * 100
3. Correlation Analysis : Identified which numeric variables (credit score, DTI, income, loan amount, interest rate) have the strongest correlation with defaults.
4. Visualization: Built charts showing default rate by credit score range, a scatter plot of DTI vs. default status, and a bar chart comparing loan purposes.
5. Outcomes Overall Default Rate: The overall default rate across all loan applications is 24.29%.


## Key Insights & Results

## Business Recommendations


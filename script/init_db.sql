--Create Database 'LoanRiskProject'
USE master;

CREATE DATABASE LoanRiskProject;

USE LoanRiskProject;


--Create table : Loan Applications
IF OBJECT_ID ('loan_applications', 'U') IS NOT NULL
	DROP TABLE loan_applications;

CREATE TABLE loan_applications (
	loan_id VARCHAR(50),
	borrower_id VARCHAR(50),
	application_date DATE,
	loan_purpose VARCHAR(50),
	loan_amount FLOAT,
	term_months INT,
	interest_rate FLOAT,
	monthly_payment FLOAT,
	dti_ratio FLOAT,
	loan_status VARCHAR(50),
	days_delinquent INT,
	defaulted INT
	);

--Create table : Borrower Profiles
IF OBJECT_ID ('borrower_profiles', 'U') IS NOT NULL
	DROP TABLE borrower_profiles;

CREATE TABLE borrower_profiles (
	borrower_id VARCHAR(50),
	age INT,
	state VARCHAR(50),
	education VARCHAR(50),
	employment VARCHAR(50),
	years_employed INT,
	annual_income INT,
	credit_score INT,
	home_ownership VARCHAR(50),
	dependents INT,
	existing_monthly_debt INT
	);


--to upload csv file into Loan Applications table
BULK INSERT loan_applications
FROM 'C:\Users\bizyan\Desktop\Data Analyst\Project\Loan Default Risk Analysis\datasets\loan_applications.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);

--to upload csv file into borrower_profiles table
BULK INSERT borrower_profiles
FROM 'C:\Users\bizyan\Desktop\Data Analyst\Project\Loan Default Risk Analysis\datasets\borrower_profiles.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);

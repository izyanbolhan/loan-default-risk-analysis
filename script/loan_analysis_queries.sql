/*------------------------------------------------------------------------------
Query to check overall default rate & table view creation
--------------------------------------------------------------------------------*/

CREATE OR ALTER VIEW overall_default_rate AS
SELECT
COUNT (*) AS overall_total_loans,
SUM (defaulted) AS overall_total_defaults,
ROUND ((CAST (SUM (defaulted) AS FLOAT)/(CAST (COUNT (*) AS FLOAT))),4) AS overall_default_rate_percentage
FROM overall_join

/*------------------------------------------------------------------------------
Query to calculate default rate by credit score & table view creation
--------------------------------------------------------------------------------*/

CREATE OR ALTER VIEW credit_score_defaulft_rate AS
SELECT
CASE
	WHEN credit_score < 600 THEN '520-599'
	WHEN credit_score < 650 THEN '600-649'
	WHEN credit_score < 700 THEN '650-699'
	WHEN credit_score < 750 THEN '700-749'
	ELSE '750+'
END AS score_bucket,
COUNT (*) AS total_loans,
SUM (defaulted) AS total_defaults,
ROUND ((CAST (SUM (defaulted) AS FLOAT)/(CAST (COUNT (*) AS FLOAT))),4) AS default_rate_percentage
FROM overall_join
GROUP BY
CASE
	WHEN credit_score < 600 THEN '520-599'
	WHEN credit_score < 650 THEN '600-649'
	WHEN credit_score < 700 THEN '650-699'
	WHEN credit_score < 750 THEN '700-749'
	ELSE '750+'
END

/*------------------------------------------------------------------------------
Query to calculate default rate by dti ratio & table view creation
--------------------------------------------------------------------------------*/
CREATE OR ALTER VIEW dti_ratio_default_rate AS
SELECT 
CASE
	WHEN dti_ratio < 21 THEN '<20'
	WHEN dti_ratio < 31 THEN '20-29'
	WHEN dti_ratio < 41 THEN '30-39'
	WHEN dti_ratio < 51 THEN '40-49'
	WHEN dti_ratio < 61 THEN '50-59'
	ELSE '60+'
END AS dti_bucket,
COUNT (*) AS total_loans,
SUM (defaulted) AS total_defaults,
ROUND ((CAST (SUM (defaulted) AS FLOAT)/(CAST (COUNT (*) AS FLOAT))),4) AS default_rate_percentage
FROM overall_join
GROUP BY
CASE
	WHEN dti_ratio < 21 THEN '<20'
	WHEN dti_ratio < 31 THEN '20-29'
	WHEN dti_ratio < 41 THEN '30-39'
	WHEN dti_ratio < 51 THEN '40-49'
	WHEN dti_ratio < 61 THEN '50-59'
	ELSE '60+'
END

/*------------------------------------------------------------------------------
Query to calculate default rate by loan purpose & table view creation
--------------------------------------------------------------------------------*/
CREATE OR ALTER VIEW loan_purpose_default_rate AS
SELECT
loan_purpose,
COUNT (*) AS total_loans,
SUM (defaulted) AS total_defaults,
ROUND ((CAST (SUM (defaulted) AS FLOAT)/(CAST (COUNT (*) AS FLOAT))),4) AS default_rate_percentage
FROM overall_join
GROUP BY loan_purpose
ORDER BY ROUND ((CAST (SUM (defaulted) AS FLOAT)/(CAST (COUNT (*) AS FLOAT))),4)

/*------------------------------------------------------------------------------
Query to calculate avg_loan_amount differ from defaulted and non-defaulted by loan purpose & table view creation
--------------------------------------------------------------------------------*/

CREATE OR ALTER VIEW loan_purpose_avg_loan_amount_by_defaulted AS
SELECT
loan_purpose,
LEAD (avg_loan_amount) OVER (PARTITION BY loan_purpose ORDER BY defaulted)-avg_loan_amount AS lee
FROM (
SELECT
loan_purpose,
defaulted,
ROUND (AVG (loan_amount),2) AS avg_loan_amount
FROM overall_join
GROUP BY  loan_purpose, defaulted
ORDER BY loan_purpose, defaulted
)t

/*------------------------------------------------------------------------------
Query to calculate default rate by employment & table view creation
--------------------------------------------------------------------------------*/
CREATE OR ALTER VIEW employment_default_rate AS
SELECT 
employment,
COUNT (*) AS total_loans,
SUM (defaulted) AS total_defaults,
ROUND ((CAST (SUM (defaulted) AS FLOAT)/(CAST (COUNT (*) AS FLOAT))),4) AS default_rate_percentage
FROM overall_join
GROUP BY employment

/*------------------------------------------------------------------------------
Query to calculate default rate by age & table view creation
--------------------------------------------------------------------------------*/
CREATE OR ALTER VIEW age_default_rate AS
SELECT 
CASE 
	WHEN age <31 THEN '<30'
	WHEN age <41 THEN '31-40'
	WHEN age <51 THEN '41-50'
	WHEN age <61 THEN '51-60'
	ELSE '60+'
END AS age_bucket,
COUNT (*) AS total_loans,
SUM (defaulted) AS total_defaults,
ROUND ((CAST (SUM (defaulted) AS FLOAT)/(CAST (COUNT (*) AS FLOAT))),4) AS default_rate_percentage
FROM overall_join
GROUP BY
CASE 
	WHEN age <31 THEN '<30'
	WHEN age <41 THEN '31-40'
	WHEN age <51 THEN '41-50'
	WHEN age <61 THEN '51-60'
	ELSE '60+'
END 

/*------------------------------------------------------------------------------
Query to calculate default rate by years_employed & table view creation
--------------------------------------------------------------------------------*/
CREATE OR ALTER VIEW years_employed_default_rate AS
SELECT
CASE
	WHEN years_employed < 3 THEN '00-02'
	WHEN years_employed < 6 THEN '03-05'
	WHEN years_employed < 11 THEN '06-10'
	WHEN years_employed < 16 THEN '11-15'
	ELSE '16+'
END AS years_employed_bucket,
COUNT (*) AS total_loans,
SUM (defaulted) AS total_defaults,
ROUND ((CAST (SUM (defaulted) AS FLOAT)/(CAST (COUNT (*) AS FLOAT))),4) AS default_rate_percentage
FROM overall_join
GROUP BY
CASE
	WHEN years_employed < 3 THEN '00-02'
	WHEN years_employed < 6 THEN '03-05'
	WHEN years_employed < 11 THEN '06-10'
	WHEN years_employed < 16 THEN '11-15'
	ELSE '16+'
END

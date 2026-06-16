/*------------------------------------------------------------------------------
This script shows the EDA process for loan_application table
--------------------------------------------------------------------------------*/
SELECT *
FROM loan_applications;

/*------------------------------------------------------------------------------
To check any duplicates in loan_id
--------------------------------------------------------------------------------*/
SELECT
loan_id,
COUNT (*)
FROM loan_applications
GROUP BY loan_id
HAVING COUNT (*) > 1

--Result : no duplicates found in loan_id
  
/*------------------------------------------------------------------------------
 To check is there any NULL in loan_id 
--------------------------------------------------------------------------------*/
SELECT
loan_id
FROM loan_applications
WHERE loan_id IS NOT NULL
--Result : no NULL found in loan_id

/*------------------------------------------------------------------------------
 To check any unwanted white spaces
--------------------------------------------------------------------------------*/
SELECT
loan_id
FROM loan_applications
WHERE loan_id != TRIM (loan_id);

SELECT
borrower_id
FROM loan_applications
WHERE borrower_id != TRIM (borrower_id);

SELECT loan_purpose
FROM loan_applications
WHERE loan_purpose != TRIM (loan_purpose);

SELECT loan_status
FROM loan_applications
WHERE loan_status != TRIM (loan_status);

--Result : No unwanted white spaces observed for loan_id, borrower_id, loan_purpose and loan_status

/*------------------------------------------------------------------------------
To check invalid dates
--------------------------------------------------------------------------------*/

SELECT application_date
FROM loan_applications
WHERE application_date IS NULL;
--Result : No invalid dates or NULL observed

/*------------------------------------------------------------------------------
To check if any value is in negative
--------------------------------------------------------------------------------*/
SELECT loan_amount
FROM loan_applications
WHERE loan_amount < 0;

SELECT term_months
FROM loan_applications
WHERE loan_amount < 0;

SELECT interest_rate
FROM loan_applications
WHERE interest_rate < 0;

SELECT monthly_payment
FROM loan_applications
WHERE  monthly_payment < 0;

SELECT dti_ratio
FROM loan_applications
WHERE dti_ratio < 0;

SELECT days_delinquent
FROM loan_applications
WHERE days_delinquent < 0;

SELECT defaulted
FROM loan_applications
WHERE defaulted < 0;

--Result : all values are in positive value

/*------------------------------------------------------------------------------
To check grouping for each column are in distinct, no spelling error
--------------------------------------------------------------------------------*/
SELECT DISTINCT loan_purpose
FROM loan_applications;

SELECT DISTINCT loan_status
FROM loan_applications;

--Result : All values are unique, no spelling error observed.

/*------------------------------------------------------------------------------
This script shows the EDA process for borrower_profiles table
--------------------------------------------------------------------------------*/

SELECT *
FROM borrower_profiles;

/*------------------------------------------------------------------------------
To check any duplicate in borrower_id
--------------------------------------------------------------------------------*/
SELECT
borrower_id,
COUNT (*)
FROM borrower_profiles
GROUP BY borrower_id
HAVING COUNT (*) > 1
--Result : No duplicates found in borrower_id

/*------------------------------------------------------------------------------
To check any unwanted white spaces
--------------------------------------------------------------------------------*/
SELECT state
FROM borrower_profiles
WHERE state != TRIM (state);

SELECT education
FROM borrower_profiles
WHERE education != TRIM (education);

SELECT employment
FROM borrower_profiles
WHERE employment != TRIM (employment);

SELECT home_ownership
FROM borrower_profiles
WHERE home_ownership != TRIM (home_ownership);

--Result : No unwanted white spaces observed for state, education, eployment and home_ownership.

/*------------------------------------------------------------------------------
To check if any value is in negative
--------------------------------------------------------------------------------*/
SELECT age
FROM borrower_profiles
WHERE years_employed < 0;

SELECT years_employed
FROM borrower_profiles
WHERE years_employed < 0;

SELECT annual_income
FROM borrower_profiles
WHERE annual_income < 0;

SELECT credit_score
FROM borrower_profiles
WHERE credit_score < 0;

SELECT dependents
FROM borrower_profiles
WHERE dependents < 0;

SELECT existing_monthly_debt
FROM borrower_profiles
WHERE existing_monthly_debt < 0;

--Result : All values are in positive value

/*------------------------------------------------------------------------------
To check grouping for each column are in distinct, no spelling error
--------------------------------------------------------------------------------*/
SELECT DISTINCT state
FROM borrower_profiles;

SELECT DISTINCT education
FROM borrower_profiles;

SELECT DISTINCT employment
FROM borrower_profiles;

SELECT DISTINCT home_ownership
FROM borrower_profiles;

--Result : All values are unique, no spelling error observed.

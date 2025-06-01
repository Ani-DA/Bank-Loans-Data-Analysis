---checking for duplicate loan id
SELECT 
	id,
	count(*)
FROM loans_tbl
GROUP BY id
HAVING COUNT (*) > 1

--whereas this one below shows if an employee has multiple loans, because we are grouping by employee name
-- bus in the previous one since we are grouping by id, we can see whether id is having duplicate
--and since we are grouping by name we are seeking whether employee name has other duplicates
SELECT 
	emp_title,
	count(distinct id)
FROM loans_tbl
GROUP BY emp_title
HAVING COUNT (distinct id) > 1

---KPIs
--total loan applications

SELECT 
	COUNT(DISTINCT id)
FROM loans_tbl


--total loan amount
SELECT 
	SUM(loan_amount)
FROM loans_tbl


--total loan payment received
SELECT 
	SUM(total_payment)
FROM loans_tbl


--total charged off loans
SELECT 
	COUNT(DISTINCT id) AS CHARGED_OFF_LOANS,
	COUNT(DISTINCT id) * 100.00/(SELECT COUNT(*) FROM loans_tbl)AS PCT_CHARGED_OFF_LOANS
FROM loans_tbl
	WHERE loan_status = 'Charged Off'



--total repaid loans
SELECT 
	COUNT(DISTINCT id) AS FULLY_PAID_LOANS,
	COUNT(DISTINCT id) * 100.00/(SELECT COUNT(*) FROM loans_tbl)AS PCT_FULLY_PAID_LOANS
FROM loans_tbl
	WHERE loan_status = 'Fully Paid'

--total ongoing loans
SELECT 
	COUNT(DISTINCT id) AS ONGOING_LOANS,
	COUNT(DISTINCT id) * 100.00/(SELECT COUNT(*) FROM loans_tbl)AS PCT_ONGOING_LOANS
FROM loans_tbl
	WHERE loan_status = 'Current'


--average dti
SELECT 
	AVG(dti)
FROM loans_tbl


---Good Vs Bad Loans, stats
SELECT 
	COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id ELSE NULL END) AS Good_Loans,
	ROUND(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id ELSE NULL END)*100.0/NULLIF(COUNT(*),0),2) AS PCT_GOOD_LOANS,
	COUNT(CASE WHEN loan_status = 'Charged Off' THEN id ELSE NULL END) AS Bad_Loans,
	ROUND(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id ELSE NULL END)*100.0/NULLIF(COUNT(*),0),2) AS PCT_Bad_Loans
FROM
loans_tbl


---Good Vs Bad Loans by Term
SELECT 
	term,
	COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id ELSE NULL END) AS Good_Loans,
	COUNT(CASE WHEN loan_status = 'Charged Off' THEN id ELSE NULL END) AS Bad_Loans	
FROM
	loans_tbl
GROUP BY
	term


---Good Vs Bad Loans by Purpose
SELECT 
	purpose,
	COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id ELSE NULL END) AS Good_Loans,
	COUNT(CASE WHEN loan_status = 'Charged Off' THEN id ELSE NULL END) AS Bad_Loans	
FROM
	loans_tbl
GROUP BY
	purpose
ORDER BY
	Good_Loans DESC


---What patterns do you see in credit ratings versus loan performance?

SELECT 
  credit_rating,
  loan_status,
  COUNT(*) AS loan_count
FROM loans_tbl
GROUP BY credit_rating, loan_status;


---Are there specific borrower segments with higher default or charge-off rates?
SELECT 
  home_ownership,
  loan_status,
  COUNT(*) AS loan_count
FROM loans_tbl
GROUP BY home_ownership, loan_status;

---What percentage of loans with high DTI (debt-to-income) ratios are becoming delinquent or charged off?
SELECT 
  CASE 
    WHEN dti <= 0.05 THEN '0–5%'
    WHEN dti <= 0.10 THEN '5–10%'
    WHEN dti <= 0.15 THEN '10–15%'
    WHEN dti <= 0.20 THEN '15–20%'
    WHEN dti <= 0.25 THEN '20–25%'
    ELSE '25–30%'
  END AS dti_band,
  loan_status,
  COUNT(*) AS loan_count
FROM loans_tbl
GROUP BY 
  CASE 
    WHEN dti <= 0.05 THEN '0–5%'
    WHEN dti <= 0.10 THEN '5–10%'
    WHEN dti <= 0.15 THEN '10–15%'
    WHEN dti <= 0.20 THEN '15–20%'
    WHEN dti <= 0.25 THEN '20–25%'
    ELSE '25–30%'
  END,
  loan_status
ORDER BY dti_band;


---Does Annual income of the customers play any role in loans becoming delinquent or charged off?
SELECT 
  CASE 
      WHEN annual_income <= 10000 THEN '≤ 10K'
      WHEN annual_income <= 25000 THEN '10K–25K'
      WHEN annual_income <= 50000 THEN '25K–50K'
      WHEN annual_income <= 100000 THEN '50K–100K'
      WHEN annual_income <= 200000 THEN '100K–200K'
      WHEN annual_income <= 500000 THEN '200K–500K'
      WHEN annual_income <= 1000000 THEN '500K–1M'
      ELSE '>1M'
  END AS income_band,
  loan_status,
  COUNT(*) AS loan_count
FROM loans_tbl
GROUP BY 
  CASE 
      WHEN annual_income <= 10000 THEN '≤ 10K'
      WHEN annual_income <= 25000 THEN '10K–25K'
      WHEN annual_income <= 50000 THEN '25K–50K'
      WHEN annual_income <= 100000 THEN '50K–100K'
      WHEN annual_income <= 200000 THEN '100K–200K'
      WHEN annual_income <= 500000 THEN '200K–500K'
      WHEN annual_income <= 1000000 THEN '500K–1M'
      ELSE '>1M'
  END,
  loan_status
ORDER BY income_band;


---What percentage of loans with high Loan amount are becoming delinquent or charged off?
SELECT 
  CASE 
      WHEN loan_amount <= 1000 THEN '≤ 1K'
      WHEN loan_amount <= 5000 THEN '1K–5K'
      WHEN loan_amount <= 10000 THEN '5K–10K'
      WHEN loan_amount <= 15000 THEN '10K–15K'
      WHEN loan_amount <= 20000 THEN '15K–20K'
      WHEN loan_amount <= 25000 THEN '20K–25K'
      WHEN loan_amount <= 30000 THEN '25K–30K'
      ELSE '30K–35K'
  END AS loan_amount_band,
  loan_status,
  COUNT(*) AS loan_count
FROM loans_tbl
GROUP BY 
  CASE 
      WHEN loan_amount <= 1000 THEN '≤ 1K'
      WHEN loan_amount <= 5000 THEN '1K–5K'
      WHEN loan_amount <= 10000 THEN '5K–10K'
      WHEN loan_amount <= 15000 THEN '10K–15K'
      WHEN loan_amount <= 20000 THEN '15K–20K'
      WHEN loan_amount <= 25000 THEN '20K–25K'
      WHEN loan_amount <= 30000 THEN '25K–30K'
      ELSE '30K–35K'
  END,
  loan_status
ORDER BY loan_amount_band;


---does dti affect
SELECT 
  loan_status,
  ROUND(AVG(dti), 3) AS avg_dti,
  ROUND(MIN(dti), 3) AS min_dti,
  ROUND(MAX(dti), 3) AS max_dti
FROM loans_tbl
GROUP BY loan_status;






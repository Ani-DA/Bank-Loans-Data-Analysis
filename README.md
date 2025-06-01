# Bank Loans Data Analysis

## 1. Project Overview / Purpose

![bankloan banner](https://github.com/user-attachments/assets/38f703cc-e0b1-4f88-b2ce-761b1648949d)


This project analyzes a dataset of 38,576 loan records from a fictitious UK-based bank. It begins by providing an overview of key performance indicators (KPIs) such as the total number of loans, the number of good loans, ongoing loans, and the average Debt-to-Income (DTI) ratio.

The analysis then explores how various borrower and loan attributes influence loan outcomes, identifying patterns and key factors associated with good and bad loans.

Leveraging these insights, the project further evaluates ongoing loans to assess their risk level and categorize them accordingly, supporting early risk detection and informed decision-making.


## 2. Data Overview

![DATA](https://github.com/user-attachments/assets/936d58b3-1ece-494d-9044-87734729b892)


This dataset contains **38,576 loan records** from a fictitious UK-based bank and is designed for exploratory data analysis and risk profiling. Each record represents an individual loan and includes borrower characteristics, loan attributes, credit behavior, and status information.

**Key Columns**

* **`id`**: Unique identifier for each loan record
* **`application_type`**: Type of loan applicant (e.g., Individual)
* **`emp_length`**: Length of employment of the borrower
* **`emp_title`**: Name of the borrower (used instead of job title)
* **`grade` / `sub_grade`**: Credit grade assigned to the loan
* **`home_ownership`**: Indicates if the borrower owns, rents, or has a mortgage
* **`issue_date` / `last_payment_date` / `next_payment_date`**: Key loan timeline dates
* **`loan_status`**: Status of the loan (e.g., Fully Paid, Charged Off, Ongoing)
* **`purpose`**: Purpose of the loan (e.g., car, credit card, debt consolidation)
* **`term`**: Duration of the loan (36 or 60 months)
* **`verification_status`**: Indicates if income and employment were verified
* **`annual_income`**: Borrower’s annual income
* **`dti`**: Debt-to-Income ratio (%)
* **`installment`**: Monthly installment amount
* **`int_rate`**: Interest rate (%) applied to the loan
* **`loan_amount`**: Original amount of the loan
* **`total_acc`**: Total number of credit accounts held by the borrower
* **`total_payment`**: Total amount paid till date
* **`region`**: UK region where the borrower resides
* **`credit_rating`**: Assigned credit rating (A–E scale), with lower ratings associated with Charged Off loans

---

## 3. Analysis and Insights

This project is an exploratory analysis of loan performance data. Rather than beginning with predefined business questions, the objective was to uncover patterns and relationships between borrower attributes and loan outcomes. The analysis focuses on understanding the factors that contribute to loan success or failure.

**Key Questions Explored**

* What patterns emerge between credit ratings and loan performance?

* Are there specific borrower segments with higher default or charge-off rates?

* What proportion of loans with high Debt-to-Income (DTI) ratios result in delinquency or charge-offs?

* Does Annual income of the customers play any role in loans becoming delinquent or charged off?

* What percentage of loans with high Loan amount are becoming delinquent or charged off?    

**Initial KPI Highlights**
**`Total number of loans`**

**`Total loan disbursed amount`**

**`Average Debt-to-Income (DTI) ratio`**

Loan distribution across:

**`Fully Repaid (Good Loans)`**

**`Charged Off (Bad Loans)`**

**`Ongoing loans`**

Further analysis segmented the total loan amounts based on repayment performance—quantifying how much was successfully recovered and how much was lost due to charge-offs.

For clarity, loans were categorized as follows:

##### Good Loan: If loan_status is "Fully Paid"

#### Bad Loan: If loan_status is "Charged Off"

This classification helped in isolating patterns across various borrower and loan attributes to identify risk indicators.

The Analysis is mostly done in Power Bi DAX, a few calculations are done in SQL as well. Wherever applicable, SQl Code snippet is attached.


Let's start with the **KPIs**

![vz1](https://github.com/user-attachments/assets/f00ea210-4607-450d-9771-ac73f75a40c7)

![image](https://github.com/user-attachments/assets/cb57d2db-5ad5-4583-b428-1388b0482cab)

**Insights**

* Out of approximately 38.6K loan applications, around 32K loans (83.3%) have been fully repaid, indicating a healthy repayment rate—though there's still room for improvement.

* Charged-off loans, totaling 5,333 accounts, represent about 6.5% of all loans, with a cumulative loss of approximately £28 million.

* Ongoing loans account for roughly 3% of the portfolio, highlighting a relatively small active exposure that can still shift the overall risk profile.


![vz3](https://github.com/user-attachments/assets/937c8aab-e13a-405c-9ee4-9b84f5a9748a)

      
**Insights**

* While the number of Good Loans increased by 81% over the year, the number of Bad Loans (Charged Off) surged by 110%—a significantly higher growth rate. This sharp rise in bad loans highlights the urgent need for closer monitoring, root cause analysis, and risk mitigation strategies to prevent further deterioration in portfolio quality.




![vz4](https://github.com/user-attachments/assets/d6c7692f-7cac-428b-97f8-67a6560908ec)

**Insights**

* Segment Insight
Small Business loans show the highest risk, with 27% resulting in charge-offs, indicating elevated default potential in this segment. In contrast, Debt Consolidation loans not only have the highest repayment rate but also emerge as the most common loan purpose, reflecting both popularity and reliability in borrower performance.



![vz5](https://github.com/user-attachments/assets/959221af-165b-46f4-95b4-bbc466a702a4)


**Insights**

* Term-Based Loan Insight
Bad loans are 150% more prevalent in long-term loans compared to short-term loans, highlighting a significantly higher risk profile. However, long-term loans account for 67% fewer applications, suggesting borrowers prefer shorter repayment periods despite the trade-offs in monthly installment size.



![vz6](https://github.com/user-attachments/assets/c3f6b70f-06b9-45e4-959a-cd4aa008f706)

**Insights**

* Regional Loan Performance Insight
Wales leads in overall loan volume, indicating high borrower activity. However, 14% of its loans are classified as bad loans, slightly below the national high. The West Midlands shows the highest proportion of bad loans at 18%, signaling a potential regional credit risk that warrants further investigation and tighter lending criteria.


![vz7](https://github.com/user-attachments/assets/010c8f91-ec86-4708-be9c-763dae7d24b1)


**Insights**

* Verification Status & Loan Risk
Verified customers make up approximately 60% of the loan portfolio, reflecting strong verification practices. Interestingly, bad loans account for 15.5% of the verified group compared to 12.3% in the unverified segment. This counterintuitive trend suggests that verification alone doesn't guarantee lower risk—highlighting the need to enhance credit risk models beyond basic verification.



![vz8](https://github.com/user-attachments/assets/20887dcf-6103-453b-b894-a1e3bb9f0ff6)

**Insights**

* Income Band vs Loan Performance
The majority of borrowers fall within the £25K–£200K income range, with the £50K–£100K band showing the highest loan volume. Notably, higher income groups (above £200K) exhibit strong repayment behavior with minimal bad loans. However, despite contributing under 1% of total loans, the £500K–£1M segment shows a disproportionately higher bad loan rate, suggesting outlier behavior that may require closer review.



![vz9](https://github.com/user-attachments/assets/a3e2dd4d-10e2-48e5-91cb-3aa1170d01c7)

**Insights**

* Loan Amount vs Default Rate
Default rates show a clear upward trend with increasing loan amounts. While smaller loans (≤ £10K) have default rates around 12–13%, this rate steadily rises to 24% for loans in the £30K–£35K range. This suggests that higher loan amounts carry significantly higher credit risk and may warrant stricter approval criteria or closer monitoring.



![vz10](https://github.com/user-attachments/assets/c5e183f2-2d21-42dd-9492-2ed7d4c83317)


**Insights**

* Employment Tenure vs Loan Defaults
Bad loan rates remain relatively stable between 13–15% across most employment tenure groups. However, customers with 10+ years of employment show a slightly elevated default rate of 16%. Notably, this segment also represents the largest share of total loan takers, indicating that while long-term employment may correlate with higher borrowing activity, it does not necessarily reduce credit risk.



![vz11](https://github.com/user-attachments/assets/f154d160-477a-49ef-b65d-c0a9a5c38cfa)

**Insights**

* Debt-to-Income (DTI) Ratio vs Loan Default Rates
Bad loan rates generally increase with rising DTI ratios, indicating a correlation between higher debt burden and default risk. However, the highest DTI band (25–30%) breaks this trend, showing a lower default rate of 13%, compared to the 17% peak in the 20–25% band. This anomaly may be less impactful as this segment accounts for only 2% of total loans.



![vz12](https://github.com/user-attachments/assets/13458e8a-fd83-4aae-b51b-9e52018127df)


**Insights**

* Loan Default by Home Ownership Status
Customers who rent or have mortgages account for a higher volume of loans and exhibit default rates between 13–15%, which aligns with the overall average. However, customers with ambiguous or 'Other' home ownership status show a notably higher default rate of 18%, signaling potential risk factors or lack of documentation in this group.



![vz13](https://github.com/user-attachments/assets/4aa530cf-e276-4819-a2b1-59fe8b955fba)

**Insights**

* Credit Rating vs Loan Default Probability
Credit rating is a strong predictor of loan default risk. Borrowers with poor or subprime credit ratings exhibit a significantly higher percentage of bad loans, highlighting a clear inverse relationship between creditworthiness and repayment reliability. This emphasizes the importance of credit scoring in risk assessment and loan approval strategies.





## 3.Code Analysis


* To implement the Good Vs Bad loans analysis, the loan status values were grouped in Power BI, which made the analysis and visualization quite easy.

![ca1](https://github.com/user-attachments/assets/e0e77c90-6e15-41b8-9f09-8df2f6f74065)



* To calculate the loss amount for Charged Off loans, Total On-going loans, Total Repaid Loans DAX function `Calculate()` has been used.

![ca2](https://github.com/user-attachments/assets/57af7680-6b35-4fdd-b96e-282b4fab644f)


![ca5](https://github.com/user-attachments/assets/4f2c7f61-60e2-471f-ba61-e098203c9300)


![ca6](https://github.com/user-attachments/assets/709f190f-4dc9-44bb-b42f-341c08d42750)



* To accertain whether there is any relation betweeen loan amount and loans being charged off, loan amount bins were created in SQL and then used that result to visualise in Power BI.

![ca3](https://github.com/user-attachments/assets/64016383-c708-45f4-8028-7ddf95a609d4)


To establish relation between Debt to Income ration and loans being charged off, in SQl DTI bins are created and then visualisation is done in Power BI.

![ca4](https://github.com/user-attachments/assets/8fa4c5ab-525a-433a-9cb8-cc703d9c3e0f)






## 5. Reccomendation




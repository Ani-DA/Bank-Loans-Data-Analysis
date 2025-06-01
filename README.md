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

Q1: What patterns emerge between credit ratings and loan performance?

Q2: Are there specific borrower segments with higher default or charge-off rates?

Q3: What proportion of loans with high Debt-to-Income (DTI) ratios result in delinquency or charge-offs?

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

Term-Based Loan Insight
Bad loans are 150% more prevalent in long-term loans compared to short-term loans, highlighting a significantly higher risk profile. However, long-term loans account for 67% fewer applications, suggesting borrowers prefer shorter repayment periods despite the trade-offs in monthly installment size.



![vz6](https://github.com/user-attachments/assets/c3f6b70f-06b9-45e4-959a-cd4aa008f706)

**Insights**

Regional Loan Performance Insight
Wales leads in overall loan volume, indicating high borrower activity. However, 14% of its loans are classified as bad loans, slightly below the national high. The West Midlands shows the highest proportion of bad loans at 18%, signaling a potential regional credit risk that warrants further investigation and tighter lending criteria.


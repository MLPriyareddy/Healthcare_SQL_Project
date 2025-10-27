 1. Project Overview
Objective:
--Analyzed hospital clinical outcomes and insurance claim reimbursements to identify trends, improve patient outcomes, and optimize revenue.

Scope:
Clinical data: Patients, Doctors, Visits, Diagnoses, Procedures
Claims data: 837-style Claims, Claim Line Items, Payers
Tools: PostgreSQL, Tableau Desktop

2. Database Schema (ERD)
Tables:
Patients, Doctors, Visits, DiagnosisCodes, Procedures, Claims, ClaimLineItems, Payers
Relationships: One-to-many (Patients → Visits → Claims → ClaimLineItems)
Primary and Foreign Keys clearly marked

3. Business Questions

Which doctors have the highest patient recovery rates?
What is the average claim processing time per payer?
Which procedures generate the most revenue?
What is the denial rate by payer or diagnosis?
Which patients have the highest treatment costs?
What are the trends in monthly claims submitted and paid?
Which procedures are most frequently denied and why?

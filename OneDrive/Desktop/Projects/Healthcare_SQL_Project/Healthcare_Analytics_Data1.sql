INSERT INTO DiagnosisCodes (DiagnosisCode, Description) VALUES
('I10', 'Essential (primary) hypertension'),
('E11', 'Type 2 diabetes mellitus'),
('J20', 'Acute bronchitis'),
('M54', 'Dorsalgia (back pain)'),
('F32', 'Major depressive disorder, single episode'),
('N39', 'Urinary tract infection'),
('R51', 'Headache'),
('K21', 'Gastro-esophageal reflux disease'),
('L20', 'Atopic dermatitis'),
('J45', 'Asthma');

INSERT INTO Procedures (ProcedureCode, Description, BaseCost) VALUES
('99213', 'Office/outpatient visit est', 150.00),
('99214', 'Office/outpatient visit est mod', 200.00),
('93000', 'Electrocardiogram', 75.00),
('71020', 'Chest X-ray 2 views', 50.00),
('80053', 'Comprehensive metabolic panel', 100.00),
('90471', 'Immunization admin', 25.00),
('36415', 'Routine venipuncture', 20.00),
('94640', 'Inhalation treatment', 60.00),
('20550', 'Injection tendon/ligament', 80.00),
('99203', 'Office/outpatient new patient', 180.00);

INSERT INTO Payers (PayerName, InsuranceType) VALUES
('UnitedHealthcare', 'Commercial'),
('Blue Cross Blue Shield', 'Commercial'),
('Aetna', 'Commercial'),
('Cigna', 'Commercial'),
('Humana', 'Commercial'),
('Medicare', 'Government'),
('Medicaid', 'Government'),
('Kaiser Permanente', 'Commercial'),
('Tricare', 'Government'),
('Self-Pay', 'Out-of-Pocket');

INSERT INTO Patients (Name, Gender, Age, City) VALUES
('John Smith', 'Male', 45, 'Boise'),
('Mary Johnson', 'Female', 34, 'Meridian'),
('Robert Brown', 'Male', 52, 'Nampa'),
('Patricia Davis', 'Female', 29, 'Boise'),
('Michael Miller', 'Male', 60, 'Eagle'),
('Linda Wilson', 'Female', 40, 'Meridian'),
('William Moore', 'Male', 38, 'Boise'),
('Elizabeth Taylor', 'Female', 50, 'Nampa'),
('David Anderson', 'Male', 33, 'Eagle'),
('Jennifer Thomas', 'Female', 27, 'Boise'),
('Charles Jackson', 'Male', 47, 'Meridian'),
('Susan White', 'Female', 36, 'Boise'),
('Daniel Harris', 'Male', 42, 'Nampa'),
('Jessica Martin', 'Female', 31, 'Eagle'),
('Matthew Thompson', 'Male', 55, 'Boise'),
('Sarah Garcia', 'Female', 48, 'Meridian'),
('Anthony Martinez', 'Male', 39, 'Boise'),
('Karen Robinson', 'Female', 44, 'Nampa'),
('Brian Clark', 'Male', 50, 'Eagle'),
('Emily Rodriguez', 'Female', 28, 'Boise');

INSERT INTO Doctors (Name, Specialization, ExperienceYears) VALUES
('Dr. James Lee', 'Cardiology', 15),
('Dr. Susan Hall', 'Endocrinology', 10),
('Dr. Robert Allen', 'Pulmonology', 12),
('Dr. Linda Young', 'Orthopedics', 8),
('Dr. Michael King', 'Psychiatry', 20),
('Dr. Karen Wright', 'Gastroenterology', 14),
('Dr. William Scott', 'Dermatology', 7),
('Dr. Elizabeth Green', 'General Practice', 18),
('Dr. David Baker', 'Internal Medicine', 16),
('Dr. Patricia Adams', 'Pediatrics', 9);

INSERT INTO Visits (PatientID, DoctorID, VisitDate, DiagnosisCode, TreatmentCost, Outcome) VALUES
(1, 1, '2025-01-05', 'I10', 200.00, 'Recovered'),
(2, 2, '2025-01-08', 'E11', 300.00, 'Ongoing'),
(3, 3, '2025-01-10', 'J20', 150.00, 'Recovered'),
(4, 4, '2025-01-12', 'M54', 180.00, 'Ongoing'),
(5, 5, '2025-01-15', 'F32', 250.00, 'Referred'),
(6, 6, '2025-01-18', 'K21', 220.00, 'Recovered'),
(7, 7, '2025-01-20', 'L20', 200.00, 'Ongoing'),
(8, 8, '2025-01-22', 'J45', 180.00, 'Recovered'),
(9, 9, '2025-01-25', 'N39', 160.00, 'Recovered'),
(10, 10, '2025-01-28', 'R51', 140.00, 'Recovered'),
(11, 1, '2025-02-02', 'I10', 210.00, 'Ongoing'),
(12, 2, '2025-02-05', 'E11', 310.00, 'Recovered'),
(13, 3, '2025-02-08', 'J20', 155.00, 'Recovered'),
(14, 4, '2025-02-10', 'M54', 190.00, 'Ongoing'),
(15, 5, '2025-02-12', 'F32', 260.00, 'Referred'),
(16, 6, '2025-02-15', 'K21', 225.00, 'Recovered'),
(17, 7, '2025-02-18', 'L20', 210.00, 'Ongoing'),
(18, 8, '2025-02-20', 'J45', 185.00, 'Recovered'),
(19, 9, '2025-02-22', 'N39', 165.00, 'Recovered'),
(20, 10, '2025-02-25', 'R51', 145.00, 'Recovered');

INSERT INTO Claims (VisitID, PayerID, ClaimStatus, ClaimedAmount, PaidAmount, SubmissionDate, AdjudicationDate) VALUES
(1, 1, 'Paid', 200.00, 200.00, '2025-01-06', '2025-01-10'),
(2, 2, 'Denied', 300.00, 0.00, '2025-01-09', '2025-01-15'),
(3, 3, 'Paid', 150.00, 150.00, '2025-01-11', '2025-01-14'),
(4, 4, 'Pending', 180.00, NULL, '2025-01-13', NULL),
(5, 5, 'Paid', 250.00, 250.00, '2025-01-16', '2025-01-20'),
(6, 6, 'Paid', 220.00, 220.00, '2025-01-19', '2025-01-23'),
(7, 7, 'Denied', 200.00, 0.00, '2025-01-21', '2025-01-25'),
(8, 8, 'Paid', 180.00, 180.00, '2025-01-23', '2025-01-27'),
(9, 9, 'Paid', 160.00, 160.00, '2025-01-26', '2025-01-29'),
(10, 10, 'Paid', 140.00, 140.00, '2025-01-29', '2025-02-02');
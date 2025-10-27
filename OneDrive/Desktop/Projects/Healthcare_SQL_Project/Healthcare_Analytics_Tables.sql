CREATE TABLE Patients (
    PatientID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    City VARCHAR(50)
);

-- Doctors
CREATE TABLE Doctors (
    DoctorID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Specialization VARCHAR(100),
    ExperienceYears INT
);

-- Diagnosis Codes (ICD-10)
CREATE TABLE DiagnosisCodes (
    DiagnosisCode VARCHAR(10) PRIMARY KEY,
    Description VARCHAR(255)
);

-- Procedures (CPT / HCPCS)
CREATE TABLE Procedures (
    ProcedureCode VARCHAR(10) PRIMARY KEY,
    Description VARCHAR(255),
    BaseCost NUMERIC(10,2)
);

-- Visits
CREATE TABLE Visits (
    VisitID SERIAL PRIMARY KEY,
    PatientID INT REFERENCES Patients(PatientID),
    DoctorID INT REFERENCES Doctors(DoctorID),
    VisitDate DATE,
    DiagnosisCode VARCHAR(10) REFERENCES DiagnosisCodes(DiagnosisCode),
    TreatmentCost NUMERIC(10,2),
    Outcome VARCHAR(20)
);

-- Payers
CREATE TABLE Payers (
    PayerID SERIAL PRIMARY KEY,
    PayerName VARCHAR(100),
    InsuranceType VARCHAR(50)
);

-- Claims
CREATE TABLE Claims (
    ClaimID SERIAL PRIMARY KEY,
    VisitID INT REFERENCES Visits(VisitID),
    PayerID INT REFERENCES Payers(PayerID),
    ClaimStatus VARCHAR(20), -- Submitted, Denied, Paid, Pending
    ClaimedAmount NUMERIC(10,2),
    PaidAmount NUMERIC(10,2),
    SubmissionDate DATE,
    AdjudicationDate DATE
);

-- Claim Line Items
CREATE TABLE ClaimLineItems (
    LineItemID SERIAL PRIMARY KEY,
    ClaimID INT REFERENCES Claims(ClaimID),
    ProcedureCode VARCHAR(10) REFERENCES Procedures(ProcedureCode),
    LineItemCost NUMERIC(10,2),
    DenialReason VARCHAR(255)
);
-- Count of patients by gender

select * from patients;

SELECT Gender, COUNT(*) AS PatientCount
FROM Patients
GROUP BY Gender;

--Average patient age by city

SELECT City, Round(AVG(Age)) AS Avg_Age
FROM Patients
GROUP BY City;

--Most common diagnosis

Select * from DiagnosisCodes;

Select * from Visits;

Select DiagnosisCode, Count(*) as Common_Diagnosis 
From Visits 
Group By DiagnosisCode 
Having count(*)>1;

SELECT d.Description, COUNT(v.VisitID) AS CountVisits
FROM Visits v
JOIN DiagnosisCodes d ON v.DiagnosisCode = d.DiagnosisCode
GROUP BY d.Description
ORDER BY CountVisits DESC
LIMIT 5;

--Patient revisit count (more than 1 visit)

SELECT PatientID, COUNT(*) AS VisitCount
FROM Visits
GROUP BY PatientID
HAVING COUNT(*) > 1;

--Doctor success rate (Recovered visits / Total visits)

SELECT doc.Name, 
       COUNT(*) FILTER (WHERE v.Outcome = 'Recovered')::DECIMAL / COUNT(*) * 100 AS SuccessRate
FROM Visits v
JOIN Doctors doc ON v.DoctorID = doc.DoctorID
GROUP BY doc.Name
ORDER BY SuccessRate DESC;
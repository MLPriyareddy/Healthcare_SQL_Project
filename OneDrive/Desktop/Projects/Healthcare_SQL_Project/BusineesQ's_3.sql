--Doctor revenue generated

SELECT doc.Name,
       SUM(c.PaidAmount) AS TotalRevenue
FROM Claims c
JOIN Visits v ON c.VisitID = v.VisitID
JOIN Doctors doc ON v.DoctorID = doc.DoctorID
GROUP BY doc.Name
ORDER BY TotalRevenue DESC;

--Denial rate by diagnosis

SELECT d.Description,
       COUNT(c.ClaimID) FILTER (WHERE c.ClaimStatus='Denied')::DECIMAL / COUNT(c.ClaimID) * 100 AS DenialRate
FROM Claims c
JOIN Visits v ON c.VisitID = v.VisitID
JOIN DiagnosisCodes d ON v.DiagnosisCode = d.DiagnosisCode
GROUP BY d.Description
ORDER BY DenialRate DESC;

--Monthly claim trends

SELECT DATE_TRUNC('month', SubmissionDate) AS Month,
       COUNT(*) AS TotalClaims,
       SUM(PaidAmount) AS TotalPaid
FROM Claims
GROUP BY Month
ORDER BY Month;


--Top patients by total treatment cost

SELECT p.Name, SUM(v.TreatmentCost) AS TotalCost
FROM Visits v
JOIN Patients p ON v.PatientID = p.PatientID
GROUP BY p.Name
ORDER BY TotalCost DESC
LIMIT 10;


--Most frequent procedure per doctor

SELECT doc.Name, pr.Description, COUNT(*) AS ProcedureCount
FROM ClaimLineItems cli
JOIN Claims c ON cli.ClaimID = c.ClaimID
JOIN Visits v ON c.VisitID = v.VisitID
JOIN Doctors doc ON v.DoctorID = doc.DoctorID
JOIN Procedures pr ON cli.ProcedureCode = pr.ProcedureCode
GROUP BY doc.Name, pr.Description
ORDER BY doc.Name, ProcedureCount DESC;
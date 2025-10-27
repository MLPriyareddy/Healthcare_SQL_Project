--Total claimed and paid amounts by payer

SELECT p.PayerName,
       SUM(c.ClaimedAmount) AS TotalClaimed,
       SUM(c.PaidAmount) AS TotalPaid,
       SUM(c.ClaimedAmount) - SUM(c.PaidAmount) AS RevenueLost
FROM Claims c
JOIN Payers p ON c.PayerID = p.PayerID
GROUP BY p.PayerName
ORDER BY RevenueLost DESC;

--Claim denial rate by payer
SELECT p.PayerName,
       COUNT(*) FILTER (WHERE c.ClaimStatus='Denied')::DECIMAL / COUNT(*) * 100 AS DenialRate
FROM Claims c
JOIN Payers p ON c.PayerID = p.PayerID
GROUP BY p.PayerName;

--Average claim processing time (days)

SELECT p.PayerName,
       AVG(c.AdjudicationDate - c.SubmissionDate) AS AvgProcessingDays
FROM Claims c
JOIN Payers p ON c.PayerID = p.PayerID
WHERE c.AdjudicationDate IS NOT NULL
GROUP BY p.PayerName;

--Top 10 procedures by revenue

SELECT pr.Description, SUM(cli.LineItemCost) AS TotalRevenue
FROM ClaimLineItems cli
JOIN Procedures pr ON cli.ProcedureCode = pr.ProcedureCode
GROUP BY pr.Description
ORDER BY TotalRevenue DESC
LIMIT 10;

--Claims aging

SELECT 
    CASE 
        WHEN CURRENT_DATE - c.SubmissionDate <= 30 THEN '0-30 days'
        WHEN CURRENT_DATE - c.SubmissionDate <= 60 THEN '31-60 days'
        ELSE '61+ days'
    END AS AgingBucket,
    COUNT(*) AS ClaimsCount
FROM Claims c
WHERE c.ClaimStatus <> 'Paid'
GROUP BY AgingBucket;


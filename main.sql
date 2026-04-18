WITH zeros AS (
    SELECT 0 AS Num
    FROM (SELECT 1 AS x UNION ALL SELECT 1 UNION ALL SELECT 1 
          UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 
          UNION ALL SELECT 1) t
),
all_data AS (
    SELECT Num FROM Shipments
    UNION ALL
    SELECT Num FROM zeros
),
ordered AS (
    SELECT Num,
           ROW_NUMBER() OVER (ORDER BY Num) AS rn,
           COUNT(*) OVER () AS total
    FROM all_data
)
SELECT AVG(1.0 * Num) AS Median
FROM ordered
WHERE rn IN (total/2, total/2 + 1);

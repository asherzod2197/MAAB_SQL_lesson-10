-- Task 1

WITH cte AS (
    SELECT EmployeeID, ManagerID, JobTitle, 0 AS Depth
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

    SELECT e.EmployeeID, e.ManagerID, e.JobTitle, c.Depth + 1
    FROM Employees e
    JOIN cte c
    ON e.ManagerID = c.EmployeeID
)
SELECT * FROM cte
ORDER BY EmployeeID;


-- Task 2

WITH factorial AS (
    SELECT 1 AS Num, CAST(1 AS BIGINT) AS Factorial
    UNION ALL
    SELECT Num + 1,
           Factorial * (Num + 1)
    FROM factorial
    WHERE Num < 10
)
SELECT * FROM factorial
OPTION (MAXRECURSION 0);


-- Task 3

WITH fib AS (
    SELECT 1 AS n, CAST(1 AS BIGINT) AS Fibonacci_Number, 0 AS prev
    UNION ALL
    SELECT 2, 1, 1
    UNION ALL
    SELECT n + 1,
           Fibonacci_Number + prev,
           Fibonacci_Number
    FROM fib
    WHERE n < 10
)
SELECT n, Fibonacci_Number
FROM fib
WHERE n <= 10
ORDER BY n
OPTION (MAXRECURSION 0);

--How many transactions were made by each user?

WITH UserTransactionCounts AS (
    SELECT SenderUserID, COUNT(*) AS TransactionCount
    FROM Transactions
    GROUP BY SenderUserID
)
SELECT u.FirstName, u.LastName, COALESCE(TransactionCount, 0) AS TransactionCount
FROM Users u
LEFT JOIN UserTransactionCounts ON u.UserID = UserTransactionCounts.SenderUserID;

-- average transaction amount for each user?
WITH UserAverageTransactionAmount AS (
    SELECT SenderUserID, AVG(Amount) AS AvgTransactionAmount
    FROM Transactions
    GROUP BY SenderUserID
)
SELECT Users.FirstName, Users.LastName, round(COALESCE(AvgTransactionAmount, 0),2) AS AvgTransactionAmount
FROM Users
LEFT JOIN UserAverageTransactionAmount ON Users.UserID = UserAverageTransactionAmount.SenderUserID;

--What are the top 5 users with the highest transaction amounts?
SELECT FirstName, LastName, TotalAmount
FROM (
    SELECT SenderUserID, SUM(Amount) AS TotalAmount,
           ROW_NUMBER() OVER (ORDER BY SUM(Amount) DESC) AS RowNum
    FROM Transactions
    GROUP BY SenderUserID
) AS  ku
JOIN Users u
ON u.UserID = ku.SenderUserID
WHERE RowNum <= 5;

--what is the cumulative sum of transaction amounts over time?
SELECT FirstName, LastName, Amount, 
       SUM(Amount) OVER (PARTITION BY SenderUserID ORDER BY Timestamp) AS CumulativeSum
FROM Transactions
JOIN Users 
ON Transactions.SenderUserID = Users.UserID
ORDER BY SenderUserID, Timestamp;

--Which users have made transactions above the average transaction amount?
WITH UserAverageTransactionAmount AS (
    SELECT AVG(Amount) AS AvgTransactionAmount
    FROM Transactions
)
SELECT DISTINCT Users.FirstName, Users.LastName
FROM Users
JOIN Transactions ON Users.UserID = Transactions.SenderUserID
CROSS JOIN UserAverageTransactionAmount
WHERE Transactions.Amount > UserAverageTransactionAmount.AvgTransactionAmount;





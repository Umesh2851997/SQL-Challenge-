select * from users

--find the first name and last name of all users?
SELECT FirstName, LastName FROM Users;

--find the first name and last name of all users?
SELECT Email FROM Users WHERE LastName = 'Smith';

--retrieve the balance of the wallet associated with UserID 1?
SELECT Balance FROM Wallets WHERE UserID = 1;

-- fetch all businesses of type 'Retail'?
SELECT * FROM Businesses WHERE BusinessType = 'Retail';

--all transactions where the amount is greater than $1000?
SELECT * FROM Transactions WHERE Amount < 500;

--get the names of users who have unread notifications.
SELECT u.FirstName, u.LastName 
FROM Users u 
JOIN Notifications n ON u.UserID = n.UserID 
WHERE n.Status = 'unread';

-- find all the businesses located at 'Shopping City, USA'?
SELECT * 
FROM Businesses 
WHERE BusinessAddress 
LIKE '%Shopping City';

--get the details of the QR codes that have expired.
SELECT * FROM QRCodes WHERE ExpirationDate < NOW();

--find all users who have made a transaction?
SELECT DISTINCT u.UserID, u.FirstName, u.LastName 
FROM Users u 
JOIN Transactions t ON u.UserID = t.SenderUserID OR u.UserID = t.ReceiverUserID;


-- find all unread notifications sent in the last 7 days.
SELECT * FROM Notifications 
WHERE Status = 'unread' 
AND Timestamp >= NOW() - INTERVAL '7 days';



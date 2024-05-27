
drop table if exists Users
CREATE TABLE Users (
    UserID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(20) UNIQUE,
    PasswordHash VARCHAR(255),
    Address VARCHAR(255),
    KYCInfo TEXT
);

CREATE TABLE Businesses (
    BusinessID SERIAL PRIMARY KEY,
    BusinessName VARCHAR(100),
    BusinessType VARCHAR(50),
    BusinessAddress VARCHAR(255),
    BusinessRegistrationInfo TEXT,
    BusinessBankAccount VARCHAR(50)
);

CREATE TABLE Wallets (
    WalletID SERIAL PRIMARY KEY,
    UserID INTEGER REFERENCES Users(UserID),
    Balance NUMERIC(15, 2)
);

CREATE TABLE Transactions (
    TransactionID SERIAL PRIMARY KEY,
    SenderUserID INTEGER REFERENCES Users(UserID),
    ReceiverUserID INTEGER REFERENCES Users(UserID),
    Amount NUMERIC(15, 2),
    Timestamp TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    TransactionType VARCHAR(50),
    Status VARCHAR(50)
);

CREATE TABLE QRCodes (
    QRCodeID SERIAL PRIMARY KEY,
    UserID INTEGER REFERENCES Users(UserID),
    QRCodeData TEXT,
    Timestamp TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    ExpirationDate TIMESTAMPTZ
);

CREATE TABLE Merchants (
    MerchantID SERIAL PRIMARY KEY,
    MerchantName VARCHAR(100),
    MerchantLocation VARCHAR(255),
    MerchantQRCodeID INTEGER REFERENCES QRCodes(QRCodeID)
);

CREATE TABLE Notifications (
    NotificationID SERIAL PRIMARY KEY,
    UserID INTEGER REFERENCES Users(UserID),
    Message TEXT,
    Timestamp TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(50)
);

CREATE TABLE UserSettings (
    UserID INTEGER PRIMARY KEY REFERENCES Users(UserID),
    NotificationPreferences VARCHAR(255),
    PrivacySettings VARCHAR(255)
);

CREATE TABLE AuditLogs (
    LogID SERIAL PRIMARY KEY,
    UserID INTEGER REFERENCES Users(UserID),
    Action VARCHAR(256),
    Timestamp TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE RegulatoryComplianceData (
    ComplianceID SERIAL PRIMARY KEY,
    UserID INTEGER REFERENCES Users(UserID),
    ComplianceInfo TEXT
);
CREATE TABLE UserActivityLogs (
    LogID SERIAL PRIMARY KEY,
    UserID INTEGER REFERENCES Users(UserID),
    ActivityInfo TEXT,
    Timestamp TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Users (FirstName, LastName, Email, PhoneNumber, PasswordHash, Address, KYCInfo) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', 'hashed_password_1', '123 Main St, Anytown, USA', 'KYC info for John Doe'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', 'hashed_password_2', '456 Oak St, Anytown, USA', 'KYC info for Jane Smith'),
('Alice', 'Johnson', 'alice.johnson@example.com', '2345678901', 'hashed_password_3', '789 Pine St, Anytown, USA', 'KYC info for Alice Johnson'),
('Bob', 'Brown', 'bob.brown@example.com', '3456789012', 'hashed_password_4', '101 Maple St, Anytown, USA', 'KYC info for Bob Brown'),
('Carol', 'Davis', 'carol.davis@example.com', '4567890123', 'hashed_password_5', '202 Elm St, Anytown, USA', 'KYC info for Carol Davis'),
('David', 'Miller', 'david.miller@example.com', '5678901234', 'hashed_password_6', '303 Birch St, Anytown, USA', 'KYC info for David Miller'),
('Eve', 'Wilson', 'eve.wilson@example.com', '6789012345', 'hashed_password_7', '404 Cedar St, Anytown, USA', 'KYC info for Eve Wilson'),
('Frank', 'Moore', 'frank.moore@example.com', '7890123456', 'hashed_password_8', '505 Spruce St, Anytown, USA', 'KYC info for Frank Moore'),
('Grace', 'Taylor', 'grace.taylor@example.com', '8901234567', 'hashed_password_9', '606 Willow St, Anytown, USA', 'KYC info for Grace Taylor'),
('Henry', 'Anderson', 'henry.anderson@example.com', '9012345678', 'hashed_password_10', '707 Fir St, Anytown, USA', 'KYC info for Henry Anderson');

INSERT INTO Businesses (BusinessName, BusinessType, BusinessAddress, BusinessRegistrationInfo, BusinessBankAccount) VALUES
('Tech Innovators Inc.', 'Technology', '789 Tech Park, Silicon Valley, USA', 'Registration info for Tech Innovators', 'BankAccount12345'),
('Green Earth Goods', 'Retail', '101 Green St, Eco City, USA', 'Registration info for Green Earth Goods', 'BankAccount67890'),
('Healthy Foods Co.', 'Food & Beverage', '202 Fresh St, Healthy Town, USA', 'Registration info for Healthy Foods Co.', 'BankAccount11111'),
('Fashion Hub', 'Fashion', '303 Style Ave, Fashion City, USA', 'Registration info for Fashion Hub', 'BankAccount22222'),
('Auto World', 'Automotive', '404 Drive Rd, Motor City, USA', 'Registration info for Auto World', 'BankAccount33333'),
('Home Comforts', 'Home & Living', '505 Cozy St, Comfort Town, USA', 'Registration info for Home Comforts', 'BankAccount44444'),
('Gadget Galaxy', 'Electronics', '606 Tech Blvd, Gadget City, USA', 'Registration info for Gadget Galaxy', 'BankAccount55555'),
('Adventure Gear', 'Outdoors', '707 Trek St, Adventure Town, USA', 'Registration info for Adventure Gear', 'BankAccount66666'),
('Book Haven', 'Books', '808 Read St, Book City, USA', 'Registration info for Book Haven', 'BankAccount77777'),
('Fitness Pro', 'Fitness', '909 Gym Rd, Fitness City, USA', 'Registration info for Fitness Pro', 'BankAccount88888');

INSERT INTO Wallets (UserID, Balance) VALUES
(1, 1000.00),
(2, 500.00),
(3, 750.00),
(4, 1250.00),
(5, 300.00),
(6, 600.00),
(7, 900.00),
(8, 400.00),
(9, 1100.00),
(10, 1300.00);

INSERT INTO Transactions (SenderUserID, ReceiverUserID, Amount, TransactionType, Status) VALUES
(1, 2, 100.00, 'payment', 'completed'),
(2, 1, 50.00, 'payment', 'completed'),
(3, 4, 75.00, 'payment', 'completed'),
(4, 3, 125.00, 'payment', 'completed'),
(5, 6, 30.00, 'payment', 'completed'),
(6, 5, 60.00, 'payment', 'completed'),
(7, 8, 90.00, 'payment', 'completed'),
(8, 7, 40.00, 'payment', 'completed'),
(9, 10, 110.00, 'payment', 'completed'),
(10, 9, 130.00, 'payment', 'completed');

INSERT INTO QRCodes (UserID, QRCodeData, ExpirationDate) VALUES
(1, 'QRCodeData1', '2024-12-31 23:59:59'),
(2, 'QRCodeData2', '2024-12-31 23:59:59'),
(3, 'QRCodeData3', '2024-12-31 23:59:59'),
(4, 'QRCodeData4', '2024-12-31 23:59:59'),
(5, 'QRCodeData5', '2024-12-31 23:59:59'),
(6, 'QRCodeData6', '2024-12-31 23:59:59'),
(7, 'QRCodeData7', '2024-12-31 23:59:59'),
(8, 'QRCodeData8', '2024-12-31 23:59:59'),
(9, 'QRCodeData9', '2024-12-31 23:59:59'),
(10, 'QRCodeData10', '2024-12-31 23:59:59');

INSERT INTO Merchants (MerchantName, MerchantLocation, MerchantQRCodeID) VALUES
('Best Buy', '123 Mall Rd, Shopping City, USA', 1),
('Walmart', '456 Market St, Shopping City, USA', 2),
('Target', '789 Shop St, Shopping City, USA', 3),
('Home Depot', '101 Builder Rd, Shopping City, USA', 4),
('Costco', '202 Wholesale St, Shopping City, USA', 5),
('Kroger', '303 Grocery Rd, Shopping City, USA', 6),
('Amazon', '404 Online St, Shopping City, USA', 7),
('eBay', '505 Auction Rd, Shopping City, USA', 8),
('Alibaba', '606 Trade Rd, Shopping City, USA', 9),
('Macys', '707 Fashion Rd, Shopping City, USA', 10);

INSERT INTO Notifications (UserID, Message, Status) VALUES
(1, 'Your transaction has been completed.', 'read'),
(2, 'You have received a new payment.', 'unread'),
(3, 'Your account balance is low.', 'read'),
(4, 'New login from unrecognized device.', 'unread'),
(5, 'Password changed successfully.', 'read'),
(6, 'KYC verification completed.', 'unread'),
(7, 'New offer available in your account.', 'read'),
(8, 'Transaction failed due to insufficient funds.', 'unread'),
(9, 'Your account details have been updated.', 'read'),
(10, 'Security alert: multiple failed login attempts.', 'unread');

 INSERT INTO UserSettings (UserID, NotificationPreferences, PrivacySettings) VALUES
(1, 'email, sms', 'public'),
(2, 'email', 'private'),
(3, 'sms', 'public'),
(4, 'email, sms', 'private'),
(5, 'email', 'public'),
(6, 'sms', 'private'),
(7, 'email, sms', 'public'),
(8, 'email', 'private'),
(9, 'sms', 'public'),
(10, 'email, sms', 'private');

 INSERT INTO AuditLogs (UserID, Action) VALUES
(1, 'User logged in.'),
(2, 'User logged out.'),
(3, 'Password changed.'),
(4, 'Profile updated.'),
(5, 'Transaction made.'),
(6, 'KYC info updated.'),
(7, 'User registered.'),
(8, 'Email changed.'),
(9, 'Phone number changed.'),
(10, 'Address updated.');

 INSERT INTO RegulatoryComplianceData (UserID, ComplianceInfo) VALUES
(1, 'Compliance info for user 1.'),
(2, 'Compliance info for user 2.'),
(3, 'Compliance info for user 3.'),
(4, 'Compliance info for user 4.'),
(5, 'Compliance info for user 5.'),
(6, 'Compliance info for user 6.'),
(7, 'Compliance info for user 7.'),
(8, 'Compliance info for user 8.'),
(9, 'Compliance info for user 9.'),
(10, 'Compliance info for user 10.');

 INSERT INTO UserActivityLogs (UserID, ActivityInfo) VALUES
(1, 'User logged in.'),
(2, 'User viewed profile.'),
(3, 'User updated settings.'),
(4, 'User made a transaction.'),
(5, 'User logged out.'),
(6, 'User changed password.'),
(7, 'User verified email.'),
(8, 'User updated KYC info.'),
(9, 'User viewed dashboard.'),
(10, 'User added a new payment method.');

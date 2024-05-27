# SQL-Challenge-

### Database Schema Description
#####  This repository contains the SQL schema for a database that manages users, businesses, transactions, notifications, and other related data. Below is a description of each table and its columns:

### Business Problem:
##### Transaction Monitoring and User Engagement Optimization

### Description:
##### The business operates a digital payment platform where users can make transactions, receive notifications, and manage their settings. With the increasing volume of transactions and user interactions, the company faces several challenges:

###### Fraud Detection: There's a need to identify and mitigate fraudulent activities such as unauthorized transactions or account breaches.
###### User Engagement: Enhancing user engagement by delivering personalized notifications and optimizing user settings to match user preferences.
###### Compliance Management: Ensuring regulatory compliance by maintaining accurate audit logs, monitoring KYC verification status, and managing regulatory compliance data for users.
###### Business Insights: Extracting actionable insights from transaction data to understand user behavior, popular merchants, and transaction trends.

### Users Table
###### UserID: Unique identifier for each user (auto-incremented).
###### FirstName: First name of the user.
###### LastName: Last name of the user.
###### Email: Email address of the user (unique).
###### PhoneNumber: Phone number of the user (unique).
###### PasswordHash: Hashed password of the user.
###### Address: Address of the user.
###### KYCInfo: Information related to Know Your Customer (KYC) verification.
### Businesses Table
###### BusinessID: Unique identifier for each business (auto-incremented).
###### BusinessName: Name of the business.
###### BusinessType: Type or category of the business.
###### BusinessAddress: Address of the business.
###### BusinessRegistrationInfo: Information related to the business registration.
###### BusinessBankAccount: Bank account information of the business.
### Wallets Table
###### WalletID: Unique identifier for each wallet (auto-incremented).
###### UserID: Foreign key referencing the UserID in the Users table.
###### Balance: Current balance in the wallet.
### Transactions Table
###### TransactionID: Unique identifier for each transaction (auto-incremented).
###### SenderUserID: Foreign key referencing the UserID of the sender.
###### ReceiverUserID: Foreign key referencing the UserID of the receiver.
###### Amount: Amount of the transaction.
###### Timestamp: Timestamp of the transaction.
###### TransactionType: Type of the transaction.
###### Status: Status of the transaction.
### QRCodes Table
###### QRCodeID: Unique identifier for each QR code (auto-incremented).
###### UserID: Foreign key referencing the UserID of the user.
###### QRCodeData: Data encoded in the QR code.
###### Timestamp: Timestamp of the creation of the QR code.
###### ExpirationDate: Expiration date of the QR code.
### Merchants Table
###### MerchantID: Unique identifier for each merchant (auto-incremented).
###### MerchantName: Name of the merchant.
###### MerchantLocation: Location of the merchant.
###### MerchantQRCodeID: Foreign key referencing the QRCodeID in the QRCodes table.
###### Notifications Table
###### NotificationID: Unique identifier for each notification (auto-incremented).
###### UserID: Foreign key referencing the UserID of the user.
###### Message: Content of the notification.
###### Timestamp: Timestamp of the notification.
###### Status: Status of the notification.
### UserSettings Table
###### UserID: Primary key and foreign key referencing the UserID in the Users table.
######NotificationPreferences: Preferences for receiving notifications.
###### PrivacySettings: Privacy settings of the user.
### AuditLogs Table
###### LogID: Unique identifier for each audit log (auto-incremented).
###### UserID: Foreign key referencing the UserID of the user.
###### Action: Action performed by the user.
###### Timestamp: Timestamp of the action.
### RegulatoryComplianceData Table
###### ComplianceID: Unique identifier for each compliance data (auto-incremented).
###### UserID: Foreign key referencing the UserID of the user.
###### ComplianceInfo: Information related to regulatory compliance.
### UserActivityLogs Table
###### LogID: Unique identifier for each user activity log (auto-incremented).
###### UserID: Foreign key referencing the UserID of the user.
###### ActivityInfo: Information about the user activity.
###### Timestamp: Timestamp of the user activity.

### Conclusion:
###### By addressing the challenges of transaction monitoring, user engagement optimization, compliance management, and deriving actionable insights, the business can enhance the overall user experience, mitigate risks, and drive business growth in the competitive digital payment industry. Leveraging the data available in the database, the company can make informed decisions and adapt to evolving market dynamics effectively.

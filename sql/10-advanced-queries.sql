USE banking_transactions;

-- 80. Total Accounts
SELECT COUNT(account_id) FROM accounts;

-- 81. Calculate total accounts by account type
SELECT account_type, 
	COUNT(*) as 'total_accounts',
    ROUND(COUNT(*)* 100 / (SELECT COUNT(*) FROM accounts), 2) as percentage
FROM accounts
GROUP BY account_type
ORDER BY total_accounts DESC;

-- 82. Calculate total accounts whose account is Active
SELECT DISTINCT status, COUNT(*) as total_accounts FROM accounts
GROUP BY status
ORDER BY total_accounts DESC;

-- 83. To calculate Total Accounts per Year
SELECT DISTINCT year, COUNT(*) as total_accounts FROM accounts 
GROUP BY year
ORDER BY total_accounts DESC;

-- 84. Average Account balance
SELECT DISTINCT status, COUNT(*) AS accounts, 
	ROUND(AVG(balance), 2) AS average_balance FROM accounts
GROUP BY status;

-- 85. Find customers who total balance top 10%
SELECT customer_id, 
	SUM(balance) AS total_balance,
    COUNT(account_id) AS total_accounts
FROM accounts
GROUP BY customer_id
ORDER BY total_balance DESC
LIMIT 10;

-- 86. Find who are the bank's top 10 customers by balance
SELECT c.customer_id, 
	c.name,
	COUNT(a.account_id) AS total_accounts,
    SUM(a.balance) AS balance
FROM accounts a
JOIN customers c
	ON a.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY balance DESC
LIMIT 10;

-- 87. Who are the top customers by transaction valume
WITH customer_transactions AS (
	SELECT c.customer_id, c.name,
		COUNT(t.transaction_id) AS total_transactions,
        FORMAT(SUM(t.amount), 2) AS transaction_valume
	FROM transactions t
    JOIN accounts a
		ON t.account_id = a.account_id
	JOIN customers c
		ON a.customer_id = c.customer_id
	GROUP BY c.customer_id, c.name
)
SELECT * FROM customer_transactions
ORDER BY transaction_valume DESC
LIMIT 10;

-- 88. Find Top 3 Customers by total Revennue
SELECT c.customer_id,
	c.name, 
    SUM(t.amount) AS revenue
FROM customers c
JOIN accounts a
	ON c.customer_id = a.customer_id
JOIN transactions t
	ON a.account_id = t.account_id
GROUP BY c.customer_id, c.name
ORDER BY revenue DESC
LIMIT 3;

-- 89. Which customer gender has highest Annual Income
SELECT DISTINCT gender, 
	FORMAT(SUM(annual_income), 2) AS total_annual_income FROM customers
GROUP BY gender
ORDER BY total_annual_income DESC;

-- 90. Find customers who transactions are more than 10
SELECT c.customer_id,
	c.name,
    t.txn_date,
    COUNT(t.transaction_id) AS total_transactions
FROM customers c
JOIN accounts a
	ON a.customer_id = c.customer_id
JOIN transactions t
	ON a.account_id = t.account_id
GROUP BY c.customer_id, c.name, t.txn_date
HAVING COUNT(t.transaction_id) > 10
ORDER BY total_transactions DESC
LIMIT 10;

-- 91. Find highest Balance from Accounts
SELECT balance FROM (
	SELECT balance, DENSE_RANK() OVER(ORDER BY balance DESC) AS rnk
    FROM accounts
) t
WHERE rnk = 1;

-- 92.  How many Customers whose gender is Males and Females in each city
SELECT city,
	SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) AS male_count,
    SUM(CASE WHEN gender = "Female" THEN 1 ELSE 0 END) AS female_count
FROM customers
GROUP BY city;

-- 93. Find the Top 5 Branches where the total customer account balance is more than 10 lacks.
SELECT a.branch_id,
	b.branch_name,
	COUNT(a.customer_id) AS total_customers,
    FORMAT(SUM(a.balance), 2) AS total_balance
FROM accounts a
JOIN branches b
	ON a.branch_id = b.branch_id
JOIN customers c
	ON a.customer_id = c.customer_id
GROUP BY a.branch_id, b.branch_name
HAVING SUM(a.balance) > 1000000
ORDER BY total_balance DESC
LIMIT 5;

-- 94. How many customers have performed at least one tranasaction during the last 3 months.
SELECT COUNT(a.customer_id) AS active_accounts
	FROM transactions t
JOIN accounts a
	ON a.account_id = t.account_id
WHERE t.txn_date >= DATE_SUB(CURDATE	(), INTERVAL 3 MONTH);
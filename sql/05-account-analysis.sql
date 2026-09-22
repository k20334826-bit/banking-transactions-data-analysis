USE banking_transactions;

-- ACCOUNT ANALYSIS ---
---------------------------------------------------------------------------------------------
-- 12. How many accounts does bank have.
SELECT COUNT(DISTINCT account_id) AS total_accounts FROM accounts;

-- 13. How many accounts are Active, Dormant, and Closed.
SELECT status, COUNT(*) as total_accounts
FROM accounts
GROUP BY status
LIMIT 1;

-- 14. How many accounts are opened in each year.
SELECT YEAR(open_date) AS year,
	COUNT(account_id) AS total_accounts
FROM accounts
GROUP BY YEAR(open_date)
ORDER BY year ASC;

-- 15. How many accounts were opened in each month.
SELECT MONTH(open_date) AS month,
	COUNT(account_id) AS total_accounts
FROM accounts
GROUP BY MONTH(open_date)
ORDER BY month ASC;

-- 16. Which of the top 5 branches have highest number of accounts.
SELECT a.branch_id,
	b.branch_name,
    COUNT(a.account_id) AS total_accounts
FROM branches b
JOIN accounts a
	ON a.branch_id = b.branch_id
GROUP BY branch_id, branch_name
ORDER BY total_accounts DESC
LIMIT 5;

-- 17. Find top 5 branches which have highest number of customers.
SELECT b.branch_id,
	b.branch_name,
    COUNT(c.customer_id) AS total_customers
FROM customers c
JOIN accounts a
	ON a.customer_id = c.customer_id
JOIN branches b
	ON a.branch_id = b.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY total_customers DESC
LIMIT 5;

-- 18. What is average account balance by account type
SELECT account_type,
	FORMAT(AVG(balance), 2) AS average_balance
FROM accounts
GROUP BY account_type
ORDER BY average_balance DESC;

-- 19. What is the top 5 total balance held by each branch.
SELECT b.branch_id,
	b.branch_name,
    FORMAT(SUM(a.balance), 2) AS total_balance
FROM accounts a
JOIN branches b
	ON a.branch_id = b.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY SUM(a.balance) DESC
LIMIT 5;

-- 20 How many bank accounts currently have balance of 0.
SELECT COUNT(*) FROM accounts
WHERE balance = 0;

-- 21. Which branches have custsomers balance exceeding 3 cr.
SELECT b.branch_id,
	b.branch_name,
    b.city,
    FORMAT(SUM(a.balance), 2) AS balance
FROM accounts a
JOIN branches b
	ON a.branch_id = b.branch_id
GROUP BY b.branch_id, b.branch_name, b.city
HAVING SUM(a.balance) >= 30000000
ORDER BY SUM(a.balance) DESC;
USE banking_transactions;

-- TRANSACTION ANALYSIS --
----------------------------------------------------------------------------------------------------------
-- 22. How many transactions has the bank processed.
SELECT COUNT(*) AS total_transactions FROM transactions;

-- 23. What is the total transaction valume.
SELECT FORMAT(SUM(amount), 2) AS total_valume FROM transactions;

-- 24. What is the average transaction amount.
SELECT FORMAT(AVG(amount), 2) FROM transactions;

-- 25. What is the highest transaction amount
SELECT FORMAT(MAX(amount), 2) FROM transactions;

-- 26. What is the lowest transaction amount.
SELECT MIN(amount) FROM transactions;

-- 27. 	Which transaction type is most common.
SELECT txn_type, 
	COUNT(transaction_id) AS transactions FROM transactions
GROUP BY txn_type
ORDER BY transactions DESC
LIMIT 1;

-- 28. What is the total amount by each transaction type.
SELECT txn_type, 
	FORMAT(SUM(amount), 2) as amount
FROM transactions 
GROUP BY txn_type
ORDER BY SUM(amount) DESC;
SELECT * FROM transactions;

-- 29. Which transaction has the highest transaction value.
SELECT txn_type, 
	FORMAT(SUM(amount), 2) as amount
FROM transactions 
GROUP BY txn_type
ORDER BY SUM(amount) DESC
LIMIT 1;

-- 30. How many transactions daily occured.
SELECT DATE(txn_date) AS date,
	COUNT(*) AS transactions
FROM transactions
GROUP BY DATE(txn_date)
ORDER BY DATE(txn_date);

-- 31 Which day has the highest transactions are occured.
SELECT DATE(txn_date) AS date,
	COUNT(*) AS transactions
FROM transactions
GROUP BY DATE(txn_date)
ORDER BY DATE(txn_date)
LIMIT 1;

-- 32. Which dates had more than 700 transactions
WITH transactions AS (
	SELECT DATE(txn_date) AS transaction_date,
		COUNT(*) AS transactions
    FROM transactions
    GROUP BY DATE(txn_date)
)
SELECT * FROM transactions
WHERE transactions >= 700;

-- 33. How many transactions are occured weekly
SELECT YEAR(txn_date) AS transaction_year,
	WEEK(txn_date, 1) AS transaction_week,
    COUNT(*) as transactions
FROM transactions
GROUP BY YEAR(txn_date), WEEK(txn_date, 1)
ORDER BY YEAR(txn_date), WEEK(txn_date, 1);
-- week start
SELECT 
	DATE_SUB(DATE(txn_date), INTERVAL WEEKDAY(txn_date) DAY) AS week_start,
    COUNT(*) AS transactions
FROM transactions
GROUP BY 
	DATE_SUB(DATE(txn_date), INTERVAL WEEKDAY(txn_date) DAY);

-- 34. Which month has the highest transaction valume
SELECT MONTHNAME(txn_date) AS transaction_month,
	FORMAT(SUM(amount), 2) AS valume
FROM transactions
GROUP BY MONTHNAME(txn_date);

-- 35. Which customers have performed more than 10 transactions
WITH trn AS (
	SELECT a.customer_id, 
		COUNT(t.transaction_id) AS transactions
	FROM transactions t
	JOIN accounts a
		ON a.account_id = t.account_id
	GROUP BY a.customer_id
	ORDER BY transactions DESC
)
SELECT * FROM trn
WHERE transactions < 10;

-- 36. How many custoemrs have performed more than 10 transactions
SELECT COUNT(*) AS above_100_customers
FROM (
	SELECT a.customer_id,
		COUNT(t.transaction_id) AS total_transactions
        FROM transactions t
        JOIN accounts a
			ON t.account_id = a.account_id
		GROUP BY a.customer_id
        HAVING COUNT(t.transaction_id) > 10
        ORDER BY total_transactions
	) AS 
customer_transactions;

-- 37. Who are the top 10 customers by transaction valume
SELECT c.name, 
	FORMAT(SUM(t.amount), 2) AS valume
FROM transactions t
JOIN accounts a
	ON t.account_id = t.account_id
JOIN customers c
	ON a.customer_id = c.customer_id
GROUP BY c.name
ORDER BY SUM(t.amount) DESC
LIMIT 10;
    
-- 38. Which cutomer have the highest transaction frequency.
SELECT a.customer_id,
	COUNT(t.transaction_id) AS frequency
FROM accounts a
JOIN transactions t
	ON 	a.account_id = t.account_id
GROUP BY a.customer_id
ORDER BY frequency DESC
LIMIT 1;

-- 39. Which braanches handle the highest transaction valume.
SELECT b.branch_id, b.branch_name, b.city,
	COUNT(t.transaction_id) AS total_transactions,
    FORMAT(SUM(t.amount), 2) AS total_valume
FROM transactions t
JOIN accounts a
	ON t.account_id = a.account_id
JOIN branches b
	ON a.branch_id = b.branch_id
GROUP BY b.branch_id, b.branch_name, b.city
ORDER BY total_valume DESC
LIMIT 10;

-- 40. What are the 10 largest transactions, Who made them, and which branch handle them.
SELECT t.transaction_id, a.customer_id, a.account_id, c.name,
	b.branch_id, b.branch_name, t.txn_date, t.txn_type, t.channel,
	t.amount, t.merchant_category
FROM transactions t
JOIN accounts a
	ON t.account_id = a.account_id
JOIN customers c
	ON a.customer_id = c.customer_id
JOIN branches b
	ON b.branch_id = a.branch_id
ORDER BY t.amount DESC
LIMIT 10;

-- 41. What percentage of transactions are above 1 lack
SELECT COUNT(*) AS total_transactions,
	FORMAT(SUM(amount > 10000), 2) AS above_1_cr,
    ROUND(SUM(amount > 10000) * 100.0/COUNT(*), 2) AS percentage
FROM transactions;

-- 42. Which customers belongs to the top 10% by transaction valume.
WITH customer_transactions AS (
	SELECT a.customer_id,
		COUNT(t.transaction_id) AS txn_count,
        SUM(t.amount) AS txn_valume
	FROM transactions t
    JOIN accounts a
		ON t.account_id = a.account_id
	GROUP BY a.customer_id
),
ranked_customers AS (
	SELECT customer_id, txn_count, txn_valume,
    NTILE(10) OVER (ORDER BY txn_valume DESC) AS percentile_group
    FROM customer_transactions
)
SELECT customer_id, txn_count, txn_valume
FROM ranked_customers
WHERE percentile_group = 1
ORDER BY txn_valume DESC;

-- 43. Which branches handle the most high-value transactions
SELECT b.branch_id, b.branch_name, b.city, b.state,
	COUNT(t.transaction_id) AS total_transactions,
	FORMAT(SUM(t.amount), 2) AS transaction_value
FROM transactions t
JOIN accounts a
	ON t.account_id = a.account_id
JOIN branches b
	ON a.branch_id = b.branch_id
GROUP BY b.branch_id, b.branch_name, b.city, b.state
ORDER BY transaction_value DESC
LIMIT 10;

-- 44. What is the Average amount by branch.
SELECT b.branch_id, b.branch_name,
	FORMAT(AVG(t.amount), 2) AS average_value
FROM transactions t
JOIN accounts a
	ON 	t.account_id = a.account_id
JOIN branches b
	ON a.branch_id = b.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY AVG(t.amount) DESC;

-- 45. Which customer have both high transaction frequency and high transactions value.
SELECT c.customer_id, c.name,
	COUNT(t.transaction_id) AS frequency,
    FORMAT(SUM(t.amount), 2) AS value
FROM transactions t
JOIN accounts a
	ON t.account_id = a.account_id
JOIN customers c
	ON a.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY SUM(t.amount) DESC
LIMIT 10;
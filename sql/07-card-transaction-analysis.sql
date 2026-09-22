USE banking_transactions;

-- CARD ANALYSIS
----------------------------------------------------------------------------------------------------------------------
-- 46. How many cards does the bank have
SELECT COUNT(*) AS total_cards FROM cards;

-- 47. How many cards are Active, Expired, and Blocked
SELECT status, COUNT(*) FROM cards;

SELECT card_status, COUNT(*) from cards
GROUP BY card_status;

-- 47. Which card type is most common.
SELECT card_type, COUNT(*) AS total_cards FROM cards
GROUP BY card_type
ORDER BY total_cards DESC
LIMIT 1;

-- 48. How many cards were issued in each year.
SELECT YEAR(issue_date) AS card_year,
	COUNT(*) AS total_cards
FROM cards
GROUP BY YEAR(issue_date)
ORDER BY card_year ASC;

-- 49. Which branches have issued the most cards.
SELECT b.branch_id, b.branch_name,
	COUNT(c.card_id) AS total_cards,
    ROW_NUMBER() OVER (ORDER BY COUNT(c.card_id) DESC) branch_rank
FROM cards c
JOIN accounts a
	ON c.account_id = a.account_id
JOIN branches b
	ON a.branch_id = b.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY COUNT(card_id) DESC
LIMIT 10;

-- 50. How many customers have more than one cards.
SELECT COUNT(*) AS customers_wit_multi_cards
	FROM (
		SELECT a.customer_id FROM cards c
        JOIN accounts a
			ON c.account_id = a.account_id
		GROUP BY a.customer_id
        HAVING COUNT(c.card_id) > 1
	) AS multi_card_customers;

-- 51. Which customer have highest number of cards.
SELECT cus.customer_id, cus.name,
	COUNT(c.card_id) AS cards
FROM cards c
JOIN customers cus
	ON c.customer_id = cus.customer_id
GROUP BY cus.customer_id, cus.name
ORDER BY cards DESC
LIMIT 5;

-- 52. What is the total card spending by transaction type
SELECT car.card_type, FORMAT(SUM(cartr.amount), 2) AS total_spending FROM cards car
JOIN card_transactions cartr
	ON car.card_id = cartr.card_id
GROUP BY car.card_type
ORDER BY total_spending DESC;

-- 53. What is the average monthly card spending.
SELECT FORMAT(AVG(monthly_spending), 2) AS average_monthly_spending
FROM (
	SELECT YEAR(txn_date) AS trans_year,
    MONTH(txn_date) AS trans_month,
	SUM(amount) AS monthly_spending
    FROM card_transactions
    GROUP BY YEAR(txn_date), MONTH(txn_date)
) monthly_card_spending;

-- 54, Which card type generates highest transaction valume
SELECT c.card_type,
	FORMAT(SUM(ct.amount), 2) AS txn_valume
FROM cards c
JOIN card_transactions ct
	ON ct.card_id = c.card_id
GROUP BY c.card_type
ORDER BY txn_valume
LIMIT 1;

-- CARD TRANSACTION ANALYSIS
-----------------------------------------------------------------------------------
-- 55. How many cards are occured in each month.
SELECT MONTHNAME(txn_date) AS txn_month,
	COUNT(card_txn_id) AS total_transactions
FROM card_transactions
GROUP BY MONTHNAME(txn_date);

-- 56. What is the monthly card spending
SELECT MONTHNAME(txn_date), FORMAT(SUM(amount), 2) AS card_spending,
	DENSE_RANK() OVER (ORDER BY SUM(amount) DESC) AS rk
 FROM card_transactions
 GROUP BY MONTHNAME(txn_date);
 
 -- 57. Which month has the highest card spending
 SELECT MONTHNAME(txn_date) AS transaction_month,
	FORMAT(SUM(amount), 2) AS card_spending
FROM card_transactions
GROUP BY MONTHNAME(txn_date)
ORDER BY SUM(amount) DESC
LIMIT 1;

-- 58. Which card type has the highest spending
SELECT c.card_type,
	ROUND(SUM(ct.amount), 2) AS total_spending
FROM card_transactions ct
JOIN cards c
	ON 	ct.card_id = c.card_id
GROUP BY c.card_type
ORDER BY SUM(ct.amount) DESC
LIMIT 1;

-- 59. Which customers spend most using cards.
SELECT cus.customer_id, cus.name,
	SUM(ct.amount) AS card_spending
FROM card_transactions ct
JOIN cards c
	ON c.card_id = ct.card_id
JOIN accounts a
	ON c.account_id = a.account_id
JOIN customers cus
	ON a.customer_id = cus.customer_id
GROUP BY cus.customer_id, cus.name
ORDER BY card_spending DESC
LIMIT 10;

-- 60. Which marchants receive the highest card transaction value
SELECT merchant_category, 
	FORMAT(SUM(amount), 2) AS transaction_value
FROM card_transactions
GROUP BY merchant_category
ORDER BY SUM(amount) DESC
LIMIT 5;

-- 61. Which card transactionss are above 20000.
SELECT card_txn_id, card_id, amount, txn_date FROM card_transactions
WHERE amount > 20000
ORDER BY amount DESC;
USE banking_transactions;

################################ CHECK DUPLICATED OR NULL VALUES #################################################
-- Accounts
SELECT account_id, COUNT(*) FROM accounts
GROUP BY account_id
HAVING COUNT(*) > 1;

SELECT account_id FROM accoUnts
WHERE account_id IS NULL;

-- Branches
SELECT branch_id, COUNT(*) FROM branches
GROUP BY branch_id
HAVING COUNT(*) > 1;

SELECT branch_id FROM branches
WHERE branch_id IS NULL;

-- Customers
SELECT COUNT(*) AS total_rows,
	COUNT(customer_id) AS non_null_values,
    COUNT(*) - COUNT(customer_id) AS null_values,
    COUNT(DISTINCT customer_id) AS unique_values,
    COUNT(customer_id) - COUNT(DISTINCT customer_id) AS duplicated_values
FROM customers;

-- Transactions
SELECT COUNT(*) AS total_rows,
	COUNt(transaction_id) AS non_null_values,
    COUNT(*) - COUNT(transaction_id) AS null_values,
    COUNT(DISTINCT transaction_id) AS unique_values,
    COUNT(transaction_id) - COUNT(DISTINCT transaction_id) AS duplicated_values
FROM transactions;

-- Cards
SELECT COUNT(*) as total_values,
	COUNT(card_id) AS non_null_values,
    COUNT(*) - COUNT(card_id) AS null_values,
    COUNT(DISTINCT card_id) AS unique_values,
    COUNT(card_id) - COUNT(DISTINCT card_id) AS duplicated_values
FROM cards;

-- Card Transactions
SELECT COUNT(*) AS total_records,
	COUNT(card_txn_id) AS non_null_records,
    COUNT(*) - COUNT(DISTINCT card_txn_id) AS null_records,
    COUNT(DISTINCT card_txn_id) AS unique_records,
    COUNT(card_txn_id) - COUNT(DISTINCT card_txn_id) AS diplicated_records
FROM card_transactions;

-- Loans
SELECT COUNT(*) AS total_records,
	COUNT(loan_id) AS non_null_records,
    COUNT(*) - COUNT(DISTINCT loan_id) AS null_records,
    COUNT(DISTINCT loan_id) AS unique_records,
    COUNT(loan_id) - COUNT(DISTINCT loan_id) AS duplicated_records
FROM loans;

-- Loan Payments
SELECT COUNT(*) AS total_records,
	COUNT(payment_id) AS non_null_records,
    COUNT(*) - COUNT(DISTINCT payment_id) AS null_records,
    COUNT(DISTINCT payment_id) AS unique_records,
    COUNT(payment_id) - COUNT(DISTINCT payment_id) AS duplicated_records
FROM loan_payments;

-- Employees
SELECT COUNT(*) AS total_records,
	COUNT(employee_id) AS non_null_records,
    COUNT(*) - COUNT(DISTINCT employee_id) AS null_records,
    COUNT(DISTINCT employee_id) AS unique_records,
    COUNT(employee_id) - COUNT(DISTINCT employee_id) AS duplicated_records
FROM employees;

-- Support Tickets
SELECT COUNT(*) AS total_records,
	COUNT(ticket_id) AS non_null_records,
    COUNT(*) - COUNT(DISTINCT ticket_id) AS null_records,
    COUNT(DISTINCT ticket_id) AS unique_records,
    COUNT(ticket_id) - COUNT(DISTINCT ticket_id) AS duplicated_records
FROM support;
USE banking_transactions;

-- LOAN ANALYSIS
----------------------------------------------------------------------------------------------------------------------------
-- 62. How many loans has the bank issued
SELECT COUNT(*) AS total_loans FROM loans;

-- 63. What is the total loan amount issued.
SELECT FORMAT(SUM(loan_amount), 2) AS total_loan_amount FROM loans;

-- 64. What is the average loan amount.
SELECT ROUND(AVG(loan_amount), 2) AS average_loan_amount FROM loans;

-- 65. Which loan type is most common.
SELECT loan_type,
	COUNT(*) AS total_loans
FROM loans
GROUP BY loan_type
ORDER BY total_loans DESC
LIMIT 1;

-- 66. Which loan type has the highest total loan amount.
SELECT loan_type,
	FORMAT(SUM(loan_amount), 2) AS total_loan_amount
FROM loans
GROUP BY loan_type
ORDER BY total_loan_amount
LIMIT 1;

-- 67. Which customers have the highest outstanding loan amount.
SELECT l.customer_id,
	SUM(l.loan_amount - COALESCE(p.total_principle_paid, 00)) AS total_outstanding
FROM loans l
LEFT JOIN (
	SELECT loan_id, SUM(principal_component) AS total_principle_paid
    FROM loan_payments
    GROUP BY loan_id
) p
ON l.loan_id = p.loan_id
GROUP BY l.customer_id
ORDER BY total_outstanding DESC
LIMIT 10;

-- LOAN PAYMENT ANALYSIS 
-----------------------------------------------------------------------------------------------------------------------
-- 68. How much money has the bank collected through loan payments.
SELECT FORMAT(SUM(amount_paid), 2) AS peyments_collected FROM loan_payments;

-- 69. What is the average loan payment.
SELECT ROUND(AVG(amount_paid), 2) AS average_paid FROM loan_payments;

-- 70. Which cutomers have mode the highest total loan payments.
SELECT c.customer_id, c.name,
	FORMAT(SUM(lp.amount_paid), 2) AS total_loan_payments
FROM loan_payments lp
JOIN loans l
	ON lp.loan_id = l.loan_id
JOIN customers c
	ON l.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_loan_payments DESC
LIMIT 5;

-- 71. Which loans have missed payments.
SELECT loan_id, COUNT(*) AS missed_payments FROM loan_payments
WHERE late_payment_flag = 1
GROUP BY loan_id
ORDER BY missed_payments DESC;

-- 72. Which customers have overdue loan payments.
SELECT l.loan_id, c.name, COUNT(*) AS overdue_payments,
	FORMAT(SUM(pl.amount_paid), 2) AS amount_paid_on_overdue_payments
FROM loan_payments pl
JOIN loans l
	ON pl.loan_id = l.loan_id
JOIN customers c
	ON l.customer_id = c.customer_id
WHERE pl.late_payment_flag = 1
GROUP BY l.loan_id
ORDER BY overdue_payments DESC;

-- 73. Which branches have the highest loan payments amounts.
SELECT b.branch_id, b.branch_name, l.loan_id,
	FORMAT(SUM(lp.amount_paid), 2) AS total_loan_paymetns
FROM loan_payments lp
JOIN loans l
	ON lp.loan_id = l.loan_id
JOIN customers c
	ON l.customer_id = c.customer_id
JOIN branches b
	ON l.branch_id = b.branch_id
GROUP BY b.branch_id, b.branch_name, l.loan_id
ORDER BY total_loan_paymetns DESC
LIMIT 10;
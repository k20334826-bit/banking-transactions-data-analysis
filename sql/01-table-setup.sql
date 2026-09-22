CREATE DATABASE banking_transactions;

USE banking_transactions;

ALTER TABLE accounts
	MODIFY account_id INT, 
    MODIFY customer_id INT,
    MODIFY branch_id INT,
    MODIFY account_type CHAR(15),
    MODIFY balance DECIMAL(10,2),
    MODIFY status VARCHAR(50),
    MODIFY `year_month` CHAR(7),
    MODIFY year INT;

ALTER TABLE branches 
	MODIFY branch_id INT,
    MODIFY branch_name VARCHAR(100),
    MODIFY city VARCHAR(50),
    MODIFY state VARCHAR(50),
    MODIFY ifsc_code VARCHAR(100),
    MODIFY `year` INT(4),
    MODIFY month CHAR(20);

ALTER TABLE customers MODIFY customer_id INT, modify `name` VARCHAR(50), modify gender CHAR(10), 
	MODIFY phone VARCHAR(15), MODIFY email VARCHAR(100), MODIFY city CHAR(20), MODIFY state VARCHAR(30),
	MODIFY occupation VARCHAR(100), MODIFY annual_income DECIMAL(10,2),  MODIFY credit_score INT, MODIFY credit_status CHAR(20), MODIFY join_month CHAR(20),
    MODIFY age INT, MODIFY age_group CHAR(20);

ALTER TABLE transactions MODIFY transaction_id INT, MODIFY account_id INT, MODIFY txn_type VARCHAR(50), MODIFY amount DECIMAL(10,2),
	MODIFY channel VARCHAR(50), MODIFY merchant_category CHAR(20), MODIFY trans_month CHAR(20), MODIFY trans_year INT;

ALTER TABLE employees MODIFY employee_id INT, MODIFY name VARCHAR(50), MODIFY branch_id INT, MODIFY role VARCHAR(50),
	MODIFY salary DECIMAL(10,2), MODIFY join_month CHAR(20), MODIFY year INT;

ALTER TABLE cards MODIFY card_id INT, MODIFY customer_id INT, MODIFY account_id INT, MODIFY card_type VARCHAR(30), 
	MODIFY credit_limit INT, MODIFY status CHAR(10), MODIFY card_status CHAR(10);

ALTER TABLE card_transactions MODIFY card_txn_id INT, MODIFY card_id INT, MODIFY merchant_category CHAR(20), 
	MODIFY is_fraud INT, MODIFY amount DECIMAL(10,2), MODIFY year INT, MODIFY month CHAR(20);

ALTER TABLE loans MODIFY loan_id INT, MODIFY customer_id INT, MODIFY branch_id INT, MODIFY loan_type CHAR(20), MODIFY loan_amount DECIMAL(10,2), MODIFY interest_rate DECIMAL(10,2),
	MODIFY term_months INT, MODIFY start_date DATE, MODIFY status CHAR(20);

ALTER TABLE support MODIFY ticket_id INT, MODIFY customer_id INT, MODIFY issue_type VARCHAR(20), MODIFY status CHAR(10),MODIFY satisfaction_score INT;

ALTER TABLE loan_payments MODIFY payment_id INT, MODIFY loan_id INT, MODIFY amount_paid DECIMAL(10,2),
	MODIFY interest_component DECIMAL(10,2), 
    MODIFY late_payment_flag INT, MODIFY principal_component DECIMAL(10,2);
    
DESC customers;
DESC branches;
DESC accounts;
DESC transactions;
DESC cards;
DESC card_transactions;
DESC loans;
DESC loan_payments;
DESC employees;
DESC support;
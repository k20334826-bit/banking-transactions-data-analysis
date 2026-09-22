USE banking_transactions;

-- ADD KEYS
ALTER TABLE accounts ADD PRIMARY KEY (account_id);
ALTER TABLE customers ADD PRIMARY KEY (customer_id);
ALTER TABLE branches ADD PRIMARY KEY (branch_id);
ALTER TABLE transactions ADD PRIMARY KEY (transaction_id);
ALTER TABLE employees ADD PRIMARY KEY (employee_id);
ALTER TABLE cards ADD PRIMARY KEY(card_id);
ALTER TABLE card_transactions ADD PRIMARY KEY (card_txn_id);
ALTER TABLE loans ADD PRIMARY KEY (loan_id);
ALTER TABLE loan_payments ADD PRIMARY KEY (payment_id);
ALTER TABLE support ADD PRIMARY KEY (ticket_id);


ALTER TABLE accounts ADD CONSTRAINT for_keys FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
ALTER TABLE accounts ADD CONSTRAINT fk_accounts_branches FOREIGN KEY (branch_id) REFERENCES branches(branch_id);

ALTER TABLE transactions ADD CONSTRAINT fk_transactions_account FOREIGN KEY (account_id) REFERENCES accounts(account_id);

ALTER TABLE cards ADD CONSTRAINT fk_cards_accounts FOREIGN KEY (account_id) REFERENCES accounts(account_id);
ALTER TABLE cards ADD CONSTRAINT fk_cards_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

ALTER TABLE card_transactions ADD CONSTRAINT fk_card_transactions_cards FOREIGN KEY (card_id) REFERENCES cards(card_id);

ALTER TABLE loans ADD CONSTRAINT fk_loan_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
ALTER TABLE loans ADD CONSTRAINT fk_loans_branches FOREIGN KEY (branch_id) REFERENCES branches (branch_id);

ALTER TABLE loan_payments ADD CONSTRAINT fk_loan_payments_loan FOREIGN KEY (loan_id) REFERENCES loans(loan_id);

ALTER TABLE employees ADD CONSTRAINT fk_employees_branches FOREIGN KEY (branch_id) REFERENCES branches(branch_id);

ALTER TABLE support ADD CONSTRAINT fk_support_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

-- Check all PRIMARY and FOREIGN KEYS
SELECT TABLE_NAME,
	INDEX_NAME,
    COLUMN_NAME,
    NON_UNIQUE,
    SEQ_IN_INDEX
FROM information_schema.STATISTICS
WHERE TABLE_SCHEMA = 'banking_transactions'
ORDER BY TABLE_NAME, INDEX_NAME, SEQ_IN_INDEX;
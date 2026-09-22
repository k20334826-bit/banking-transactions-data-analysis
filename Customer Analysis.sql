USE banking_transactions;

-- CUSTOMER ANALYSIS
---------------------- --------------------------------------------------------------------------
-- 1. How many customers does bank have:
SELECT  COUNT(*) AS total_customers
FROM customers;

-- 2.  How many Customers whose gender is Males and Females in each city
SELECT city,
	SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) AS male_count,
    SUM(CASE WHEN gender = "Female" THEN 1 ELSE 0 END) AS female_count
FROM customers
GROUP BY city;

-- 3. What is the average age of bank cutomers
SELECT 
	ROUND(AVG(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())), 2) AS average_age
FROM customers;

-- 4. How many customers belongs to each age group
SELECT age_group, COUNT(customer_id) AS total_accounts FROM customers
GROUP BY age_group;

-- 5. Which state has the highest number of customers
SELECT state, COUNT(customer_id) AS total_customers
FROM customers
GROUP BY state;
SELECT state,
	COUNT(customer_id) AS total_customers,
	RANK() OVER(ORDER BY COUNT(customer_id) DESC) AS 'rank'
FROM customers
GROUP BY state
ORDER BY 'rank' ASC;

-- 6. How many customers joined the bank in each year
SELECT YEAR(join_date) AS year,
	COUNT(customer_id) AS total_customers
FROM customers
GROUP BY YEAR(join_date)
ORDER BY year;

-- 7. How many customers are joined after 2020.alter
SELECT YEAR(join_date) AS year,
	COUNT(customer_id) AS total_customers
FROM customers
WHERE YEAR(join_date) > 2020
GROUP BY YEAR(join_date);

-- 8. Which are the top 10 ondest customers
SELECT customer_id,
	name,
    age
FROM customers
ORDER BY age DESC
LIMIT 10;

-- 9. Who are the top 10 joungest customers
SELECT customer_id,
	name,
    age
FROM customers
ORDER BY age ASC
LIMIT 10;

-- 10. What percentae of customers have multiple accounts
SELECT ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers), 2) AS percentage
FROM (
	SELECT customer_id FROM accounts
    GROUP BY customer_id
    HAVING COUNT(customer_id) > 1
) AS multiple_customers;
SELECT * FROM customers;

-- 11. How many customers are currently Active.
SELECT a.status, 
	COUNT(c.customer_id) AS total_customers
FROM customers c
JOIN accounts a
	ON a.customer_id = c.customer_id
WHERE a.status = 'Active';
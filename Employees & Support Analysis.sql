USE banking_transactions;

-- EMPLOYEES & SUPPORT ANALYSIS
----------------------------------------------------------------------------------------------
-- 74. How many Employees are work at each Branch
SELECT b.branch_id, b.branch_name, COUNT(e.employee_id) AS total_employees
FROM employees e
JOIN branches b
	ON e.branch_id = b.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY COUNT(e.employee_id) DESC;

-- 75. which Branches have the highest number of Employees
SELECT b.branch_id, b.branch_name, COUNT(e.employee_id) AS total_employees
FROM employees e
JOIN branches b
	ON e.branch_id = b.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY total_employees DESC
LIMIT 10;

-- 76. Which Customers sgenerate the most support ticket
SELECT customer_id, COUNT(DISTINCT ticket_id) AS total_tickets
FROM support
GROUP BY customer_id
ORDER BY total_tickets DESC
LIMIT 10;

-- 77. What is the average support resolution time
SELECT ROUND(AVG(TIMESTAMPDIFF(HOUR, date_opened, date_resolved)), 2) AS average_resolution_time
FROM support
WHERE date_resolved IS NULL;

-- 78. Which branches receive the highest number of support requests.
SELECT b.branch_id, b.branch_name, COUNT(DISTINCT s.ticket_id) AS total_requests
FROM support s
JOIN accounts a
	ON s.customer_id = a.customer_id
JOIN branches b
	ON a.branch_id = b.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY total_requests;

-- 79. Which cutomers have raised the most support tickets
SELECT s.customer_id, c.name, COUNT(s.ticket_id) AS total_tickets
FROM support s
JOIN customers c
	ON s.customer_id = c.customer_id
GROUP BY s.customer_id, c.name
ORDER BY total_tickets DESC
LIMIT 10;
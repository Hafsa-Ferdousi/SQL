@ C:\Users\User\Downloads

SELECT branch_name, branch_city
FROM branch
WHERE assets > 1000000;

SELECT account_number, balance
FROM account
WHERE branch_name = 'Downtown'
   OR balance BETWEEN 600 AND 750;

SELECT a.account_number
FROM account a
JOIN branch b ON a.branch_name = b.branch_name
WHERE b.branch_city = 'Rye';


SELECT l.loan_number
FROM loan l
JOIN borrower b ON l.loan_number = b.loan_number
JOIN customer c ON b.customer_name = c.customer_name
WHERE l.amount >= 1000
  AND c.customer_city = 'Harrison';


SELECT *
FROM account
ORDER BY balance DESC;

SELECT *
FROM customer
ORDER BY customer_city ASC;

SELECT customer_name
FROM depositor
INTERSECT
SELECT customer_name
FROM borrower;

SELECT * FROM customer
WHERE customer_name IN (
    SELECT customer_name FROM depositor
    UNION
    SELECT customer_name FROM borrower
);


SELECT c.customer_name, c.customer_city
FROM customer c
JOIN borrower b ON c.customer_name = b.customer_name
MINUS
SELECT c.customer_name, c.customer_city
FROM customer c
JOIN depositor d ON c.customer_name = d.customer_name;

SELECT SUM(assets) AS total_assets
FROM branch;


SELECT branch_name, AVG(balance) AS average_balance
FROM account
GROUP BY branch_name;


SELECT b.branch_city, AVG(a.balance) AS average_balance
FROM account a
JOIN branch b ON a.branch_name = b.branch_name
GROUP BY b.branch_city;

SELECT branch_name, MIN(amount) AS lowest_loan
FROM loan
GROUP BY branch_name;


SELECT branch_name, COUNT(*) AS total_loans
FROM loan
GROUP BY branch_name;


SELECT d.customer_name, d.account_number
FROM depositor d
JOIN account a ON d.account_number = a.account_number
WHERE a.balance = (
    SELECT MAX(balance) FROM account
);


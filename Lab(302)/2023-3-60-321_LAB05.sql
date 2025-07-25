@ C:\Users\User\Downloads


SELECT DISTINCT C.*
FROM customer C, depositor D, account A, branch B
WHERE C.customer_name = D.customer_name
AND D.account_number = A.account_number
AND A.branch_name = B.branch_name
AND C.customer_city = B.branch_city;



-- using a subquery

SELECT *
FROM customer
WHERE customer_name IN (
    SELECT C.customer_name
    FROM customer C, depositor D, account A, branch B
    WHERE C.customer_name = D.customer_name
    AND D.account_number = A.account_number
    AND A.branch_name = B.branch_name
    AND C.customer_city = B.branch_city
);


SELECT DISTINCT C.*
FROM customer C, borrower B1, loan L, branch BR
WHERE C.customer_name = B1.customer_name
AND B1.loan_number = L.loan_number
AND L.branch_name = BR.branch_name
AND C.customer_city = BR.branch_city;


SELECT  C.*
FROM customer C, borrower B1, loan L, branch BR
WHERE C.customer_name = B1.customer_name
AND B1.loan_number = L.loan_number
AND L.branch_name = BR.branch_name
AND C.customer_city = BR.branch_city;

-- 2using a subquery
SELECT *
FROM customer
WHERE customer_name IN (
    SELECT C.customer_name
    FROM customer C, borrower B, loan L, branch BR
    WHERE C.customer_name = B.customer_name
    AND B.loan_number = L.loan_number
    AND L.branch_name = BR.branch_name
    AND C.customer_city = BR.branch_city
);

--having
SELECT B.branch_city, AVG(A.balance)
FROM account A, branch B
WHERE A.branch_name = B.branch_name
GROUP BY B.branch_city
HAVING SUM(A.balance) >= 1000;

--without having
SELECT branch_city, avg_balance
FROM (
    SELECT B.branch_city AS branch_city, AVG(A.balance) AS avg_balance, SUM(A.balance) AS total_balance
    FROM account A, branch B
    WHERE A.branch_name = B.branch_name
    GROUP BY B.branch_city
)
WHERE total_balance >= 1000;


SELECT B.branch_city, AVG(L.amount)
FROM loan L, branch B
WHERE L.branch_name = B.branch_name
GROUP BY B.branch_city
HAVING AVG(L.amount) >= 1500;


--without having 4
SELECT branch_city, avg_amount
FROM (
    SELECT B.branch_city AS branch_city, AVG(L.amount) AS avg_amount
    FROM loan L, branch B
    WHERE L.branch_name = B.branch_name
    GROUP BY B.branch_city
)
WHERE avg_amount >= 1500;

-- ALL
SELECT C.customer_name, C.customer_street, C.customer_city
FROM customer C, depositor D, account A
WHERE C.customer_name = D.customer_name
AND D.account_number = A.account_number
AND A.balance >= ALL (
    SELECT balance FROM account
);



--WITHOUT ALL

SELECT C.customer_name, C.customer_street, C.customer_city
FROM customer C, depositor D, account A
WHERE C.customer_name = D.customer_name
AND D.account_number = A.account_number
AND A.balance = (
    SELECT MAX(balance) FROM account
);



SELECT C.customer_name, C.customer_street, C.customer_city
FROM customer C, borrower B, loan L
WHERE C.customer_name = B.customer_name
AND B.loan_number = L.loan_number
AND L.amount <= ALL (
    SELECT amount FROM loan
);



--WITHOUT ALL

SELECT C.customer_name, C.customer_street, C.customer_city
FROM customer C, borrower B, loan L
WHERE C.customer_name = B.customer_name
AND B.loan_number = L.loan_number
AND L.amount = (
    SELECT MIN(amount) FROM loan
);


--IN
SELECT DISTINCT B.branch_name, B.branch_city
FROM branch B
WHERE B.branch_name IN (
    SELECT branch_name FROM account
)
AND B.branch_name IN (
    SELECT branch_name FROM loan
);

--EXISTS

SELECT DISTINCT B.branch_name, B.branch_city
FROM branch B
WHERE EXISTS (
    SELECT * FROM account A
    WHERE A.branch_name = B.branch_name
)
AND EXISTS (
    SELECT * FROM loan L
    WHERE L.branch_name = B.branch_name
);



--8 IN
SELECT DISTINCT C.customer_name, C.customer_city
FROM customer C, depositor D
WHERE C.customer_name = D.customer_name
AND C.customer_name NOT IN (
    SELECT customer_name FROM borrower
);


--8NOT EXISTS
SELECT DISTINCT C.customer_name, C.customer_city
FROM customer C, depositor D
WHERE C.customer_name = D.customer_name
AND NOT EXISTS (
    SELECT * FROM borrower B
    WHERE B.customer_name = C.customer_name
);

--WITHOUT WITH
SELECT A.branch_name
FROM account A
GROUP BY A.branch_name
HAVING SUM(A.balance) > (
    SELECT AVG(total)
    FROM (
        SELECT branch_name, SUM(balance) AS total
        FROM account
        GROUP BY branch_name
    )
);
--USING WITH
WITH BranchTotal AS (
    SELECT branch_name, SUM(balance) AS total
    FROM account
    GROUP BY branch_name
)
SELECT branch_name
FROM BranchTotal
WHERE total > (
    SELECT AVG(total) FROM BranchTotal
);


--WITHOUT WITH

SELECT L.branch_name
FROM loan L
GROUP BY L.branch_name
HAVING SUM(L.amount) < (
    SELECT AVG(total)
    FROM (
        SELECT branch_name, SUM(amount) AS total
        FROM loan
        GROUP BY branch_name
    )
);



--WITH

WITH BranchLoan AS (
    SELECT branch_name, SUM(amount) AS total
    FROM loan
    GROUP BY branch_name
)
SELECT branch_name
FROM BranchLoan
WHERE total < (
    SELECT AVG(total) FROM BranchLoan
);








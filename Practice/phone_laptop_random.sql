CREATE TABLE PHONE(
    brand VARCHAR2(30),
    purchase_date VARCHAR2(30),
    price NUMBER
);



INSERT INTO phone (brand, purchase_date, price)
VALUES ('Sumsang', TO_DATE('02-22-2020', 'MM-DD-YYYY'), 20000);

INSERT INTO phone VALUES ('REALME', TO_DATE('1995-06-12', 'YYYY-MM-DD'), 20000);
INSERT INTO phone VALUES ('REDMI', TO_DATE('1995-06-12', 'YYYY-MM-DD'), 200020);

INSERT INTO phone (brand, purchase_date, price)
VALUES ('ASUS', TO_DATE('02-22-2022', 'MM-DD-YYYY'), 220000);

INSERT INTO phone VALUES ('HP', TO_DATE('1995-6-2', 'YYYY-MM-DD'), 80000);
INSERT INTO phone VALUES ('DELL', TO_DATE('1995-06-12', 'YYYY-MM-DD'), 200020);

SELECT * FROM PHONE; 



CREATE TABLE LAPTOP(
    brand VARCHAR2(30),
    purchase_date VARCHAR2(30),
    price NUMBER
);

INSERT INTO  LAPTOP (brand, purchase_date, price)
VALUES ('Lenovo', TO_DATE('02-22-2022', 'MM-DD-YYYY'), 220000);

INSERT INTO LAPTOP VALUES ('HP', TO_DATE('1995-6-2', 'YYYY-MM-DD'), 80000);
INSERT INTO  LAPTOP VALUES ('DELL', TO_DATE('1995-06-12', 'YYYY-MM-DD'), 200020);
INSERT INTO LAPTOP (brand, purchase_date, price)
VALUES ('ASUS', TO_DATE('02-22-2022', 'MM-DD-YYYY'), 220000);

INSERT INTO LAPTOP VALUES ('APPLE', TO_DATE('1995-6-2', 'YYYY-MM-DD'), 80000);
INSERT INTO  LAPTOP VALUES ('MSI', TO_DATE('1995-06-12', 'YYYY-MM-DD'), 200020);

SELECT * FROM LAPTOP;

SELECT *
FROM PHONE
NATURAL JOIN LAPTOP;



SELECT
    P.brand,
    P.purchase_date AS phone_date,
    P.price AS phone_price,
    L.purchase_date AS laptop_date,
    L.price AS laptop_price
FROM PHONE P
JOIN LAPTOP L
  ON P.brand = L.brand;

SELECT 
MAX(P.PRICE) AS HIGEST_PHONE_P,
MAX(L.PRICE) AS HIGEST_LAP_P
FROM PHONE P
JOIN LAPTOP L
ON P.brand=L.brand;
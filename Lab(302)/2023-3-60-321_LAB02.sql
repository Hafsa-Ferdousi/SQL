CREATE TABLE book(
    book_id CHAR(6) PRIMARY KEY,
    title VARCHAR2(50) NOT NULL,
    author VARCHAR(30),
    copies NUMBER DEFAULT 1 CHECK (COPIES > 0)


);
CREATE TABLE member (
    member_id CHAR(5) PRIMARY KEY,
    name VARCHAR2(30) NOT NULL,
    city VARCHAR2(20),
    date_of_birth DATE
);


CREATE TABLE borrow (
    book_id CHAR(6),
    member_id CHAR(5),
    borrow_date DATE DEFAULT SYSDATE,
    CONSTRAINT fk_book FOREIGN KEY (book_id)
        REFERENCES book(book_id) ON DELETE CASCADE,
    CONSTRAINT fk_member FOREIGN KEY (member_id)
        REFERENCES member(member_id) ON DELETE CASCADE,
    CONSTRAINT borrow_pk PRIMARY KEY (book_id, member_id)
);




ALTER TABLE book RENAME COLUMN copies TO available_copies;


ALTER TABLE member ADD (email VARCHAR2(50) UNIQUE);


ALTER TABLE book ADD CONSTRAINT unique_author UNIQUE (author);






INSERT INTO book VALUES ('B001', 'The Odyssey', 'Homer', 5);


INSERT INTO book VALUES ('B002', '1984', 'George Orwell', 3);


INSERT INTO book VALUES ('B003', 'Data Structures', 'Mark Weiss', 2);






INSERT INTO member VALUES ('M001', 'Alice', 'Dhaka', TO_DATE('1995-04-12','YYYY-MM-DD'), 'alice@gmail.com');
INSERT INTO member VALUES ('M002', 'Bob', 'Khulna', TO_DATE ('1993-07-30','YYYY-MM-DD'), 'bob@gmail.com');
INSERT INTO member VALUES ('M003', 'Carol', 'Dhaka',TO_DATE ('1990-11-23','YYYY-MM-DD'), 'carol@gmail.com');
INSERT INTO member VALUES ('M004', 'Daniel', 'Chittagong', to_DATE( '1997-01-04','YYYY-MM-DD'), 'daniel@gmail.com');


INSERT INTO borrow VALUES ('B001', 'M001', TO_DATE('2024-06-01', 'YYYY-MM-DD'));


INSERT INTO borrow VALUES ('B002', 'M002', TO_DATE('2024-06-05', 'YYYY-MM-DD'));


INSERT INTO borrow VALUES ('B003', 'M003', TO_DATE('2024-06-07', 'YYYY-MM-DD'));


INSERT INTO borrow VALUES ('B001', 'M003', TO_DATE('2024-06-10', 'YYYY-MM-DD'));


SELECT * FROM book;
SELECT * FROM member;
SELECT * FROM borrow;


SELECT name, city, email
FROM member;




SELECT DISTINCT city
FROM member;




SELECT *
FROM book
WHERE available_copies > 2;


SELECT *
FROM member
WHERE city = 'Dhaka';




SELECT *
FROM member
WHERE city != 'Khulna';


SELECT DISTINCT b.member_id
FROM borrow b
JOIN book bk ON b.book_id = bk.book_id
WHERE bk.title = 'The Odyssey';


SELECT member.name, borrow.book_id
FROM member
JOIN borrow
    ON member.member_id = borrow.member_id
WHERE borrow.borrow_date > DATE '2024-06-05';




SELECT *
FROM borrow
WHERE member_id = 'M003';




SELECT DISTINCT borrow.book_id
FROM borrow
JOIN member
    ON borrow.member_id = member.member_id
WHERE member.city = 'Dhaka';




SELECT *
FROM member
WHERE member_id NOT IN (
    SELECT DISTINCT member_id
    FROM borrow
);
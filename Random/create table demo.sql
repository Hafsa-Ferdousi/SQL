
CREATE TABLE BOOK(
  book_id CHAR(6),
  title VARCHAR2(50)  NOT NULL,
  author VARCHAR2(30),
  copies NUMBER DEFAULT 1,
  PRIMARY KEY(book_id),

   CHECK (COPIES>=0)

);

CREATE TABLE member(
  member_id CHAR(6),
  name VARCHAR2(50)  NOT NULL,
  city VARCHAR2(30),
  date_of_birth Date,
  PRIMARY KEY( member_id)

);

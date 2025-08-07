CREATE TABLE TEAM(
SL_NO NUMBER,
PLAYER_NAME VARCHAR2(30),
ROLE VARCHAR2(15),
NOTE VARCHAR(100)

);
INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(1,'LITON KUMAR DAS','CAPTAIN');
INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(2,'Tanzid Hasan Tamim','Player');
insert into team values(3,'MD Namim Shekh','Player', 'Ban A');
INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(4,'Soumya Sarkar','Player');
INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(5,'Mohammad Parvez Hossain Emon','Player');

INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(6,'MD Towhid Hridoy','Player');

INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(7,'Jaker Ali Anik','Player');
INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(8,'MD Mehedi Hasan Miraj','Player');
INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(9,'MD Samim Hossin','Player');
INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(10,'MD Nazmul Hasan Shanto','Player');
INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(11,'Shak Mahedi Hasan ','Player');
INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(12,'MD Tanvir Islam','Player');
INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(13,'MD Rishad Hossin','Player');
INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(14,'Nasum Ahmed','Player');


insert into team values(15,'Hasan Mahmud','Player', 'Ban A');

INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(16,'Taskin Ahmed','Player');
INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(17,'MD Tanzim Hasan Sakib','Player');
INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(18,'MD Saifuddin','Player');
INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(19,'Nadid Rana','Player');
INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(20,'MD Mustafizur Rahman','Player');
INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(21,'MD Sariful Islam','Player');
INSERT INTO TEAM (SL_NO ,PLAYER_NAME,ROLE)VALUES(22,'Syed Khaled Ahmed','Player');

insert into team values(23,'Quazi Nurul Hasan Sohan','Player', 'Ban A');
insert into team values(24,'Mahidul Islam Hhuiyan Ankon','Player', 'Ban A');
insert into team values(25,'Mohammad Saif Hasn','Player', 'Ban A');

SELECT * FROM TEAM;



SELECT SL_NO ,PLAYER_NAME
FROM  team
ORDER BY  SL_NO ;

SELECT SL_NO ,PLAYER_NAME
FROM  team
ORDER BY  SL_NO DESC;


SELECT NOTE
FROM TEAM;



SELECT NOTE,PLAYER_NAME
FROM TEAM
WHERE NOTE IS NOT NULL;

SELECT COUNT(NOTE)
FROM TEAM
WHERE NOTE IS NOT NULL;

-- *-* ???
SELECT PLAYER_NAME,
(SELECT COUNT(NOTE)FROM TEAM WHERE NOTE IS NOT NULL ) AS N_COUNT
FROM TEAM 
WHERE NOTE IS NOT NULL;

SELECT PLAYER_NAME
FROM TEAM 
WHERE PLAYER_NAME LIKE ('MD%');

SELECT PLAYER_NAME
FROM TEAM 
WHERE PLAYER_NAME LIKE ('%Hasan%');



update team 
set role = 'Vice captain'
where PLAYER_NAME='MD Mehedi Hasan Miraj';

delete from team
where sl_no=25;

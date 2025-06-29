create table T1(
id int ,
name varchar(50),
age int);
insert into T1 values(1,'rijal',25);
insert into T1 values(2,'jamil',15);
insert into T1 values(3,'ramlal',215);
select * from T1;
select *from T1 order by age desc;
select *from T1 order by age asc;
select *from T1 order by NAME asc;
select *from T1 order by ID desc;
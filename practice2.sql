https://dotnettutorials.net/lesson/sql-server-scalar-function/
https://www.sqltutorial.org/sql-subquery/

https://www.codingvila.com/search/label/SQL%20Server
https://www.sqlservertutorial.net/sql-server-string-functions/sql-server-patindex-function/
https://www.mssqltips.com/sqlservertutorial/9361/sql-patindex-function/

create table emp_hyd(eid int,ename varchar(20),salary money)
create table emp_chenin(eid int,ename varchar(20),salary money)
select * from emp_hyd;
select * from emp_chenin;

union:
	no.of the columns,order of the columns,datatype of the columns  should be match.
select * from emp_hyd union emp_chenin
select * from emp_hyd
union
select * from emp_chenin;
select * from emp_hyd
select * from emp_chenin

select * from emp_hyd 
union
select eid,ename from emp_chenin

select eid,ename from emp_hyd 
union
select eid,ename from emp_chenin

select ename,eid from emp_hyd 
union
select eid,ename from emp_chenin

select eid from emp_hyd 
union
select ename from emp_chenin


union all:

select * from emp_hyd
union all
select * from emp_chenin
select * from emp_hyd
select * from emp_chenin

intersect:To return common values from the table.

select * from emp_hyd
intersect
select * from emp_chenin

except:To returns all values from the left hand side table which are not foound in the right hand table.

select* from emp_hyd except select * from emp_chenin

select* from emp_chenin except select * from emp_hyd




retrive methods:-
1)selection: with "where" condition
2)projection: with out "where" condition
3)joins

when we retrive the data more than one table.
 ansi - formate joins(new style):with "ON" keyword join condition.
	inner join
	outer join
		left outer join
		right outer join
		full outer join
	cross join
	natural join
 non ansi formate joins(old style):with "where" key word join condition.
	equi join
	non equi join
	self join


	create table student(stid int,sname varchar(40),smail varchar(40),courseid int)
	select * from student

	create table course(courseid int,cname varchar(40),cfee decimal(6,2))
	select * from course


	select * from student
	select * from course

INNER JOIN:
select * from student join course on student.courseid=course.courseid;
select stid,sname,smail,cname,cfee from student join course on student.courseid=course.courseid;
 
OUTER JOIN:
select * from student s left outer join course c on s.courseid=c.courseid
	select * from student
	select * from course

select * from student s right outer join course c on s.courseid=c.courseid
	select * from student
	select * from course
select * from student s full outer join course c on s.courseid=c.courseid

select * from student cross join course
	select * from student
	select * from course
select s1.stid,s1.sname,s1.smail,s1.courseid from student s1,student s2 where s1.courseid=s2.courseid and s1.sname='adams'
select * from student
select s1.stid,s1.sname,s1.smail,s1.courseid from student s1,student s2 where s1.courseid=s2.courseid and s2.sname='adams'
select * from student









create table p2a (id int,name char(40),age int,address varchar(40),salary money)
insert into p2a values(1,'Ramesh',32,'Ahmedabad',2000)
select * from p2a
insert into p2a values(2,'Khilan',25,'Delhi',1500)
insert into p2a values(3,'kaushik',23,'Kota ',2000)
select * from p2a where id=1,age=32;

select * from p2a
select id,name,age,salary from p2a order by age offset 0 rows fetch next 4 rows only;

select id,name,age,salary from p2a where id in(1,2,3,4) order by age; 
select id,name,age,salary from p2a where id in( select id from p2a) order by age; 

select id,name,age,salary from p2a where id between 1 and  6 order by age;

select isnull(null,'satya')name;
select isnull(null,500)value
select isnull('Hello','satya')greetings;



select id,name,age,address,salary from p2a where id=4 and age>18;
select id,name,age,address,salary from p2a where id=8 and age>18;

select id,name,age,address,salary from p2a where id=4 or age>18;
select id,name,age,address,salary from p2a where id=8 or age>18;
select id,name,age,address,salary from p2a where id=8 or age<18;


with temporytable(averagevalues) as (select avg(salary) from p2a)
select id,name,age,salary from p2a,temporytable where p2a.salary < temporytable.averagevalues;


with temporytable(averagevalues) as (select avg(salary) from p2a)
select id,name,age,salary from p2a,temporytable where p2a.salary > temporytable.averagevalues;


select * from p2a
 
SQL | WITH clause
The SQL WITH clause was introduced by Oracle in the Oracle 9i release 2 database. The SQL WITH clause allows you to give a sub-query block a name (a process also called sub-query refactoring), which can be referenced in several places within the main SQL query.

The clause is used for defining a temporary relation such that the output of this temporary relation is available and is used by the query that is associated with the WITH clause.
Queries that have an associated WITH clause can also be written using nested sub-queries but doing so add more complexity to read/debug the SQL query.
WITH clause is not supported by all database system.
The name assigned to the sub-query is treated as though it was an inline view or table
The SQL WITH clause was introduced by Oracle in the Oracle 9i release 2 database.
Syntax:

WITH temporaryTable (averageValue) as
    (SELECT avg(Attr1)
    FROM Table),
    SELECT Attr1
    FROM Table
    WHERE Table.Attr1 > temporaryTable.averageValue;


In this query, WITH clause is used to define a temporary relation temporaryTable that has only 1 attribute averageValue. averageValue holds the average value of column Attr1 described in relation Table. The SELECT statement that follows the WITH clause will produce only those tuples where the value of Attr1 in relation Table is greater than the average value obtained from the WITH clause statement.

Note: When a query with a WITH clause is executed, first the query mentioned within the  clause is evaluated and the output of this evaluation is stored in a temporary relation. Following this, the main query associated with the WITH clause is finally executed that would use the temporary relation produced.



Queries

Example 1:  Find all the employee whose salary is more than the average salary of all employees.
Name of the relation: Employee


 
EmployeeID	Name	Salary
100011	Smith	50000
100022	Bill	94000
100027	Sam	70550
100845	Walden	80000
115585	Erik	60000
1100070	Kate	69000
SQL Query:

WITH temporaryTable(averageValue) as
    (SELECT avg(salary)
    from p2a), 
        SELECT id,name, salary 
        FROM p2a, temporaryTable 
        WHERE p2a.salary > temporaryTable.averageValue;

		select * from p2a







select id,name,age from p2a group by id having age between 18 and 30;
select id,sum(age) from p2a group by id having sum(age)>=18

insert into p2a values(8,'Ramesh',23,'hyderabad',3900)
select name,count(salary) from p2a group by name having count(salary)>=2000;



select * from p2a


select * from orders
select age,count(age) from p2a group by age having count(age)>=1;
select * from p2a
select * from persons


create table person(id int not null primary key,lastname varchar(255)not null,firstname varchar(255),age int);
insert into person values(1,'Hansen','Ola',30);
insert into person values(2,'Svendson','Tove',23);
insert into person values(3,'Pettersen','Kari',20);
select * from person

create table order_a(orderid int not null primary key,ordernumber int not null,id int foreign key references person(id))
insert into order_a values(1,77895,3)
insert into order_a values(2,44678,3)
insert into order_a values(3,22456,2)
insert into order_a values(4,24562,1)

select * from order_a;


delete from person where id=3; 
drop table person; 
begin transaction
delete from order_a;
select * from person;
select * from order_a;

begin transaction
delete from person;

begin transaction
rollback


create table teachers(teacher_id int,teacher_name varchar(255),subject char(20),salary money);
insert into teachers values(145,'Mark Devid','Mathematics',60000)
insert into teachers values(151,'Jacob Mahtab','English',50000)
insert into teachers values(142,'Lory Bryed','Physics',70000)
insert into teachers values(155,'Simans Gill','Geography',40000)
select * from teachers;

with temporarytable1(averagevalues)as(select avg(salary) from teachers) select teacher_id,teacher_name,salary,averagevalues from teachers,temporarytable1 where teachers.salary > temporarytable1.averagevalues;

with temporarytable1(averagevalues)as(select avg(salary) from teachers) select * from teachers,temporarytable1 where teachers.salary < temporarytable1.averagevalues;


create table car_models(manufacturing_unit int,carbrands varchar(40),model varchar(40),totalcost money)
select len(carbrands) as 'len',carbrands from car_models
select datalength('ford') from car_models
select datalength(carbrands),carbrands from car_models 
insert into car_models values(11211,'Maruti Suzuki','Desizre',650000)
insert into car_models values(11212,'Ford','Classic',800000)
insert into car_models values(11213,'Nissan','DLX',850000)
insert into car_models values(11214,'Toyota','Glanza',700000)
insert into car_models values(11215,'Hyundai','Elitei20',600000)
insert into car_models values(11216,'Hyundaiii','Elitei2000',900000)



select * from car_models;

with totalcost(carbrands,totalcost) as (select carbrands, sum(totalcost) from car_models group by carbrands),carbrandaverage(avgcost) as (select avg(totalcost) from car_models) 
select * from car_models,carbrandaverage where car_models.totalcost > carbrandaverage.avgcost

with totalcost(carbrands,totalcost) as (select carbrands, sum(totalcost) from car_models group by carbrands),carbrandaverage(avgcost) as (select avg(totalcost) from car_models) 
select * from car_models,carbrandaverage where car_models.totalcost < carbrandaverage.avgcost;

 
 select count(id)'count of ids' from p2a;
 select avg(salary)'avg of salarys' from p2a;
 select sum(salary)'sum of the salarys' from p2a;
 select top 3 * from p2a;
 select top 3 * from person;
select top 2 percent * from p2a;

select * from p2a offset 0 rows fetch 2 rows;

select age,count(age)'ages count'from p2a group by age;
select name,count(name)'count of names' from p2a group by name;


create table books(book_id int,book_name varchar(40),price money);
insert into books values(89,'aaa',230)
insert into books values(90,'bbb',430)
insert into books values(91,'ccc',324)
insert into books values(92,'ddd',730)
select * from books

select book_id,price from books where price>=350;

create table books1(book_id int,book_name varchar(40),price money);

/*select count(book_id)'book_id',*/


select * from p2a where id=1 or age=22;
select * from p2a where id=1 and age=22;
select * from p2a where id=1

sp_readererrorlog



Scalar Functions-UPPER,LOWER,LEN, DATALENGTH,GETDATE,COALESCE

LEN : Returns the length of a string
DATALENGTH : Returns the number of bytes used to represent an expression

select upper('satya cognine')
select lower('SATYA Cognine')
select len('satya cognine 125')
select len('satya ')
select DATALENGTH('satya ')
select len(' satya ')
select DATALENGTH(' satya ')
select datalength('satya Cognine 125')
select datalength('ford') from car_models
select datalength(carbrands) from car_models 
select len(carbrands)as 'length of it',carbrands from car_models
select datalength(carbrands) as 'datalength of it',carbrands from car_models
select getdate()
select coalesce(null,null,'satya','cognine',null,null,'125')
SELECT COALESCE(NULL, NULL, NULL, 'W3Schools.com', NULL, 'Example.com');
select coalesce(null,1,null,2,'satya')
SELECT COALESCE('Apple', 'Orange', 'Kiwi', 'Cherry') AS Result1;

SELECT COALESCE(NULL, 'Orange', 'Kiwi', 'Cherry') AS Result2;

SELECT COALESCE(NULL, NULL, 'Kiwi', NULL) AS Result3;

SELECT COALESCE(NULL, NULL, NULL, 'Cherry') AS Result4;

SELECT COALESCE(10, 20, 30, 40, 50) AS Result1;

SELECT COALESCE(NULL, 40, 50, 60) AS Result2;

SELECT COALESCE(NULL, NULL, 4, NULL) AS Result3;

SELECT COALESCE(NULL, NULL, NULL, 95, 105) AS Result4;
select coalesce(name,'n/b')from p2aa




Numeric Functions-ABS, FLOOR, CEILing, ISNUMERIC

select abs(-235.8)
select floor(-235.8)
select floor(235.1)
select floor(235.9)
select floor(22.09)
select ceiling(235.4)
select ceiling(22.09)
select isnumeric(125.5)
select isnumeric('sai')
select floor(-25.6)
select ceiling(-25.6)


Character/String Functions -ASCII,LTRIM, RTRIM,CHARINDEX,CONCAT,FORMAT,
 LEFT, LEN,LOWER,PATINDEX,REPLACE,REPLICATE,REVERSE,RIGHT,STUFF, SUBSTRING,

select ascii('satya')
select ascii('s')
SELECT name, ASCII(name) AS NumCodeOfFirstChar FROM p2a;

select ltrim('  _cognine')
select rtrim('cognine_  ')
select name,charindex('a',name) as matchposition from p2a
select charindex('e','ramesha') as matchposition
select concat('cog',' nine')

DECLARE @d DATETIME = '12/01/2018';
SELECT FORMAT (@d, 'd', 'en-US') AS 'US English Result',
               FORMAT (@d, 'd', 'no') AS 'Norwegian Result',
               FORMAT (@d, 'd', 'zu') AS 'Zulu Result';


select left('cognine in hyderabad',10)as selectedwords
select len('cognine in hyderabad')as length
select lower('Cognine In Hyderabad')
select patindex('%[g]%','cognine')as 'new name'
select patindex('%[^0-9]%','Abcd1234') as new
select replace('cognine','n','N')
select replicate(' cognine',3)
select reverse('cognine')
select right('cognine in hyderabad',17)as selectedwords
select stuff('cognine ',8,4,' htmlabc')
select substring('cognine',1,3)as extrstroing

Conversion Functions-CAST, CONVERT, TRY_CONVERT, TRY_CAST,PARSE
select cast(25.5 as int)number
select cast('123'as int)
select cast('cognine' as int)
select cast(25.5 as char)char
declare @str as varchar(50)
set @str='12121'
select cast(@str as int) as result
select cast('12345678' as decimal(10,2))as result
select cast(123.456 as int) as result
select cast('07/03/2022' as datetime) as result
select cast('07/03/2022' as datetime2) as result
select cast(getdate() as varchar(40))as result
select cast(null as int) as result

select cast('abc' as int)as result
select cast('19/14/2017' as datetime)as result
select cast('19/14/2017' as datetime2)as result
select try_cast('abc'as int)as result
select try_cast('123' as int)as result
select try_cast('19/14/2017' as datetime)as result
select try_cast('19/14/2017' as datetime2)as result
select try_cast(null as int) as result
select convert(int,25.6)int_value
select convert(varchar,25.6)varchar
select convert(datetime,'2022-01-24')
select convert(varchar(50),getdate())as result
select convert(varchar(50),getdate(),100)as result1
select convert(varchar(50),getdate(),101)as result2
select convert(varchar(50),getdate(),102)as result3
select convert(varchar(50),getdate(),103)as result4
select convert(varchar(50),getdate(),104)as result5
select convert(varchar(50),getdate(),105)as result6
select convert(varchar(50),getdate(),106)as 'dd mon yyy'
select convert(varchar(50),getdate(),107)as 'mon dd yyy'

select convert(varchar(50),getdate(),110)as result7


select try_convert(datetime,'2022/01/24')as month 
select try_convert(int,25.6)as intvalue
select try_convert(int,'cognine')as int
declare @sale money
set @sale=1234567.98723
select convert(varchar(50),@sale)as result
select convert(varchar(50),@sale,0)as result1
select convert(varchar(50),@sale,1)as result2
select convert(varchar(50),@sale,2)as result3
select convert(varchar(50),@sale,3)as result4
select convert(varchar(50),@sale,256)as result5
select convert(int,'cognine')as int

select cast('cognine' as int)int
select try_cast('cognine' as int)int
select parse('cognine'as int)
declare @str as varchar(50) set @str='11223' select parse(@str as int)as result;
select parse('1234' as decimal(10,2))as result;
select parse('06/03/2017' as datetime)as result;
select parse('2022/01/24' as datetime)as result;
select parse('01/24/2022' as datetime)as result
select parse('1234' as int)
select parse('cognine' as int)
select parse(null as int)
select try_parse('cognine' as int)
select try_parse(null as int)

Date Functions-GETDATE,CURRENT_TIMESTAMP,DATENAME,DAtePART,DAY,Month,Year,DAtediff,dateadd,EOMONTH,ISDate

select getdate()
select current_timestamp
select datename(year,'2022/01/24')as datepartstringname
select datename(yyyy,'2022/01/24')as datepartstringname
select datename(day,'2022/01/24')
select datename(month,'2022/01/24')
select datediff(year,'2022/01/24','2000/01/01')as datediff
select datediff(year,'2000/01/24','2022/01/01')as datediff
select datediff(day,'2022/01/24','2000/01/01')as datediff
select datediff(month,'2000/01/24','2022/01/01')as datediff
select dateadd(year,1,'2022/01/24')as dateadd
SELECT DATEADD(day, 1, '2017/08/25') AS DateAdd;

declare @date datetime2='';
select eomonth('2022/02/24')as [last day of this month]
select isdate('2022/01/24')
select isdate('12:46:50:950')
select isdate('102030')
select isdate('2022/01/24 12:46:50:950')
select isdate('2022/01/24 12:46:50.00000')


Aggregate Functions-AVG,COUNT,MIN, SUM,MAX,COUNT_BIG

select avg(salary) as 'avg salary' from p2a
select count(id) as 'count of ids' from p2a
select min(salary) as 'minimun sal' from p2a
select sum(age)as 'sum of the ages' from p2a
select sum(salary)as 'sum of the salarys' from p2a
select max(salary) as 'Maximum salary' from p2a
select count_big(salary) as 'count_big' from p2a
select count(salary) as 'count' from p2a



select floor(10/2)
select floor(26.9)
select ceiling(26.1)
select ltrim('  sai')
select * from p2a
select charindex('a',name),name from p2a
select name,charindex('a',name),name from p2a






select * from productlist
select between('2015/01/01'and'2020/12/31') from productlist 
select * from productlist where dom between '2015-01-01' and '2020-12-31'

retrive methods:-
1)selection: with "where" condition
2)projection: with out "where" condition
3)joins

when we retrive the data more than one table.
 ansi - formate joins(new style):with "ON" keyword join condition.
	inner join
	outer join
		left outer join
		right outer join
		full outer join
	cross join
	natural join
 non ansi formate joins(old style):with "where" key word join condition.
	equi join
	non equi join
	self join


	create table student(stid int,sname varchar(40),smail varchar(40),courseid int)
	select * from student

	create table course(courseid int,cname varchar(40),cfee decimal(6,2))
	select * from course


	select * from student
	select * from course

INNER JOIN:
select * from student join course on student.courseid=course.courseid;
select stid,sname,smail,cname,cfee from student join course on student.courseid=course.courseid;
 
OUTER JOIN:
select * from student s left outer join course c on s.courseid=c.courseid
	select * from student
	select * from course

select * from student s right outer join course c on s.courseid=c.courseid
	select * from student
	select * from course
select * from student s full outer join course c on s.courseid=c.courseid

select * from student cross join course
	select * from student
	select * from course
select s1.stid,s1.sname,s1.smail,s1.courseid from student s1,student s2 where s1.courseid=s2.courseid and s1.sname='adams'
select * from student
select s1.stid,s1.sname,s1.smail,s1.courseid from student s1,student s2 where s1.courseid=s2.courseid and s2.sname='adams'
select * from student

select * from p2a

with temporytable(averagevalues) as (select avg(salary) from p2a)
select id,name,age,salary from p2a,temporytable where p2a.salary > temporytable.averagevalues;

4.Write a query which gives employee types in the organization.
select id,name,data_type from p2a
sp_help p2a

5.Write a query which returns Name, FatherName, DOB of employees whose PresentBasic is
i. Greater than 30000.
ii. Less than 3000.
iii. Between 3000 and 5000. (Note:Assume 1 as least unit in currency).

select id,name,age,salary from p2a where salary >2000;
select id,name,age,salary from p2a where salary <= 2000;
select id,name,age,salary from p2a where salary between 2000 and 8000;

select name,salary from 
select max(salary) from p2a
select name,salary from p2a order by salary desc offset 0 rows fetch first 2 row only
select name,salary from p2a where salary=(select max(salary) from p2a)

select * from p2a
select name from p2a where name like 'ram%'
select name from p2a where name like '%ik'
select * from employee where initial '%a-t%'


create table emp1(id int,initial varchar(5),name varchar(40),firstname varchar(20),middlename varchar(20),lastname varchar(20),
                  fathername varchar(20),salary int,DOB date,deptname varchar(10))

insert into emp1 values(101,'R.','sai kumar reddy','sai','kumar','reddy','raju',20000,'11/09/2000','dev'),
					   (102,'L.','konda reddy lekkala','konda','reddy','lekkala','konda',10000,'10/13/2000','QA'),
					   (103,'T.','ramesh kumar thota','ramesh','kumar','thota','naresh',5000,'09/30/1998','HR'),
					   (104,'R.','vikram singh rathode ','vikram','singh','rathode','satya',3000,'05/12/1996','dev'),
					   (105,'N.','rama rao nandamuri','rama','rao','nandamuri','harikrishna',4000,'04/18/1989','QA'),
					   (106,'P.','satya narayana pulamanthula','satya','narayana','pulamanthula','nagaraju',4500,'12/06/1997','dev')
select * from emp1

insert into emp1 values(112,'K.','chandra mahesh kollu','chandra','mahesh','kollu','ramesh',25000,'09-22-1996','HR'),
					   (113,'L.','chandra shekar lekkala','chandra','shekar','lekkala','konda',15000,'03-30-1996','dev')





create table p2aa(id int,initial varchar(20),name varchar(40),firstname varchar(40),middlename varchar(40),lastname varchar(40),fathername varchar(40),dept varchar(20),dob date,salary money)
select * from p2aa
select name,dept from p2aa



1.Write a query to Get a List of Employees who have a one part name.
select name from p2aa where name not like '% %'
select name,left(name,charindex(' ',name)) as onepartname from p2aa
select name,left(name like ' %'))as oneopartname from p2aa
select name from p2aa where name like ' %'
select firstname from p2aa where firstname != null
SELECT name,RTRIM(LEFT(REPLACE(Name,' ',REPLICATE(' ',100)),100)) AS FirstName from p2aa where name is not null
SELECT name,LTRIM(RIGHT(REPLACE(Name,' ',REPLICATE(' ',100)),100)) AS LastName from p2aa
2.Write a query to Get a List of Employees who have a three part name.
select name from p2aa where name like '% % %'
select name,reverse(left(name,charindex('',name))) as threepartname from p2aa
select name,left(name,charindex(' ',name)) as onepartname from p2aa
select name,reverse(name)as tpn,left('tpn',charindex('','tpn')) from p2aa

select name,charindex('a',name),name from p2a
select name,right(name,5) as threepartname from p2aa

SELECT reverse(SUBSTRING(reverse(name), 1, CHARINDEX(' ', reverse(name)) - 1)) AS lastname FROM p2aa
select reverse(substring(reverse(name),1,charindex('',reverse(name)))) as threepartname from p2aa
select * from p2aa
sp_help p2aa
select name from p2aa where 
3.write a query to get a list of Employees who have a First Middle Or last name as Ram, and not anything else
select * from p2aa where name like '%ram%'
select * from p2aa where firstname='ram' or  middlename='ram' or lastname='ram'
4.Write a query which gives employee types in the organization.
select name,dept from p2aa
sp_help p2a
select Distinct  dept from p2aa

5.Write a query which returns Name, FatherName, DOB of employees whose PresentBasic is
i. Greater than 30000.
select name,fathername,dob,salary from p2aa where salary >30000
ii. Less than 3000.
select name,fathername,dob,salary from p2aa where salary <3000
iii. Between 3000 and 5000.
select name,fathername,dob,salary from p2aa where salary between 3000 and 5000

6)Write a query which returns All the details of employees whose Name
i. Ends with 'KHAN'
select name from p2aa where name like '%khan'
ii. Starts with 'CHANDRA'
select name from p2aa where name like 'chandra%'
iii. Is 'RAMESH' and their initial will be in the range of alphabets a-t.
select * from p2aa where initial between 'a' and 't' 
select * from p2aa where initial in('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t')
select name from p2aa where initial='t'





select top(3) * from p2aa
select top(50) percent * from p2aa



















CREATE TABLE Assidetails(Id int,Name varchar(40),FatherName varchar(20),Age int,salary int)
INSERT INTO Assidetails VALUES(1,'ram chandra rao','rao',22,25000),(2,'ramesh reddy ram','ram reddy',22,45000)
SELECT * FROM Assidetails;
select left(Name,CHARINDEX(' ',Name)) AS FirstName,reverse(left (reverse(Name),CHARINDEX(' ',reverse(Name)))) AS LastName FROM Assidetails;
select name,left(name,charindex(' ',name)) as onepartname from assidetails
SELECT * FROM Assidetails;

CREATE TABLE Assidetails1(Id int,Intial varchar(10),FirstName varchar(40),MiddleName varchar(20),LastName varchar(20),
FatherName varchar(20),Department varchar(20),DOB date,salary int);
INSERT INTO Assidetails1 VALUES(1,'c.','ram','chandra','rao','rao','developer','1999/08/22',30000),
(2,'b.','jam','chandra','ram','jio','QA','1998/07/21',4000),
(3,'t.','sat','ram','aitel','airtel','developer','1997/09/23',3000),
(4,'s.','satya','raj','voda','voda','QA','1997/09/29',5000),
(5,'t.','mahesh','ram','idea','vi','QA','1994/09/29',2000),
(6,'e.','chinna','jio','ram','reliance','developer','1994/01/09',40000);
INSERT INTO Assidetails1 VALUES(7,'t.','Ramesh chandra','jio','chandra','reliance','developer','1994/01/09',1000),
(8,'v.','Chandra Khan','airtel','khan','airtel','QA','1994/01/09',10000);
SELECT * FROM Assidetails1 where FirstName='ram' or LastName='ram' or MiddleName='ram';
SELECT Intial+' '+FirstName+' '+MiddleName+' '+LastName AS Name,Department FROM Assidetails1
SELECT Intial+' '+FirstName+' '+MiddleName+' '+LastName AS Name,FatherName ,DOB FROM Assidetails1 WHERE salary>30000
SELECT Intial+' '+FirstName+' '+MiddleName+' '+LastName AS Name,FatherName ,DOB FROM Assidetails1 WHERE salary<3000
SELECT Intial+' '+FirstName+' '+MiddleName+' '+LastName AS Name,FatherName ,DOB FROM Assidetails1 WHERE salary Between 3000 AND 5000
SELECT * FROM Assidetails1 WHERE FirstName like '%khan';
SELECT * FROM Assidetails1 WHERE FirstName like 'chandra%';
SELECT * FROM Assidetails1 WHERE FirstName like '%chandra';
SELECT Intial+' '+FirstName+' '+MiddleName+' '+LastName AS Name FROM Assidetails1 WHERE intial Between 'a.' AND 't.';
select * from Assidetails1;


1. Write a script to extracts all the numerics from Alphanumeric String
declare @str varchar(20)='soe14ce13017'
declare @intnumber int
set @intnumber=patindex('%[^0-9]%',@str)
while @intnumber >0
begin
set @str = stuff(@str,@intnumber,1,'')
set @intnumber = patindex('%[^0-9]%',@str)
end
select @str

2. Write a script to calculate age based on the Input DOB
select datediff(year,'2000-07-23',getdate());


Declare @Today date,@dob date, @TodayN int,@dobN int, @daysBM int, @years int, @months int, @days int  

set @Today = GETUTCDATE()   
set @dob = '1997-02-15'  
  
set @TodayN = convert(nvarchar(10),@Today,112)  
set @dobN = convert(Nvarchar(10),@dob,112)  
set @years = ( @TodayN - @dobN)/10000  
set @months =(1200 + (month(@Today)- month(@dob))*100 + day(@Today) - day(@dob))/100 %12  
set @daysBM = day(dateadd(d,-1,left(convert(Nvarchar(10),dateadd(M,1,@dob),112),6)+'01'))  
set @days = (sign(day(@Today) - day(@dob))+1)/2 * (day(@Today) - day(@dob))+ (sign(day(@dob) - day(@Today))+1)/2 * (@daysBM - day(@dob) + day(@Today))  
 
Select @years as [Yrs],@months [Months],@days [Days]  


3. Create a column in a table and that should throw an error when we do SELECT * or SELECT of that column. If we select other columns then we should see results

 4. Display Calendar Table based on the input year. If I give the year 2017 then populate data for 2017 only

Date e.g.  1/1/2017 

DayofYear 1 – 365/366 (Note 1)

Week 1-52/53

DayofWeek 1-7

Month 1-12

DayofMonth 1-30/31 (Note 2)

Note 1: DayofYear varies depending on the number of days in the given year.

Note 2: DayofMonth varies depending on number of days in the given month

Weekly calculations are always for a 7 day period Sunday to Saturday.

declare @a date ='2017-09-29'
select  datename(dayofyear,@a)as dayofyear,datename(week,@a)as week,datepart(weekday,@a)as dayofweek,datepart(month,@a)as month,datepart(day,@a)as dayofmonth

5.Display Emp and Manager Hierarchies based on the input till the topmost hierarchy. (Input would be empid)

Output: Empid, empname, managername, heirarchylevel



declare @str varchar(20)='soe14ce13017'
declare @intnumber int
set @intnumber=patindex('%[^0-9]%',@str)
while @intnumber >0
begin
set @str = stuff(@str,@intnumber,1,'')
set @intnumber = patindex('%[^0-9]%',@str)
end
select @str

declare @str1 varchar(20)='soe14ce13017'
declare @intnumber1 int
set @intnumber1=patindex('%[^a-zA-Z]%',@str1)
while @intnumber1 >0
begin
set @str1 = stuff(@str1,@intnumber1,1,'')
set @intnumber1 = patindex('%[^a-zA-Z]%',@str1)
end
select @str1


declare @today date,@dob date,@todayn int,@dobn int,@daysbm int,@years int,@months int,@days int
set @dob='2012-02-29'
set @today=getdate()
set @todayn = convert(varchar(10),@today,112)
set @dob = convert(varchar(10),@dob,112)
set @years = (@todayn - @dob)/10000
set @months = (1200 + (month(@today)- month(@dob))*100 + day(@today) - day(@dob))/100 %12  
set @daysbm = day(dateadd(d,-1,left(convert(varchar(10),dateadd(M,1,@dob),112),6)+'01'))  
set @days = (sign(day(@today) - day(@dob))+1)/2 * (day(@today) - day(@dob))+ (sign(day(@dob) - day(@today))+1)/2 * (@daysbm - day(@dob) + day(@today))  
select @years as years,@months as months,@days as days

/** SQL SCRIPT for Age Calculation based on DOB given below in Years , Months , Days ***/  
Declare @Today date,@dob date, @TodayN int,@dobN int, @daysBM int, @years int, @months int, @days int  
----- Inputs ------  
set @Today = GETUTCDATE() /*** Today's Date for Calculation : Please Don't change this **/  
set @dob = '1997-02-15' /** Enter Date_Of_Birth here in YYYY-MM-DD Format **/  
-- Calculcation Part ---  
set @TodayN = convert(nvarchar(10),@Today,112)  
set @dobN = convert(Nvarchar(10),@dob,112)  
set @years = ( @TodayN - @dobN)/10000  
set @months =(1200 + (month(@Today)- month(@dob))*100 + day(@Today) - day(@dob))/100 %12  
set @daysBM = day(dateadd(d,-1,left(convert(Nvarchar(10),dateadd(M,1,@dob),112),6)+'01'))  
set @days = (sign(day(@Today) - day(@dob))+1)/2 * (day(@Today) - day(@dob))+ (sign(day(@dob) - day(@Today))+1)/2 * (@daysBM - day(@dob) + day(@Today))  
--- Final Result of the Query ---  
Select @years as [Yrs],@months [Months],@days [Days]  




select year('2022-02-03')as year
select month('2022-02-03')as month
select day('2022-02-03')as day
CREATE TABLE CalenderTable(ID INT ,NAME VARCHAR(30),AGE INT,DOB DATE);
INSERT INTO CalenderTable VALUES(1,'D2S7A1F3R8',22,'1946/08/22'),(2,'h3j4h5j4j6',24,'1889/02/25'),(3,'h34hbb5bg5h',27,'1946/08/12'),(4,'v98d6d7f6d7f6',19,'1945/06/06');
INSERT INTO CalenderTable VALUES(9,'D2S7A1F3R8',22,'1998/08/22')
select*from CalenderTable;
select datepart(year,dob)as year,datepart(month,dob)as month,datepart(day,dob)as day,datepart(weekday,dob)as weekdays,datename(weekday,dob)as weekday,datename(month,dob)as name_month from calendertable
select datediff(year,'2000-07-23',getdate());
declare @a date ='2017-09-29'
select  datename(dayofyear,@a)as dayofyear,datename(week,@a)as week,datepart(weekday,@a)as dayofweek,datepart(month,@a)as month,datepart(day,@a)as dayofmonth


select * from employeeself
select e.employeeid,e.name as employeename,m.name as manager from employeeself e,employeeself m where m.employeeid=e.managerid

create table c9(id int,name varchar(20),repurting int)
insert into c9 values(131,'pradeep a',000),(117,'konda l',145),(122,'praveen r',145),(123,'avinash a',145),(145,'sumith v',131),(149,'pavan v',122)
select * from c9
select c.id,c.name as employeename,m.name as managername,m.id as managerid from c9 c,c9 m where m.id=c.repurting
select id,name as employeename from c9 where id=(select repurting from c9 where id=117)

select'
Single Row Sub Query
A single-row subquery is used when the outer query's' results are based on a single, unknown value.
Although this query type is formally called "single-row," the name implies that the query returns multiple columns-but only one row of results.
However, a single-row subquery can return only one row of results consisting of only one column to the outer query.

In the below SELECT query, inner MySQL returns only one row i.e. the minimum salary for the company.
It, in turn, uses this value to compare the salary of all the employees and displays only those, whose salary is equal to minimum salary.

SELECT first_name, salary, department_id
FROM employees
WHERE salary = (SELECT MIN (salary)
FROM employees);

A HAVING clause is used when the group results of a query need to be restricted based on some condition.
If a subquery's result must be compared with a group function, you must nest the inner query in the outer query's HAVING clause.

SELECT department_id, MIN (salary)
FROM employees
GROUP BY department_id
HAVING MIN (salary) < (SELECT AVG (salary)
FROM employees);

Multiple Row Sub Query
Multiple-row subqueries are nested queries that can return more than one row of results to the parent query.
Multiple-row subqueries are used most commonly in WHERE and HAVING clauses. Since it returns multiple rows,
it must be handled by set comparison operators (IN, ALL, ANY).While IN operator holds the same meaning as discussed in the earlier chapter,
ANY operator compares a specified value to each value returned by the subquery while ALL compares a value to every value returned by a subquery.
The below query will show the error because single-row subquery returns multiple rows.

SELECT first_name, department_id FROM employees WHERE department_id = (SELECT department_id FROM employees WHERE LOCATION_ID = 100)

's
select * from company
select * from candidate
select * from address
select * from p2a
select * from p2aa
select * from employee
select name,age,id,salary from p2a where salary < all(select salary from p2a where id=1)
select name,age,id,salary from p2a where salary <> any(select salary from p2a where id=1)
select name,age,id,salary from p2a where salary > some(select salary from p2a where id=1)
https://www.sqltutorial.org/sql-subquery/





Sub Queries
Single Row Subqueries
SELECT firstname, salary,id FROM p2aa WHERE salary = (SELECT min(salary) FROM p2aa);

Multi Row Subqueries
select name,firstname,lastname,dept from p2aa where  initial in(select initial from p2aa where initial in('a','b','c','d','g','j'))
select * from p2aa
Any or Some
select firstname,lastname,salary from p2aa where salary <> any(select avg(salary) from p2aa)
ALL
select firstname,lastname,salary from p2aa where salary > all(select salary from p2aa where id=1) order by salary 
Nested Sub Queries
select firstname,lastname,salary from p2aa where salary > all(select salary from p2aa where id=(select id from p2aa where name='ravi')) order by salary 

Co-related Subqueries
select name,department,salary from employeetable e1 where salary in(select max(e2.salary) from employeetable e2 where e2.id=e1.id group by e2.city) order by salary,name 
select name,department,salary from employeetable
Exists and Not Exists
select * from employeetable
select * from projects
select * from p2aa
select title as project from projects where exists(select 1 from employeetable e where salary >2500 and e.id=projects.employeeid)order by title
select title as project from projects where not exists(select 1 from employeetable e where salary >2500 and e.id=projects.employeeid)order by title
select * from projects
Derived Tables

Stored Procedures
Advantages Of Stored Procedures compared to Independent SQL Statements
Stored Procedures
Creating , Altering and Dropping
1)creating sp
create procedure spp2aa as begin select * from p2aa end
execute spp2aa

2)Altering
alter procedure spp2aa as begin select * from p2aa end
execute sp_rename 'spp2aa','sp_storedprocedure'
exec sp_storedprocedure
3)dropping
drop procedure sp_storedprocedure
Optional Parameters :-
Input and Output Parameters, in/out :-
1)
create procedure spaddtwonumbers(@no1 int,@no2 int)
as
begin
declare @result int
set @result = @no1+@no2
print 'result :' +cast(@result as varchar)
end

execute spaddtwonumbers 10,20

execute spaddtwonumbers @no1=10,@no2=20

declare @no1 int,@no2 int
set @no1=10
set @no2=20
execute spaddtwonumbers @no1,@no2
drop proc addtwonumbers

-----------------------------------------------------------------------
create procedure addtwonumbers(@no1 int,@no2 int)
as
begin 
declare @result int
set @result=@no1+@no2
print @result
end
declare @no1 int,@no2 int
set @no1=20
set @no2=30
exec addtwonumbers @no1,@no2
execute addtwonumbers 50,10
exec addtwonumbers @no2=100,@no1=50


----------------------------------------------
alter proc addtwonumbers(@no1 int,@no2 int,@no3 int=Null)
as
begin
declare @result int
set @result = @no1+@no2+@no3
print @result
end
exec addtwonumbers 40,10

exec addtwonumbers @no1=10,@no2=20
-------------------------------------------------------------------------------
 proc emp

-------------------------------------------------------------------------------

1.1)
select * from employeetable
create procedure getemployeetablegenderandage
@gender varchar(20),
@age int
as 
begin
 select id,name,salary,gender,age from employeetable where gender =@gender and age=@age
end
execute getemployeetablegenderandage 'male',25
execute getemployeetablegenderandage 25,'male' ---error
execute getemployeetablegenderandage @age=25,@gender='male'




-- Create Employee Table
CREATE TABLE Employee1
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  DOB DATETIME,
  DeptID INT
)
INSERT INTO Employee1 VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 1)
INSERT INTO Employee1 VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 2)
INSERT INTO Employee1 VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060', 2)
INSERT INTO Employee1 VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 3)
INSERT INTO Employee1 VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 1)
INSERT INTO Employee1 VALUES(6, 'Hina', 'Female','1995-07-12 10:53:27.060', 2)
INSERT INTO Employee1 VALUES(7, 'Hina', 'Female','1995-07-12 10:53:27.060', 2)

1.2)
create procedure spupdateemployeebyid
(@id int,@name varchar(20),@gender varchar(20),@dob datetime,@deptid int)
as
begin 
update employee1 set name=@name,gender =@gender,dob=@dob,deptid=@deptid where id=@id
end
execute spupdateemployeebyid 3,'Palak', 'Female', '1994-06-17 10:53:27.060', 3
execute spupdateemployeebyid @id=7,@gender ='female',@dob='1994-06-17 10:53:27.060',@deptid=3,@name='Joy'


------------------------------------------------------
alter proc spupdateemployeebyid
(@id int,@name varchar(20)='n/a',@gender varchar(20),@dob datetime,@deptid int)
as
begin
insert into employee1 values (@id,@name,@gender,@dob,@deptid)
end

exec spupdateemployeebyid 8,'male','07/02/2022',22

------------------------------------------------------
2)
create procedure spgetresult
@no1 int,@no2 int,@result int output
as 
begin
set @result = @no1+@no2
end

declare @result int
execute spgetresult 10,20,@result out
print 'result is :'+cast(@result as varchar)
print @result

select * from p2aa
select * from employeetable

2.1)
create procedure getemployeecountbydept
@dept varchar(20),
@p2aacount int output
as
begin
select @p2aacount=count(id) from p2aa where dept=@dept
end

declare @p2aatotal int
execute getemployeecountbydept 'dev',@p2aatotal output
print @p2aatotal

declare @p2aatotal int
execute getemployeecountbydept 'dev',@p2aatotal
print @p2aatotal

declare @p2aatotal int
execute getemployeecountbydept 'dev',@p2aatotal 
if (@p2aatotal is null)
 print '@p2aatotal is null'
else
 print '@p2aatotal is not null'
 print @p2aatotal

select * from p2aa














































































































































































































































































































































































































































































































































































































































































































































































SQL SERVER String Functions:
ASCII	Returns the ASCII value for the specific character
select sname,ascii(sname)as 'numcodeoffirstchar' from student

CHAR	Returns the character based on the ASCII code
select char(97)as'charcter of 97'
CHARINDEX	Returns the position of a substring in a string
select charindex('t','Customer') as 'matchposition'
CONCAT	Adds two or more strings together
select concat('cog','nine',' hyd') as 'adding string'
Concat with +	Adds two or more strings together
select 'cog'+'nine'+' hyd'
CONCAT_WS	Adds two or more strings together with a separator
select concat_ws('.','www','google','com')
select concat_ws(',','cognine',' hyderabad')
DATALENGTH	Returns the number of bytes used to represent an expression
select datalength('cognine')
DIFFERENCE	Compares two SOUNDEX values, and returns an integer value
select difference('juice','jucy')
FORMAT	Formats a value with the specified format
LEFT	Extracts a number of characters from a string (starting from left)
LEN	Returns the length of a string
LOWER	Converts a string to lower-case
LTRIM	Removes leading spaces from a string
NCHAR	Returns the Unicode character based on the number code
PATINDEX	Returns the position of a pattern in a string
select patindex('%schools%','w3schools.com')
select patindex('%aty%','satya')
select patindex('%_t%','satya')
select patindex('%t_%','satya')
select patindex('%[nin]%','cognine')
select patindex('%[^nin]%','cognine')
select patindex('%[^cog]%','cognine')
select patindex('%g%ne%','cognine')

QUOTENAME	Returns a Unicode string with delimiters added to make the string a valid SQL Server delimited identifier
REPLACE	Replaces all occurrences of a substring within a string, with a new substring
REPLICATE	Repeats a string a specified number of times
REVERSE	Reverses a string and returns the result
RIGHT	Extracts a number of characters from a string (starting from right)
RTRIM	Removes trailing spaces from a string
SOUNDEX	Returns a four-character code to evaluate the similarity of two strings
SPACE	Returns a string of the specified number of space characters
STR	Returns a number as string
STUFF	Deletes a part of a string and then inserts another part into the string, starting at a specified position
SUBSTRING	Extracts some characters from a string
TRANSLATE	Returns the string from the first argument after the characters specified in the second argument are translated into the characters specified in the third argument.
TRIM	Removes leading and trailing spaces (or other specified characters) from a string
UNICODE	Returns the Unicode value for the first character of the input expression
UPPER	Converts a string to upper-case























































































































































































































































































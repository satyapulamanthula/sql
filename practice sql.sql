https://www.tutorialsteacher.com/sqlserver/create-primary-keys#create-pk-using-ssms
https://www.tutorialsteacher.com/sql/sql-merge-statement

commit
create table EMPL (EMP_ID int,EMP_NAME char(40),EMP_LOC varchar(30));
begin transaction
insert into EMPL values(100,'Amit','pune');
insert into EMPL values(200,'Raju','munbai');
insert into EMPL values(300,'Ram','chenni');
select * from empl;
begin transaction
rollback;

begin transaction
update EMPL set EMP_LOC='stockholm' where EMP_ID=100;
commit;

begin transaction
update EMPL set EMP_LOC='Bangalore' where EMP_NAME = 'Amit';
begin transaction
Rollback;
drop table EMPL;

create table ORDERS(ORDER_ID int,ITEM_NAME char(40));
select * from ORDERS;
begin transaction
insert into ORDERS values(100,'Laptop');
insert into ORDERS values(200,'Mobile');
begin transaction
insert into ORDERS values(300,'Cell Phone');
commit;
begin transaction
update ORDERS set ITEM_NAME='Smart Phone' where ORDER_ID=300;
savepoint a;
begin transaction
insert into ORDERS values (400,'mixer');
savepoint b;

begin transaction
rollback a;




create table ORDERS1(ORDER_ID int,ITEM_NAME char(40));
create table ORDERS2(ORDER_ID int,ITEM_NAME char(40));
select * from ORDERS1;
select * from ORDERS;


create table a(empid int,firstname char(40),lastname char(40),email varchar(50),phoneno bigint,salary int,deptid int
)
insert into a values(1,'jone','king','jone.king@abc.com',9876543210,33000,1)
insert into a (empid,firstname,lastname,deptid)values(2,'james','bond',2)
insert into a values(3,'neena','kochhar','neena@test.com',9876543211,17000,2)
insert into a values(4,'lex','de haan','lex@test.com',9876543212,15000,1)
update a set email=' 'where empid=2;
update a set phoneno, where empid=2;
delete a where empid=1;
alter table a alter column empid int not null unique;
update employee set email='null' where emp_id=006;
select * from a;
create table adepartment (deptid int,name char(40));
insert into adepartment values (1,'finance');
insert into adepartment values (2,'HR');
select * from adepartment;
select * from a where salary>16000;
select * from a where salary between 15000 and 20000;
select * from a where deptid=1 and salary>20000;
select * from a where deptid=(select deptid from adepartment where name='hr');

insert into a values(5,'amit','patel',' ',98766543213,18000,1);
insert into a values(6,'abdul','kalam','abdul@test.com',98766432104,25000,2);
select * from a;
select * from adepartment;
select deptid,count(*) as 'no of employrrs' from a group by deptid;

select deptid,count(empid) as 'no of Employees' from a group by deptid;

select dept.name as 'department',count(emp.empid) as 'no of employees' from a emp,adepartment dept where emp.deptid=dept.deptid group by dept.name;

select dept.name, sum(emp.salary) as 'total salaries' from a emp, adepartment dept where emp.deptid=dept.deptid group by dept.name;

it is going thorugh an error
select dept.name, sum(emp.salary) as 'total salaries' from a emp, adepartment dept where emp.deptid=dept.deptid group by dept.deptid;

select avg(salary) as average from a;
select deptid, avg(salary) as average from a group by deptid;

select max(salary) as 'highest salary' from a;
select * from a where salary=(select max(salary) from a);
select deptid, max(salary) as 'highest salary' from a group by deptid;
select max(firstname) as 'largest name' from a;
select max(lastname) as 'largest lastname name' from a;

select min(salary) as 'lowest salary' from a;
select deptid,min(salary) as 'lowest salary' from a group by deptid;
select min(firstname) as 'smallest firstname' from a;
select min(lastname) as 'smallest lastname' from a;
select * from a where salary=(select min(salary) from a);
select deptid,count_big(*) as 'no of employrrs' from a group by deptid;
select deptid,count(*) as 'no of employrrs' from a group by deptid;
select count_big(salary) as 'no of employrrs' from p2a group by name;
select * from p2a
select count_big(salary)as 'abc',salary from p2a;


select count(id) from p2a




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





FUNCTIONS IN SQL:

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


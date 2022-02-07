https://dotnettutorials.net/lesson/row_number-function-sql-server/
https://dotnettutorials.net/lesson/self-join-sql-server/
https://dotnettutorials.net/lesson/having-clause-sql-server/

create table employeetable(id int primary key,name varchar(100)not null,department varchar(100)not null,salary float not null,gender varchar(45)not null,age int not null,city varchar(45)not null)
INSERT INTO employeetable (Id, Name, Department, Salary, Gender, Age, City) VALUES (1001, 'John Doe', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO employeetable (Id, Name, Department, Salary, Gender, Age, City) VALUES (1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'London');
INSERT INTO employeetable (Id, Name, Department, Salary, Gender, Age, City) VALUES (1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO employeetable (Id, Name, Department, Salary, Gender, Age, City) VALUES (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO employeetable (Id, Name, Department, Salary, Gender, Age, City) VALUES (1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'London');
INSERT INTO employeetable (Id, Name, Department, Salary, Gender, Age, City) VALUES (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'Mumbai');
INSERT INTO employeetable (Id, Name, Department, Salary, Gender, Age, City) VALUES (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO employeetable (Id, Name, Department, Salary, Gender, Age, City) VALUES (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO employeetable (Id, Name, Department, Salary, Gender, Age, City) VALUES (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO employeetable (Id, Name, Department, Salary, Gender, Age, City) VALUES (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');
select * from employeetable

create table projects(projectid int primary key identity(1,1),title varchar(100)not null,clientid int,employeeid int,startdate datetime,enddate datetime,foreign key(employeeid) references employeetable(id));
INSERT INTO Projects (Title, ClientId, EmployeeId, StartDate, EndDate) VALUES 
('Develop ecommerse website from scratch', 1, 1003, GETDATE(), (Getdate() + 35)),
('WordPress website for our company', 1, 1002, GETDATE(), (Getdate() + 45)),
('Manage our company servers', 2, 1007, GETDATE(), (Getdate() + 55)),
('Hosting account is not working', 3, 1009, GETDATE(), (Getdate() + 65)),
('MySQL database from my desktop application', 4, 1010, GETDATE(), (Getdate() + 75)),
('Develop new WordPress plugin for my business website', 2, NULL, GETDATE(), (Getdate() + 85)),
('Migrate web application and database to new server', 2, NULL, GETDATE(), (Getdate() + 95)),
('Android Application development', 4, 1004, GETDATE(), (Getdate() + 60)),
('Hosting account is not working', 3, 1001, GETDATE(), (Getdate() + 70)),
('MySQL database from my desktop application', 4, 1008, GETDATE(), (Getdate() + 80)), 
('Develop new WordPress plugin for my business website', 2, NULL, GETDATE(), (Getdate() + 90));
select * from projects

select * from employeetable
select * from projects
select id as employeeid,name,department,city,title as project,clientid from employeetable join projects on employeetable.id=projects.employeeid

INNER JOIN:-
select id as employeeid,name,department,city,title as project,clientid from employeetable inner join projects on employeetable.id=projects.employeeid
select id as employeeid,name,department,city,title as project,clientid from employeetable join projects on employeetable.id=projects.employeeid
OUTER JOIN:-

LEFT OUTER JOIN:-

select id as employeeid,name,department,city,title as project,clientid from employeetable left join projects on employeetable.id=projects.employeeid
RIGHT OUTER JOIN;-

select id as employeeid,name,department,city,title as project,clientid from employeetable right join projects on employeetable.id=projects.employeeid
FULL OUTER JOIN;-

select id as employeeid,name,department,city,title as project,clientid from employeetable full join projects on employeetable.id=projects.employeeid
CROSS JOIN:-

select employeetable.id as employeeid,name,department,city,title as project from employeetable cross join projects
SELF JOIN:

select * from employeeself
select e.name as employee,m.name as manager from employeeself e left join employeeself m on e.managerid=m.employeeid
select e.name as employee,m.name as manager from employeeself e right join employeeself m on e.managerid=m.employeeid
select e.name as employee,m.name as manager from employeeself e join employeeself m on e.managerid=m.employeeid
select e.name as employee,m.name as manager from employeeself e cross join employeeself m

select c.fullname as candidate,co.fullname as company from candidate c left join candidate co on c.companyid=co.candidateid
select c.fullname as candidate,co.fullname as company from candidate c right join candidate co on c.companyid=co.candidateid
select c.fullname as candidate,co.fullname as company from candidate c inner join candidate co on c.companyid=co.candidateid
select c.fullname as candidate,co.fullname as company from candidate c cross join candidate co

select * from company
select * from candidate




Inner join:--
create table company(companyid int identity primary key,companyname varchar(50)null)
insert into company values('DELL')
insert into company values('HP')
insert into company values('IBM')
insert into company values('Microsoft')
select * from company

create table candidate(CandidateId int identity primary key,FullName varchar(50) NULL,CompanyId int references Company(CompanyId));
INSERT Candidate VALUES('Ron',1)
INSERT Candidate VALUES('Pete',2)
INSERT Candidate VALUES('Steve',3)
INSERT Candidate VALUES('Steve',NULL)
INSERT Candidate VALUES('Ravi',1)
INSERT Candidate VALUES('Raj',3)
INSERT Candidate VALUES('Kiran',NULL)
select * from candidate

select * from company 
select * from candidate
select * from address
select candidateid,fullname,candidate.Companyid,companyname from candidate inner join company on company.companyid=candidate.Companyid
select candidateid,company.companyid,fullname,companyname from company join candidate on company.companyid=candidate.Companyid
select * 

                                                                                   company(companyid)
create table address(addressid int identity primary key,candidateid int references candidate(candidateid),country varchar(50),state varchar(50),city varchar(50))
INSERT INTO Address Values (1, 'India', 'Odisha', 'BBSR');
INSERT INTO Address Values (2, 'India', 'Maharashtra', 'Mumbai');
INSERT INTO Address Values (3, 'India', 'Maharashtra', 'Pune');
INSERT INTO Address Values (4, 'India', 'Odisha', 'Cuttack');
select * from company
select * from candidate
select * from address
select candidate.candidateid,candidate.companyid,company.companyname,country,state,city from candidate join company on candidate.companyid=company.companyid join address on address.candidateid=candidate.candidateid 
select candidate.candidateid,candidate.companyid,company.companyname,country,state,city from candidate join company on candidate.companyid=company.companyid left join address on address.candidateid=candidate.candidateid 

select cand.candidateid,cand.fullname,cand.companyid,comp.companyname from candidate cand inner join company comp on cand.companyid=cand.companyid
select cand.candidateid,cand.fullname,cand.companyid,comp.companyname,addr.country,addr.state,addr.city from candidate cand inner join company comp on cand.companyid=comp.companyid inner join address addr on addr.candidateid=cand.candidateid









self join:-
create table employeeself(employeeid int Primary Key,name VARCHAR(20),managerid INT
INSERT INTO employeeself VALUES(1, 'Pranaya', 3)
INSERT INTO employeeself VALUES(2, 'Priyanka', 1)
INSERT INTO employeeself VALUES(3, 'Preety', NULL)
INSERT INTO employeeself VALUES(4, 'Anurag', 1)
INSERT INTO employeeself VALUES(5, 'Sambit', 1)
select * from employeeself
select e.name as employee,m.name as manager from employeeself e left join employeeself m on e.managerid=m.employeeid
select e.name as employee,m.name as manager from employeeself e inner join employeeself m on e.managerid =m.employeeid
select e.name as employee,m.name as manager from employeeself e cross join employeeself m
select e.name as employee,m.name as manager from employeeself e cross join employeeself m where e.employeeid = m.employeeid

SET OPERATORS:
SET operators are mainly used to combine the same type of data from two or more tables. Although more than one select statement will then be present,
only one result set is returned.

UNION	Combine two or more result sets into a single set, without duplicates.
UNION ALL	Combine two or more result sets into a single set, including all duplicates.
INTERSECT	Takes the data from both result sets which are in common.
EXCEPT	Takes the data from first result set, but not the second (i.e. no matching to each other)

create table students2000(name varchar(15),totalmarks int)
create table students2005(name varchar(15),totalmarks int)
INSERT INTO Students2000 VALUES('Robert',1063);
INSERT INTO Students2000 VALUES('John',1070);
INSERT INTO Students2000 VALUES('Rose',1032);
INSERT INTO Students2000 VALUES('Abel',1002);
insert into students2000 values(' ',1086)

INSERT INTO Students2005 VALUES('Robert',1063);
INSERT INTO Students2005 VALUES('Rose',1032);
INSERT INTO Students2005 VALUES('Boss',1086);
INSERT INTO Students2005 VALUES('Marry',1034);


create table students2006(name varchar(15),totalmarks int)
INSERT INTO Students2006 VALUES('john',1070);
INSERT INTO Students2006 VALUES('Abel',1002);
INSERT INTO Students2006 VALUES('Marry',1034);
INSERT INTO Students2006 VALUES('Boss',1086);
insert into students2006 values('abcd',1099);
INSERT INTO Students2006 VALUES('Robert',1063);
select * from students2000
select * from students2005
select * from students2006

TOP n cluse:-

UNION ALL:-
select * from students2000
union all
select * from students2005
union all
select * from students2006
select * from students2000
select * from students2005

UNION:-
select * from students2000
union
select * from students2005
union
select * from students2006

select * from students2000
select * from students2005

INTERSECT:-
select * from students2000
intersect
select * from students2005
intersect
select * from students2006
select * from students2000
select * from students2005

EXCEPT:-
select * from students2000 EXCEPT select * from students2005 except select * from students2006
select * from students2000
select * from students2005
select * from students2000
minus
select * from students2005
select * from students2000
select * from students2005

select top(3) * from employeetable where salary>10000 order by id
select top(70)percent * from employeetable where salary>10000 order by name
select top(3) with ties * from employeetable order by name

select name,totalmarks,rank() over(order by totalmarks desc) as rank from students2000
select name,totalmarks,dense_rank() over(order by totalmarks desc) as denserank from students2000
select name,totalmarks,row_number() over(order by totalmarks desc) as rownumber from students2000
select name,totalmarks,ntile(3) over(order by totalmarks desc) as rownumber from students2000

OUTER/CROSS APPLYS:-
select * from students2000 outer apply (select * from students2005 where students2000.totalmarks=students2005.totalmarks)tab
select * from students2000 left join students2005 on students2000.totalmarks=students2005.totalmarks
select * from students2000 cross apply (select * from students2005 where students2000.totalmarks=students2005.totalmarks)tab
select * from students2000  join students2005 on students2000.totalmarks=students2005.totalmarks
select * from students2000 cross join students2005

create table emplo(emp_id int primary key,emp_name varchar(20),manager_id int,project_id int)
select * from emplo
create table projectt(project_id int,project_name varchar(20),department varchar(30))
select * from projectt

CROSS APPLY:-
select * from projectt as pro inner join emplo as emp on pro.project_id=emp.project_id
select * from projectt as pro cross apply (select * from emplo as emp where pro.project_id=emp.project_id)tab
OUTER APPLY:-
select * from projectt as pro left join emplo as emp on pro.project_id=emp.project_id
select * from projectt as pro outer apply (select * from emplo as emp where pro.project_id=emp.project_id)tab
select * from company
select * from candidate 
select cand.candidateid,cand.fullname,cand.companyid,com.companyid,com.companyname from candidate cand left join company com on cand.companyid=com.companyid
select cand.candidateid,cand.fullname,cand.companyid,com.companyid,com.companyname from candidate cand left join company com on cand.companyid=com.companyid where com.companyid is null
select cand.candidateid,cand.fullname,cand.companyid,com.companyid,com.companyname from candidate cand left join company com on cand.companyid=com.companyid where com.companyid is not null
select * from candidate as cand outer apply (select * from company as com where cand.companyid=com.companyid)tab
select * from candidate as cand cross apply (select * from company as com where cand.companyid=com.companyid)tab


select * from p2aa
select * from p2a

select * from employeetable
select * from projects
 select * from projects where clientid=3
select id,firstname,lastname from p2aa where initial in('a','b','c','d','e','f','g','h') order by firstname,lastname
select id,name,gender,age from employeetable where id in(select employeeid from projects where clientid=1) order by name
select id,name,gender,age from employeetable where id not in(select employeeid from projects where clientid=1) order by name
select id,name,gender,age from employeetable where not exists(select 1 from projects where projects.employeeid=employeetable.id)
select id,name,gender,age from employeetable where exists(select 1 from projects where projects.employeeid=employeetable.id)





https://www.sqltutorial.org/sql-subquery/

select * from company
select * from candidate
select * from address
select can.candidateid,can.fullname,com.companyname,address.country,address.state,address.city from company com join candidate can on can.candidateid=com.companyid left join address address on address.candidateid=can.Candidateid where can.Candidateid<>0
select can.candidateid,can.fullname,com.companyname,address.country,address.state,address.city from company com join candidate can on can.candidateid=com.companyid  join address address on address.candidateid=can.Candidateid where can.Candidateid=


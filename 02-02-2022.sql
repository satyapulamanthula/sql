1. Write a script to extracts all the numerics from Alphanumeric String
solution:
declare @alphanumeric varchar(20)='ram127raju56'
declare @intnumber int
set @intnumber = patindex('%[a-zA-Z]%',@alphanumeric)
while @intnumber >0
begin
set @alphanumeric = stuff(@alphanumeric,@intnumber,1,'')
set @intnumber = patindex('%[a-zA-Z]%',@alphanumeric)
end
select @alphanumeric

2. Write a script to calculate age based on the Input DOB
solution:
select datediff(year,'2000-07-23',getdate())as total_age

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
solution:
declare @a date ='2017-09-29'
select  datename(dayofyear,@a)as dayofyear,datename(week,@a)as week,datepart(weekday,@a)as dayofweek,datepart(month,@a)as month,datepart(day,@a)as dayofmonth

5.Display Emp and Manager Hierarchies based on the input till the topmost hierarchy. (Input would be empid)

Output: Empid, empname, managername, heirarchylevel
solution:
select e.employeeid as Empid,e.name as empname,m.name as managername,m.managerid as managerid from employeeself e,employeeself m where m.employeeid=e.managerid
select c.id,c.name as employeename,m.name as managername,m.id as managerid from c9 c,c9 m where m.id=c.repurting
select id,name as employeename from c9 where id=(select repurting from c9 where id=117)

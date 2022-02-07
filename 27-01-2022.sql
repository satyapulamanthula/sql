1.Write a query to Get a List of Employees who have a one part name.
solution:
select name from p2aa where name not like '% %'
select name from p2aa
select name,left(name,charindex(' ',name)) as onepartname from p2aa where name is not null
select name,rtrim(left(replace(Name,' ',replicate(' ',100)),100)) as firstname from p2aa where name is not null
2.Write a query to Get a List of Employees who have a three part name.
solution:
select name from p2aa where name like '% % %'
3.write a query to get a list of Employees who have a First Middle Or last name as Ram, and not anything else
solution:
select * from p2aa where name like '%ram%'
4.Write a query which gives employee types in the organization.
solution:
select name,dept from p2aa
select Distinct  dept from p2aa
5.Write a query which returns Name, FatherName, DOB of employees whose PresentBasic is
i. Greater than 30000.
solution:
select name,fathername,dob,salary from p2aa where salary >30000
ii. Less than 3000.
solution:
select name,fathername,dob,salary from p2aa where salary <3000
iii. Between 3000 and 5000. (Note:Assume 1 as least unit in currency).
solution:
select name,fathername,dob,salary from p2aa where salary between 3000 and 5000
6.Write a query which returns All the details of employees whose Name
i. Ends with 'KHAN'
solution:
select name from p2aa where name like '%khan'
ii. Starts with 'CHANDRA'
solution:
select name from p2aa where name like 'chandra%'
iii. Is 'RAMESH' and their initial will be in the range of alphabets a-t.
solution:
select * from p2aa where initial between 'a' and 't' 
select * from p2aa where initial in('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t')

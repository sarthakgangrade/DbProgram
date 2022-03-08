select * from sys.databases

create database Stored_employee;

use Stored_employee;

create table employee
(
id int Identity(1,1) primary key,
name varchar(200),
salary money,
startDate date
)


select * from employee;


insert into employee values 
('sarthak',5000,'2019-03-01'),
('mishti',23000.20,'2-09-2016'),
('Bill',12000.33,'2-11-2018'),
('Meena',5500.200,'1-03-2019'),
('Charlie',456123,'2-02-2020')

select id,name from employee where salary=5000.00

ALTER TABLE employee ADD gender varchar(20),city varchar(30)

update employee set gender='F' where name = 'Meena'
update employee set gender ='M' where id not in (2,4)

 DELETE FROM employee WHERE id IN (6,7,8,9,10)
 
 select * from employee order by name
 select * from employee order by name desc

 select id,name,salary,startDate from employee order by salary offset 2 Rows
 select id,name,salary,startDate from employee order by salary desc offset 2 Rows
 
 select id,name,salary,startDate from employee order by salary desc offset 2 Rows fetch next 2 Rows only
 select id,name,salary,startDate from employee order by salary desc offset 2 Rows fetch first 2 Rows only
 
 
 
 select top 2 name,salary,gender from employee order by salary desc
 select top 2 name,salary,gender from employee order by salary

 select top 10 PERCENT name,salary from employee order by salary desc
 select top 10 PERCENT name,salary from employee order by salary

 select distinct salary from employee

 insert into employee values 
('samarth',5000,'2020-03-01','M','Madras'),
('arti',24100.20,'9-09-2016','F','delhi'),
('harsh',135000.33,'6-11-2018','M','patna'),
('harshita',12000.33,'2-12-2018','F','Ratlam')

select name,salary,city from employee where salary between 5000 and 25000
select name,salary,city from employee where salary like '%5000%'




ALTER TABLE employee ADD lname varchar(20)
update employee set lname='gangrade' where name = 'sarthak'
update employee set lname='singh' where name = 'harsh'
update employee set lname='rawat' where name = 'harshita'
update employee set lname='Naik' where name = 'arti'


select name + ' ' + lname as fullname from employee

create table employee_post
(
id int Identity(1,1) primary key,
Postname varchar(200),
experience int
)

select * from employee_post

insert into employee_post values 
('software devloper','2'),
('frontend deveeloper' ,'1')


--inner join
select 
e.id employeeid,
e.name employee_name,
p.Postname Post,
p.experience exp,
e.salary salary
from 
employee e inner join employee_post p on salary=salary; 

--left join
select 
e.id employeeid,
e.name employee_name,
p.Postname Post,
p.experience exp,
e.salary salary
from 
employee e left join employee_post p on salary=salary;

--right join
select 
e.id employeeid,
e.name employee_name,
p.Postname Post,
p.experience exp,
e.salary salary
from 
employee e right join employee_post p on salary=salary
where salary < 30000

--full join
select 
e.id employeeid,
e.name employee_name,
p.Postname Post,
p.experience exp,
e.salary salary
from 
employee e full join employee_post p on salary=salary

--cross join
select 
e.id employeeid,
e.name employee_name,
p.Postname Post,
p.experience exp,
e.salary salary
from 
employee e cross join employee_post p 
order by 
name

--group by
select sum(salary) as Msalary FROM employee WHERE gender = 'M' GROUP BY gender

--grouping sets
select gender,sum(salary) FROM employee WHERE gender = 'M' GROUP BY gender


exec dbo.SelectAllemployees;
exec dbo.Selectemployeebycity @city = 'delhi';
exec Changescitynamess;
exec deleteData @id=4;
exec createTable;
exec insertdata;

exec TryCatchinsertdata;
exec TryCatchChangecitynamess; 
exec TrycatchdeleteData @id=4;

select * from start


--if else
begin
select * from employee where city='delhi' 
if @@ROWCOUNT=0
begin print 'no such data in table'
end
else
begin print 'displaying'
end
end


--cursor
Declare @name varchar(200) ,@city varchar(30)
DECLARE s2 CURSOR 
FOR SELECT name,city FROM employee
OPEN s2
FETCH Next FROM s2 into @name,@city
print @name+''+@city
--FETCH LAST FROM s2 into @name,@city

CLOSE s2
deallocate s2



Declare  @salary money
DECLARE s2 CURSOR 
FOR SELECT salary FROM employee
OPEN s2
--FETCH Next FROM s2 into @salary
while @@FETCH_STATUS=0
if @salary<40000
begin
print 'salary'+'='+ @salary
FETCH Next FROM s2 into @salary
end

--FETCH Next FROM s2 into @salary

--FETCH LAST FROM s2 into @name,@city

CLOSE s2

deallocate s2


Declare @name varchar(200),@city varchar(30);
Declare cursor_Emp Cursor
for select name,city from employee;
open cursor_Emp;
fetch Next from cursor_Emp into @name,@city;
while @@FETCH_STATUS = 0
begin
print @name +':'+ @city 
fetch next from cursor_Emp into @name,@city;
end;
close cursor_Emp;
Deallocate cursor_Emp;







--Transactions--
--Auto Commit Transaction by default
Select * from employee
Exec CURD_Operation @Name='Jasica',@Salary=85000,@StartDate='2021-01-28',@gender='F',@City='Mumbai',@lname='jain',@Choice='Insert'

Exec CURD_Operation @Name='Vikrant',@Salary=85000,@StartDate='2008-04-21',@gender='M',@City='Noida',@lname='jain',@Choice='Update',@id=13

Exec CURD_Operation @id=28,@Choice='Delete'
select @@TRANCOUNT

--Implicit Transaction ON 
begin transaction
set IMPLICIT_TRANSACTIONS on
Select * from employee

Exec CURD_Operation @Name='neha',@Salary=38000,@StartDate='2019-01-18',@gender='F',@City='Mumbai',@lname='singh',@Choice='Insert'

Exec CURD_Operation @Name='Ranveer',@Salary=85000,@StartDate='2008-04-21',@gender='M',@City='Noida',@lname='singh',@Choice='Update',@id=13

Exec CURD_Operation @id=12,@Choice='Delete'
select @@TRANCOUNT as OpenTransactions

--COMMIT
--ROLLBACK transaction
select @@TRANCOUNT as OpenTransactions
Declare @Select int; 
set @Select=0;
if @Select=2
Begin
	COMMIT
end
else
Begin
	ROLLBACK
end

--EXPLICIT TRANSACTIONS
Begin TRANSACTION 
Select * from employee
Exec CURD_Operation @Name='dansh',@Salary=55000,@StartDate='2022-05-28',@gender='M',@City='Delhi',@lname='singh',@Choice='Insert'

Exec CURD_Operation @Name='kanchi',@Salary=85000,@StartDate='2019-01-22',@gender='F',@City='Hyderabad',@lname='singh',@Choice='Update',@id=2

Exec CURD_Operation @id=13,@Choice='Delete'

Declare @Sel int; 
set @Sel=0;
if @Sel=2
Begin
	COMMIT
end
else
Begin
	ROLLBACK
end
--Savepoint Command
--used for partial commit & partial Rollback
Begin Transaction
Exec CURD_Operation @name='Harsh',@salary=65000,@startDate='2022-08-21',@gender='M',@city='Noida',@lname='Singh',@Choice='Insert'
Save Transaction Deleted
	Exec CURD_Operation @id=12,@Choice='Delete'
	Exec CURD_Operation @id=2,@Choice='Delete'
	
Rollback Transaction Deleted
Commit
select * from employee

Create function Fun_EmployeeInformation()      
returns table       
as      
return(select * from employee  ) 

select * from Fun_EmployeeInformation()


create function perticularidEmployee(@id int)
returns table
as
return(select * from employee where id=@id)


select * from dbo.perticularidEmployee(2)



CREATE FUNCTION dbo.UDF_YearlyIncome(@salary money)
RETURNS money
AS
BEGIN 
   RETURN (12* @salary)
END 
GO	


select dbo.UDF_YearlyIncome(1200)




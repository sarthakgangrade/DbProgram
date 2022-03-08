
CREATE PROCEDURE SelectAllemployees
AS
SELECT * FROM employee
GO;


CREATE PROCEDURE Selectemployeebycity @city nvarchar(30)
AS
SELECT * FROM employee WHERE city = @city
GO

Create	PROCEDURE Changescitynamess
as
update employee set city='delhi' where id in (1,2)
go

Create PROCEDURE createTable
as 
create table start
(
id int Identity(1,1) primary key,
name varchar(200),
startDate date
)
go


Create Procedure insertdata
as
insert into start values ('sarthak','2019-03-01')
go

create Procedure deleteData
(@id int)
as
DELETE FROM employee WHERE id=@id
go


create Procedure TryCatchinsertdata
as
BEGIN TRY  
      Insert into start values('Nandu','2019-03-05')
END TRY  
BEGIN CATCH  
SELECT
ERROR_NUMBER() AS ERRORNumber,
ERROR_STATE() AS ERRORState,
ERROR_PROCEDURE() AS ERRORProcedure,
ERROR_LINE() AS ERRORLine,
ERROR_MESSAGE() AS ERRORMessage;

  
END CATCH  
;
exec TryCatchinsertdata


---delete using try catch
create Procedure TrycatchdeleteData
(@id int)
as
begin TRY
DELETE FROM employee WHERE id=@id
end TRY
begin Catch
SELECT
ERROR_NUMBER() AS ERRORNumber,
ERROR_STATE() AS ERRORState,
ERROR_PROCEDURE() AS ERRORProcedure,
ERROR_LINE() AS ERRORLine,
ERROR_MESSAGE() AS ERRORMessage;
END CATCH
;



Create	PROCEDURE TryCatchChangecitynamess
as
begin try 
update employee set city='mumbai' where id in (4,12)
end try
begin Catch
SELECT
ERROR_NUMBER() AS ERRORNumber,
ERROR_STATE() AS ERRORState,
ERROR_PROCEDURE() AS ERRORProcedure,
ERROR_LINE() AS ERRORLine,
ERROR_MESSAGE() AS ERRORMessage;
END CATCH
;


CREATE PROCEDURE CURD_Operation(
    @id int=0,
    @name Varchar(200)=null,
    @salary money=null,
    @startDate Date=null,
	@gender char(20)=null,
	@city varchar(30)=null,
	@lname varchar(20)=null,
	@Choice Varchar(100)
) AS
BEGIN TRY 
   SET NOCOUNT ON;
   if @choice ='Insert'
   begin 
    Insert into employee values (@name,@salary,@startDate,@gender,@city,@lname)
	end
	if @choice = 'Update'
	begin
	Update employee set
	Name=@Name,Salary=@Salary,StartDate=@StartDate,gender=@gender,city=@city,lname=@lname where id=@id
	end
	if @Choice='Delete'
	begin
	Delete from employee where id =@id
	end

END TRY
BEGIN CATCH
    SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage
END CATCH




--view
create view emp as select name,city from employee;
select * from emp
select * from sys.views
exec sp_rename 'emp','empv'
DROP VIEW IF EXISTS empview;

--getting view info
SELECT
    definition,
    uses_ansi_nulls,
    uses_quoted_identifier,
    is_schema_bound
FROM
    sys.sql_modules
WHERE
    object_id
    = object_id(
            'empv'
        );


---index
CREATE TABLE parts(
    part_id   INT NOT NULL, 
    part_name VARCHAR(100)
);
INSERT INTO 
    parts(part_id, part_name)
VALUES
    (1,'Frame'),
    (2,'Head Tube'),
    (3,'Handlebar Grip'),
    (4,'Shock Absorber'),
    (5,'Fork');

CREATE CLUSTERED INDEX parts_id
ON parts (part_id);  

CREATE  INDEX index_name
ON parts (part_name);

---EXEC sp_rename index_name, parts_index, N'Indexes';

ALTER INDEX index_name
ON parts
DISABLE;

ALTER INDEX ALL ON parts
DISABLE;

select * from parts

ALTER INDEX ALL ON parts
REBUILD;


ALTER INDEX index_name 
ON parts  
REBUILD;

DBCC DBREINDEX (parts, " ");  

CREATE UNIQUE INDEX index1
ON parts(part_name);

CREATE UNIQUE INDEX ix_uniq_ab 
ON parts(part_id, part_name);

INSERT INTO parts(part_id,part_name) VALUES(2,'sam');

DROP INDEX index_name
ON parts;

set transaction isolation level read Uncommitted
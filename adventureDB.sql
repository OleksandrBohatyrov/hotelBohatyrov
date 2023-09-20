--33 funkts. loomine
CREATE FUNCTION fn_ILTVF_GetEmployees()
returns table  
as 
return (Select EmployeeKey, FirstName, Cast(BirthDate as date) as DOB
from DimEmployee)



SELECT * FROM dbo.fn_ILTVF_GetEmployees();


Create Function dn_MSTVF_GetEmployees()
returns @Table table (EmployeeKey int, FirstName nvarchar(20), DOB Date)
as 
BEGIN
Insert into @Table
Select EmployeeKey, FirstName, Cast(BirthDate as Date)
from DimEmployee
return
END

SELECT * FROM dbo.fn_ILTVF_GetEmployees();
SELECT * FROM dbo.dn_MSTVF_GetEmployees();


Update fn_MSTVF_GetEmployees() set FirstName='Sam1' Where EmployeeKey = 1


CREATE FUNCTION fn_GetEmployeeNameById2(@Id int)
RETURNS nvarchar(20)
AS
BEGIN
return (Select FirstName from DimEmployee where EmployeeKey = @Id)
END;


SELECT dbo.fn_GetEmployeeNameById(1);

go
exec sp_helptext 'dbo.fn_GetEmployeeNameById2';
go


alter function fn_GetEmployeeNameById2(@Id int)
returns nvarchar(20)
with schemabinding
as
begin
return (Select FirstName from dbo.DimEmployee where EmployeeKey = @id)
End

drop table DimEmployee

select * from fn_GetEmployeeNameById2();


--34 file Ajutised Tabelid
Create Procedure spCreateLocalTempTable
as
begin
Create Table #PersonDetails(
Id int Primary key, 
Name nvarchar(20));

insert into #PersonDetails Values(1, 'Mike');
insert into #PersonDetails Values(2, 'John');
insert into #PersonDetails Values(3, 'Todd');
Select * from #PersonDetails;
end
exec spCreateLocalTempTable;

Select name from tempdb.sys.all_objects
where name like '#PersonDetails%'

Create Table ##EmployeeDetails(id int, Name nvarchar(20))
select * from ##EmployeeDetails;


--35 Indeksid Serveris 
Select * from DimEmployee where BaseRate > 35 and BaseRate < 50

Create Index IX_DimEmployee_BaseRate
on DimEmployee (BaseRate ASC)

exec sys.sp_helpindex @Objname = 'DimEmployee'


Execute sp_helptext DimEmployee 


drop index DimEmployee.IX_DimEmployee_BaseRate

drop index DimEmployee.FirstName_LastName

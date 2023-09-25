--39 fail

CREATE table tblEmployee
(
Id int Primary Key,
Name nvarchar(30),
Salary int,
Gender nvarchar(10),
DepartmentId int)

insert into tblEmployee Values (1, 'Mike', 4500, 'Male', 1);
insert into tblEmployee Values (2, 'Anna', 2000, 'Female', 2);
insert into tblEmployee Values (3, 'Anton', 6000, 'Male', 3);
insert into tblEmployee Values (4, 'John', 1500, 'Male', 5);
insert into tblEmployee Values (5, 'Katya', 4500, 'Female', 5);

create table tblDepartment 
(
DeptId int Primary key,
DeptName nvarchar(20)
)

insert into tblDepartment Values (1, 'Tallinn');
insert into tblDepartment Values (2, 'Parnu');
insert into tblDepartment Values (3, 'Tartu');
insert into tblDepartment Values (4, 'Narva');
insert into tblDepartment Values (5, 'Voru');


select Id, Name, Salary, Gender, DeptName  
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.DeptId

create view vWEmployeesByDepartment
as
select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.DeptId

select * from vWEmployeesByDepartment


Create View vWITDepartment_Employees
as
Select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
where tblDepartment.DeptName = 'IT'

Create View vWEmployeesNonConfidentialData
as
Select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId


Create View vWEmployeesCountByDepartment
as
Select DeptName, COUNT(Id) as TotalEmployees
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
Group By DeptName


--40 fail

Create view vWEployeesDataExceptSalary
as
select Id, Name, Gender, DepartmentId
from tblEmployee

select * from vWEployeesDataExceptSalary


UPDATE vWEployeesDataExceptSalary
set name = 'Mikey' where Id = 2

delete from vWEployeesDataExceptSalary where Id = 2
insert into vWEployeesDataExceptSalary values(2, 'Mikey', 'Male', 2)

Create View vWEmployeesDetailsByDepartment
as
Select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId


select * from vWEmployeesDetailsByDepartment

UPDATE vWEmployeesDetailsByDepartment
set DeptName='IT' where Name = 'John'

--41 fail

create table tblProduct
(
ProductId int primary key,
Name nvarchar(20),
UnitPrice int
)

insert into tblProduct Values(1, 'Books', 20)
insert into tblProduct Values(2, 'Pens', 14)
insert into tblProduct Values(3, 'Pencils', 11)
insert into tblProduct Values(4, 'Clips', 10)


create table tblProductSales
(
ProductId int,
QuantitySold int
)
Insert into tblProductSales values(1, 10)
Insert into tblProductSales values(3, 23)
Insert into tblProductSales values(4, 21)
Insert into tblProductSales values(2, 12)
Insert into tblProductSales values(1, 13)
Insert into tblProductSales values(3, 12) 
Insert into tblProductSales values(4, 13) 
Insert into tblProductSales values(1, 11)
Insert into tblProductSales values(2, 12)
Insert into tblProductSales values(1, 14)

﻿

Create view vWTotalSalesByProduct
with SchemaBinding
as
Select Name,
SUM(ISNULL((QuantitySold * UnitPrice), 0)) as TotalSales,
COUNT_BIG(*) as TotalTransactions
from dbo.tblProductSales
join dbo.tblProduct
on dbo.tblProduct.ProductId = dbo.tblProductSales.ProductId
group by Name

﻿
Create Unique Clustered Index UIX_vWTotalSalesByProduct_Name
on vWTotalSalesByProduct(Name)

Select * from vWTotalSalesByProduct


--42 fail
Create View vWEmployeeDetails
@Gender nvarchar(20)
as
Select Id, Name, Gender, DepartmentId
from  tblEmployee
where Gender = @Gender


Create function fnEmployeeDetails(@Gender nvarchar(20))
Returns Table
as
Return 
(Select Id, Name, Gender, DepartmentId
from tblEmployee where Gender = @Gender)

Select * from dbo.fnEmployeeDetails('Male')

Create View vWEmployeeDetailsSorted
as
Select Id, Name, Gender, DepartmentId
from tblEmployee
order by Id


Create function fnEmployeeDetails(@Gender nvarchar(20))
Returns Table
as
Return 
(Select Id, Name, Gender, DepartmentId
from tblEmployee where Gender = @Gender)


Select * from dbo.fnEmployeeDetails('Male')



Create View vWEmployeeDetailsSorted
as
Select Id, Name, Gender, DepartmentId
from tblEmployee
order by Id

Create Table ##TestTempTable(Id int, Name nvarchar(20), Gender nvarchar(10))
Insert into ##TestTempTable values(101, 'Martin', 'Male')
Insert into ##TestTempTable values(102, 'Joe', 'Female')
Insert into ##TestTempTable values(103, 'Pam', 'Female')
Insert into ##TestTempTable values(104, 'James', 'Male')

Create View vwOnTempTable
as
Select Id, Name, Gender
from ##TestTempTable

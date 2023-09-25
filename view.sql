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


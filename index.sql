--36 fail
create clustered index Ix_DimEmployee_Name
On DimEmployee(FirstName)


CREATE table [tblEmployee]
(
[Id] int Primary Key,
[Name] nvarchar(50),
[Salary] int,
[Gender] nvarchar(10),
[City] nvarchar(50))


insert into tblEmployee Values(3, 'John', 4500, 'Male', 'New York')
insert into tblEmployee Values(1, 'Sam', 2500, 'Male', 'New London')
insert into tblEmployee Values(4, 'Sara', 5500, 'Female', 'Tokyo')
insert into tblEmployee Values(5, 'Todd', 3100, 'Male', 'Toronto')
insert into tblEmployee Values(2, 'Pam', 6500, 'Female', 'Sydney')

create clustered index IX_tblemployee_Name
on tblEmployee(Name)

DROP index tblEmployee.PK

CREATE Clustered Index IX_tblEmployee_Gender_Salary
ON tblEmployee(Gender DESC, Salary ASC)

Create NonClustered Index IX_tblEmployee_Name
ON tblEmployee(Name)


--37 fail

Execute sp_helpindex tblEmployee

insert into tblEmployee Values (1, 'Mike', 'Sandoz', 4500, 'Male', 'New York')
insert into tblEmployee Values (1, 'John', 'Menco', 2500, 'Male', 'London')

DROP index tblEmployee.PK__tblEmplo__3214EC07EA643786

Insert into tblEmployee Values(1,'Mike', 'Sandoz',4500,'Male','New York')
Insert into tblEmployee Values(1,'John', 'Menco',2500,'Male','London')

Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee(FirstName, LastName)

ALTER TABLE tblEmployee 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City)

select * from tblEmployee

EXECUTE SP_HELPCONSTRAINT tblEmployee

CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_KEY

--38 fail

CREATE table [tblEmployee]
(
[Id] int Primary Key,
[FirstName] nvarchar(50),
[LastName] nvarchar(50),
[Salary] int,
[Gender] nvarchar(10),
[City] nvarchar(50))

insert into tblEmployee Values (1, 'Mike', 'Sandoz', 4500, 'Male', 'New York')
insert into tblEmployee Values (2, 'Sara', 'Menco', 6500, 'Female', 'London')
insert into tblEmployee Values (3, 'John', 'Barber', 2500, 'Male', 'Sydney')
insert into tblEmployee Values (4, 'Pam', 'Grove', 3500, 'Female', 'Toronto')
insert into tblEmployee Values (5, 'james', 'Mirch', 7500, 'Male', 'London')

create nonclustered index IX_tblemployee_Salary
on tblEmployee(salary ASC)

select * from tblEmployee where Salary > 4000 and Salary < 8000

DElete from tblEmployee where Salary = 2500
Update tblEmployee Set Salary = 9000 where Salary = 7500


select * from tblEmployee order by Salary

select * from tblEmployee order by Salary Desc

select Salary, COUNT(Salary) as Total
from tblEmployee
Group by Salary

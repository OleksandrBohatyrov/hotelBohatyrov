--92 fail

create trigger trMyFirstTRigger
on database
for create_table
as
begin
print 'New table created'
END


create table Test (Id int)
select * from Test

alter trigger trMyFirstTRigger
ON Database
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
print 'A table has just been created, modified or deleted'
END

insert into Test(Id) values(1);

alter trigger trMyFirstTRigger
on database 
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
	rollback
	print 'You cannot create, alter or drop a table'
	END

drop table TEST2


disable TRIGGER trMyFirstTRigger on database
drop trigger trMyFirstTRigger on database

Create trigger trRenameTable
on database
for RENAME
AS
BEGIN
print 'You just renamed something'
end

--93 fail

CREATE trigger tr_DatabaseScopeTrigger
on database
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN 
rollback
print 'You cannot create, alter or drop a table in the current database'
end

create trigger tr_ServerScopeTrigger
ON ALL SERVER
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN 
rollback
print 'You cannot create, alter or drop a table in any database on the server'
end

DISABLE TRIGGER tr_ServerScopeTrigger ON ALL SERVER

ENABLE TRIGGER tr_ServerScopeTrigger ON ALL SERVER

DROP TRIGGER tr_ServerScopeTrigger ON ALL SERVER

--94 fail

﻿

CREATE TRIGGER tr_DatabaseScopeTrigger
ON DATABASE
FOR CREATE_TABLE
AS
BEGIN
Print 'Database Scope Trigger'
END
GO
CREATE TRIGGER tr_ServerScopeTrigger
ON ALL SERVER
FOR CREATE_TABLE
AS
BEGIN
Print 'Server Scope Trigger'
END
GO

exec sp_settriggerorder
@triggername = 'tr_DatabaseScopeTrigger',
@order = 'Last', --Võib olla First, Last, None
@stmttype = 'CREATE_TABLE',
@namespace='DATABASE'
GO

﻿
--96 fail
CREATE TRIGGER tr_LogonAuditTriggers
ON ALL SERVER
FOR LOGON
AS
BEGIN
DECLARE @LoginName NVARCHAR(100)
Set @LoginName = ORIGINAL_LOGIN()
IF (SELECT COUNT(*) FROM sys.dm_exec_sessions WHERE is_user_process = 1
AND original_login_name = @LoginName) > 3 BEGIN
Print 'Fourth connection of ' + @LoginName + 'blocked' ROLLBACK
END
END

execute sp_readerrorlog

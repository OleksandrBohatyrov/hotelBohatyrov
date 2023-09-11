--MSSQL
--Lisamine triger
CREATE TRIGGER roomLisamine
ON room
FOR INSERT
AS
insert into logi(kuupaev, andmed, kasutaja)
SELECT GETDATE(),
CONCAT(inserted.number,', ', inserted.name,', ',inserted.status,', ',inserted.smoke,', ', r.description,', ', r.max_capacity),
USER
FROM inserted
INNER JOIN room_type r ON inserted.id=r.id
--WHERE linn.linniD=inserted.linnID
insert into room(number, name, status, smoke, room_type_id)
values (310, 'PapaMama', 'NO', 0, 6);
SELECT * from room;
SELECT * from room_type;
SELECT * from logi;	

--Uuendamine triger
CREATE TRIGGER roomUuendamine
ON room
FOR UPDATE
AS
insert into logi(kuupaev, andmed, kasutaja)
SELECT GETDATE(),
CONCAT('Vanad andmed', deleted.number,', ', deleted.name,', ',  deleted.status,', ', deleted.smoke,', ',  r1.description,', ', r1.max_capacity,
'uued -', inserted.number, ', ', inserted.name, inserted.status, ', ', inserted.name,  inserted.status,', ', inserted.smoke,', ',  r2.description,', ', r2.max_capacity),
USER
FROM deleted
INNER JOIN inserted ON deleted.id=inserted.id
INNER JOIN room_type r1 ON deleted.room_type_id=r1.id
INNER JOIN room_type r2 ON inserted.room_type_id=r2.id
--kontroll
select * from room;
UPDATE room SET room_type_id=2
where number='23';
select * from room
select * from logi;


--XAMPP
--Lisamine triger
insert into logi(kuupaev, andmed, kasutaja)
SELECT NOW(),
concat('Uued andmed: ',
new.number, ', ',
new.name, ', ',
new.status, ', ',
new.smoke, ', ',
rt.description, ', ',
rt.max_capacity),
USER()
from room r
INNER join room_type rt
on r.room_type_id=rt.id
WHERE r.id=new.id

--Uendamine triger
INSERT logi(kuupaev, andmed, kasutaja)
SELECT now(),
concat('Vanad andmed: ',
old.number, ', ',
old.name, ', ',
old.status, ', ',
old.smoke, ', ',
rt1.description, ', ',
rt1.max_capacity,
       ' Uued andmed: ',
new.number, ', ',
new.name, ', ',
new.status, ', ',
new.smoke, ', ',
rt2.description, ', ',
rt2.max_capacity),
USEr()
from room r
inner join room_type rt1 on old.room_type_id=rt1.id
inner join room_type rt2 on new.room_type_id=rt2.id
where r.id=new.id

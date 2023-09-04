CREATE TRIGGER guestLisamine
ON guest
FOR INSERT
AS
INSERT INTO logi(kuupaev, kasutaja, andmed, tegevus)
SELECT GETDATE(), USER, CONCAT(inserted.first_name, ', ', inserted.last_name),
'guest on lisatud'
FROM inserted
--kontroll
insert into guest(first_name, last_name, member_since)
values ('Oleksandr', 'Bohatyrov', '2022-05-01');
SELECT * FROM guest;
select * from logi;






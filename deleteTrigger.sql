CREATE TRIGGER guestKustutamine
ON guest
FOR DELETE
AS
INSERT INTO logi(kuupaev, kasutaja, andmed, tegevus)
SELECT GETDATE(), USER, CONCAT(deleted.first_name, ', ', deleted.last_name),
'guest on kustutatud'
FROM deleted
--kontroll
DELETE FROM guest where id=1
SELECT * FROM guest;
select * from logi;

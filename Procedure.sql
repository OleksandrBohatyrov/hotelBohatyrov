--Protseduurid
--Andmete lisamine ja SELECT
CREATE PROCEDURE LisamineGuest
    @first_name VARCHAR(80),
    @last_name VARCHAR(80),
    @member_since DATE
AS
BEGIN
    INSERT INTO guest (first_name, last_name, member_since)
    VALUES (@first_name, @last_name, @member_since);
END;
--kontroll
EXEC LisamineGuest 'John', 'Doe', '2023-01-15';


CREATE PROCEDURE SelectGuests
AS
BEGIN
    SELECT * FROM guest;
END;

--kontroll
EXEC SelectGuests;
--Kustutamine ja SELECT
CREATE PROCEDURE KustutamineGuest
    @id INT
AS
BEGIN
	select * from guest;
    DELETE FROM guest
    WHERE id = @id;
	select * from guest;
	select * from logi;
END;
--kontroll
EXEC KustutamineGuest @id = 2; 

--Andmete uuendamine sisestatud id järgi


CREATE PROCEDURE uuendamineID
    @id INT,
    @new_first_name VARCHAR(80),
    @new_last_name VARCHAR(80),
    @new_member_since DATE
AS
BEGIN
    UPDATE guest
    SET
        first_name = @new_first_name,
        last_name = @new_last_name,
        member_since = @new_member_since
    WHERE
        id = @id;
END;


EXEC uuendamineID @id = 1, @new_first_name = 'UusFirstName', @new_last_name = 'UusLastName', @new_member_since = '2023-09-04';
select * from guest;
select * from logi;




--Külaliste (guest) arvu leidmine
-- svoyu

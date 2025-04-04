
CREATE PROCEDURE UpdateWatermarTable
@lastload varchar(2000)
AS
BEGIN

BEGIN TRANSACTION;
UPDATE water_table
SET lastload = @lastload
COMMIT TRANSACTION;
END;

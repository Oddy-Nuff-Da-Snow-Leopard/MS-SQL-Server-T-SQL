USE University;
GO

-- 1
SET NOCOUNT ON;
IF EXISTS(SELECT * FROM SYS.OBJECTS
WHERE OBJECT_ID=object_id(N'DBO.X'))
DROP TABLE X;

DECLARE @c int, @flag char = 'r';
SET IMPLICIT_TRANSACTIONS ON;
CREATE TABLE X(K int);
INSERT INTO X VALUES (1), (2), (3);
SET @c = (SELECT COUNT(*) FROM X);
PRINT 'Row amount in table X: ' + CONVERT(nchar(2), @c);
IF @flag = 'c' COMMIT;
ELSE ROLLBACK;
SET IMPLICIT_TRANSACTIONS OFF

IF EXISTS(SELECT * FROM SYS.OBJECTS
WHERE OBJECT_ID=object_id(N'DBO.X'))
PRINT 'Table X exists';
ELSE PRINT 'Table X not exists'
GO


-- 2
BEGIN TRY
BEGIN TRANSACTION
INSERT INTO Teacher VALUES ('СМЛВ', 'Смелов Владимир Владиславович', 'м', 'ИСиТ');
UPDATE Student SET GroupID = 'a' WHERE StudentID = 1085;
COMMIT TRANSACTION;
END TRY 
BEGIN CATCH
PRINT 'Message: ';
IF PATINDEX('%PK%', ERROR_MESSAGE()) > 0
PRINT 'Primary key constraint error';
IF PATINDEX('%преобразования%', ERROR_MESSAGE()) > 0
PRINT 'Data type conversion error'
ROLLBACK TRANSACTION;
END CATCH


-- 3
DELETE FROM Teacher WHERE Teacher = 'Алксв';
DECLARE @SavePoint varchar(max);
BEGIN TRY
BEGIN TRANSACTION
INSERT INTO Teacher VALUES('Алксв', 'Алексеев Максим Евгеньевич', 'м', 'ИСиТ');
SET @SavePoint = 'p1'; SAVE TRANSACTION @SavePoint;
INSERT INTO Teacher VALUES('СМЛВ', 'Смелов Владимир Владиславович', 'м', 'ИСиТ');
SET @SavePoint = 'p2'; SAVE TRANSACTION @SavePoint;
COMMIT TRANSACTION;
END TRY 
BEGIN CATCH
PRINT 'Message: ';
IF PATINDEX('%PK%', ERROR_MESSAGE()) > 0
PRINT 'Primary key constraint error';
IF PATINDEX('%преобразования%', ERROR_MESSAGE()) > 0
PRINT 'Data type conversion error'
PRINT 'Last save point: ' + @SavePoint;
ROLLBACK TRANSACTION @SavePoint;
COMMIT TRANSACTION;
END CATCH

GO
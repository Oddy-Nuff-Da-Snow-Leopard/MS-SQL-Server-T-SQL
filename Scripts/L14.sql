USE University;
GO

DROP PROCEDURE Subject_Procedure;
GO


-- 1
CREATE PROC Subject_Procedure AS
BEGIN
SELECT * FROM [Subject];
RETURN @@ROWCOUNT;
END
GO

SET NOCOUNT ON;
DECLARE @a int;
EXECUTE @a = Subject_Procedure;
PRINT 'Total amount of rows in Subject table: ' + CONVERT(varchar(max), @a);
GO


-- 2
ALTER PROCEDURE Subject_Procedure @p varchar(20) = NULL, @c int OUTPUT AS
BEGIN
SELECT * FROM [Subject] WHERE Pulpit = @p;
SET @c = @@ROWCOUNT;
RETURN (SELECT COUNT(*) FROM [Subject]);
END
GO

SET NOCOUNT ON;
DECLARE @a int, @p varchar(20) = 'ИСиТ', @c int;
EXECUTE @a = Subject_Procedure @p, @c OUTPUT;
PRINT 'Total amount of rows in Subject table: ' + CONVERT(varchar(max), @a);
PRINT 'Amount of rows in Subject table with pulpit code ' + @p + ': ' + CONVERT(varchar(max), @c);
GO


-- 3
DROP TABLE #Subject;
CREATE TABLE #Subject
([Subject] varchar(10) PRIMARY KEY,
[Subject name] varchar(max) NOT NULL,
Pulpit varchar(10) NOT NULL);
GO

ALTER PROCEDURE Subject_Procedure @p varchar(20) = NULL AS
SELECT * FROM [Subject] WHERE Pulpit = @p;
GO

INSERT INTO #Subject EXECUTE Subject_Procedure 'ПОиСОИ';

SELECT * FROM #Subject;
GO


-- 4
DROP PROCEDURE Auditorium_Procedure;
GO
CREATE PROCEDURE Auditorium_Procedure
@a varchar(20), @n varchar(10), @c int = 0, @t varchar(10) AS
BEGIN

BEGIN TRY
INSERT INTO Auditorium
(Auditorium, [Auditorium name], [Auditorium capacity], [Auditorium type])
VALUES
(@a, @n, @c, @t);
RETURN 1;
END TRY

BEGIN CATCH
PRINT 'Ops, an error has occured!';
PRINT 'Error message: ' + ERROR_MESSAGE();
PRINT 'Error number: ' + CAST(ERROR_NUMBER() AS varchar(max));
PRINT 'Error severity: ' + CONVERT(varchar(max), ERROR_SEVERITY());
PRINT 'Error procedure: ' + ERROR_PROCEDURE();
PRINT 'Error line: ' + CONVERT(varchar(max), ERROR_LINE());
RETURN -1;
END CATCH

END
GO

SET NOCOUNT ON;
EXECUTE Auditorium_Procedure '310a-1', '310a-1', 20, 'ЛБ-К';
EXECUTE Auditorium_Procedure '206-1', '206-1', 15, 'ЛБ-К';
DELETE FROM Auditorium WHERE Auditorium = '310a-1';
GO


-- 5
DROP PROCEDURE Subject_Report_Procedure;
GO
CREATE PROCEDURE Subject_Report_Procedure @p varchar(10) AS
BEGIN
	BEGIN TRY
	DECLARE Subject_Cursor CURSOR LOCAL FOR
	SELECT [Subject] FROM [Subject] WHERE Pulpit = @p;
	DECLARE @Result varchar(max) = '', @Subject varchar(10);
	DECLARE @SubjectAmount int = 0;

	OPEN Subject_Cursor;
	FETCH FROM Subject_Cursor INTO @Subject;

	IF @@FETCH_STATUS <> 0
		RAISERROR('Pulpit not found', 12, 1);
	ELSE
	BEGIN
		WHILE @@FETCH_STATUS = 0
			BEGIN
			SET @Result += RTRIM(@Subject) + ', ';
			SET @SubjectAmount += 1;
			FETCH Subject_Cursor INTO @Subject;
		END
		CLOSE Subject_Cursor;
		SET @Result = REVERSE(@Result);
		SET @Result = REVERSE(SUBSTRING(@Result, 3, LEN(@Result)));
		PRINT 'Subjects on pulpit ' + @p + ':';
		PRINT @Result;
		RETURN @SubjectAmount;
	END
	END TRY

	BEGIN CATCH
		PRINT 'Ops, an error has occured!';
		PRINT 'Error number: ' + CAST(ERROR_NUMBER() AS varchar(max));
		PRINT 'Error message: ' + ERROR_MESSAGE();
		PRINT 'Error severity: ' + CONVERT(varchar(max), ERROR_SEVERITY());
		PRINT 'Error procedure: ' + ERROR_PROCEDURE();
		PRINT 'Error line: ' + CONVERT(varchar(max), ERROR_LINE());
		PRINT 'Error state: ' + CONVERT(varchar(max), ERROR_STATE()); 
		RETURN @SubjectAmount;
	END CATCH
END
GO

DECLARE @SubjectAmount int, @Pulpit varchar(10) = 'ИСиТ';
EXEC @SubjectAmount = Subject_Report_Procedure @Pulpit;
IF @SubjectAmount > 0
	PRINT 'Amount: ' + CONVERT(varchar(max), @SubjectAmount);
GO


-- 6
DROP PROCEDURE Auditorium_Procedure_X;
GO
CREATE PROCEDURE Auditorium_Procedure_X
@a varchar(20), @n varchar(10), @c int = 0,
@t varchar(10), @tn varchar(max) AS
BEGIN
	BEGIN TRY
		SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
		BEGIN TRANSACTION
		INSERT INTO [Auditorium type]
		([Auditorium type], [Auditorium type name])
		VALUES (@t, @tn);
		DECLARE @Flag int;
		EXEC @Flag = Auditorium_Procedure @a, @n, @c, @t;
		IF @Flag = 1
			COMMIT TRANSACTION;
		ELSE
			ROLLBACK TRANSACTION;
		RETURN 1;
	END TRY

	BEGIN CATCH
		PRINT 'Ops, an error has occured!';
		PRINT 'Error number: ' + CAST(ERROR_NUMBER() AS varchar(max));
		PRINT 'Error message: ' + ERROR_MESSAGE();
		PRINT 'Error severity: ' + CONVERT(varchar(max), ERROR_SEVERITY());
		PRINT 'Error procedure: ' + ERROR_PROCEDURE();
		PRINT 'Error line: ' + CONVERT(varchar(max), ERROR_LINE());
		PRINT 'Error state: ' + CONVERT(varchar(max), ERROR_STATE()); 
		ROLLBACK TRANSACTION;
		RETURN -1;
	END CATCH
END
GO


EXEC Auditorium_Procedure_X '310-1', '310-1', 20, 'ЛБ-К', 'Компьютерный класс';
EXEC Auditorium_Procedure_X '206-1', '206-1', 20, 'ЛБ', 'Лабораторный класс';
EXEC Auditorium_Procedure_X '310-1', '310-1', 20, 'ЛБ', 'Лабораторный класс';
DELETE FROM Auditorium WHERE Auditorium = '310-1';
DELETE FROM [Auditorium type] WHERE [Auditorium type] = 'ЛБ';
GO

SELECT * FROM Auditorium;
SELECT * FROM [Auditorium type];
GO

-- 8
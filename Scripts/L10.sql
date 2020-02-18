USE University;
GO

-- 1
-- Read about data types in SQL Server
DECLARE @name char(5) = 'Maxim';
DECLARE @surname varchar(8) = 'Alekseev';
DECLARE @birthDateAndTime datetime = '01-01-2000 4pm';
DECLARE @currentTime time = CURRENT_TIMESTAMP;

DECLARE @i integer,
@s smallint,
@t tinyint,
@n numeric(12,5);

SET @i = 1488;
SET @s = (SELECT COUNT(*) FROM Faculty);
SET @n = (SELECT AVG(CAST(Note AS numeric(12,5))) FROM Progress);

SELECT @name 'name', @surname 'surname',
@birthDateAndTime 'birth day', @currentTime 'current time';

PRINT @i;
PRINT @s;
PRINT @n;
PRINT @t;
GO


-- 2
DECLARE @totalCapacity smallint = (SELECT SUM([Auditorium capacity]) FROM Auditorium),
@amountOfAuditoriums tinyint, @averageCapacity smallint,
@a tinyint, @b float;

IF @totalCapacity > 200
BEGIN
SELECT @amountOfAuditoriums = (SELECT COUNT(*) FROM Auditorium),
@averageCapacity = (SELECT AVG([Auditorium capacity]) FROM Auditorium);

SET @a = (SELECT COUNT(*) FROM Auditorium WHERE [Auditorium capacity] < @averageCapacity);
SET @b = (CAST(@a AS float)/CAST(@amountOfAuditoriums AS float)) * 100;

SELECT @amountOfAuditoriums 'Total amount of auditoriums',
@averageCapacity 'Average capacity',
@a 'Amount of auditoriums witch capacity less than average capacity',
@b 'Percent of such auditoriums';

END

ELSE IF @totalCapacity < 200
PRINT 'Total capacity is ' + @totalCapacity;

ELSE PRINT 'Nothing';
GO


-- 3
PRINT @@ROWCOUNT;
PRINT @@VERSION;
PRINT @@SPID;
PRINT @@ERROR;
PRINT @@SERVERNAME;
PRINT @@TRANCOUNT;
PRINT @@FETCH_STATUS;
PRINT @@NESTLEVEL;

-- 4
DECLARE @t float, @x float;
SELECT @t = 2.3, @x = 2;

DECLARE @z float;

IF @t > @x
SET @z = POWER(SIN(@t), 2);

IF @t < @x
SET @z = 4*(@t + @x);

ELSE
SET @z = 1 - EXP(@x - 2);

PRINT @z;
GO

CREATE TABLE t(
ID tinyint IDENTITY(1,1) PRIMARY KEY,
String nchar(25)
);

DECLARE @fullName varchar(max) = 'Алексеев Максим Евгеньевич';

set @fullName = Replace(@fullName, ' ', '.');

DECLARE @surname nchar(30) = ParseName(@fullName, 3),
@name nchar(25) =  ParseName(@fullName, 2),
@patronymic nchar(25) = ParseName(@fullName, 1);

SELECT RTRIM(@surname) + ' ' + SUBSTRING(@name, 1, 1) + '.' + SUBSTRING(@patronymic, 1, 1) + '.' AS 'ФИО';
GO


-- 6
SELECT S.StudentID AS 'ID', S.[Name] AS 'ФИО', P.[Subject] AS 'Дисциплина', CASE
WHEN P.Note BETWEEN 9 AND 10 THEN 'Отлично'
WHEN P.Note BETWEEN 7 AND 8 THEN 'Хорошо'
WHEN P.Note BETWEEN 5 AND 6 THEN 'Неплохо'
WHEN P.Note = 4 THEN 'Удовлетворительно'
ELSE 'ВЫ - лох!'
END [Мнение]
FROM Progress P INNER JOIN Student S
ON S.StudentID = P.StudentID
INNER JOIN Groups G
ON G.GroupID = S.GroupID
WHERE G.Faculty = 'ИДиП'
GO


-- 7
DROP TABLE #RandomTable
CREATE TABLE #RandomTable(
Number1 int NOT NULL,
Number2 int NOT NULL,
Number3 int NOT NULL);

DECLARE @i int = 0;
WHILE @i < 10
BEGIN
INSERT INTO #RandomTable
VALUES(RAND()*5 + 5, FLOOR(RAND()*6 + 5), RAND() * 5);
SET @i = @i + 1;
END

SELECT * FROM #RandomTable;
GO

-- 8
DECLARE @x int = 0;
WHILE @x < 10
BEGIN
PRINT @x;

IF(@x = 5)
RETURN;

SET @x = @x + 1;
END
GO

-- 9
BEGIN TRY
UPDATE Pulpit SET Pulpit = 'БФ' WHERE Pulpit = 'ИСиТ';
END TRY

BEGIN CATCH
PRINT ERROR_NUMBER();
PRINT ERROR_MESSAGE();
PRINT ERROR_LINE();
PRINT ERROR_PROCEDURE();
PRINT ERROR_SEVERITY();
PRINT ERROR_STATE();
END CATCH
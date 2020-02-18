USE University;

-- 1
EXEC SP_HELPINDEX 'Auditorium'
EXEC SP_HELPINDEX 'Auditorium type'
EXEC SP_HELPINDEX 'Faculty'
EXEC SP_HELPINDEX 'Groups'
EXEC SP_HELPINDEX 'Profession'
EXEC SP_HELPINDEX 'Progress'
EXEC SP_HELPINDEX 'Pulpit'
EXEC SP_HELPINDEX 'Student'
EXEC SP_HELPINDEX 'Subject'
EXEC SP_HELPINDEX 'Teacher'
GO


-- 2
DROP TABLE #Temp;
CREATE TABLE #Temp
(
ID int IDENTITY(1,1),
Number int NOT NULL
);

SET NOCOUNT ON;
DECLARE @i smallint = 0;
WHILE @i < 1000
BEGIN
SET @i += 1;
INSERT #Temp VALUES
(FLOOR(RAND()*100000));
END

SELECT * FROM #Temp WHERE Number BETWEEN 10000 AND 60000 ORDER BY Number
CREATE CLUSTERED INDEX #Temp_CL ON #Temp(Number ASC)
GO


-- 3
DROP TABLE #Temp1;
CREATE TABLE #Temp1
(
ID int IDENTITY(1,1),
Number int NOT NULL,
String nchar(100)
);

SET NOCOUNT ON;
DECLARE @i smallint = 0;
WHILE @i < 15000
BEGIN
SET @i += 1;
INSERT #Temp1 VALUES
(FLOOR(RAND()*100000), REPLICATE('string', 10));
END

SELECT * FROM #Temp1 WHERE Number BETWEEN 10000 AND 20000 ORDER BY Number;

CREATE INDEX #Temp1_NONCL ON #Temp1(ID, Number);
SELECT * FROM #Temp1 WHERE ID BETWEEN 150 AND 4000 AND Number BETWEEN 300 AND 5000 ORDER BY Number;
SELECT * FROM #Temp1 ORDER BY ID, Number;

SELECT * FROM #Temp1 WHERE ID = 150 AND Number > 3000;
GO

-- 4
DROP TABLE #Temp2;
CREATE TABLE #Temp2
(
ID int IDENTITY(1,1),
Number int NOT NULL,
String nchar(100)
);

SET NOCOUNT ON;
DECLARE @i smallint = 0;
WHILE @i < 20000
BEGIN
SET @i += 1;
INSERT #Temp2 VALUES
(FLOOR(RAND()*100000), REPLICATE('string', 10));
END

SELECT Number FROM #Temp2 WHERE ID BETWEEN 150 AND 9000 ORDER BY Number;

CREATE INDEX #Temp2_X ON #Temp2(ID) INCLUDE (Number);
DROP INDEX #Temp2_Noncl ON #Temp2;

SELECT Number FROM #Temp2 WHERE ID BETWEEN 150 AND 9000 ORDER BY Number;

-- 5
SELECT ID, NUMBER FROM #Temp2 WHERE ID BETWEEN 150 AND 4000 AND Number BETWEEN 300 AND 5000 ORDER BY Number;
CREATE INDEX #Temp2_Noncl_Filter_Index ON #Temp2(ID, NUMBER) WHERE (ID >= 150 AND ID <= 4000 AND Number >= 300 AND Number <= 5000);
DROP INDEX #Temp2_Noncl_Filter ON #Temp2;
GO

-- 6
DROP TABLE #Temp3;
CREATE TABLE #Temp3
(
ID int IDENTITY(1,1),
Number int NOT NULL,
String nchar(100)
);

SET NOCOUNT ON;
DECLARE @i smallint = 0;
WHILE @i < 20000
BEGIN
SET @i += 1;
INSERT #Temp3 VALUES
(FLOOR(RAND()*100000), REPLICATE('string', 10));
END

CREATE INDEX #Temp3_Noncl ON #Temp3(Number);
DROP INDEX #Temp3_Noncl ON #Temp3;

INSERT TOP(9000) #Temp3(Number, String) SELECT Number, String FROM #Temp3;

SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
        FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), 
        OBJECT_ID(N'#Temp3'), NULL, NULL, NULL) ss
        JOIN sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id  
		WHERE name is not null;

SELECT * FROM #Temp3
GO

DROP TABLE #Temp;
DROP TABLE #Temp1;
DROP TABLE #Temp2;
DROP TABLE #Temp3;
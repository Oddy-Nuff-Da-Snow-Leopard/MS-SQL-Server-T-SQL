USE University;
GO

-- 1
DROP VIEW Teachers;
DROP VIEW [Pulpit amount];
DROP VIEW Auditoriums;
DROP VIEW [Lecture auditoriums];
DROP VIEW Subjects;
DROP VIEW Teachers1;
DROP VIEW [Pulpit amount1];
GO

CREATE VIEW Teachers AS
SELECT Teacher AS 'Код преподавателя', [Teacher name] AS 'Имя',
Gender AS 'Пол', Pulpit AS 'Кафедра' FROM Teacher;
GO

SELECT * FROM Teachers;
GO

-- 2
CREATE VIEW [Pulpit amount] AS
SELECT F.Faculty AS 'Факультет', COUNT(*) AS 'Количество кафедр'
FROM Faculty F INNER JOIN Pulpit P
ON F.Faculty = P.Faculty
GROUP BY F.Faculty;
GO
--GROUP BY + INNER JOIN + COUNT(*)

SELECT * FROM [Pulpit amount];


-- 3
GO
CREATE VIEW Auditoriums AS
SELECT Auditorium AS 'Код аудитории',
[Auditorium name] AS 'Наименование аудитории' FROM Auditorium
WHERE [Auditorium type] LIKE 'ЛК%'
GO

SELECT * FROM Auditoriums;
INSERT INTO Auditoriums VALUES('100-3а', '100-3а');
SELECT * FROM Auditoriums;
SELECT * FROM Auditorium;

DELETE FROM Auditoriums
WHERE 'Код аудитории' = '100-3а';

DELETE FROM Auditorium
WHERE Auditorium = '100-3а';


-- 4
GO
CREATE VIEW [Lecture auditoriums] AS
SELECT Auditorium AS 'Код аудитории',
[Auditorium name] AS 'Наименование аудитории' FROM Auditorium
WHERE [Auditorium type] LIKE 'ЛК%' WITH CHECK OPTION;
GO


-- 5
CREATE VIEW Subjects([Код дисциплины], [Наименование дисциплины], [Код кафедры]) AS
SELECT TOP(100) [Subject], [Subject name], Pulpit
FROM [Subject]
ORDER BY [Subject];
GO

SELECT * FROM Subjects;
GO

-- 6
CREATE VIEW Teachers1 WITH SCHEMABINDING AS
SELECT Teacher AS 'Код преподавателя', [Teacher name] AS 'Имя',
Gender AS 'Пол', Pulpit AS 'Кафедра' FROM dbo.Teacher;
GO

ALTER TABLE Teacher
DROP COLUMN Teacher;

SELECT * FROM Teacher


GO
CREATE VIEW [Pulpit amount1] WITH SCHEMABINDING AS
SELECT F.Faculty AS 'Факультет', COUNT(*) AS 'Количество кафедр'
FROM dbo.Faculty F INNER JOIN dbo.Pulpit P
ON F.Faculty = P.Faculty
GROUP BY F.Faculty;
GO

SELECT * FROM Faculty;

--Почему ORDER BY используеться совместно с секцией TOP?
--Почему нельзя INTO?
--Вопрос из лекции по поводу INSERT-а
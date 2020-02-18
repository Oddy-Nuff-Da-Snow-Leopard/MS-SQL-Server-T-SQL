USE University;

--Tasks down here
-- 1
SELECT * FROM Faculty;
SELECT * FROM Pulpit;
SELECT * FROM Profession;

SELECT [Pulpit name] AS 'Кафедра', Faculty AS 'Факультет' FROM Pulpit
WHERE Pulpit.Faculty IN (SELECT Faculty FROM Profession
WHERE [Profession name] LIKE '%технология%' OR [Profession name] LIKE '%технологии%');
GO

--The same solution with using Faculty table
SELECT [Pulpit name] AS 'Кафедра', Faculty.Faculty AS 'Факультет' FROM Pulpit, Faculty
WHERE Faculty.Faculty = Pulpit.Faculty AND Pulpit.Faculty IN (SELECT Faculty FROM Profession
WHERE [Profession name] LIKE '%технология%' OR [Profession name] LIKE '%технологии%');
GO


-- 2
SELECT [Pulpit name] AS 'Кафедра', F.Faculty AS 'Факультет' FROM Pulpit P
INNER JOIN Faculty F
ON F.Faculty = P.Faculty
WHERE P.Faculty IN (SELECT Faculty FROM Profession
WHERE [Profession name] LIKE '%технология%' OR [Profession name] LIKE '%технологии%');
GO


-- 3
SELECT DISTINCT [Pulpit name] AS 'Кафедра', Faculty.Faculty AS 'Факультет' FROM Pulpit
INNER JOIN Faculty
ON Faculty.Faculty = Pulpit.Faculty
INNER JOIN Profession
ON Profession.Faculty = Pulpit.Faculty
WHERE Profession.[Profession name] LIKE '%технология%' OR [Profession name] LIKE '%технологии%';
GO


-- 4
SELECT * FROM [Auditorium type];
SELECT * FROM Auditorium;
SELECT Auditorium AS 'Аудитория', [Auditorium type] AS 'Тип аудитории',
[Auditorium capacity] AS 'Вместимость' FROM Auditorium A1
WHERE Auditorium = (SELECT TOP(1) Auditorium FROM Auditorium A2
WHERE A1.[Auditorium type] = A2.[Auditorium type] ORDER BY [Auditorium capacity] DESC);
GO

-- 5
INSERT INTO Faculty(Faculty, [Faculty name]) VALUES
('Мксм', 'Максима');

SELECT [Faculty name] FROM Faculty
WHERE NOT EXISTS(SELECT * FROM Pulpit
WHERE Faculty.Faculty = Pulpit.Faculty);
GO

-- 6
SELECT (SELECT AVG(NOTE) FROM Progress WHERE [Subject] = 'ОАиП') AS 'Средняя ОАиП',
(SELECT AVG(NOTE) FROM Progress WHERE [Subject] = 'КГ') AS 'Средняя КГ',
(SELECT AVG(NOTE) FROM Progress WHERE [Subject] = 'СУБД') AS 'Средняя СУБД';
GO

SELECT * FROM Auditorium

-- 7
SELECT [Auditorium type name] AS 'Тип аудитории'
FROM [Auditorium type] [At]
WHERE 60 >= ANY(SELECT [Auditorium capacity] FROM Auditorium [A]
WHERE [At].[Auditorium type] = A.[Auditorium type]);
GO

-- 8
SELECT StudentID, [Subject], Note FROM Progress
WHERE Note >= ALL(SELECT Note FROM Progress);

-- 10

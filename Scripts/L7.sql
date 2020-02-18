USE University;

--Tasks down here
-- 1
SELECT * FROM Faculty;
SELECT * FROM Pulpit;
SELECT * FROM Profession;

SELECT [Pulpit name] AS '�������', Faculty AS '���������' FROM Pulpit
WHERE Pulpit.Faculty IN (SELECT Faculty FROM Profession
WHERE [Profession name] LIKE '%����������%' OR [Profession name] LIKE '%����������%');
GO

--The same solution with using Faculty table
SELECT [Pulpit name] AS '�������', Faculty.Faculty AS '���������' FROM Pulpit, Faculty
WHERE Faculty.Faculty = Pulpit.Faculty AND Pulpit.Faculty IN (SELECT Faculty FROM Profession
WHERE [Profession name] LIKE '%����������%' OR [Profession name] LIKE '%����������%');
GO


-- 2
SELECT [Pulpit name] AS '�������', F.Faculty AS '���������' FROM Pulpit P
INNER JOIN Faculty F
ON F.Faculty = P.Faculty
WHERE P.Faculty IN (SELECT Faculty FROM Profession
WHERE [Profession name] LIKE '%����������%' OR [Profession name] LIKE '%����������%');
GO


-- 3
SELECT DISTINCT [Pulpit name] AS '�������', Faculty.Faculty AS '���������' FROM Pulpit
INNER JOIN Faculty
ON Faculty.Faculty = Pulpit.Faculty
INNER JOIN Profession
ON Profession.Faculty = Pulpit.Faculty
WHERE Profession.[Profession name] LIKE '%����������%' OR [Profession name] LIKE '%����������%';
GO


-- 4
SELECT * FROM [Auditorium type];
SELECT * FROM Auditorium;
SELECT Auditorium AS '���������', [Auditorium type] AS '��� ���������',
[Auditorium capacity] AS '�����������' FROM Auditorium A1
WHERE Auditorium = (SELECT TOP(1) Auditorium FROM Auditorium A2
WHERE A1.[Auditorium type] = A2.[Auditorium type] ORDER BY [Auditorium capacity] DESC);
GO

-- 5
INSERT INTO Faculty(Faculty, [Faculty name]) VALUES
('����', '�������');

SELECT [Faculty name] FROM Faculty
WHERE NOT EXISTS(SELECT * FROM Pulpit
WHERE Faculty.Faculty = Pulpit.Faculty);
GO

-- 6
SELECT (SELECT AVG(NOTE) FROM Progress WHERE [Subject] = '����') AS '������� ����',
(SELECT AVG(NOTE) FROM Progress WHERE [Subject] = '��') AS '������� ��',
(SELECT AVG(NOTE) FROM Progress WHERE [Subject] = '����') AS '������� ����';
GO

SELECT * FROM Auditorium

-- 7
SELECT [Auditorium type name] AS '��� ���������'
FROM [Auditorium type] [At]
WHERE 60 >= ANY(SELECT [Auditorium capacity] FROM Auditorium [A]
WHERE [At].[Auditorium type] = A.[Auditorium type]);
GO

-- 8
SELECT StudentID, [Subject], Note FROM Progress
WHERE Note >= ALL(SELECT Note FROM Progress);

-- 10

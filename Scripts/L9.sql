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
SELECT Teacher AS '��� �������������', [Teacher name] AS '���',
Gender AS '���', Pulpit AS '�������' FROM Teacher;
GO

SELECT * FROM Teachers;
GO

-- 2
CREATE VIEW [Pulpit amount] AS
SELECT F.Faculty AS '���������', COUNT(*) AS '���������� ������'
FROM Faculty F INNER JOIN Pulpit P
ON F.Faculty = P.Faculty
GROUP BY F.Faculty;
GO
--GROUP BY + INNER JOIN + COUNT(*)

SELECT * FROM [Pulpit amount];


-- 3
GO
CREATE VIEW Auditoriums AS
SELECT Auditorium AS '��� ���������',
[Auditorium name] AS '������������ ���������' FROM Auditorium
WHERE [Auditorium type] LIKE '��%'
GO

SELECT * FROM Auditoriums;
INSERT INTO Auditoriums VALUES('100-3�', '100-3�');
SELECT * FROM Auditoriums;
SELECT * FROM Auditorium;

DELETE FROM Auditoriums
WHERE '��� ���������' = '100-3�';

DELETE FROM Auditorium
WHERE Auditorium = '100-3�';


-- 4
GO
CREATE VIEW [Lecture auditoriums] AS
SELECT Auditorium AS '��� ���������',
[Auditorium name] AS '������������ ���������' FROM Auditorium
WHERE [Auditorium type] LIKE '��%' WITH CHECK OPTION;
GO


-- 5
CREATE VIEW Subjects([��� ����������], [������������ ����������], [��� �������]) AS
SELECT TOP(100) [Subject], [Subject name], Pulpit
FROM [Subject]
ORDER BY [Subject];
GO

SELECT * FROM Subjects;
GO

-- 6
CREATE VIEW Teachers1 WITH SCHEMABINDING AS
SELECT Teacher AS '��� �������������', [Teacher name] AS '���',
Gender AS '���', Pulpit AS '�������' FROM dbo.Teacher;
GO

ALTER TABLE Teacher
DROP COLUMN Teacher;

SELECT * FROM Teacher


GO
CREATE VIEW [Pulpit amount1] WITH SCHEMABINDING AS
SELECT F.Faculty AS '���������', COUNT(*) AS '���������� ������'
FROM dbo.Faculty F INNER JOIN dbo.Pulpit P
ON F.Faculty = P.Faculty
GROUP BY F.Faculty;
GO

SELECT * FROM Faculty;

--������ ORDER BY ������������� ��������� � ������� TOP?
--������ ������ INTO?
--������ �� ������ �� ������ INSERT-�
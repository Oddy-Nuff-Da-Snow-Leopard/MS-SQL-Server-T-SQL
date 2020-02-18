USE University;
GO

-- 1
SELECT A.Auditorium AS '���������',
[At].[Auditorium type name] AS '��� ���������'
FROM Auditorium AS A INNER JOIN [Auditorium type] As [At]
ON A.[Auditorium type] = [At].[Auditorium type];
GO


-- 2
SELECT A.Auditorium AS '���������',
[At].[Auditorium type name] AS '��� ���������'
FROM Auditorium AS A INNER JOIN [Auditorium type] As [At]
ON A.[Auditorium type] = [At].[Auditorium type] AND [Auditorium type name] LIKE '%���%';
GO


-- 3
SELECT A.Auditorium AS '���������',
[At].[Auditorium type name] AS '��� ���������'
FROM Auditorium AS A,[Auditorium type] As [At]
WHERE A.[Auditorium type] = [At].[Auditorium type];
GO

SELECT A.Auditorium AS '���������',
[At].[Auditorium type name] AS '��� ���������'
FROM Auditorium AS A,[Auditorium type] As [At]
WHERE A.[Auditorium type] = [At].[Auditorium type] AND [Auditorium type name] LIKE '%���%';
GO

-- 4
SELECT Faculty.Faculty AS '���������', Pulpit.Pulpit AS '�������������', Groups.Profession AS '��� ���������',
Progress.[Subject] AS '����������',
Student.[Name] AS '��� ��������',
CASE
	WHEN (Progress.Note = 6) THEN '6(�����)'
	WHEN (Progress.Note = 7) THEN '7(����)'
	WHEN (Progress.Note = 8) THEN '8(������)'
	ELSE '������ �� 6, �� 7 � �� 8'
END [������]
FROM Faculty INNER JOIN Groups
ON Faculty.Faculty = Groups.Faculty
INNER JOIN Pulpit
ON Faculty.Faculty = Pulpit.Faculty
INNER JOIN Student
ON Groups.GroupID = Student.StudentID
INNER JOIN Progress
ON Student.StudentID = Progress.StudentID AND Progress.Note BETWEEN 6 AND 8
ORDER BY Progress.Note DESC, Faculty.Faculty, Pulpit.Pulpit, Student.[Name] ASC;
GO

-- 5
SELECT Faculty.Faculty AS '���������', Pulpit.Pulpit AS '�������������', Groups.Profession AS '��� ���������',
Progress.[Subject] AS '����������',
Student.[Name] AS '��� ��������',
CASE
	WHEN (Progress.Note = 6) THEN '6(�����)'
	WHEN (Progress.Note = 7) THEN '7(����)'
	WHEN (Progress.Note = 8) THEN '8(������)'
	ELSE '������ �� 6, �� 7 � �� 8'
END [������]
FROM Faculty INNER JOIN Groups
ON Faculty.Faculty = Groups.Faculty
INNER JOIN Pulpit
ON Faculty.Faculty = Pulpit.Faculty
INNER JOIN Student
ON Groups.GroupID = Student.StudentID
INNER JOIN Progress
ON Student.StudentID = Progress.StudentID AND Progress.Note BETWEEN 6 AND 8
ORDER BY(CASE WHEN(Progress.Note = 7) THEN 1
WHEN(Progress.Note = 8) THEN 2
ELSE 3
END), Faculty.Faculty, Pulpit.Pulpit, Student.[Name] ASC;
GO

 -- 6
SELECT ISNULL(Teacher.Teacher, '***') AS [�������������],
Pulpit.Pulpit AS [�������]
FROM Pulpit LEFT OUTER JOIN Teacher
ON Pulpit.Pulpit = Teacher.Pulpit;
GO


-- 7
SELECT ISNULL(Teacher.Teacher, '***') AS [�������������],
Pulpit.Pulpit AS [�������]
FROM Teacher LEFT OUTER JOIN Pulpit 
ON Pulpit.Pulpit = Teacher.Pulpit;
GO

SELECT ISNULL(Teacher.Teacher, '***') AS [�������������],
Pulpit.Pulpit AS [�������]
FROM Teacher RIGHT OUTER JOIN Pulpit 
ON Pulpit.Pulpit = Teacher.Pulpit;
GO

-- 8
SELECT (SELECT COUNT(*) FROM Student) AS '���-�� ����� � ������� Student',
(SELECT COUNT(*) FROM Groups) AS '���-�� ����� � ������� Groups',
(SELECT COUNT(*) FROM Student S FULL OUTER JOIN Groups G
ON G.GroupID = S.GroupID) AS '���-�� ����� � FULL OUTER JOIN ����������';
GO

SELECT (SELECT COUNT(*) FROM Student) AS '���-�� ����� � ������� Student',
(SELECT COUNT(*) FROM Groups) AS '���-�� ����� � ������� Groups',
(SELECT COUNT(*) FROM Groups G FULL OUTER JOIN Student S
ON G.GroupID = S.GroupID) AS '���-�� ����� � FULL OUTER JOIN ����������';
GO

-- 9
SELECT Auditorium AS '���������', [Auditorium type name] AS '��� ���������'
FROM Auditorium A CROSS JOIN [Auditorium type] [At]
WHERE A.[Auditorium type] = [At].[Auditorium type];
GO
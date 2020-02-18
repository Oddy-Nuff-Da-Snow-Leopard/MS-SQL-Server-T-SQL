USE University;
GO


-- 1
SELECT MAX([Auditorium capacity]) AS '������������ ���������������',
       MIN([Auditorium capacity]) AS '����������� ���������������',
	   AVG([Auditorium capacity]) AS '������� ���������������',
	   SUM([Auditorium capacity]) AS '��������� ���������������',
	   COUNT(*) AS [����� ���-�� ���������]
FROM Auditorium;
GO


-- 2
SELECT A_type.[Auditorium type name] AS '��� ���������',
       MAX([Auditorium capacity]) AS '������������ ���������������',
       MIN([Auditorium capacity]) AS '����������� ���������������',
	   AVG([Auditorium capacity]) AS '������� ���������������',
	   SUM([Auditorium capacity]) AS '��������� ���������������',
	   COUNT(*) AS [����� ���-�� ��������� ������� ����]

FROM [Auditorium type] A_type INNER JOIN Auditorium A
ON A_type.[Auditorium type] = A.[Auditorium type]
GROUP BY A_type.[Auditorium type name];
GO
-- A_type.[Auditorium type] here is a group name

-- 3 
SELECT * FROM (SELECT CASE
WHEN Note BETWEEN 4 AND 5 THEN '4-5'
WHEN Note BETWEEN 6 AND 7 THEN '6-7'
WHEN Note BETWEEN 8 AND 9 THEN '8-9'
WHEN Note = 10 THEN '10'
END '������', COUNT(*) AS '����������'

FROM Progress GROUP BY CASE 
WHEN Note BETWEEN 4 AND 5 THEN '4-5'
WHEN Note BETWEEN 6 AND 7 THEN '6-7'
WHEN Note BETWEEN 8 AND 9 THEN '8-9'
WHEN Note = 10 THEN '10'
END) AS Result ORDER BY CASE Result.������
WHEN '4-5' THEN 4
WHEN '6-7' THEN 3
WHEN '8-9' THEN 2
WHEN '10' THEN 1
END;
GO

SELECT * FROM Progress

-- Testing
SELECT COUNT(*) FROM Progress;
GO


-- 4
SELECT G.Faculty AS '���������',
G.Profession AS '�������������',
2015 - G.[Year first] AS '����',
ROUND(AVG(CAST(Note AS float(4))),2) AS '������� ������'
FROM Student S INNER JOIN Groups G
ON G.GroupID = S.GroupID
INNER JOIN Progress P
ON S.StudentID = P.StudentID
GROUP BY G.Faculty, G.Profession, G.[Year first] 
ORDER BY [������� ������] DESC;
GO

SELECT * FROM Student S INNER JOIN Groups G
ON G.GroupID = S.GroupID
INNER JOIN Progress P
ON S.StudentID = P.StudentID
GO


-- 5
SELECT G.Faculty AS '���������',
G.Profession AS '�������������',
2015 - G.[Year first] AS '����',
ROUND(AVG(CAST(Note AS float(4))),2) AS '������� ������'
FROM Student S INNER JOIN Groups G
ON G.GroupID = S.GroupID
INNER JOIN Progress P
ON S.StudentID = P.StudentID
WHERE P.[Subject] IN ('����', '����')
GROUP BY G.Faculty, G.Profession, G.[Year first] 
ORDER BY [������� ������] DESC;
GO

-- 6
SELECT G.Faculty AS '���������', G.Profession AS '�������������',
P.[Subject] AS '�������', AVG(CAST(Note AS float(2))) AS '������� ������'
FROM Student S INNER JOIN Groups G
ON G.GroupID = S.GroupID
INNER JOIN Progress P
ON S.StudentID = P.StudentID
WHERE G.Faculty = '����'
GROUP BY G.Faculty, G.Profession, P.[Subject] WITH ROLLUP;
GO

-- 7
SELECT G.Faculty AS '���������', G.Profession AS '�������������',
P.[Subject] AS '�������', AVG(CAST(Note AS float(2))) AS '������� ������'
FROM Student S INNER JOIN Groups G
ON G.GroupID = S.GroupID
INNER JOIN Progress P
ON S.StudentID = P.StudentID
WHERE G.Faculty = '����'
GROUP BY G.Faculty, G.Profession, P.[Subject] WITH CUBE;
GO


-- 8
SELECT Progress.[Subject], AVG(Progress.Note)
FROM Groups INNER JOIN Student
ON Groups.GroupID = Student.GroupID
INNER JOIN Progress
ON Student.StudentID = Progress.StudentID
WHERE Groups.Faculty = '����'
GROUP BY Progress.[Subject]

SELECT Progress.[Subject], AVG(Progress.Note)
FROM Groups INNER JOIN Student
ON Groups.GroupID = Student.GroupID
INNER JOIN Progress
ON Student.StudentID = Progress.StudentID
WHERE Groups.Faculty = '����'
GROUP BY Progress.[Subject]


SELECT Progress.[Subject], AVG(Progress.Note)
FROM Groups INNER JOIN Student
ON Groups.GroupID = Student.GroupID
INNER JOIN Progress
ON Student.StudentID = Progress.StudentID
WHERE Groups.Faculty = '����'
GROUP BY Progress.[Subject]
UNION
SELECT Progress.[Subject], AVG(Progress.Note)
FROM Groups INNER JOIN Student
ON Groups.GroupID = Student.GroupID
INNER JOIN Progress
ON Student.StudentID = Progress.StudentID
WHERE Groups.Faculty = '����'
GROUP BY Progress.[Subject]


SELECT Progress.[Subject], AVG(Progress.Note)
FROM Groups INNER JOIN Student
ON Groups.GroupID = Student.GroupID
INNER JOIN Progress
ON Student.StudentID = Progress.StudentID
WHERE Groups.Faculty = '����'
GROUP BY Progress.[Subject]
INTERSECT
SELECT Progress.[Subject], AVG(Progress.Note)
FROM Groups INNER JOIN Student
ON Groups.GroupID = Student.GroupID
INNER JOIN Progress
ON Student.StudentID = Progress.StudentID
WHERE Groups.Faculty = '����'
GROUP BY Progress.[Subject]


SELECT Progress.[Subject], AVG(Progress.Note)
FROM Groups INNER JOIN Student
ON Groups.GroupID = Student.GroupID
INNER JOIN Progress
ON Student.StudentID = Progress.StudentID
WHERE Groups.Faculty = '����'
GROUP BY Progress.[Subject]
EXCEPT
SELECT Progress.[Subject], AVG(Progress.Note)
FROM Groups INNER JOIN Student
ON Groups.GroupID = Student.GroupID
INNER JOIN Progress
ON Student.StudentID = Progress.StudentID
WHERE Groups.Faculty = '����'
GROUP BY Progress.[Subject]

-- 11
SELECT [Subject], COUNT(Note) AS '����� ��������� ���������� �� �������� 8 ��� 9'
FROM Progress
GROUP BY Note, [Subject] HAVING Note = 8 OR Note = 9;
USE University;
GO

-- 1
SELECT A.Auditorium AS 'Аудитория',
[At].[Auditorium type name] AS 'Тип аудитории'
FROM Auditorium AS A INNER JOIN [Auditorium type] As [At]
ON A.[Auditorium type] = [At].[Auditorium type];
GO


-- 2
SELECT A.Auditorium AS 'Аудитория',
[At].[Auditorium type name] AS 'Тип аудитории'
FROM Auditorium AS A INNER JOIN [Auditorium type] As [At]
ON A.[Auditorium type] = [At].[Auditorium type] AND [Auditorium type name] LIKE '%ком%';
GO


-- 3
SELECT A.Auditorium AS 'Аудитория',
[At].[Auditorium type name] AS 'Тип аудитории'
FROM Auditorium AS A,[Auditorium type] As [At]
WHERE A.[Auditorium type] = [At].[Auditorium type];
GO

SELECT A.Auditorium AS 'Аудитория',
[At].[Auditorium type name] AS 'Тип аудитории'
FROM Auditorium AS A,[Auditorium type] As [At]
WHERE A.[Auditorium type] = [At].[Auditorium type] AND [Auditorium type name] LIKE '%ком%';
GO

-- 4
SELECT Faculty.Faculty AS 'Факультет', Pulpit.Pulpit AS 'Специальность', Groups.Profession AS 'Код профессии',
Progress.[Subject] AS 'Дисциплина',
Student.[Name] AS 'Имя студента',
CASE
	WHEN (Progress.Note = 6) THEN '6(шесть)'
	WHEN (Progress.Note = 7) THEN '7(семь)'
	WHEN (Progress.Note = 8) THEN '8(восемь)'
	ELSE 'Оценка не 6, не 7 и не 8'
END [Оценка]
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
SELECT Faculty.Faculty AS 'Факультет', Pulpit.Pulpit AS 'Специальность', Groups.Profession AS 'Код профессии',
Progress.[Subject] AS 'Дисциплина',
Student.[Name] AS 'Имя студента',
CASE
	WHEN (Progress.Note = 6) THEN '6(шесть)'
	WHEN (Progress.Note = 7) THEN '7(семь)'
	WHEN (Progress.Note = 8) THEN '8(восемь)'
	ELSE 'Оценка не 6, не 7 и не 8'
END [Оценка]
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
SELECT ISNULL(Teacher.Teacher, '***') AS [Преподаватель],
Pulpit.Pulpit AS [Кафедра]
FROM Pulpit LEFT OUTER JOIN Teacher
ON Pulpit.Pulpit = Teacher.Pulpit;
GO


-- 7
SELECT ISNULL(Teacher.Teacher, '***') AS [Преподаватель],
Pulpit.Pulpit AS [Кафедра]
FROM Teacher LEFT OUTER JOIN Pulpit 
ON Pulpit.Pulpit = Teacher.Pulpit;
GO

SELECT ISNULL(Teacher.Teacher, '***') AS [Преподаватель],
Pulpit.Pulpit AS [Кафедра]
FROM Teacher RIGHT OUTER JOIN Pulpit 
ON Pulpit.Pulpit = Teacher.Pulpit;
GO

-- 8
SELECT (SELECT COUNT(*) FROM Student) AS 'Кол-во строк в таблице Student',
(SELECT COUNT(*) FROM Groups) AS 'Кол-во строк в таблице Groups',
(SELECT COUNT(*) FROM Student S FULL OUTER JOIN Groups G
ON G.GroupID = S.GroupID) AS 'Кол-во строк в FULL OUTER JOIN соединении';
GO

SELECT (SELECT COUNT(*) FROM Student) AS 'Кол-во строк в таблице Student',
(SELECT COUNT(*) FROM Groups) AS 'Кол-во строк в таблице Groups',
(SELECT COUNT(*) FROM Groups G FULL OUTER JOIN Student S
ON G.GroupID = S.GroupID) AS 'Кол-во строк в FULL OUTER JOIN соединении';
GO

-- 9
SELECT Auditorium AS 'Аудитория', [Auditorium type name] AS 'Тип аудитории'
FROM Auditorium A CROSS JOIN [Auditorium type] [At]
WHERE A.[Auditorium type] = [At].[Auditorium type];
GO
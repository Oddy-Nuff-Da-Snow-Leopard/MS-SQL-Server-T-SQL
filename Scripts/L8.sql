USE University;
GO


-- 1
SELECT MAX([Auditorium capacity]) AS 'Максимальная вместительность',
       MIN([Auditorium capacity]) AS 'Минимальная вместительность',
	   AVG([Auditorium capacity]) AS 'Средняя вместительность',
	   SUM([Auditorium capacity]) AS 'Суммарная вместительность',
	   COUNT(*) AS [Общее кол-во аудиторий]
FROM Auditorium;
GO


-- 2
SELECT A_type.[Auditorium type name] AS 'Тип аудитории',
       MAX([Auditorium capacity]) AS 'Максимальная вместительность',
       MIN([Auditorium capacity]) AS 'Минимальная вместительность',
	   AVG([Auditorium capacity]) AS 'Средняя вместительность',
	   SUM([Auditorium capacity]) AS 'Суммарная вместительность',
	   COUNT(*) AS [Общее кол-во аудиторий данного типа]

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
END 'Оценки', COUNT(*) AS 'Количество'

FROM Progress GROUP BY CASE 
WHEN Note BETWEEN 4 AND 5 THEN '4-5'
WHEN Note BETWEEN 6 AND 7 THEN '6-7'
WHEN Note BETWEEN 8 AND 9 THEN '8-9'
WHEN Note = 10 THEN '10'
END) AS Result ORDER BY CASE Result.Оценки
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
SELECT G.Faculty AS 'Факультет',
G.Profession AS 'Специальность',
2015 - G.[Year first] AS 'Курс',
ROUND(AVG(CAST(Note AS float(4))),2) AS 'Средняя оценка'
FROM Student S INNER JOIN Groups G
ON G.GroupID = S.GroupID
INNER JOIN Progress P
ON S.StudentID = P.StudentID
GROUP BY G.Faculty, G.Profession, G.[Year first] 
ORDER BY [Средняя оценка] DESC;
GO

SELECT * FROM Student S INNER JOIN Groups G
ON G.GroupID = S.GroupID
INNER JOIN Progress P
ON S.StudentID = P.StudentID
GO


-- 5
SELECT G.Faculty AS 'Факультет',
G.Profession AS 'Специальность',
2015 - G.[Year first] AS 'Курс',
ROUND(AVG(CAST(Note AS float(4))),2) AS 'Средняя оценка'
FROM Student S INNER JOIN Groups G
ON G.GroupID = S.GroupID
INNER JOIN Progress P
ON S.StudentID = P.StudentID
WHERE P.[Subject] IN ('ОАиП', 'СУБД')
GROUP BY G.Faculty, G.Profession, G.[Year first] 
ORDER BY [Средняя оценка] DESC;
GO

-- 6
SELECT G.Faculty AS 'Факультет', G.Profession AS 'Специальность',
P.[Subject] AS 'Предмет', AVG(CAST(Note AS float(2))) AS 'Средняя оценка'
FROM Student S INNER JOIN Groups G
ON G.GroupID = S.GroupID
INNER JOIN Progress P
ON S.StudentID = P.StudentID
WHERE G.Faculty = 'ХТиТ'
GROUP BY G.Faculty, G.Profession, P.[Subject] WITH ROLLUP;
GO

-- 7
SELECT G.Faculty AS 'Факультет', G.Profession AS 'Специальность',
P.[Subject] AS 'Предмет', AVG(CAST(Note AS float(2))) AS 'Средняя оценка'
FROM Student S INNER JOIN Groups G
ON G.GroupID = S.GroupID
INNER JOIN Progress P
ON S.StudentID = P.StudentID
WHERE G.Faculty = 'ХТиТ'
GROUP BY G.Faculty, G.Profession, P.[Subject] WITH CUBE;
GO


-- 8
SELECT Progress.[Subject], AVG(Progress.Note)
FROM Groups INNER JOIN Student
ON Groups.GroupID = Student.GroupID
INNER JOIN Progress
ON Student.StudentID = Progress.StudentID
WHERE Groups.Faculty = 'ХТиТ'
GROUP BY Progress.[Subject]

SELECT Progress.[Subject], AVG(Progress.Note)
FROM Groups INNER JOIN Student
ON Groups.GroupID = Student.GroupID
INNER JOIN Progress
ON Student.StudentID = Progress.StudentID
WHERE Groups.Faculty = 'ИДиП'
GROUP BY Progress.[Subject]


SELECT Progress.[Subject], AVG(Progress.Note)
FROM Groups INNER JOIN Student
ON Groups.GroupID = Student.GroupID
INNER JOIN Progress
ON Student.StudentID = Progress.StudentID
WHERE Groups.Faculty = 'ХТиТ'
GROUP BY Progress.[Subject]
UNION
SELECT Progress.[Subject], AVG(Progress.Note)
FROM Groups INNER JOIN Student
ON Groups.GroupID = Student.GroupID
INNER JOIN Progress
ON Student.StudentID = Progress.StudentID
WHERE Groups.Faculty = 'ИДиП'
GROUP BY Progress.[Subject]


SELECT Progress.[Subject], AVG(Progress.Note)
FROM Groups INNER JOIN Student
ON Groups.GroupID = Student.GroupID
INNER JOIN Progress
ON Student.StudentID = Progress.StudentID
WHERE Groups.Faculty = 'ХТиТ'
GROUP BY Progress.[Subject]
INTERSECT
SELECT Progress.[Subject], AVG(Progress.Note)
FROM Groups INNER JOIN Student
ON Groups.GroupID = Student.GroupID
INNER JOIN Progress
ON Student.StudentID = Progress.StudentID
WHERE Groups.Faculty = 'ИДиП'
GROUP BY Progress.[Subject]


SELECT Progress.[Subject], AVG(Progress.Note)
FROM Groups INNER JOIN Student
ON Groups.GroupID = Student.GroupID
INNER JOIN Progress
ON Student.StudentID = Progress.StudentID
WHERE Groups.Faculty = 'ХТиТ'
GROUP BY Progress.[Subject]
EXCEPT
SELECT Progress.[Subject], AVG(Progress.Note)
FROM Groups INNER JOIN Student
ON Groups.GroupID = Student.GroupID
INNER JOIN Progress
ON Student.StudentID = Progress.StudentID
WHERE Groups.Faculty = 'ИДиП'
GROUP BY Progress.[Subject]

-- 11
SELECT [Subject], COUNT(Note) AS 'Число студентов получивших на предмете 8 или 9'
FROM Progress
GROUP BY Note, [Subject] HAVING Note = 8 OR Note = 9;
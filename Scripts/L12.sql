USE University;
GO

-- 1
DECLARE Subject_Cursor CURSOR
FOR SELECT [Subject] FROM [Subject] WHERE Pulpit = 'ИСиТ';

DECLARE @SubjectName char(10), @ResultStr varchar(max) = '';

OPEN Subject_Cursor;
FETCH Subject_Cursor INTO @SubjectName;
PRINT 'Дисциплины на кафедре ИСиТ:';

WHILE @@FETCH_STATUS = 0
BEGIN 
SET @ResultStr += RTRIM(@SubjectName) + ', ';

FETCH Subject_Cursor INTO @SubjectName;
END

SET @ResultStr = REVERSE(@ResultStr);
SET @ResultStr = REVERSE(SUBSTRING(@ResultStr, 3, LEN(@ResultStr)));
PRINT @ResultStr;
CLOSE Subject_Cursor;
DEALLOCATE Subject_Cursor;
GO


-- 2
DECLARE Teacher_Cursor CURSOR LOCAL
FOR SELECT [Teacher name] FROM Teacher;

DECLARE @TeacherName varchar(max);
OPEN Teacher_Cursor;
FETCH Teacher_Cursor INTO @TeacherName;
IF @@FETCH_STATUS = 0
PRINT '1. ' + @TeacherName;
CLOSE Teacher_Cursor;
GO

DECLARE @TeacherName varchar(max);
OPEN Teacher_Cursor;
FETCH Teacher_Cursor INTO @TeacherName;
IF @@FETCH_STATUS = 0
PRINT '2. ' + @TeacherName;
CLOSE Teacher_Cursor;
GO


DECLARE Teacher_Cursor CURSOR GLOBAL
FOR SELECT [Teacher name] FROM Teacher;

DECLARE @TeacherName varchar(max);
OPEN Teacher_Cursor;
FETCH Teacher_Cursor INTO @TeacherName;
IF @@FETCH_STATUS = 0
PRINT '1. ' + @TeacherName;
CLOSE Teacher_Cursor;
GO

DECLARE @TeacherName varchar(max);
OPEN Teacher_Cursor;
FETCH Teacher_Cursor INTO @TeacherName;
IF @@FETCH_STATUS = 0
PRINT '2. ' + @TeacherName;
CLOSE Teacher_Cursor;
DEALLOCATE Teacher_Cursor;
GO


-- 3
DELETE FROM Faculty WHERE Faculty = 'Мкс';
DECLARE @Faculty char(10), @FacultyName varchar(max);
DECLARE Faculty_Cursor CURSOR LOCAL STATIC
FOR SELECT Faculty, [Faculty name] FROM Faculty;
OPEN Faculty_Cursor;
PRINT 'Rows amount: ' + CONVERT(varchar(3), @@CURSOR_ROWS);
INSERT INTO Faculty VALUES
('Мкс', 'Максимушки алксеева');
INSERT INTO Faculty VALUES
('Мкс1', 'Максимушки алксеева1');
DELETE FROM Faculty WHERE Faculty = 'Мкс1'
UPDATE Faculty SET [Faculty name] = 'А ну давай'
WHERE Faculty = 'Мкс';

FETCH Faculty_Cursor INTO @Faculty, @FacultyName;
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT @Faculty + ' ' + RTRIM(@FacultyName);
FETCH Faculty_Cursor INTO @Faculty, @FacultyName;
END
CLOSE Faculty_Cursor;

SELECT * FROM Faculty;
GO

-- 4
DECLARE @TeacherName varchar(max), @n tinyint;
DECLARE Teacher_Cursor CURSOR LOCAL DYNAMIC SCROLL
FOR SELECT [Teacher name], ROW_NUMBER() OVER(ORDER BY Teacher) N FROM Teacher;

OPEN Teacher_Cursor;
FETCH LAST FROM Teacher_Cursor INTO @TeacherName, @n;
PRINT 'Last row:         ' + RTRIM(@TeacherName) + ', row number is ' + CONVERT(char(3), @n);
FETCH PRIOR FROM Teacher_Cursor INTO @TeacherName, @n;
PRINT 'Prior row:        ' + RTRIM(@TeacherName) + ', row number is ' + CONVERT(char(3), @n);
FETCH RELATIVE -5 FROM Teacher_Cursor INTO @TeacherName, @n;
PRINT 'Relative -5 row:  ' + RTRIM(@TeacherName) + ', row number is ' + CONVERT(char(3), @n);
FETCH RELATIVE 2 FROM Teacher_Cursor INTO @TeacherName, @n;
PRINT 'Relative 2 row:   ' + RTRIM(@TeacherName) + ', row number is ' + CONVERT(char(3), @n);
FETCH NEXT FROM Teacher_Cursor INTO @TeacherName, @n;
PRINT 'Next row:         ' + RTRIM(@TeacherName) + ', row number is ' + CONVERT(char(3), @n);
FETCH ABSOLUTE 5 FROM Teacher_Cursor INTO @TeacherName, @n;
PRINT 'Absolute 5 row:   ' + RTRIM(@TeacherName) + ', row number is ' + CONVERT(char(3), @n);
FETCH Absolute -10 FROM Teacher_Cursor INTO @TeacherName, @n;
PRINT 'Absolute -10 row: ' + RTRIM(@TeacherName) + ', row number is ' + CONVERT(char(3), @n);


-- 5
DROP TABLE #Test;
CREATE TABLE #Test(
ID smallint PRIMARY KEY IDENTITY(1, 1),
String varchar(max) NOT NULL,
Number smallint NOT NULL
);

INSERT INTO #Test VALUES
('мама', 100),
('мыла', 200),
('пожилую', 300),
('раму', 500);

SELECT * FROM #Test;

DECLARE @ID smallint, @String varchar(max), @Number smallint;
DECLARE Test_Cursor CURSOR LOCAL SCROLL
FOR SELECT ID, String, Number FROM #Test FOR UPDATE;

OPEN Test_Cursor;
FETCH FROM Test_Cursor INTO @ID, @String, @Number;
DELETE FROM #Test WHERE CURRENT OF Test_Cursor;
FETCH RELATIVE 3 FROM Test_Cursor INTO @ID, @String, @Number;
UPDATE #Test SET Number = 1000 WHERE CURRENT OF Test_Cursor;
CLOSE Test_Cursor;
GO


-- 6
SELECT * FROM Student
SELECT * FROM Groups
SELECT * FROM Progress
INSERT INTO Student VALUES(1, 'Алексеев Максим Евгеньевич', '2000-01-01');
INSERT INTO Student VALUES(2, 'Акушевич Андрей Александрович', '1999-10-01');

INSERT INTO Progress VALUES('БД', 1087, '2019-06-28', 2);
INSERT INTO Progress VALUES('ООП', 1088, '2019-06-22', 3);

DECLARE @Note tinyint;
DECLARE Clean_Cursor CURSOR LOCAL DYNAMIC
FOR SELECT Note FROM Progress FOR UPDATE;

OPEN Clean_Cursor;
FETCH FROM Clean_Cursor INTO @Note;
WHILE @@FETCH_STATUS = 0
BEGIN 
IF @Note < 4
DELETE FROM Progress WHERE CURRENT OF Clean_Cursor;
FETCH FROM Clean_Cursor INTO @Note;
END

DELETE FROM Student WHERE StudentID = 1091;
DELETE FROM Student WHERE StudentID = 1092;
GO


-- 8
DECLARE Report_Cursor CURSOR LOCAL
FOR SELECT F.Faculty,
P.Pulpit, Count(T.Teacher), COUNT(S.Subject) FROM
Faculty F INNER JOIN Pulpit P
ON F.Faculty = P.Faculty
INNER JOIN Teacher T
ON P.Pulpit = T.Pulpit
INNER JOIN [Subject] S
ON P.Pulpit = S.Pulpit
GROUP BY F.Faculty, P.Pulpit

SELECT * FROM 
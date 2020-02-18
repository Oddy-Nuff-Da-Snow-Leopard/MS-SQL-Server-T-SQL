USE University;


-- Task01
GO
CREATE FUNCTION Count_Students(@faculty nvarchar(max)) returns int AS
BEGIN
	DECLARE @numberOfStudents int;
	SET @numberOfStudents = (SELECT COUNT(StudentID) FROM Student S
	INNER JOIN Groups G
	ON G.GroupID = S.GroupID
	WHERE G.Faculty = @faculty);

	return @numberOfStudents;
END
GO

DECLARE @faculty nvarchar(max) = 'ТОВ';
DECLARE @numberOfStudents int = dbo.Count_Students(@faculty);
PRINT CAST(@numberOfStudents AS nvarchar(max));

GO
ALTER FUNCTION Count_Students(@faculty nvarchar(max) = NULL,
@profession nvarchar(max) = NULL) returns int AS
BEGIN
	DECLARE @numberOfStudents int;
	SET @numberOfStudents = (SELECT COUNT(StudentID) FROM Student S
	INNER JOIN Groups G
	ON G.GroupID = S.GroupID
	WHERE G.Faculty = @faculty);

	return @numberOfStudents;
END
GO

SELECT Faculty, dbo.Count_Students(Faculty, default) FROM Faculty;

-- Task02
GO
CREATE FUNCTION Subjects_Summary(@pulpit nvarchar(max)) returns nvarchar(max) AS
BEGIN
	DECLARE Subject_Cursor CURSOR LOCAL FOR
	SELECT [Subject] FROM [Subject] WHERE Pulpit = @pulpit;
	DECLARE @result nvarchar(max) = 'Subjects: ';
	DECLARE @subject nvarchar(10);

	OPEN Subject_Cursor;
	FETCH FROM Subject_Cursor INTO @subject;

	WHILE @@FETCH_STATUS = 0
		BEGIN
		SET @result += RTRIM(@subject) + ', ';
		FETCH Subject_Cursor INTO @subject;
	END
	CLOSE Subject_Cursor;

	SET @result = REVERSE(@result);
	SET @result = REVERSE(SUBSTRING(@result, 3, LEN(@result)));

	RETURN @result;
END

GO
SELECT Pulpit, dbo.Subjects_Summary(Pulpit) AS 'Summary' FROM Pulpit;


-- Task03 WTF

GO
CREATE FUNCTION Get_Table(@faculty nvarchar(max), @pulpit nvarchar(max))
returns TABLE AS
RETURN SELECT F.Faculty, P.Pulpit FROM Faculty F
	INNER JOIN Pulpit P
	ON F.Faculty = P.Faculty
	WHERE F.Faculty = ISNULL(@faculty, F.Faculty) AND
	P.Pulpit = ISNULL(@pulpit, P.Pulpit);

GO

SELECT * FROM dbo.Get_Table(NULL, NULL);
SELECT * FROM dbo.Get_Table('ТОВ', NULL);
SELECT * FROM dbo.Get_Table(NULL, 'БФ');


-- Task04
GO
CREATE FUNCTION Count_Teacher(@pulpit nvarchar(max)) returns int AS
BEGIN
	DECLARE @NumberOfTeacher int = (SELECT COUNT(Teacher) FROM
	Teacher WHERE Pulpit = ISNULL(@pulpit, Pulpit));

	return @NumberOfTeacher;
END

GO
SELECT Pulpit, dbo.Count_Teacher(Pulpit) 'Amount of teachers'  FROM Pulpit;
SELECT dbo.Count_Teacher(NULL) 'Total amount of teachers';


-- Task06

 GO
CREATE FUNCTION Count_Pulpits(@faculty nvarchar(max)) returns int AS
BEGIN
	return (SELECT COUNT(Pulpit) FROM Pulpit WHERE Faculty = @faculty);
END

GO
CREATE FUNCTION Count_Groups(@faculty nvarchar(max)) returns int AS
BEGIN
	return (SELECT COUNT(GroupID) FROM Groups WHERE Faculty = @faculty);
END

GO
CREATE FUNCTION Count_Professions(@faculty nvarchar(max)) returns int AS
BEGIN
	return (SELECT COUNT(Profession) FROM Profession WHERE Faculty = @faculty);
END

 GO
CREATE FUNCTION Faculty_Report(@numberOfStudents int) returns @table TABLE
([Факультет] nvarchar(max), [Количество кафедр] int, [Количество групп]  int, 
[Количество студентов] int, [Количество специальностей] int ) AS
BEGIN
	DECLARE Faculty_Cursor CURSOR LOCAL STATIC FOR
	SELECT Faculty FROM Faculty
	WHERE dbo.Count_Students(Faculty, default) > @numberOfStudents; 
	DECLARE @faculty nvarchar(10);

	OPEN Faculty_Cursor;  
	FETCH Faculty_Cursor INTO @faculty;

	WHILE @@fetch_status = 0
	BEGIN
		INSERT INTO @table VALUES(@faculty, dbo.Count_Pulpits(@faculty),
		dbo.Count_Groups(@faculty), dbo.Count_Students(@faculty, NULL),
		dbo.Count_Professions(@faculty)); 
		FETCH Faculty_Cursor INTO @faculty;
	END
	  
	return; 
END

GO
SELECT * FROM dbo.Faculty_Report(30);
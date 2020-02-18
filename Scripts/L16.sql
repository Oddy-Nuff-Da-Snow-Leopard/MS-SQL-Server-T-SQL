USE University;

-- Task01
DROP TABLE [Trigger Teacher];
CREATE TABLE [Trigger Teacher]
(
	ID int IDENTITY(1, 1),
	[Statement] varchar(max) CHECK ([Statement] IN ('INSERT', 'DELETE', 'UPDATE')),
	[Trigger name] varchar(max),
	Comment varchar(max)
);
GO

DROP TRIGGER [Trigger Teacher Insert];
GO
CREATE TRIGGER [Trigger Teacher Insert] ON TEACHER AFTER INSERT AS
BEGIN
	DECLARE @teacher varchar(max), @teacherName varchar(max),
			@gender varchar(max), @pulpit varchar(max);

	PRINT 'INSERT operation';
	SET @teacher = (SELECT [Teacher] FROM INSERTED);
	SET @teacherName = (SELECT [Teacher name] FROM INSERTED);
	SET @gender = (SELECT [Gender] FROM INSERTED);
	SET @pulpit = (SELECT [Pulpit] FROM INSERTED);

	DECLARE @info varchar(max) = RTRIM(@teacher) + ' | ' + RTRIM(@teacherName) + ' | ' 
								+ RTRIM(@gender) + ' | ' + RTRIM(@pulpit) + '.';

	INSERT INTO [Trigger Teacher] VALUES
	('INSERT', 'Trigger Teacher Insert', @info);
END
GO


DELETE FROM Teacher WHERE Teacher = 'Алксв';
INSERT INTO Teacher VALUES ('Алксв', 'Алексеев Максим Евгеньевич', 'м', 'ИСиТ');
SELECT * FROM [Trigger Teacher];


-- Task02
GO
CREATE TRIGGER [Trigger Teacher Delete] ON TEACHER AFTER DELETE AS
BEGIN
	DECLARE @teacher varchar(max), @teacherName varchar(max),
			@gender varchar(max), @pulpit varchar(max);

	PRINT 'DELETE operation';
	SET @teacher = (SELECT [Teacher] FROM DELETED);
	SET @teacherName = (SELECT [Teacher name] FROM DELETED);
	SET @gender = (SELECT [Gender] FROM DELETED);
	SET @pulpit = (SELECT [Pulpit] FROM DELETED);

	DECLARE @info varchar(max) = RTRIM(@teacher) + ' | ' + RTRIM(@teacherName) + ' | ' 
								+ RTRIM(@gender) + ' | ' + RTRIM(@pulpit) + '.';

	INSERT INTO [Trigger Teacher] VALUES
	('DELETE', 'Trigger Teacher Delete', @info);
END


-- Task03
DROP TRIGGER [Trigger Teacher Update]
GO
CREATE TRIGGER [Trigger Teacher Update] ON TEACHER AFTER UPDATE AS
BEGIN
	DECLARE @teacher varchar(max), @teacherName varchar(max),
			@gender varchar(max), @pulpit varchar(max);

	DECLARE @info varchar(max);

	PRINT 'UPDATE operation';
	SET @teacher = (SELECT [Teacher] FROM DELETED);
	SET @teacherName = (SELECT [Teacher name] FROM DELETED);
	SET @gender = (SELECT [Gender] FROM DELETED);
	SET @pulpit = (SELECT [Pulpit] FROM DELETED);

	SET @info = 'DELETED: ' + RTRIM(@teacher) + ' | ' + RTRIM(@teacherName) + ' | ' 
								+ RTRIM(@gender) + ' | ' + RTRIM(@pulpit) + ';';

	SET @teacher = (SELECT [Teacher] FROM INSERTED);
	SET @teacherName = (SELECT [Teacher name] FROM INSERTED);
	SET @gender = (SELECT [Gender] FROM INSERTED);
	SET @pulpit = (SELECT [Pulpit] FROM INSERTED);

	SET @info += ' INSERTED: ' + RTRIM(@teacher) + ' | ' + RTRIM(@teacherName) + ' | ' 
								+ RTRIM(@gender) + ' | ' + RTRIM(@pulpit) + '.';

	INSERT INTO [Trigger Teacher] VALUES
	('UPDATE', 'Trigger Teacher Update', @info);
END
GO

UPDATE Teacher SET [Teacher name] = 'Дагестанский ингуш ежжи'
				WHERE [Teacher] = 'Алксв';


-- Task04
DROP TRIGGER [Teacher Trigger];
GO
CREATE TRIGGER [Teacher Trigger] ON Teacher AFTER INSERT, DELETE, UPDATE AS
BEGIN
	DECLARE @teacher varchar(max), @teacherName varchar(max),
			@gender varchar(max), @pulpit varchar(max);

	DECLARE @info varchar(max);

	DECLARE @insertsCount int = (SELECT COUNT(*) FROM INSERTED);
	DECLARE @deletionsCount int = (SELECT COUNT(*) FROM DELETED);

	IF (@insertsCount > 0 AND @deletionsCount = 0)
	BEGIN
		PRINT 'INSERT operation';
		SET @teacher = (SELECT [Teacher] FROM INSERTED);
		SET @teacherName = (SELECT [Teacher name] FROM INSERTED);
		SET @gender = (SELECT [Gender] FROM INSERTED);
		SET @pulpit = (SELECT [Pulpit] FROM INSERTED);

		SET @info = RTRIM(@teacher) + ' | ' + RTRIM(@teacherName) + ' | ' 
									+ RTRIM(@gender) + ' | ' + RTRIM(@pulpit) + '.';

		INSERT INTO [Trigger Teacher] VALUES
		('INSERT', 'Trigger Teacher', @info);
	END

	ELSE IF (@insertsCount = 0 AND @deletionsCount > 0)
	BEGIN
		PRINT 'DELETE operation';
		SET @teacher = (SELECT [Teacher] FROM DELETED);
		SET @teacherName = (SELECT [Teacher name] FROM DELETED);
		SET @gender = (SELECT [Gender] FROM DELETED);
		SET @pulpit = (SELECT [Pulpit] FROM DELETED);

		SET @info = RTRIM(@teacher) + ' | ' + RTRIM(@teacherName) + ' | ' 
									+ RTRIM(@gender) + ' | ' + RTRIM(@pulpit) + '.';

		INSERT INTO [Trigger Teacher] VALUES
		('DELETE', 'Trigger Teacher', @info);
	END

	ELSE IF (@insertsCount > 0 AND @deletionsCount > 0)
	BEGIN
		PRINT 'UPDATE operation';
		SET @teacher = (SELECT [Teacher] FROM DELETED);
		SET @teacherName = (SELECT [Teacher name] FROM DELETED);
		SET @gender = (SELECT [Gender] FROM DELETED);
		SET @pulpit = (SELECT [Pulpit] FROM DELETED);

		SET @info = 'DELETED: ' + RTRIM(@teacher) + ' | ' + RTRIM(@teacherName) + ' | ' 
									+ RTRIM(@gender) + ' | ' + RTRIM(@pulpit) + ';';

		SET @teacher = (SELECT [Teacher] FROM INSERTED);
		SET @teacherName = (SELECT [Teacher name] FROM INSERTED);
		SET @gender = (SELECT [Gender] FROM INSERTED);
		SET @pulpit = (SELECT [Pulpit] FROM INSERTED);

		SET @info += ' INSERTED: ' + RTRIM(@teacher) + ' | ' + RTRIM(@teacherName) + ' | ' 
									+ RTRIM(@gender) + ' | ' + RTRIM(@pulpit) + '.';

		INSERT INTO [Trigger Teacher] VALUES
		('UPDATE', 'Trigger Teacher', @info);
	END
END


-- Task05
ALTER TABLE Teacher ADD CONSTRAINT Gender CHECK (Gender IN ('м', 'ж'));

UPDATE Teacher SET [Gender] = 'C'
				WHERE [Teacher] = 'Алксв';


-- Task06

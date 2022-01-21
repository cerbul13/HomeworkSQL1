USE master
GO
--DROP DATABASE SIIT_DB

if DB_ID('SIIT_DB') IS NULL
BEGIN
	CREATE DATABASE SIIT_DB
	Print('Database SIIT_DB created.')
END
GO

USE SIIT_DB
GO

if OBJECT_ID('Students') IS NULL
BEGIN
	CREATE TABLE Students
	(
	  StudentID       INT           NOT NULL IDENTITY(1,1),
	  Name			  NVARCHAR(100) NOT NULL,
	  Profession      NVARCHAR(100) NOT NULL,
	  CourseID        int			NULL,
	  CONSTRAINT PK_StudentID PRIMARY KEY(StudentID)  
	);
END;

if OBJECT_ID('Courses') IS NULL
BEGIN
	CREATE TABLE Courses
	(
	  CourseID        INT           NOT NULL IDENTITY(1,1),
	  Name			  NVARCHAR(100) NOT NULL,
	  Duration        INT			NOT NULL,
	  TeacherID       INT			NULL,
	  CONSTRAINT PK_CourseID PRIMARY KEY(CourseID)  
	);
END;

if OBJECT_ID('Teachers') IS NULL
BEGIN
	CREATE TABLE Teachers
	(
	  TeacherID       INT           NOT NULL IDENTITY(1,1),
	  Name			  NVARCHAR(100) NOT NULL,
	  CONSTRAINT PK_TeacherID PRIMARY KEY(TeacherID)  
	);
END;

INSERT INTO Students (Name,Profession,CourseID) VALUES ('Student 1','Programmer',1)
INSERT INTO Students VALUES ('Student 2','Mechanic',NULL)
INSERT INTO Students VALUES ('Student 3','Baker',1)
INSERT INTO Students VALUES ('Student 4','Farmer',2)
INSERT INTO Students VALUES ('Student 5','Butcher',1)
INSERT INTO Students VALUES ('Student 6','Fireman',1)
INSERT INTO Students VALUES ('Student 7','Journalist',2)
INSERT INTO Students VALUES ('Student 8','Singer',2)
INSERT INTO Students VALUES ('Student 9','Lawyer',1)
INSERT INTO Students SELECT 'Student 10','Postman',2
SELECT * FROM Students

INSERT INTO Courses (Name,Duration,TeacherID) VALUES ('Course 1',5,1)
INSERT INTO Courses VALUES ('Course 2',10,NULL)
SELECT * FROM Courses

INSERT INTO Teachers (Name) VALUES ('Teacher 1')
INSERT INTO Teachers VALUES ('Teacher 2')
SELECT * FROM Teachers




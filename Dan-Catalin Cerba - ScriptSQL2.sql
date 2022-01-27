USE SIIT_DB
GO

--1) Modify the Students table and make the CourseID a foreign key referencing the Courses table
ALTER TABLE Students
ADD FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)

--2) Modify the Courses table and make the TeacherID a foreign key referencing the Teachers table
ALTER TABLE Courses
ADD FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)

--3) Modify the Teachers table and add 2 new columns: Email and PhoneNumber
ALTER TABLE Teachers
ADD Email nvarchar(100) NULL
ALTER TABLE Teachers
ADD PhoneNumber nvarchar(50) NULL
GO

--4) Modify the data in the Teacher table like so:
--one teacher should have the following Email: teacher@scoalainformala.ro and PhoneNumber +50123456789
--one teacher should have the following: Email: siit_teacher@gmail.com and PhoneNumber: +40740123456
--one teacher should have both Email and PhoneNumber NULL

UPDATE Teachers
SET Email='teacher@scoalainformala.ro', PhoneNumber='+50123456789'
WHERE Name='Teacher 1'
UPDATE Teachers
SET Email='siit_teacher@gmail.com', PhoneNumber='+40740123456'
WHERE Name='Teacher 2'
INSERT INTO Teachers VALUES('Teacher 3', NULL, NULL)

--5) If needed, update the Courses.TeacherID data to match the above teachers
INSERT INTO Courses VALUES ('Course 3',7,3)
UPDATE Courses
SET TeacherID=2 
WHERE Name='Course 2'

--6) Select the Course with the highest duration
-- Version 1
--SELECT TOP 1 * FROM Courses 
--ORDER BY Duration DESC
-- Version 2
SELECT TOP 1 * FROM Courses 
WHERE Duration=(SELECT MAX(Duration) FROM Courses)

--7) Select the average Course duration
SELECT AVG(CAST(Duration as Float)) FROM COURSES

--8) Select the number(count) of students for each Course
SELECT COUNT(*) as StudentsCount,CourseID FROM Students 
WHERE CourseID IS NOT NULL
GROUP BY CourseID

--9) Select the teachers who's email address ends with @scoalainformala.ro
SELECT * FROM Teachers 
WHERE Email LIKE '%@scoalainformala.ro'

--10) Select the teachers that have a Romanian phone number (starts with +40)
SELECT * FROM Teachers 
WHERE PhoneNumber LIKE '+40%'

--11) Select the Students enrolled in a course that is longer than 2.5 (if needed update the Courses.Duration data to values above and below 2.5)
ALTER TABLE Courses
ALTER COLUMN Duration Float
GO
UPDATE Courses
SET Duration=2.3
WHERE Name='Course 1'
UPDATE Students SET CourseID=3 WHERE Name='Student 2'
SELECT * FROM Students WHERE Students.CourseID IN (SELECT CourseID FROM COURSES WHERE Duration >2.5)

--12) Select the Courses that have a teacher with an @scoalainformala.ro email address
SELECT * FROM Courses WHERE TeacherID IN (SELECT TeacherID FROM Teachers WHERE Email like '%@scoalainformala.ro')

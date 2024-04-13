--Retrieve a list of all classes with their details:
SELECT * FROM Class;

--Retrieve a list of all courses:
SELECT * FROM Course;

--Retrieve a list of all students:
SELECT * FROM Student;

--Retrieve a list of all teachers:
SELECT * FROM Teacher;

--Retrieve a list of all assignments for a specific class:
SELECT * FROM Assignment WHERE class_id = [class_id];

--Retrieve grades for a specific student:
SELECT * FROM Grade WHERE enrollment_id IN (SELECT enrollment_id FROM Enrollment WHERE student_id = [student_id]);

--Retrieve attendance records for a specific class:
SELECT * FROM Attendance WHERE enrollment_id IN (SELECT enrollment_id FROM Enrollment WHERE class_id = [class_id]);

--Retrieve transcript for a specific student:
SELECT * FROM Transcript WHERE student_id = [student_id];

--Retrieve the number of students enrolled in each class:
SELECT Class.class_id, COUNT(Enrollment.student_id) 
FROM Class
LEFT JOIN Enrollment ON Class.class_id = Enrollment.class_id
GROUP BY Class.class_id;

--Retrieve a list of students with their parent information:
SELECT Student.*, Parent.*
FROM Student
JOIN Parent ON Student.parent_id = Parent.parent_id;

--Retrieve a list of classes without any assigned teacher:
SELECT *
FROM Class
LEFT JOIN Teach ON Class.class_id = Teach.class_id
WHERE Teach.teacher_id IS NULL;

--Retrieve a list of students and their corresponding transcripts:
SELECT Student.*, Transcript.grade, Transcript.course_id
FROM Student
JOIN Transcript ON Student.student_id = Transcript.student_id;





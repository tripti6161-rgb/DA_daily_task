-- day 01
CREATE DATABASE CollegeDB;
USE CollegeDB;

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18),
    city VARCHAR(50) DEFAULT 'Delhi',
    course VARCHAR(50) NOT NULL,
    fees DECIMAL(10,2)
);

DESC Student;
ALTER TABLE Student
ADD phone VARCHAR(15);

ALTER TABLE Student
MODIFY phone VARCHAR(20);

ALTER TABLE Student
MODIFY phone VARCHAR(20);

INSERT INTO Student
(student_id, name, email, age, city, course, fees)
VALUES
(1, 'Rahul', 'rahul@gmail.com', 20, 'Delhi', 'BCA', 45000),
(2, 'Aman', 'aman@gmail.com', 21, 'Meerut', 'BCA', 50000),
(3, 'Priya', 'priya@gmail.com', 19, 'Noida', 'BBA', 40000),
(4, 'Neha', 'neha@gmail.com', 22, 'Delhi', 'BTech', 75000),
(5, 'Rohit', 'rohit@gmail.com', 20, 'Ghaziabad', 'BCA', 48000);

SELECT * FROM Student;
TRUNCATE TABLE Student;

-- day 02
SELECT name, age, course
FROM Student;

SELECT *
FROM Student
WHERE age > 20;

SELECT *
FROM Student
WHERE city = 'Delhi';

SELECT *
FROM Student
WHERE age BETWEEN 20 AND 22;

SELECT *
FROM Student
WHERE course = 'BCA';

SELECT *
FROM Student
WHERE course IN ('BCA', 'BTech');

SELECT *
FROM Student
WHERE name LIKE 'A%';

SELECT *
FROM Student
WHERE name LIKE '%a';

SELECT *
FROM Student
WHERE name LIKE '%h%';

SELECT *
FROM Student
WHERE age > 20
AND city = 'Delhi';

SELECT *
FROM Student
WHERE city = 'Delhi'
OR city = 'Meerut';

UPDATE Student
SET fees = 55000
WHERE student_id = 2;


UPDATE Student
SET city = 'Noida'
WHERE student_id = 1;

DELETE FROM Student
WHERE student_id = 5;
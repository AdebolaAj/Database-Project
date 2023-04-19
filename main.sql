-- Question 2
CREATE TABLE departments (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE courses (
  department_id INTEGER REFERENCES departments(id),
  course_id INT PRIMARY KEY,
  course_number VARCHAR(10) NOT NULL,
  name VARCHAR(255) NOT NULL,
  semester VARCHAR(10) NOT NULL,
  year INTEGER NOT NULL
);

CREATE TABLE assignments (
  assignment_id INT PRIMARY KEY,
  category VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  percentage DECIMAL(5,2),
  course_id INTEGER REFERENCES courses(course_id)
);

CREATE TABLE students (
  student_id INT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  course_id INT,
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE grades (
  grade_id INT PRIMARY KEY,
  student_id INTEGER REFERENCES students(student_id),
  assignment_id INTEGER REFERENCES assignments(student_id),
  score DECIMAL(5,2),
  grade INTEGER NOT NULL
);

INSERT INTO departments (id, name) VALUES (636, 'Computer Science');

INSERT INTO courses (department_id, course_id, course_number, name, semester, year) VALUES (636, 1, 101, 'Intro to Programming', 'Fall', 2022),
       (636, 2, 102, 'Programming 2', 'Fall', 2022),
       (636, 3, 201, 'Database Systems', 'Fall', 2022);

INSERT INTO assignments (assignment_id, category, name, percentage, course_id) 
  VALUES (1, 'Participation', 'Participation', 10.0, 1),
         (2, 'Homework', 'Homework', 20.0, 1),
         (3, 'Tests', 'Tests', 50.0, 1),
         (4, 'Projects', 'Projects', 20.0, 1);

INSERT INTO students (student_id, first_name, last_name, course_id) 
  VALUES (100,'Adebola', 'Ajayi', 1),
         (200,'David', 'Oluyomi-Lords', 1),
         (400,'James', 'Qui', 3),
         (300,'Onwuosiuno', 'Ikhioda', 1);


INSERT INTO grades (student_id, assignment_id, grade_id, grade) 
  VALUES (100, 1, 1, 95),
         (100, 2, 2, 100),
         (100, 3, 3, 96),
         (100, 4, 4, 95),
         (200, 1, 5, 90),
         (200, 2, 6, 95),
         (200, 3, 7, 100),
         (200, 4, 8, 95),
         (300, 1, 9, 85),
         (300, 2, 10, 67),
         (300, 3, 11, 75),
         (300, 4, 12, 95),
         (400, 1, 13, 85),
         (400, 2, 14, 87),
         (400, 3, 15, 75),
         (400, 4, 16, 95);

-- Question 3
SELECT * FROM departments;

SELECT * FROM courses;

SELECT * FROM assignments;

SELECT * FROM students;

SELECT * FROM grades;

-- Question 4

SELECT AVG(grade) as average_grade
FROM grades
WHERE assignment_id = [assignment_id];
SELECT MAX(grade) as highest_grade
FROM grades
WHERE assignment_id = [assignment_id];

SELECT MIN(grade) as lowest_grade
FROM grades
WHERE assignment_id = [assignment_id];

-- Question 5

SELECT s.* 
FROM students s JOIN courses c ON s.course_id = c.course_id
where c.course_id = 1;

-- Question 6

SELECT s.*, g.*
FROM students s JOIN grades g ON s.student_id = g.student_id JOIN assignments a ON g.assignment_id = a.assignment_id
WHERE s.course_id = 1;

-- Question 7

INSERT INTO assignments (assignment_id, category, name, percentage, course_id) 
VALUES (5, 'Final Exam', 'Final Exam', 30.0, 1);
SELECT * FROM assignments;

INSERT INTO grades (student_id, assignment_id, grade_id, grade) 
  VALUES (100, 5, 17, 95),
         (200, 5, 18, 100),
         (300, 5, 19, 96),
         (400, 5, 20, 96);

-- Question 8

-- UPDATE assignments
-- SET percentage = 30.0
-- WHERE category = "Tests" and course_id = 1;

-- UPDATE assignments
-- SET percentage = 10.0
-- WHERE category = "Homework" and course_id = 1;
-- SELECT * FROM assignments;

-- Question 9

-- UPDATE grades
-- SET grade = grade + 2
-- WHERE assignment_id = 2;

-- SELECT * FROM grades;

-- Question 10

-- UPDATE grades
-- SET grade = grade + 2
-- WHERE assignment_id = 2
-- AND student_id IN (
--   SELECT student_id FROM students WHERE lower(last_name) LIKE '%q%'
-- );
-- SELECT * FROM grades;

-- Question 11

-- SELECT 
--   s.first_name, 
--   s.last_name, 
-- SUM((a.percentage * g.grade)/100) AS grade
-- FROM students s
-- JOIN grades g ON s.student_id = g.student_id
-- JOIN assignments a ON g.assignment_id = a.assignment_id
-- GROUP BY s.first_name, s.last_name
-- HAVING s.student_id = 100;

-- Question 12
-- SELECT 
--   s.first_name, 
--   s.last_name,
-- SUM((a.percentage * g.grade - (SELECT MIN(g.grade) FROM grades g))/100) AS grade
-- FROM students s
-- JOIN grades g ON s.student_id = g.student_id
-- JOIN assignments a ON g.assignment_id = a.assignment_id
-- GROUP BY s.first_name, s.last_name
-- HAVING s.student_id = 100;

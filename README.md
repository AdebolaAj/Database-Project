# Database-Project
## Link to code: https://replit.com/join/luvndstyep-ajayiade
It is auto compiled so yyou can easily run it.
### Task 1
![erd drawio](https://user-images.githubusercontent.com/57672853/232942115-4462356a-886c-4925-8d26-aa5dd555c8e0.png)

### Task 2

```
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
```
### Tak 3 
```
SELECT * FROM departments;

SELECT * FROM courses;

SELECT * FROM assignments;

SELECT * FROM students;

SELECT * FROM grades;
```
Which outputs:
<img width="813" alt="Screenshot 2023-04-18 at 9 28 03 PM" src="https://user-images.githubusercontent.com/57672853/232943255-a6644ff6-302c-48b5-8ea3-74401f1eda50.png">
<img width="800" alt="Screenshot 2023-04-18 at 9 28 33 PM" src="https://user-images.githubusercontent.com/57672853/232943256-08aa9e71-7ad0-4bee-a3a2-51e14d729d04.png">
<img width="801" alt="Screenshot 2023-04-18 at 9 29 03 PM" src="https://user-images.githubusercontent.com/57672853/232943257-2c400240-0c79-49b4-bbc4-2598e8ad096a.png">
<img width="800" alt="Screenshot 2023-04-18 at 9 29 18 PM" src="https://user-images.githubusercontent.com/57672853/232943258-301a55a4-c284-402f-bdf5-58c87f1a02d5.png">
<img width="804" alt="Screenshot 2023-04-18 at 9 31 57 PM" src="https://user-images.githubusercontent.com/57672853/232944185-a390a7d5-8d2a-4128-8901-a4db0e812958.png">
The score still being NULL because the final grade has not being calculated.

### Task 4
```
SELECT AVG(grade) as average_grade
FROM grades
WHERE assignment_id = [assignment_id];
SELECT MAX(grade) as highest_grade
FROM grades
WHERE assignment_id = [assignment_id];

SELECT MIN(grade) as lowest_grade
FROM grades
WHERE assignment_id = [assignment_id];
```
Which outputs: 
89.375
100
67

### Task 5
```
SELECT s.* 
FROM students s JOIN courses c ON s.course_id = c.course_id
where c.course_id = 1;
```
<img width="802" alt="Screenshot 2023-04-18 at 9 39 36 PM" src="https://user-images.githubusercontent.com/57672853/232944658-e0501d2b-f232-4dd1-ad2e-cbc7759896a8.png">

### Task 6
```
SELECT s.*, g.*
FROM students s JOIN grades g ON s.student_id = g.student_id JOIN assignments a ON g.assignment_id = a.assignment_id
WHERE s.course_id = 1;
```
<img width="800" alt="Screenshot 2023-04-18 at 9 40 01 PM" src="https://user-images.githubusercontent.com/57672853/232944826-78b722d5-85a0-455e-a551-94476dbf616d.png">

### Task 7
```
INSERT INTO assignments (assignment_id, category, name, percentage, course_id) 
VALUES (5, 'Final Exam', 'Final Exam', 30.0, 1);
SELECT * FROM assignments;

INSERT INTO grades (student_id, assignment_id, grade_id, grade) 
  VALUES (100, 5, 17, 95),
         (200, 5, 18, 100),
         (300, 5, 19, 96),
         (400, 5, 20, 96);
```
<img width="800" alt="Screenshot 2023-04-18 at 9 40 43 PM" src="https://user-images.githubusercontent.com/57672853/232945687-94a6bba4-dac3-4401-a5c0-624868717ab9.png">

### Task 8
```
UPDATE assignments
SET percentage = 30.0
WHERE category = "Tests" and course_id = 1;

UPDATE assignments
SET percentage = 10.0
WHERE category = "Homework" and course_id = 1;
SELECT * FROM assignments;
```
<img width="804" alt="Screenshot 2023-04-18 at 9 56 16 PM" src="https://user-images.githubusercontent.com/57672853/232946854-625579c7-b1be-4e4f-bb75-00bbab3ff695.png">

### Task 9
```
UPDATE grades
SET grade = grade + 2
WHERE assignment_id = 2;

SELECT * FROM grades;
```
<img width="804" alt="Screenshot 2023-04-18 at 9 56 42 PM" src="https://user-images.githubusercontent.com/57672853/232946898-fe139e8c-f26f-4fee-8b0e-befaf70e80a3.png">

### Task 10

```
UPDATE grades
SET grade = grade + 2
WHERE assignment_id = 2
AND student_id IN (
  SELECT student_id FROM students WHERE lower(last_name) LIKE '%q%'
);
SELECT * FROM grades;
```
<img width="799" alt="Screenshot 2023-04-18 at 9 57 05 PM" src="https://user-images.githubusercontent.com/57672853/232947075-50100995-8c01-46b6-9b53-1655884232d7.png">

### Task 11

```

SELECT 
  s.first_name, 
  s.last_name, 
SUM((a.percentage * g.grade)/100) AS grade
FROM students s
JOIN grades g ON s.student_id = g.student_id
JOIN assignments a ON g.assignment_id = a.assignment_id
GROUP BY s.first_name, s.last_name
HAVING s.student_id = 100;
```
Adebola|Ajayi|94
### Task 12

```
SELECT 
  s.first_name, 
  s.last_name,
SUM((a.percentage * g.grade - (SELECT MIN(g.grade) FROM grades g))/100) AS grade
FROM students s
JOIN grades g ON s.student_id = g.student_id
JOIN assignments a ON g.assignment_id = a.assignment_id
GROUP BY s.first_name, s.last_name
HAVING s.student_id = 100;
```
Adebola|Ajayi|90

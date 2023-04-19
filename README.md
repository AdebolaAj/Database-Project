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

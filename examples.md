# Example questions and results

Each question below was submitted to the app as written. The SQL and responses are copied from that run. The fourth question resulted in an error instead of a query result.

## Example 1

**Question:** Which courses does Maya Chen take, and what grades does she have?

**Generated SQL:**
```sql
SELECT courses.course_name, enrollments.grade 
FROM people 
JOIN students ON people.person_id = students.person_id 
JOIN enrollments ON students.student_id = enrollments.student_id 
JOIN courses ON enrollments.course_id = courses.course_id 
WHERE people.first_name = 'Maya' AND people.last_name = 'Chen';
```

**Response:** Maya Chen takes the following courses and has the corresponding grades:

- Algebra I: A
- Biology: B+
- World History: A-

## Example 2

**Question:** Who teaches Biology?

**Generated SQL:**
```sql
SELECT DISTINCT p.first_name, p.last_name 
FROM people p 
JOIN teachers t ON p.person_id = t.person_id 
JOIN courses c ON t.teacher_id = c.teacher_id 
WHERE c.course_name = 'Biology';
```

**Response:** Sam Wilson teaches Biology.

## Example 3

**Question:** List the students in Algebra I and their grades.

**Generated SQL:**
```sql
SELECT p.first_name, p.last_name, e.grade 
FROM people p 
JOIN students s ON p.person_id = s.person_id 
JOIN enrollments e ON s.student_id = e.student_id 
JOIN courses c ON e.course_id = c.course_id 
WHERE c.course_name = 'Algebra I';
```

**Response:** The students in Algebra I and their grades are:

1. Maya Chen - A
2. Noah Patel - B
3. Ava Garcia - A-
4. Olivia Kim - B+

## Example 4

**Question:** What is the average grade level of the students? (The data has grade labels, not numeric scores; this should expose a limitation.)

**Generated SQL or error:** `OperationalError: near ".": syntax error`

**Response:** Could not answer that question: OperationalError: near ".": syntax error

## Example 5

**Question:** How many students are enrolled in each course?

**Generated SQL:**
```sql
SELECT courses.course_id, COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id;
```

**Response:** The number of students enrolled in each course is as follows:

- Course 1: 4 students
- Course 2: 4 students
- Course 3: 4 students

## Example 6

**Question:** Which students have an A in Biology?

**Generated SQL:**
```sql
SELECT s.student_id, p.first_name, p.last_name 
FROM students s 
JOIN people p ON s.person_id = p.person_id 
JOIN enrollments e ON s.student_id = e.student_id 
JOIN courses c ON e.course_id = c.course_id 
WHERE e.grade = 'A' AND c.course_name = 'Biology';
```

**Response:** The students who have an A in Biology are:

1. Ava Garcia (Student ID: 3)
2. Olivia Kim (Student ID: 5)

## Example 7

**Question:** What courses does Jordan Rivera teach?

**Generated SQL:**
```sql
SELECT courses.course_name 
FROM courses 
JOIN teachers ON courses.teacher_id = teachers.teacher_id 
JOIN people ON teachers.person_id = people.person_id 
WHERE people.first_name = 'Jordan' AND people.last_name = 'Rivera';
```

**Response:** Jordan Rivera teaches the following courses: Algebra I and World History.

## Example 8

**Question:** Which student has the most course enrollments?

**Generated SQL:**
```sql
SELECT student_id, COUNT(*) AS enrollment_count FROM enrollments GROUP BY student_id ORDER BY enrollment_count DESC LIMIT 1;
```

**Response:** The student with the most course enrollments is student ID 1, with 3 enrollments.

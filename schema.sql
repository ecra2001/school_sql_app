PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS people (
    person_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE
);

CREATE TABLE IF NOT EXISTS teachers (
    teacher_id INTEGER PRIMARY KEY,
    person_id INTEGER NOT NULL UNIQUE REFERENCES people(person_id)
);

CREATE TABLE IF NOT EXISTS students (
    student_id INTEGER PRIMARY KEY,
    person_id INTEGER NOT NULL UNIQUE REFERENCES people(person_id),
    grade_level INTEGER NOT NULL CHECK (grade_level BETWEEN 1 AND 12)
);

CREATE TABLE IF NOT EXISTS courses (
    course_id INTEGER PRIMARY KEY,
    course_name TEXT NOT NULL,
    teacher_id INTEGER NOT NULL REFERENCES teachers(teacher_id)
);

CREATE TABLE IF NOT EXISTS enrollments (
    enrollment_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL REFERENCES students(student_id),
    course_id INTEGER NOT NULL REFERENCES courses(course_id),
    grade TEXT,
    UNIQUE (student_id, course_id)
);

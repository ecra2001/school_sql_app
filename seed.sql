INSERT OR IGNORE INTO people (person_id, first_name, last_name, email) VALUES
    (1, 'Maya', 'Chen', 'maya.chen@example.edu'),
    (2, 'Noah', 'Patel', 'noah.patel@example.edu'),
    (3, 'Ava', 'Garcia', 'ava.garcia@example.edu'),
    (4, 'Ethan', 'Brooks', 'ethan.brooks@example.edu'),
    (5, 'Olivia', 'Kim', 'olivia.kim@example.edu'),
    (6, 'Liam', 'Reed', 'liam.reed@example.edu'),
    (7, 'Jordan', 'Rivera', 'jordan.rivera@example.edu'),
    (8, 'Sam', 'Wilson', 'sam.wilson@example.edu');

INSERT OR IGNORE INTO teachers (teacher_id, person_id) VALUES (1, 7), (2, 8);
INSERT OR IGNORE INTO students (student_id, person_id, grade_level) VALUES
    (1, 1, 9), (2, 2, 10), (3, 3, 9), (4, 4, 11), (5, 5, 10), (6, 6, 12);
INSERT OR IGNORE INTO courses (course_id, course_name, teacher_id) VALUES
    (1, 'Algebra I', 1), (2, 'Biology', 2), (3, 'World History', 1);
INSERT OR IGNORE INTO enrollments (enrollment_id, student_id, course_id, grade) VALUES
    (1, 1, 1, 'A'), (2, 1, 2, 'B+'), (3, 1, 3, 'A-'),
    (4, 2, 1, 'B'), (5, 2, 2, 'A-'),
    (6, 3, 1, 'A-'), (7, 3, 2, 'A'), (8, 3, 3, 'B+'),
    (9, 4, 3, 'B'), (10, 5, 2, 'A'), (11, 5, 1, 'B+'), (12, 6, 3, 'A');

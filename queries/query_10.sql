SELECT sub.name
FROM grades g
JOIN subjects sub ON sub.id = g.subject_id
JOIN teachers t ON t.id = sub.teacher_id
JOIN students s ON s.id = g.student_id
WHERE s.fullname = 'Ivan Ivanov' AND t.fullname = 'Dr.Smith';
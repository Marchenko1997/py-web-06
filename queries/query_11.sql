SELECT s.fullname AS student, t.fullname AS teacher, ROUND(AVG(g.grade), 2) AS avg_grade
FROM grades g
JOINT students s ON s.id = g.student_id
JOINT subjects sub ON sub.id = g.subject_id
JOINT teachers t ON t.id = sub.teacher_id
WHERE s.fullname = 'Ivan Ivanov' AND t.fullname = 'Dr.Smith'
GROUP BY s.id, t.id;
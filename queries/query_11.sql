SELECT s.fullname AS student, t.fullname AS teacher, ROUND(AVG(g.grade), 2) AS avg_grade
FROM grades g
JOIN students s ON s.id = g.student_id
JOIN subjects sub ON sub.id = g.subject_id
JOIN teachers t ON t.id = sub.teacher_id
WHERE s.fullname = 'Cheryl Smith' AND t.fullname = 'Beth Hinton'
GROUP BY s.id, t.id;
SELECT DISTINCT sub.name
FROM grades g
JOIN subjects sub ON sub.id = g.subject_id
JOIN students s ON s.id = g.student_id
WHERE s.fullname = 'Cheryl Smith';
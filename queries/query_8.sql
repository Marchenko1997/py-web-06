SELECT t.fullname, ROUND(AVG(g.grade), 2) AS avg_grade
FROM grades g
JOIN subjects sub ON sub.id = g.subject_id
JOIN teachers t ON t.id = sub.teacher_id
WHERE t.fullname = 'Dr.Smith'
GROUP BY t.id
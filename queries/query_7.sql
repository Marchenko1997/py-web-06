SELECT s.fullname, g.grade
FROM grades g
JOIN students s ON s.id = g.student_id
JOIN subjects sub ON sub.id = g.subject_id
JOIN groups gr ON gr.id = s.group_id
WHERE sub.name = "History" AND gr.name = "Group A"
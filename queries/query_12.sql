SELECT s.fullname AS student, g.grade, g.grade_date
FROM grades g
JOIN students s ON s.id = g.student_id
JOIN subjects sub ON sub.id = g.subject_id
JOIN groups gr On gr.id = s.group_id
WHERE gr.name = 'Group B' AND sub.name = "English"
AND g.grade_date = (
    SELECT MAX(g2.grade_date)
    FROM grades g2
    JOIN students s2 ON s2.id = g2.student_id
    WHERE s2.group_id = gr.id
    AND g2.subject_id = sub.id
)
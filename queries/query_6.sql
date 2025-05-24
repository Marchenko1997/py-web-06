SELECT s.fullname FROM students s
JOIN groups g ON g.id = s.group_id
WHERE g.name = "Group C"
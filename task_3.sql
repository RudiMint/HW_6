SELECT g.name AS group_name, AVG(grades.grade) AS average_grade
FROM groups g
JOIN students s ON g.id = s.group_id
JOIN grades ON s.id = grades.student_id
JOIN subjects ON grades.subject_id = subjects.id
WHERE subject_id = 1
GROUP BY g.id, g.name;

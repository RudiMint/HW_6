SELECT teachers.fullname AS teacher_name, subjects.name AS course_name, AVG(grades.grade) AS average_grade
FROM teachers
JOIN subjects ON teachers.id = subjects.teacher_id
JOIN grades ON subjects.id = grades.subject_id
WHERE teachers.id = 1
GROUP BY teachers.fullname, subjects.name;
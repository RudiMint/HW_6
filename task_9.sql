SELECT DISTINCT subjects.name AS course_name
FROM subjects
JOIN grades ON subjects.id = grades.subject_id
JOIN students ON grades.student_id = students.id
WHERE students.id = 1;
SELECT subjects.name AS course_name
FROM subjects
JOIN teachers ON subjects.teacher_id = teachers.id
WHERE teachers.id = 1;
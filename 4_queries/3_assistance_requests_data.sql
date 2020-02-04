SELECT teachers.name as teacher,
       students.name as student,
       assignments.name as assignment,
       (assistance_requests.completed_at - assistance_requests.started_at) as duration
FROM assistance_requests
LEFT JOIN teachers ON teacher_id = teachers.id
LEFT JOIN students ON student_id = students.id
LEFT JOIN assignments ON assignment_id = assignments.id
ORDER BY duration;
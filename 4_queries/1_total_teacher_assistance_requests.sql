SELECT count(assistance_requests.teacher_id) as total_assistances,
       teachers.name
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
GROUP BY teachers.name
HAVING teachers.name = 'Waylon Boehm';
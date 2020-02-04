SELECT DISTINCT teachers.name as teacher,
                cohorts.name
FROM teachers
JOIN assistance_requests ar ON teachers.id = teacher_id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY cohorts.name,
         teachers.name
ORDER BY cohorts.name;
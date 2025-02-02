-- SELECT
--   ( SELECT count(assignments)
--    FROM assignments)-count(assignment_submissions) as total_incomplete
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- WHERE students.name = 'Ibrahim Schimmel';
 -- Select avg(total_students) as average_students
-- FROM
--   (SELECT count(students) as total_students
--    FROM students
--    JOIN cohorts on cohorts.id = cohort_id
--    GROUP BY cohorts.name ) as totals_table;

SELECT assignments.name
FROM assignments
WHERE id NOT IN
    (SELECT assignment_id
     FROM assignment_submissions
     JOIN students ON students.id = student_id
     WHERE students.name = 'Ibrahim Schimmel' );
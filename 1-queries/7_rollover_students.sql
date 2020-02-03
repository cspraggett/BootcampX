SELECT
  students.name AS student_name,
  cohorts.name AS cohort_name,
  cohorts.start_date AS cohort_start_date,
  students.start_date AS student_start_date
FROM students
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE
  students.start_date <> cohorts.start_date
ORDER BY
  cohorts.start_date;
-- instructions say to order by name of cohort, but that does not return the same result as the EXPECTED result.
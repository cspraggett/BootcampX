SELECT co.name as cohort,
       sum(completed_at - started_at) as total_duration
FROM assistance_requests
JOIN students st ON student_id = st.id
JOIN cohorts co ON cohort_id = co.id
GROUP BY cohort
ORDER BY total_duration;
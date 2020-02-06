const {Pool} = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2] || 'JUL02';
const value = [`${cohortName}`];

pool.query(`
SELECT DISTINCT teachers.name as teacher,
                cohorts.name
FROM teachers
JOIN assistance_requests ar ON teachers.id = teacher_id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = $1
ORDER BY cohorts.name;
`, value)
  .then(res => {
    res.rows.forEach(assist => {
      console.log(`${assist.name}: ${assist.teacher}`);
    });
  })
  .catch(err => console.error('query error', err.stack));
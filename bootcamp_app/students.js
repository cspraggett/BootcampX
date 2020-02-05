const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const [cohort, max] = process.argv.slice(2);
//console.log(cohort, max);

pool.query(`
SELECT students.id, students.name, cohorts.name as cohort_name
FROM students JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE '%${cohort.toUpperCase()}%'
LIMIT ${max};`)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
    });
  })
  .catch(err => console.error('query error', err.stack));
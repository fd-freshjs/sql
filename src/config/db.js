const dbconfig = {
  user: process.env.PGUSER,
  database: process.env.PGDATABASE,
  password: process.env.PGPASSWORD,

  host: process.env.PGHOST,
  port: process.env.PGPORT,
  dialect: 'postgres'
}

module.exports = dbconfig;

require("dotenv").config();
const { Client } = require("pg");

const client = new Client();

const createSQLString = (string) => `'${string}'`;

const createUserValue = (full_name, email, dob, country, tall) => `
(${createSQLString(full_name)},
${createSQLString(email)},
${createSQLString(dob)},
${createSQLString(country)},
${tall.toFixed(2)})`;

const getUsersFromServer = async () => {
  const { data: { results: users } } = await axios.get('/users');

  const userValues = users.map(user => 
    createUserValue(
      `${user.name.first} ${user.name.last}`,
      user.email,
      user.dob.date,
      user.location.state,
      Math.random() * 3 + 0.2
    )
  );

  return userValues;
}

(async () => {
  await client.connect();

  /* await client.query(`
    ALTER TABLE users
    ADD COLUMN tall numeric(3, 2)
    NOT NULL CHECK(tall BETWEEN 0.2 AND 3.00) DEFAULT 0.3
  `); */

  const userValues = await getUsersFromServer();

  await client.query(`
    INSERT INTO users
    (full_name, email, dob, country, tall)
    VALUES
    ${userValues.join(', ')};
  `);

  await client.end();
  process.exit();
})();
// IIFE

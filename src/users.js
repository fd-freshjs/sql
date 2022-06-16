const axios = require("axios");
const { createSQLString } = require("./utils");

const createUserStringRow = (full_name, email, dob, country, tall) => {
return `
(
  ${createSQLString(full_name)},
  ${createSQLString(email)},
  ${createSQLString(dob)},
  ${createSQLString(country)},
  ${tall.toFixed(2)}
)`;
}
module.exports.createUserStringRow = createUserStringRow;


const getUsersFromServer = async () => {
  const { data: { results: users } } = await axios.get('https://randomuser.me/api/?results=50&seed=fresh');

  const userValues = users.map(user =>
    createUserStringRow(
      `${user.name.first} ${user.name.last}`,
      user.email,
      user.dob.date,
      user.location.state,
      0.2 + Math.random() * 2
    )
  );

  return userValues;
}
module.exports.getUsersFromServer = getUsersFromServer;

module.exports.userQueries = async (client) => {
  /* await client.query(`
    ALTER TABLE users
    ADD COLUMN tall numeric(3, 2)
    NOT NULL CHECK(tall BETWEEN 0.2 AND 3.00) DEFAULT 0.3
  `); */

  const userValues = await getUsersFromServer();

  const queryString = `
  INSERT INTO users
  (full_name, email, dob, country, tall)
  VALUES
  ${userValues.join(', ')};
  `;
  /* 
    ('full_name', 'email@mail.com', '2022-6-4', 'Ukraine', 1.03),
    (),
    ();
  */
  console.log(queryString);

  await client.query(queryString);
}

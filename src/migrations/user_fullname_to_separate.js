
module.exports.up = async (client) => {
  // ALTER ADD COLUMN firstName, lastName
  await client.query(`
    ALTER TABLE users
      ADD COLUMN firstName varchar(16) NOT NULL CHECK(firstName != ''),
      ADD COLUMN lastName varchar(16) NOT NULL CHECK(lastName != '')
  `);

  // ALTER ADD COLUMN isMale
  await client.query(`
    ALTER TABLE users
      ADD COLUMN isMale boolean NOT NULL
  `);

  // SELECT users
  const users = await client.query(`
    SELECT * FROM users;
  `);

  // INSERT RANDOM isMale
  await Promise.all(
    users.map()
  );


  // UPDATE users SET firstName = '', lasName = '' WHERE id
  // DROP COLUMN full_name

  await client.query();
}

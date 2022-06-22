
module.exports.up = async (client) => {
  // ALTER ADD COLUMN firstName, lastName
  await client.query(`
    ALTER TABLE users
      ADD COLUMN firstName varchar(16) NOT NULL CHECK(firstName != ''),
      ADD COLUMN lastName varchar(16) NOT NULL CHECK(lastName != '')
  `);

  // SELECT users
  const users = await client.query(`
    SELECT * FROM users;
  `);
  
  // UPDATE users SET firstName = '', lastName = '' WHERE id

  // DROP COLUMN full_name

  await client.query(`

  `);
}

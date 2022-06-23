const client = require("../models");

module.exports.createUser = async () => {
  
}

module.exports.getUserList = async (limit, page) => {
  
}

module.exports.getUserById = async (userId) => {
  const { rows: foundUsers } = await client.query(`
    SELECT * FROM "users" WHERE "id" = ${userId}
  `);

  if (foundUsers.length === 0) {
    return null;
  }

  return foundUsers[0];
}

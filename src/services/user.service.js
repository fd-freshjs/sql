const { QueryTypes } = require('sequelize');
const client = require("../models");
const User = require('../models/user');

module.exports.createUser = async () => {
  
}

module.exports.getUserList = async (limit, page) => {
  
}

module.exports.getUserById = async (userId) => {
  
  /* const foundUsers = await client.query(`
  SELECT * FROM "users" WHERE "id" = ${userId}
  `, { type: QueryTypes.SELECT }); */
  
  // const qInt = client.getQueryInterface();
  /* const foundUsers = await qInt.select(null, 'users', { where: {
    id: userId,
  } }); */

  const foundUsers = await User.findAll({
    where: {
      id: userId,
    }
  });
  // await User.findOne
  // await User.findByPk

  if (foundUsers.length === 0) {
    return null;
  }

  return foundUsers[0];
}

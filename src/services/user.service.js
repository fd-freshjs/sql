const { QueryTypes } = require('sequelize');
const client = require("../models");
const User = require('../models/user');


/* 
C - insert - create
R - select - find*
U - update - update
D - delete - destroy

*/

module.exports.createUser = async (data) => {
  const newUser = await User.create(data);

  return newUser;
}

module.exports.getUserList = async (limit, page) => {
  const foundUsers = await User.findAll({
    limit: limit,
    offset: (page - 1) * limit,
  });

  return foundUsers;
}


const getUserById = async (userId) => {
  // 1
  // const foundUsers = await User.findAll({
  //   where: {
  //     id: userId,
  //   },
  //   limit: 1,
  // });

  // 2
  /* const foundUser = await User.findOne({
    where: {
      id: userId,
    }
  }); */

  // 3
  const user = await User.findByPk(userId);

  if (!user) {
    throw new Error('User not found');
  }

  return user;
}
module.exports.getUserById = getUserById;


module.exports.updateUserById = async (id, data) => {
  // 1
  // await User.update(data, {
  //   where: {
  //     id,
  //   }
  // });
  // const updatedUser = await getUserById(id);

  // 2
  const updatedUser = await getUserById(id);

  if (!updatedUser) {
    throw new Error('User not found');
  }

  await updatedUser.update(data);

  return updatedUser;
}

module.exports.deleteUserById = async (id) => {
  // 1
  // const deletedCount = await User.destroy({ where: { id } });
  // if (deletedCount === 0) {
  //   throw new Error('User not found');
  // }

  // 2
  const deletedUser = await getUserById(id);
  if (!deletedUser) {
    throw new Error('User not found');
  }
  await deletedUser.destroy();

  return deletedUser;
}

const { getUserById, getUserList } = require("../services/user.service");

module.exports.createUser = async () => {};

module.exports.updateUser = async () => {};

module.exports.deleteUser = async () => {};

module.exports.getById = async (req, res, next) => {
  console.log(req.params.id);

  const id = Number(req.params.id);

  const foundUser = await getUserById(id);

  res.status(200).send({ data: foundUser });
};

module.exports.getList = async (req, res, next) => {
  // ?page=1&limit=10
  const page = req.query.page || 1;
  const limit = req.query.limit || 10;

  const userList = await getUserList(limit, page);

  res.status(200).send({ data: userList });
};

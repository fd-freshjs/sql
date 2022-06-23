const { Sequelize } = require("sequelize");
const dbconfig = require('../config/db.js');

const { database, user, password, ...restOptions } = dbconfig;
const client = new Sequelize(database, user, password, restOptions);

module.exports = client;

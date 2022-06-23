const { Client } = require("pg");
const dbconfig = require('../config/db.js');
const client = new Client(dbconfig);

client.connect();

module.exports = client;

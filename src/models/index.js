const { Client } = require("pg");
const dbconfig = require('../config/db.js');
const { migrate } = require("../migrate.js");

const client = new Client(dbconfig);

client.connect();
migrate(client);

module.exports = client;

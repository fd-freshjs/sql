require("dotenv").config();
const { migrate } = require("./migrate");
const client = require("./models");

(async () => {
  // await userQueries(client);

  await migrate(client);

  await client.end();
  process.exit();
})();
// IIFE

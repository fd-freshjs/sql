require("dotenv").config();
const { Client } = require("pg");
const { migrate } = require("./migrate");

const client = new Client();

(async () => {
  await client.connect();

  // await userQueries(client);

  // await migrate(client);

  function insertRandomPhone(orderId) {
    const randomIndex = Math.floor(Math.random() * phones.length)
    const randomPhone = phones[randomIndex];

    const randomAmount = Math.floor(Math.random() * 25);

    await client.query(`
      INSERT INTO phones_to_orders
      (order_id, phone_id, amount)
      VALUES
      (${orderId}, ${randomPhone.id}, ${randomAmount});
    `);
  }


  const users = await getUsers();
  const phones = await getPhones();

  for (const user of users) {
    const userId = user.id;

    const ordersCount = Math.floor(Math.random() * 10);

    for (let i = 0; i < ordersCount; i++) {
      const newOrder = await client.query(`
        INSERT INTO orders
        (user_id)
        VALUES
        (${userId})
        RETURNING id;
      `);

      const randomPhonesInOrder = Math.floor(Math.random() * 5);

      for (let i = 0; i < randomPhonesInOrder; i ++) {
        insertRandomPhone(newOrder.id);
      }
    }
  }

  await client.end();
  process.exit();
})();
// IIFE

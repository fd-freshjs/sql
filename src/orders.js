async function query () {
  async function insertRandomPhone(orderId, usedIndexes) {
    let randomIndex = Math.floor(Math.random() * phones.rows.length);
    if (usedIndexes.includes(randomIndex)){
      randomIndex = Math.floor(Math.random() * phones.rows.length);
    }
    const randomPhone = phones.rows[randomIndex];
    usedIndexes.push(randomIndex);

    const randomAmount = 1 + Math.floor(Math.random() * 24);

    await client.query(`
      INSERT INTO phones_to_orders
      (order_id, phone_id, amount)
      VALUES
      (${orderId}, ${randomPhone.id}, ${randomAmount});
    `);
  }


  const users = await client.query(`
    SELECT * FROM users;
  `);
  const phones = await client.query(`
    SELECT * FROM phones;
  `);

  console.log(users);

  for (const user of users.rows) {
    const userId = user.id;

    const ordersCount = Math.floor(Math.random() * 10);

    for (let i = 0; i < ordersCount; i++) {
      const { rows: [newOrder] } = await client.query(`
        INSERT INTO orders
        (user_id)
        VALUES
        (${userId})
        RETURNING id;
      `);

      const randomPhonesInOrder = Math.floor(Math.random() * 5);
      const usedIndexes = [];

      for (let i = 0; i < randomPhonesInOrder; i ++) {
        await insertRandomPhone(newOrder.id, usedIndexes);
      }
    }
  }
}

module.exports = query;

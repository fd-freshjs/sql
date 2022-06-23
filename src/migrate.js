const fs = require('fs/promises');
const path = require('path');
const client = require('./models');

module.exports.migrate = async () => {
  await client.query(`
    CREATE TABLE IF NOT EXISTS migrations
    (
      name varchar(128) PRIMARY KEY CHECK(name != '')
    );
  `);

  const { rows: migrations } = await client.query(`
      SELECT * FROM migrations;
  `);

  const fileNames = await fs.readdir(path.resolve(__dirname, './migrations/'));

  for (const fileName of fileNames) {
    const filepath = path.resolve(__dirname, './migrations/', fileName);
    const module = require(filepath);

    if (!migrations.find(m => m.name === fileName)) {
      console.log('Running migration - ', fileName);
      await module.up(client);
      await client.query(`
        INSERT INTO migrations
        VALUES
        ('${fileName}')
      `);
    }
  }
}


module.exports.up = async function up (client) {
  console.log('test');
  await client.query(`
  CREATE TABLE brands (
      id serial PRIMARY KEY,
      name VARCHAR(32) NOT NULL UNIQUE
  );

  INSERT INTO brands (name)
  SELECT DISTINCT brand FROM phones;

  ALTER TABLE phones
  ADD FOREIGN KEY (brand) REFERENCES brands(name)
  ON DELETE CASCADE;
`);
}

module.exports.down = async function down () {
  await client.query(`
  ALTER TABLE phones
  DROP CONSTRAINT "phones_brand_fkey";

  DROP TABLE brands;
`);
}

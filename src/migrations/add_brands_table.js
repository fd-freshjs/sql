const { DataTypes } = require("sequelize");

module.exports.up = async function up (client) {
  const queryInterface = client.getQueryInterface();

  await queryInterface.createTable('brands', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    name: {
      type: DataTypes.STRING(32),
      allowNull: false,
      unique: true,
    },
  });

  const brands = await queryInterface.select(null, 'brands');

  await queryInterface.bulkInsert('brands', [...brands]);

  await queryInterface.addConstraint('brands', {
    type: 'FOREIGN KEY',
    fields: ['brand'],
    references: {
      table: 'brands',
      field: 'name',
    },
    onDelete: 'CASCADE',
  });
}

module.exports.down = async function down () {
  await client.query(`
    ALTER TABLE phones
    DROP CONSTRAINT "phones_brand_fkey";

    DROP TABLE brands;
  `);
}

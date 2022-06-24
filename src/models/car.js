const { Model, DataTypes } = require("sequelize");
const client = require("./index");

class Car extends Model {}

Car.init({
  id: {
    type: DataTypes.UUID,
    allowNull: false,
    primaryKey: true,
  },
  model: {
    type: DataTypes.STRING(32),
    allowNull: false,
  },
  brand: {
    type: DataTypes.STRING(32),
    allowNull: false,
  }
}, {
  sequelize: client,
  tableName: 'cars',
  timestamps: false,
});

module.exports = Car;

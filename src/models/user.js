const { Model, DataTypes } = require("sequelize");
const client = require("./index");

class User extends Model {}

User.init({
  id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    autoIncrement: true,
    primaryKey: true,
  },
  full_name: {
    type: DataTypes.STRING,
    allowNull: false,
    validate: {
      notEmpty: true
    },
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
  },
  dob: {
    type: DataTypes.DATEONLY,
    allowNull: false,
  },
  country: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  tall: {
    type: DataTypes.DECIMAL(3, 2),
    allowNull: false,
  },
}, {
  sequelize: client,
  tableName: 'users',
  timestamps: false,
});

module.exports = User;

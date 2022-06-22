const User = require("./user");

class Order {
  id;
  user_id = {
    type: 'int',
    references: { model: User, key: 'id' }
  };
}

module.exports = Order;

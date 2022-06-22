class User {
  tableName = 'users'

  id = {
    type: 'int'
  };
  full_name = {
    type: 'string'
  };
  email = {
    type: 'string',
    unique: true,
  };
}

module.exports = User;

/* 
  CREATE TABLE ${tableName}
  (
    ${for
      key type
    }
  );
*/

-- @block

/* 
    создать с pkey
    users
    (
        id,
        firstname
        lastname
        phone
    )

 */

CREATE TABLE users (
    id serial PRIMARY KEY, -- users_pkey
    name varchar(32)
);

DROP TABLE user_carts;
CREATE TABLE user_carts (
    id serial PRIMARY KEY,
    user_id int REFERENCES users(id) -- user_carts_user_id_fkey
);

INSERT INTO users (name) values ('Test');

INSERT INTO user_carts (user_id) VALUES (1);

/* 1-N один ко многим */

-- @block
CREATE TABLE users (
    -- id serial unique NOT NULL, -- users_id_key
    id serial PRIMARY KEY, -- users_pkey
    name varchar(32)
);

CREATE TABLE user_carts (
    id serial PRIMARY KEY,
    user_id int REFERENCES users(id) -- user_carts_user_id_fkey
);


-- @block
DROP TABLE user_carts;

-- @block
INSERT INTO users (id, name) values (2, 'Test');

INSERT INTO user_carts (user_id) VALUES (2);


CREATE TABLE phones (
    id serial PRIMARY KEY,
    value VARCHAR(24) NOT NULL UNIQUE,
    user_id int,
    operator_id int REFERENCES operators(id)
);

ALTER TABLE phones
ADD FOREIGN KEY (user_id) REFERENCES users(id);

/* 
    1-N

    1) Бренды и товары
    brands -> goods

    2) Команды и игроки
    teams -> players

    3) Группы и студенты
    groups -> students
 */

/* 1) */
CREATE TABLE brands (
    id serial PRIMARY KEY,
    name VARCHAR(64) NOT NULL UNIQUE CHECK(name !== ''),
);

CREATE TABLE goods (
    id serial PRIMARY KEY,
    name VARCHAR(128) NOT NULL CHECK(char_length(name) >= 4),
    brand_id int REFERENCES brands(id)
);

/* 2) */
CREATE TABLE teams (
    id serial PRIMARY KEY,
    name VARCHAR(64) NOT NULL UNIQUE CHECK(name !== ''),
);

CREATE TABLE players (
    id serial PRIMARY KEY,
    full_name VARCHAR(128) NOT NULL CHECK(char_length(name) >= 4),
    number int NOT NULL CHECK(number >= 0),
    team_id int REFERENCES teams(id)
);

/* 3) */
CREATE TABLE groups (
    id serial PRIMARY KEY,
    name VARCHAR(64) NOT NULL UNIQUE CHECK(name !== ''),
);

CREATE TABLE students (
    id serial PRIMARY KEY,
    full_name VARCHAR(128) NOT NULL CHECK(char_length(name) >= 4),
    group_no int NOT NULL CHECK(number >= 0),
    group_id int REFERENCES groups(id)
);

/* 1-1 */

/* N-M */

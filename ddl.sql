/* 1-N один ко многим */

-- @block
CREATE TABLE users (
    -- id serial unique NOT NULL, -- users_id_key
    id serial PRIMARY KEY, -- users_pkey
    name varchar(32)
);

/* 
    1-N

    one user -> many phones
 */


/* 1-0..1 */

CREATE TABLE trainers (
    id VARCHAR PRIMARY KEY,
    full_name VARCHAR(64) NOT NULL CHECK(full_name != ''),
    team_id int UNIQUE
);

CREATE TABLE teams (
    id serial PRIMARY KEY,
    name VARCHAR(32) NOT NULL UNIQUE CHECK(char_length(name) >= 4),
    trainer_id VARCHAR REFERENCES trainers(id)
);

INSERT INTO trainers
(id, full_name)
VALUES
('123-234-345-456', 'Test Testovich');

INSERT INTO teams (name, trainer_id) VALUES ('Byki', '234-234-345-345'), ();

UPDATE trainers
SET team_id = 1
WHERE -- filter
"id" = '123-234-345-456';


/* N-M */

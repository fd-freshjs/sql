/* 1-1 */

DROP TABLE IF EXISTS teams, trainers;

CREATE TABLE trainers (
    id VARCHAR PRIMARY KEY,
    full_name VARCHAR(64) NOT NULL CHECK(full_name != ''),
    team_id int NOT NULL
);

CREATE TABLE teams (
    id serial PRIMARY KEY,

    name VARCHAR(32) 
    NOT NULL
    UNIQUE
    CHECK(char_length(name) >= 4),

    trainer_id VARCHAR NOT NULL
);


ALTER TABLE trainers
        ADD FOREIGN KEY (team_id) REFERENCES teams (id)
                DEFERRABLE INITIALLY DEFERRED;
 
ALTER TABLE teams 
        ADD FOREIGN KEY (trainer_id) REFERENCES trainers (id)
                DEFERRABLE INITIALLY DEFERRED;


BEGIN;

INSERT INTO teams (id, name, trainer_id) VALUES (1, 'Orly', '123-234-345-456');

INSERT INTO trainers
(id, full_name, team_id)
VALUES
('123-234-345-456', 'Test Testovich', 1);

COMMIT;
CREATE TABLE users (
  id serial PRIMARY KEY,
  full_name varchar NOT NULL,
  email varchar(32) NOT NULL UNIQUE,
  dob date NOT NULL
);

ALTER TABLE users
ADD COLUMN country VARCHAR(32) CHECK(country != '');

UPDATE users
SET dob = '2003-03-05'
WHERE country = 'Poland';


INSERT INTO users (full_name, email, dob) VALUES (
  'Tes3t Testovich', 'test4@mail.com', '1980-02-20'
);

SELECT
  concat(u.full_name, ' / ', u.email) as "Name / E-mail"
FROM
  users as u
;

SELECT
  id, full_name, extract(year from age(dob)) AS age
FROM users;


-- count, sum, min, max, avg
-- GROUP BY

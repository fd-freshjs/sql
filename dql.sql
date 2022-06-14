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
  *
FROM
  users
WHERE "E-mail" = 'test2@mail.com' -- error: column "E-mail" not found
GROUP BY "E-mail" -- success
;

SELECT
  *
FROM
  (
    SELECT *, email as "E-mail" FROM users
  ) as e
WHERE "E-mail" = 'test2@mail.com'
;

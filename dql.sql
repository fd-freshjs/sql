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
*, email as "E-mail"
FROM
users;

SELECT
  email as "E-mail"
FROM
  users
WHERE -- FILTER (table)
  -- true AND (false OR true)
  -- extract(year from age(dob)) >= 25
  date_part('year', age("dob")) >= 25
;
-- age("dob") = interval '42 years .. months .. days'

SELECT
  *
FROM
  users
WHERE -- FILTER 1)
  char_length(full_name) >= 5
ORDER BY -- SORTING 2)
  country DESC, -- high priority
  dob ASC; -- less priority

SELECT
  country, count(id)
FROM
  users
WHERE date_part('year', age("dob")) >= 18

GROUP BY country
HAVING country = 'Chech Rep' -- FILTER (GROUPS)
;

/* 
  a) сгруппировать пользователей по году рождения
  группы по годам рождения
  1995
  2003
  2022
  1980

  б) посчитать кол-во полз в группах
  1995 | 2
  2003 | 1
  2022 | 1
  1980 | 1
 */



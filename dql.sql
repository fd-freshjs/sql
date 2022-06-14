CREATE TABLE users (
  id serial PRIMARY KEY,
  full_name varchar NOT NULL,
  email varchar(32) NOT NULL UNIQUE,
  dob date NOT NULL
);

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
WHERE -- FILTER
  -- extract(year from age(dob)) >= 25
  date_part('year', age(dob)) >= 25
;

/* 
  Найти всех пользов
  у которых
  а) возраст больше 25 лет
  б) имя равно ... (смотря что в таблице)


  в) дата рождения в месяце январе
 */


SELECT
  email as "E-mail"
FROM
  users
WHERE -- FILTER
  -- extract(year from age(dob)) >= 25
  date_part('month', dob) = 2
;

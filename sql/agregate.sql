
/* 
  Агрегатные ф-ции
  из много строк сделай одно значение


 */

SELECT count(*) FROM users
WHERE country = 'Ontario'
;

/* 
  count (column)
  count (*)
  подсчет кол-ва строк по колонке

  Кол-во людей с определенным именем

  Кол-во людей родившихся до 1950 года
  date_part || extract
  date_part('year', "dob")
  // 1986-05-07
  // 1986

  Кол-во людей в возрасте от 30 до 40 лет
  date_part('year', age("dob"))
 */


SELECT count(*)
FROM users
WHERE full_name = 'Peetu Manni'
;

SELECT
  count(*)
FROM users
WHERE date_part('year', "dob") < 1950
;

SELECT
  count(*)
FROM users
WHERE date_part('year', "dob") BETWEEN date_part('year', CURRENT_DATE) - 40 AND 1992
;

-- age('1982-01-01')
-- 30 years 15 days 50 minutes

SELECT
  count(*)
FROM users
WHERE date_part('year', age("dob")) BETWEEN 30 AND 40
;

/* 
  avg, count, sum, max, min
 */

/* 
  avg - среднее значение колонки

  Средний рост пользователей

  Средний возраст пользователей

 */

SELECT
  avg(tall)
FROM users;

SELECT
  avg( date_part('year', age("dob") ) )
FROM users;


SELECT
  country,
  avg( tall ) as avg_country_tall,
  count(*) as rows
FROM users
-- WHERE country = 'England' OR country = 'Canada' OR country = 'Ireland'
GROUP BY country
HAVING country = 'Zeeland' OR country = 'Ontario' OR country = 'Bremen';


SELECT
  brand, sum(price)
FROM products
GROUP BY brand;


/* 
  min
  max
 */

SELECT
  brand,
  min(price),
  avg(price),
  max(price)
FROM products
-- WHERE price > 100
GROUP BY brand;

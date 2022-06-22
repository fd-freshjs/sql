UPDATE orders
SET address = 'Adress 1'
WHERE user_id = 58
RETURNING *;

SELECT user_id FROM orders
WHERE address IS NOT NULL;

WITH user_ids AS
(
  SELECT user_id FROM orders
  WHERE address IS NOT NULL
)
SELECT * FROM users
WHERE id IN (SELECT user_id FROM user_ids);
-- =

/*  */

SELECT
  CASE
    WHEN avg(tall) > 1.5 THEN 'Больше 1.5'
    WHEN avg(tall) < 1.5 THEN 'Меньше 1.5'
    ELSE 'Равен 1.5'
  END,
  count(id)

FROM users;

UPDATE users
SET tall = 1.65
WHERE id = 57;

UPDATE users
SET tall = (
  CASE
    WHEN tall < 1.8 THEN 1.8
    ELSE 1.9
  END
)

WHERE id <= 60
RETURNING *;


/* 

  IN - проверяет равенство значения любому варианту (true/false)
  ANY - проеряет условие оператора для любого из вариантов (true/false)
  EXISTS - проверяет что в табл выражении есть хотя бы одна строка (true/false)
  ALL 

 */

SELECT * FROM users
WHERE full_name ~* ANY ( VALUES ('.*lie '), ('David ') );

SELECT * FROM users
WHERE full_name ~* ALL ( VALUES ('.*lie '), (' MAdsen') );

SELECT * FROM users
WHERE EXISTS (
  SELECT user_id FROM orders
  WHERE address IS NOT NULL
)


/* 
  оконные функции

  SELECT id, avg() over()
 */

/* 
  найти средний чек и ид заказов среди телефонов марки Xiaomi
 */
SELECT
  pto.order_id,
  avg(p.price * pto.amount) over(PARTITION BY brand) as avg_price
FROM "phones" as p
  JOIN "phones_to_orders" as pto ON p.id = pto.phone_id
WHERE p.brand = 'Xiaomi';

/* 
  найти почту юзера с максимальным кол-вом заказов
 */
SELECT
  email,
  count(o.id) over(partition by u.id) as user_orders_count
FROM
  users as u
  JOIN orders as o ON u.id = o.user_id
ORDER BY user_orders_count DESC
LIMIT 1
;

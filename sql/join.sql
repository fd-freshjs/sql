/* JOINS */
/* 
    users 1
        ||
    orders N
        ||
        p_to_o
        ||
    phones M
 */
/*  */
/* Извлеч все телефоны конкретного заказа */
SELECT ph.brand, ph.id FROM phones AS ph
  INNER JOIN phones_to_orders AS "p_to_o" ON ph.id = "p_to_o".phone_id
WHERE "p_to_o".order_id = 19;

/* проверка */
SELECT phone_id, amount FROM phones_to_orders WHERE order_id = 19;



/*  */
/* кол-во заказов определенного пользователя и его емейл */
/* 1 */
SELECT * FROM orders WHERE user_id = 58;

/* 2 */
SELECT count(*) AS "Order count" FROM orders WHERE user_id = 58;

/* 3 */
SELECT count(*), u.email AS "Order count"
FROM orders AS o
  JOIN users AS u ON o.user_id = u.id
WHERE user_id = 58
GROUP BY email;

/* извлечь все данные пользователей и кол-во заказов */

SELECT count(o.id), u.*
FROM users as u
  INNER JOIN orders as o ON u.id = o.user_id
GROUP BY u.id

/* извлечь все данные пользователей у которых кол-во заказов выше среднего */
SELECT * FROM
(
  SELECT count(o.id) as "count", u.*
  FROM users as u
    INNER JOIN orders as o ON u.id = o.user_id
  GROUP BY u.id
) as order_count
WHERE count > avg("count");

/* 
  INNER JOIN table ON table.id  =  orders.user_id
 */

/* 
  Все заказы с определенной моделью (id) телефона

  Кол-во телефонов в определенном заказе

  Все модели телефонов конкретного заказа

  Извлечь модель самого популярного телефона
  p_to_o.amount
  шаг 1 найти модель тел конкр заказа


 */

SELECT o.*
FROM orders as o
  JOIN phones_to_orders as pto ON pto.order_id = o.id
WHERE pto.phone_id = 3;
/*  */
SELECT pto.order_id
FROM phones_to_orders as pto
  JOIN phones as p ON pto.phone_id = p.id
WHERE p.id = 3;
/*  */

SELECT sum(amount)
FROM phones_to_orders
WHERE order_id = 18;

SELECT sum(pto.amount)
FROM phones_to_orders as pto
  JOIN orders as o ON order_id = id
WHERE o.id = 18;

/*  */

/* 
    Найти всех пользователей которые не делали заказы
 */
SELECT o.id as order_id, u.* FROM users as u
  LEFT JOIN orders as o ON o.user_id = u.id
WHERE o.id IS NULL;

/*  */
SELECT id from orders WHERE user_id = 59;
-- DELETE FROM orders WHERE id = 37 OR id = 43 OR id
DELETE FROM orders WHERE id IN (37, 43, 44, 45);
DELETE FROM phones_to_orders WHERE order_id IN (37, 43, 44, 45);

/* 

  Найти указанные модели определенного юзера
 */

 --users.id phones.model
SELECT
  p.model, u.id
FROM phones as p
  JOIN phones_to_orders as pto ON pto.phone_id = p.id
  JOIN orders as o ON pto.order_id = o.id
  JOIN users as u ON o.user_id = u.id
  
WHERE u.id = 58 AND p.model IN ('3310', 'Honor1', 'A51');

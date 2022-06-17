/* JOINS */
/* 
    users 1
        ||
    orders N
        ||  p_to_o
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


/* обновить юзеров которые родились до 1980го года
    установить рост больше 1.8
 */
UPDATE users
SET tall = 1.9
WHERE date_part('year', dob) < 1980
RETURNING *;

/* 
  обновить телефоны которых на складе осталось меньше 5ти штук
  установить кол-во на складе 15 шт
 */
UPDATE phones
SET amount = 15
WHERE amount < 5
RETURNING *;

/* 
  обновить цены телефонам модели Apple
  установив цену на 5% больше
 */

SELECT * FROM phones WHERE brand = 'Apple';

UPDATE phones
SET price = DEFAULT
WHERE brand = 'Apple'
RETURNING *;

/* 
  CASE
    WHEN THEN
    WHEN THEN
    ELSE
  END
 */

UPDATE phones
SET price = (
  CASE
    WHEN price < 1000 THEN 1000
    WHEN price > 5000 THEN 5000
    ELSE
      price
  END
  )
RETURNING *
;

/* delete */
DELETE FROM phones_to_orders
WHERE amount < 5
RETURNING *;


DELETE FROM phones_to_orders
WHERE order_id IN (63, 64)
RETURNING *;

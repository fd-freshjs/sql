/* представление view */
CREATE OR REPLACE VIEW month_report
AS
  SELECT users.id as user_id, created_at as order_ts
    FROM users
    JOIN orders ON user_id = users.id
  WHERE date_part('month', created_at) = date_part('month', CURRENT_DATE);

SELECT * FROM month_report;


/* WITH test as (
  SELECT users.id as user_id, created_at as order_ts
    FROM users
    JOIN orders ON user_id = users.id
)

SELECT * FROM test */

UPDATE orders
SET created_at = '2022-03-16 00:00:00'
WHERE user_id = 58;


/* MATERIALIZED VIEW - кэшированное табличное представление */
DROP VIEW month_report;

CREATE MATERIALIZED VIEW month_report
AS
  SELECT users.id as user_id, created_at as order_ts
    FROM users
    JOIN orders ON user_id = users.id
  WHERE date_part('month', created_at) = date_part('month', CURRENT_DATE);

/*  */

SELECT * FROM ( VALUES('texdt') ) as temp(str);
SELECT * FROM ( VALUES($$texdt$$) ) as temp(str);


CREATE OR REPLACE FUNCTION month_report(month int) RETURNS TABLE (user_id int, order_ts timestamp)
AS $$
  BEGIN
    RETURN QUERY SELECT u.id, o.created_at
      FROM users as u
      JOIN orders as o ON o.user_id = u.id
      WHERE date_part('month', o.created_at) = month;
  END;
$$
LANGUAGE plpgsql;

SELECT * FROM month_report(3);

/* 
  Используя старый запрос select
  создайте настраиваемую функцию
 */

DROP FUNCTION order_phones;

CREATE OR REPLACE FUNCTION order_phones(orderid int) RETURNS TABLE (brand varchar, model varchar, id int)
AS $$
  BEGIN
    RETURN QUERY SELECT ph.brand, ph.model, ph.id FROM phones AS ph
      INNER JOIN phones_to_orders AS "p_to_o" ON ph.id = "p_to_o".phone_id
    WHERE "p_to_o".order_id = orderid;
  END;
$$
LANGUAGE plpgsql;

SELECT * FROM order_phones(18);

CREATE TABLE user_cars (
  user_id int NOT NULL UNIQUE CHECK(user_exists(user_id))
);

CREATE FUNCTION user_exists(user_id int) RETURNS BOOLEAN
AS $$
  BEGIN
    RETURN QUERY SELECT 
      CASE
        WHEN count(*) > 0 THEN TRUE
        ELSE FALSE
      END
    FROM users WHERE id = user_id;
  END;
$$
LANGUAGE plpgsql;

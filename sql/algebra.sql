
CREATE TABLE A (
  name VARCHAR(16) PRIMARY KEY
);

CREATE TABLE B (
  name VARCHAR(16) PRIMARY KEY
);
/*  */
INSERT INTO A VALUES (
  'XYZ'),
  ('XXX'),
  ('YYY'),
  ('ZZZ');
/*  */
INSERT INTO B VALUES
('AAA'),
  ('BBB'),
  ('CCC'),
  ('ZZZ');

SELECT * FROM A UNION SELECT * FROM B;
/*  */
INSERT INTO A VALUES ('CCC');

SELECT * FROM A INTERSECT SELECT * FROM B

/* p_to_o -> amount buyed */
/* phones -> brand */

SELECT phone_id FROM phones_to_orders WHERE order_id = 19
INTERSECT
SELECT id FROM phones;

SELECT brand, id FROM phones
WHERE id = (SELECT phone_id FROM phones_to_orders WHERE order_id = 19);


/*  */

SELECT id FROM phones
EXCEPT
SELECT phone_id FROM phones_to_orders;

DELETE FROM phones_to_orders WHERE phone_id = 10;

/* УМНОЖЕНИЕ - ДЕКАРТОВО ПРОИЗВЕДЕНИЕ */
SELECT * FROM A, B
WHERE A.name = B.name;

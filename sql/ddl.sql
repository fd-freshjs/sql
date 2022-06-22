/* N-M */
CREATE TABLE goods (
    id serial PRIMARY KEY,
    name VARCHAR NOT NULL,
    stock_amount INT
);
CREATE TABLE orders (id serial PRIMARY KEY, address VARCHAR);
CREATE TABLE goods_to_orders (
    order_id INT REFERENCES orders(id),
    -- 1, 1
    good_id INT REFERENCES goods(id),
    -- 1, 2
    amount INT NOT NULL CHECK(amount >= 1),
    UNIQUE(order_id, good_id)
);
/*  */
INSERT INTO goods (name, stock_amount)
VALUES ('stool', 5),
    ('table', 10),
    ('candelabre', 15);

INSERT INTO orders
    (address)
VALUES
    ('Zaporizha'),
    ('Kiev'),
    ('Ney York');

INSERT INTO goods_to_orders
VALUES (1, 2, 5);
INSERT INTO goods_to_orders
VALUES (1, 2, 5);
INSERT INTO goods_to_orders
VALUES (3, 1, 3);
/*  */
DELETE FROM goods_to_orders
WHERE order_id = 1
    AND good_id = 2
    AND amount = 5;
/* 
 N-M (через связ. таблицу)
 
 1) группы и предметы
 
 2) пассажиры и рейсы
 
 3) маршруты и машины (номерной знак)
 */
/* 1) */
CREATE TABLE "groups" (id serial PRIMARY KEY,...);
CREATE TABLE "subjects" (id serial PRIMARY KEY,...);
CREATE TABLE "groups_to_subjects" (
    group_id INT REFERENCES groups(id),
    subj_id INT REFERENCES subjects(id),
    UNIQUE(group_id, subj_id)
);


/* ALTER */
ALTER TABLE users
-- DROP tall
-- DROP CONSTRAINT "users_email_key"
-- ADD name varchar
-- ADD CHECK()
-- ADD CONSTRAINT "name" CHECK()
-- ALTER column TYPE BOOLEAN
-- ALTER SET DEFAULT 'value'
-- ALTER DROP DEFAULT 'value'


CREATE TABLE books (
  author_id int,
);

ALTER TABLE books
ADD FOREIGN KEY (author_id) REFERENCES users(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

/* 
  Создайте таблицу брендов 
  и обновите определение таблицы телефонов
  чтобы колонка phones.brand ссылалась на brands.name
 */

CREATE TABLE brands (
    id serial PRIMARY KEY,
    name VARCHAR(32) NOT NULL UNIQUE
);

ALTER TABLE phones
ADD FOREIGN KEY (brand) REFERENCES brands(name)
ON DELETE CASCADE;

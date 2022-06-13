/* N-M */

CREATE TABLE goods (
    id serial PRIMARY KEY,
    name varchar NOT NULL,
    stock_amount int
);

CREATE TABLE orders (
    id serial PRIMARY KEY,
    address varchar
);

CREATE TABLE goods_to_orders (
    order_id int REFERENCES orders(id),  -- 1, 1
    good_id int REFERENCES goods(id), -- 1, 2
    amount int NOT NULL CHECK(amount >= 1),
    UNIQUE(order_id, good_id)
);

/*  */

INSERT INTO goods
(name, stock_amount)
VALUES (
    'stool', 5
), (
    'table', 10
), (
    'candelabre', 15
);

INSERT INTO orders
(address)
VALUES (
    'Zaporizha'
),  (
    'Kiev'
), (
    'Ney York'
);

INSERt INTO goods_to_orders
VALUES (
    1, 2, 5
);

INSERt INTO goods_to_orders
VALUES (
    1, 2, 5
);

INSERt INTO goods_to_orders
VALUES (
    3, 1, 3
);


/*  */

DELETE FROM goods_to_orders
WHERE
    order_id = 1
    AND good_id = 2
    AND amount = 5;


/* 
    N-M (через связ. таблицу)

    1) группы и предметы

    2) пассажиры и рейсы

    3) маршруты и машины (номерной знак)
 */

/* 1) */
CREATE TABLE "groups" (
    id serial PRIMARY KEY,
    ...
);

CREATE TABLE "subjects" (
    id serial PRIMARY KEY,
    ...
);

CREATE TABLE "groups_to_subjects" (
    group_id int REFERENCES groups(id),
    subj_id int REFERENCES subjects(id),
    UNIQUE(group_id, subj_id)
);

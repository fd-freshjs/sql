
/* 
  RELATIONS

  column REFERENCES table_name(pkey)

  1  =>  :  <=  1

  1  :  <=  N

  N   <=  n_to_m  =>   M

 */


/* 
    users 1
        ||
    orders N
        ||  p_to_o
    phones M
 */

DROP TABLE IF EXISTS orders, phones_to_orders, phones;
CREATE TABLE orders (
  id serial PRIMARY KEY,
  "address" varchar(32),
  "created_at" timestamp NOT NULL DEFAULT current_date,

  "user_id" int REFERENCES users(id) ON DELETE CASCADE
);


CREATE TABLE phones (
  id serial PRIMARY KEY,
  model varchar(32) NOT NULL CHECK(model != ''),
  brand varchar(32) NOT NULL CHECK(brand != ''),
  price decimal(9, 2) NOT NULL CHECK(price > 0.00),
  amount int NOT NULL CHECK(amount >= 0) DEFAULT 0,

  "created_at" timestamp NOT NULL DEFAULT current_date,

  UNIQUE(model, brand)
);

CREATE TABLE phones_to_orders (
  order_id int REFERENCES orders(id),
  phone_id int REFERENCES phones(id),
  amount int NOT NULL CHECK(amount > 0) DEFAULT 1,
  PRIMARY KEY(order_id, phone_id)
);
DELETE FROM phones_to_orders;

INSERT INTO phones
(model, brand, price, amount)
VALUES
('3310', 'NOKIA', 500, 10),
('3300', 'NOKIA', 600, 20),
('Redmi 3', 'Xaiomi', 1000, 15),
('Note 5', 'Xiaomi', 2000, 20),
('Honor 1', 'Huawei', 1500, 10),
('F12', 'Huawei', 3000, 25),
('Galaxy 1','Samsung', 1500, 20),
('A 51', 'Samsung', 2000, 10),
('G20', 'Oppo', 3000, 20),
('IPhone 10', 'Apple', 5000, 10);


/* 

  avg, count, sum, min, max
  GROUP BY

  Средняя цена всех телефонов

  Средняя цена на все модели бренда Huawei

  Среднее количество телефонов в заказе

  Общее количество заказов на каждого пользователя

  Общая Стоимость всех телефонов каждого бренда
 */

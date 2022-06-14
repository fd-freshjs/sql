/* 

  1) таблица products
  id, name, price, brand
  минимум 15 записей

  2) найти товары цена которых больше 100

  3) найти записи сортировав по цене

  4) Найти группы брендов

  5) найти товары бренд которых Tesla и цена меньше 20 000

  6) 

 */


CREATE TABLE products (
  id serial PRIMARY KEY,
  name VARCHAR(32) NOT NULL CHECK(name != ''),
  price decimal(7, 2) NOT NULL CHECK(price > 0.00),
  brand VARCHAR(32) NOT NULL CHECK(brand != ''),
  UNIQUE(name, brand)
);

INSERT INTO products
(name, price, brand)
VALUES
('Yabloko', 40.00, 'Dushes'),
('Sliva', 40.00, 'Pqwe'),
('Grusha', 70.00, 'Test1'),
('Banan', 70.00, 'Dushes'),
('Kolbasa', 70.00, 'Mayskaya'),
('Yagoda', 70.00, 'Test1'),
('Guitar E1', 240.00, 'Yamaha'),
('Guitar E3', 240.00, 'Yamaha'),
('Guitar E2', 240.00, 'Yamaha'),
('Guitar H5', 240.00, 'Vest'),
('Model E', 12340.00, 'Tesla'),
('Model Y', 72340.00, 'Tesla'),
('Guitar G1', 240.00, 'Grand'),
('Guitar G2', 240.00, 'Grand'),
('Patroler', 12340.00, 'LandRover'),
('Patroler G', 72340.00, 'LandRover');

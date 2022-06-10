-- @block
DROP TABLE products;

-- @block
CREATE TABLE products (
    id serial NOT NULL UNIQUE,

    amount int NOT NULL
    CHECK (amount > 0) DEFAULT 0,

    name varchar NOT NULL
);

-- @block
INSERT INTO products (name, price) VALUES ('apple', -3.00);

-- @block
ALTER TABLE products
DROP CONSTRAINT "products_amount_check";

ALTER TABLE products
ADD CHECK (amount >= 0);

-- @block
ALTER TABLE products
ADD COLUMN price numeric(7, 2);

-- @block
ALTER TABLE products
DROP COLUMN price,
ADD COLUMN price numeric(7, 2) CHECK(price BETWEEN 100 AND 5000);


INSERT INTO products (name, price) values ('1', 99);

/* 
изменить огрничение
- добавить check(length (name) > 4)
- удалить проверку price between и добавить новую between 100 and 50000
 */

-- @block
 ALTER TABLE products
 ADD CHECK(length(name) > 4);

-- @block
 ALTER TABLE products
 DROP CONSTRAINT IF EXISTS "products_price_check",
 ADD CONSTRAINT "products_price_check" CHECK(price BETWEEN 100 and 50000);
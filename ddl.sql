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
INSERT INTO products (name) VALUES ('apple');

-- @block
ALTER TABLE products
DROP CONSTRAINT "products_amount_check";

ALTER TABLE products
ADD CONSTRAINT "products_amount_check" CHECK (amount >= 0);

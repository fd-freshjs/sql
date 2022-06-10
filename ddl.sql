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
ADD CONSTRAINT "products_amount_check" CHECK (amount >= 0);

-- @block
ALTER TABLE products
ADD COLUMN price numeric(7, 2);

-- @block
ALTER TABLE products
DROP COLUMN price;





-- @block
ALTER TABLE products

DROP COLUMN price,

ADD COLUMN price numeric(7, 2) CHECK(price >= 0.00),

ADD CONSTRAINT "max-value" CHECK(amount < 5000);




-- @block
ALTER TABLE products
ALTER COLUMN price TYPE decimal(7, 2);

ALTER TABLE products

ADD CHECK (price >= 0.00),

ALTER COLUMN price SET DEFAULT 0.00;

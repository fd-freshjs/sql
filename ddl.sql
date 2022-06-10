-- @block
DROP TABLE products;

-- @block
CREATE TABLE products (
    id serial NOT NULL UNIQUE,

    amount int NOT NULL
    CHECK (amount > 0) DEFAULT 0,

    name varchar NOT NULL,

    manufacturer VARCHAR(128) NOT NULL,

    UNIQUE(name, manufacturer)
);

-- @block
INSERT INTO products (name, price) VALUES ('apple', -3.00);

-- @block
ALTER TABLE products
DROP CONSTRAINT "products_amount_check";

ALTER TABLE products
ADD CHECK (amount >= 0);


CREATE TABLE vet_client (
    id serial NOT NULL UNIQUE,
    nickname VARCHAR(32) NOT NULL CHECK(nickname != ''),
    phone VARCHAR(32) NOT NULL CHECK(nickname != ''),
    full_name varchar(64),
    UNIQUE(nickname, phone)
);

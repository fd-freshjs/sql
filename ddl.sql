DROP TABLE my_users;
-- @block
CREATE TABLE my_users (
    id serial NOT NULL
    CONSTRAINT "id_unique" UNIQUE,

    firstname varchar(32) NOT NULL CHECK (length (firstname) > 3),

    lastname varchar(64) NOT NULL CHECK (length (lastname) > 2),

    email varchar(32) NOT NULL UNIQUE CHECK (length (email) >= 6),

    isMale BOOLEAN NOT NULL,

    -- numeric(всего, после запятой)
    balance decimal(5, 2) DEFAULT 0.00 NOT NULL 
    CONSTRAINT "balance_positive" CHECK (balance >= 0.00)
);
-- @block
INSERT
INTO "my_users"
(firstname, lastname, isMale, email)
VALUES
('', '', true, '');
/* 
    DEFAULT 0.00

    not null
    check()
    unique

    constraint "" ...
 */

 /* 
 Создать таблицу products
 с атрибутами:
 - id
 - name
 - price
 - quantity
 с соответствующими проверками

 1) Вставьте данные соответствующие проверкам
 2) Вставьте данные чтобы создать ошибку уникальности
 3) ... чтобы создать ошибку количества
 4) ... чтобы создать ошибку уникальности имени
  */
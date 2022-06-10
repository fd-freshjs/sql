DROP TABLE my_users;

-- @block
CREATE TABLE
    my_users (
        id serial NOT NULL UNIQUE,
        firstname VARCHAR(32) NOT NULL
        CHECK (char_length (firstname) >= 3),

        lastname VARCHAR(64) NOT NULL
        CHECK (length (lastname) >= 2),

        email VARCHAR NOT NULL UNIQUE
        CHECK (length (email) BETWEEN 6 AND 32),

        is_male BOOLEAN NOT NULL,

        birthdate date NOT NULL CHECK(birthdate >= '1990-01-01' AND birthdate <= CURRENT_DATE),

        -- numeric(всего, после запятой)
        balance DECIMAL(5, 2) DEFAULT 0.00 NOT NULL
        CONSTRAINT "balance_positive" CHECK (balance >= 0.00)
    );
-- @block
INSERT INTO
    my_users (firstname, lastname, is_male, email, birthdate)
VALUES ('test', 'testovich', true, 'qweqw1', CURRENT_DATE);
/* 
    Создайте таблицу продуктов
    поля
    - номер id, prod_no
    - имя продукта name, product_name
    - колво на складе quantity, qty, amount
    - цена price
    - дата последней продажи last_sold_at, date_last_sale

    проверки
    - цена больше 100 и меньше 5000
    CHECK(price >= 100 AND price < 5000)  ||   CHECK(price BETWEEN 100 AND 5000)
    - колво на складе больше = 0
    CHECK (amount >= 0) DEFAULT 0
    - дата не больше текущего дня, и не раньше 2000 года
    CHECK(last_sold_at BETWEEN '2000-01-01' AND current_date)
    - имя продукта не пустое (другими словами хотя бы один символ)
    CHECK(char_length (name) > 0)    ||   CHACK(name != '')
 */

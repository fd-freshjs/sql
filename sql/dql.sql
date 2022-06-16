CREATE TABLE users (
  id serial PRIMARY KEY,
  full_name varchar NOT NULL,
  email varchar(32) NOT NULL UNIQUE,
  dob date NOT NULL,
  tall numeric(3, 2)
    NOT NULL CHECK(tall BETWEEN 0.2 AND 3.00) DEFAULT 0.3
);

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE cars (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  model varchar(32) NOT NULL,
  brand VARCHAR(32) NOT NULL,
  UNIQUE(brand,model)
);

INSERT INTO cars (model, brand) VALUES ('Model S', 'Tesla');

/* создайте таблицу самолеты с uuid типом для pkey */

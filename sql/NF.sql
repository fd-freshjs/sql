/* 1NF */

CREATE TABLE employees (
  "firstName" VARCHAR(32) NOT NULL,
  "lastName" VARCHAR(32) NOT NULL,
  "email" VARCHAR(16) NOT NULL UNIQUE -- employees_email_key
);

/* 2NF */

CREATE TABLE positions (
  position VARCHAR(32) NOT NULL UNIQUE,
  need_comp boolean NOT NULL
);
CREATE TABLE employees (
  "firstName" VARCHAR(32) NOT NULL,
  "lastName" VARCHAR(32) NOT NULL,
  "email" VARCHAR(16) NOT NULL UNIQUE, -- employees_email_key
  position VARCHAR(32) REFERENCES positions(position)
);

INSERT INTO positions
('Progger', true),
('Buhg', true),
('Manager', false);

INSERT INTO employees
('T1', 'T1', 't1@gmail.com', 'Progger'),
('T2', 'T2', 't2@gmail.com', 'Buhg'),
('T3', 'T3', 't3@gmail.com', 'Manager');

/* 3NF */

CREATE TABLE offices (
  office varchar(32) NOT NULL UNIQUE,
  phone varchar(32) NOT NULL
);

CREATE TABLE positions (
  position VARCHAR(32) NOT NULL,
  need_comp boolean NOT NULL,
  office VARCHAR (32) REFERENCES offices(office),
  UNIQUE(position, office)
);

CREATE TABLE employees (
  "firstName" VARCHAR(32) NOT NULL,
  "lastName" VARCHAR(32) NOT NULL,
  "email" VARCHAR(16) NOT NULL UNIQUE, -- employees_email_key
  position VARCHAR(32) REFERENCES positions(position),
  office_phone varchar(32) NOT NULL
);

/* 
  employees -> position -> office -> office_phone

 */

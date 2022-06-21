/* BCNF (3.5) */

/* 

  students
      || N:M
  subjects
      || 1:N
  teachers
 */


CREATE TABLE subjects (
  name varchar(32) NOT NULL UNIQUE,
);

CREATE TABLE students_to_subjects (
  subject varchar(32) REFERENCES subjects(name),
  student varchar(32) REFERENCES students(name)
  PRIMARY KEY(subject, student)
);

CREATE TABLE students (
  name VARCHAR(32) NOT NULL,
);

CREATE TABLE teachers (
  name VARCHAR(32) NOT NULL UNIQUE,
  subject VARCHAR(32) REFERENCES subjects(subject)
)


/* 
  students <- N:M -> subjects
  teachers <- N:M -> subjects
 */


/* 

  drivers
    || N:M
  cars
    || 1:0..1
  tech_passport
 */


/* 
  scores
      || 
  subject
      || M:N
  student
 */

CREATE TABLE students_to_subjects_to_scores (
  subject varchar(32) REFERENCES subjects(name),
  student varchar(32) REFERENCES students(name),
  score int NOT NULL CHECK(score > 0 AND score < 5),
  PRIMARY KEY(subject, student)
);

/* 
  stores (type_transport)
    || N:M (amount)
  products
    ||
  addresses
 */

-- products_to_stores
-- addresses_to_stores

/* 
  offices
    || 1:N
  hardwares (type = 'Low', 'Middle', 'Hight Power')
    || M:N
  positions (hardw_type)
*/

-- ('Low', 'Middle', 'High')

CREATE TABLE offices (
  id serial PRIMARY KEY,
  address VARCHAR NOT NULL
);

CREATE TYPE hardw_type as ENUM('Low', 'Middle', 'High');
CREATE TABLE hardwares (
  id serial PRIMARY KEY,
  type hardw_type NOT NULL,
  office_id int REFERENCES offices
);

CREATE TABLE positions (
  id serial PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE
);

CREATE TABLE position_to_offices (
  position_id int REFERENCES positions,
  office_id int REFERENCES offices,
  PRIMARY KEY(position_id, office_id)
);

CREATE TABLE position_to_hardware (
  
-- products_to_stores
-- addresses_to_stores

/* 
  offices
    || 1:N
  hardwares (type = 'Low', 'Middle', 'Hight Power')
    || M:N
  positions (hardw_type)
*/

-- ('Low', 'Middle', 'High')

CREATE TABLE offices (
  id serial PRIMARY KEY,
  address VARCHAR NOT NULL
);

CREATE TYPE hardw_type as ENUM('Low', 'Middle', 'High');
CREATE TABLE hardwares (
  id serial PRIMARY KEY,
  type hardw_type NOT NULL,
  office_id int REFERENCES offices
);

CREATE TABLE positions (
  id serial PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE
);

CREATE TABLE position_to_offices (
  position_id int REFERENCES positions(id),
  office_id int REFERENCES offices,
  PRIMARY KEY(position_id, office_id)
);

CREATE TABLE position_to_types (
  position_id int PRIMARY KEY REFERENCES positions,
  type hardw_type NOT NULL
);

CREATE TABLE position_to_hardware (
  position_id int REFERENCES positions,
  hardware_id int REFERENCES hardwares,
  PRIMARY KEY (position_id, hardware_id)
);

INSERT 
INSERT INTO position_to_types VALUES (1);

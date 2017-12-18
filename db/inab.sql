-- inab.sql

DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS vendors;
DROP TABLE IF EXISTS categories;



CREATE TABLE categories(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE vendors(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL

);

CREATE TABLE accounts(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE transactions(
  id SERIAL4 PRIMARY KEY,
  amount NUMERIC(8,2),
  comment VARCHAR(255),
  transaction_date DATE,
  category_id INT4 REFERENCES categories(id),
  vendor_id INT4 REFERENCES vendors(id),
  account_id INT4 REFERENCES accounts(id)
);

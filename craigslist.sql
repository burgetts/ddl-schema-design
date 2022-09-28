
DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region TEXT NOT NULL
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    password TEXT NOT NULL,
    pref_region INTEGER REFERENCES regions
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    author_id INTEGER REFERENCES users,
    region_id INTEGER REFERENCES regions,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    location TEXT,
    category INTEGER REFERENCES categories
);

INSERT INTO regions
  (region)
VALUES
  ('Northeast'),
  ('Northwest'),
  ('Southeast'),
  ('Southwest');

INSERT INTO categories
  (category)
VALUES
  ('Art'),
  ('Video Games'),
  ('Furniture');

INSERT INTO users
  (username, password, pref_region)
VALUES
 ('beans', 'beans1', 3),
 ('meatloaf_lover15', 'beans2', 3);

INSERT INTO posts
  (author_id, region_id, title, text, category)
VALUES
  (2, 1, 'Furniture for sale', 'this chair is rad', 3);
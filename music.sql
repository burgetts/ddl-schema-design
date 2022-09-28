-- from the terminal run:
-- psql < music.sql

-- To improve:
-- Add two new tables, artists and producers
-- Add two tables songs_artists and songs_producers
DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  -- artists TEXT[] NOT NULL,
  album TEXT NOT NULL
  -- producers TEXT[] NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer TEXT NOT NULL
);

CREATE TABLE songs_artists
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs,
  artist_id INTEGER REFERENCES artists
);

CREATE TABLE songs_producers
(
  id SERIAL PRIMARY KEY,
  song INTEGER REFERENCES songs,
  producer_id INTEGER REFERENCES producers
);

INSERT INTO artists
  (artist)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Cary'),
  ('Boyz II Men'),  
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nickelback');

INSERT INTO songs
  (title, duration_in_seconds, release_date, album)
VALUES
  ('MMMBop', 238, '04-15-1997', 'Middle of Nowhere'),
  ('Bohemian Rhapsody', 355, '10-31-1975','A Night at the Opera'),
  ('One Sweet Day', 282, '11-14-1995',  'Daydream'),
  ('Shallow', 216, '09-27-2018', 'A Star Is Born'),
  ('How You Remind Me', 223, '08-21-2001', 'Silver Side Up');

INSERT INTO producers
  (producer)
VALUES 
('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick Parashar');

INSERT INTO songs_artists
(song_id, artist_id)
VALUES
(1,2),
(3,4);

INSERT INTO songs_producers
(song, producer_id)
VALUES
(1,2),
(3,4);

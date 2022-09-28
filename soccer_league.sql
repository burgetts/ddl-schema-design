DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team TEXT NOT NULL,
    standing INTEGER NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    player_first_name TEXT NOT NULL,
    player_last_name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams ON DELETE CASCADE
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    year INTEGER NOT NULL,
    start_date DATE,
    end_date DATE
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    ref_first_name TEXT NOT NULL,
    ref_last_name TEXT NOT NULL
);

CREATE TABLE games 
(
    id SERIAL PRIMARY KEY,
    location TEXT,
    team1_id INTEGER NOT NULL REFERENCES teams,
    team2_id INTEGER NOT NULL REFERENCES teams,
    score INTEGER NOT NULL,
    referee_id INTEGER REFERENCES referees
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player INTEGER NOT NULL REFERENCES players,
    game INTEGER NOT NULL REFERENCES games,
    team_id INTEGER REFERENCES teams
);
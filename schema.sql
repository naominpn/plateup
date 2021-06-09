CREATE DATABASE plateup;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    email TEXT,
    password_digest TEXT,
    name TEXT,
    current_weight INTEGER,
    goal_weight INTEGER
);
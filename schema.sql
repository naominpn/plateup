CREATE DATABASE plateup;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    email TEXT,
    password_digest TEXT,
    name TEXT,
    current_weight INTEGER,
    goal_weight INTEGER
);

CREATE TABLE logs(
    id SERIAL PRIMARY KEY,
    date DATE,
    exercise TEXT,
    weight INT,
    sets INT,
    reps INT,
    notes TEXT,
    user_id INT
);
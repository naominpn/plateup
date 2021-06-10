CREATE DATABASE plateup;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    email TEXT,
    password_digest TEXT,
    name TEXT,
    current_weight REAL,
    goal_weight REAL
);

CREATE TABLE logs(
    id SERIAL PRIMARY KEY,
    date DATE,
    exercise TEXT,
    weight REAL,
    sets INT,
    reps INT,
    notes VARCHAR(255),
    user_id INT
);
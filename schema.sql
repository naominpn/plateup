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

CREATE TABLE exercises(
    id SERIAL PRIMARY KEY,
    exercise_name TEXT,
    exercise_image TEXT
);

INSERT INTO exercises(exercise_name, exercise_image) VALUES ('Bench Press', 'https://www.fitstream.com/images/weight-training/exercises/bench-press.png');

INSERT INTO exercises(exercise_name, exercise_image) VALUES ('Squat', 'https://www.fitstream.com/images/weight-training/exercises/squat-one.png');

INSERT INTO exercises(exercise_name, exercise_image) VALUES ('Deadlift','https://www.fitstream.com/images/weight-training/exercises/deadlift-two.png');

INSERT INTO exercises(exercise_name, exercise_image) VALUES ('Rows', 'https://www.fitstream.com/images/weight-training/exercises/bent-over-row.png');

INSERT INTO exercises(exercise_name, exercise_image) VALUES ('Biceps Curls', 'https://thumbs.dreamstime.com/b/man-doing-barbell-curls-exercise-standing-bicep-curl-arm-workout-man-doing-barbell-curls-exercise-standing-bicep-curl-arm-workout-201313766.jpg');
DROP DATABASE IF EXISTS  todo_app;
DROP USER IF EXISTS michael;
CREATE user michael WITH PASSWORD 'stonebreaker';
CREATE DATABASE todo_app;
\c todo_app;
CREATE TABLE tasks (
    ID SERIAL PRIMARY KEY,
    title VARCHAR (255) NOT NULL,
    description TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NULL,
    completed boolean NOT NULL DEFAULT false
);

ALTER TABLE ONLY tasks DROP COLUMN completed;

ALTER TABLE tasks
    ADD COLUMN completed_at timestamp;

ALTER TABLE ONLY tasks
ALTER COLUMN updated_at SET DEFAULT now();


INSERT INTO tasks VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO tasks VALUES (DEFAULT, 'Study PostgreSQL', 'Read all the documentation', DEFAULT, DEFAULT, DEFAULT);

SELECT title 
FROM tasks 
WHERE completed_at IS NULL;

UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';

SELECT title
FROM tasks
WHERE title IS NULL;

SELECT description
FROM tasks
WHERE description IS NULL;

SELECT * FROM tasks
ORDER BY created_at DESC;

INSERT INTO tasks
VALUES (DEFAULT, 'mistake 1', 'a test entry', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO tasks
VALUES (DEFAULT, 'mistake 2', 'another test entry', DEFAULT, DEFAULT, DEFAULT);

SELECT title FROM tasks
WHERE title LIKE '%mistakes%';

DELETE FROM tasks
WHERE tasks.title = 'mistake 1';

SELECT * FROM tasks
WHERE title LIKE '%mistake%';

DELETE FROM tasks
WHERE tasks.title LIKE '%mistake%';

SELECT * FROM tasks
ORDER BY title ASC;


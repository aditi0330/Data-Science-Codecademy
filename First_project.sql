CREATE TABLE friends(
id INTEGER,
name TEXT,
birthday DATE
);
INSERT INTO friends (id, name, birthday) 
VALUES (1, 'Jane Doe', '1990-05-30');
SELECT * 
FROM friends;
INSERT INTO friends (id, name, birthday) 
VALUES (2, 'Aditi Shukla', '1996-05-03');
INSERT INTO friends (id, name, birthday) 
VALUES (3, 'Abhi Mish', '1996-11-30');
UPDATE friends
SET name = 'Jane Smith'
WHERE id = 1;
ALTER TABLE friends
ADD COLUMN email TEXT;
UPDATE friends
SET email = 'jane@codecademy.com'
WHERE id = 1;
UPDATE friends
SET email = 'aditi@codecademy.com'
WHERE id = 2;
UPDATE friends
SET email = 'mish@codecademy.com'
WHERE id = 3;
DELETE FROM friends
WHERE id = 1;
SELECT * 
FROM friends;
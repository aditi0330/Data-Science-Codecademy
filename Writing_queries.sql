/* This code contains: 

SELECT is the clause we use every time we want to query information from a database.
AS renames a column or table.
DISTINCT return unique values.
WHERE is a popular command that lets you filter the results of the query based on conditions that you specify.
LIKE and BETWEEN are special operators.
AND and OR combines multiple conditions.
ORDER BY sorts the result.
LIMIT specifies the maximum number of rows that the query will return.
CASE creates different outputs. */

SELECT * FROM movies;
SELECT name, genre, year
FROM movies;
SELECT name AS 'Titles'
FROM movies;
SELECT imdb_rating AS 'IMDb'
FROM movies;
SELECT DISTINCT year 
FROM movies;
SELECT * 
FROM movies 
WHERE year > 2014;
SELECT * 
FROM movies
WHERE name LIKE 'Se_en';
SELECT * 
FROM movies
WHERE name LIKE '%man%';
SELECT * 
FROM movies
WHERE name LIKE 'The %';
SELECT name
FROM movies 
WHERE imdb_rating IS NOT NULL;
SELECT *
FROM movies
WHERE year < 1985
  AND genre = 'horror';
  SELECT *
FROM movies
WHERE year > 2014
   OR genre = 'action';
   SELECT name, year, imdb_rating
FROM movies
ORDER BY imdb_rating DESC;
SELECT * 
FROM movies
ORDER BY imdb_rating DESC
LIMIT 3;
-- Create a new table
CREATE TABLE people (
  name VARCHAR(30) NOT NULL,
  has_pet BOOLEAN DEFAULT false,
  pet_type VARCHAR(10) NOT NULL,
  pet_name VARCHAR(30),
  pet_age INT
);

-- Query all fields from the table
SELECT *
FROM people;

-- Insert data into the table
INSERT INTO people (name, has_pet, pet_type, pet_name, pet_age)
VALUES ('Jacob', true, 'dog', 'Misty', 10),
  ('Ahmed', true, 'rock', 'Rockington', 100),
  ('Peter', true, 'cat', 'Franklin', 2),
  ('Dave', true, 'dog', 'Queso', 1);

-- Query only the `pet_name` field
SELECT pet_name
FROM people;

-- Filter the query to show only dogs under the age of 5
SELECT pet_type, pet_name
FROM people
WHERE pet_type = 'dog'
AND pet_age < 5;


-- Create a new table
CREATE TABLE cities (
  city VARCHAR(30) NOT NULL,
  state VARCHAR(30) NOT NULL,
  population INT
);

-- Insert data into the table
INSERT INTO cities (city, state, population)
VALUES ('Alameda', 'California', 79177),
  ('Mesa', 'Arizona', 496401),
  ('Boerne', 'Texas', 16056),
  ('Anaheim', 'California', 352497),
  ('Tucson', 'Arizona', 535677),
  ('Garland', 'Texas', 238002);

-- View the table data
SELECT *
FROM cities;

-- Use a query to view only the cities
SELECT city
FROM cities;

-- Bonus 1:
-- Create a query to view cities in Arizona
SELECT city, state
FROM cities
WHERE state = 'Arizona';

-- Bonus 2:
-- Create a query to view cities and states
-- with a population less than 100,000
SELECT *
FROM cities
WHERE population < 100000;

-- Bonus 3:
-- Create a query to view the city in California
-- with a population of less than 100,000
SELECT *
FROM cities
WHERE population < 100000
AND state = 'California';

-- Delete the table "people"
DROP TABLE people;

-- Re-create the table "people" within animals_db
CREATE TABLE people (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  has_pet BOOLEAN DEFAULT false,
  pet_type VARCHAR(10) NOT NULL,
  pet_name VARCHAR(30),
  pet_age INT
);

-- Insert data into the table
INSERT INTO people (name, has_pet, pet_type, pet_name, pet_age)
VALUES ('Jacob', true, 'dog', 'Misty', 10),
  ('Ahmed', true, 'rock', 'Rockington', 100),
  ('Ahmed', true, 'rock', 'Rockington', 100),
  ('Peter', true, 'cat', 'Franklin', 2),
  ('Dave', true, 'dog', 'Queso', 1),
  ('Dave', true, 'dog', 'Pringles', 7);

-- Query all fields from the table
SELECT *
FROM people;

-- Query the data to return all the rows containing the name "Dave"
SELECT id, name, pet_name, pet_age
FROM people
WHERE name = 'Dave';

-- Update a single row to change the `pet_name` and `pet_age` column data
UPDATE people
SET has_pet = true, pet_name = 'Rocket', pet_age = 8
WHERE id = 6;

SELECT *
FROM people;

-- Delete the duplicate entry using a unique id
DELETE FROM people
WHERE id = 3;

SELECT *
FROM people;

-- Drop table if exists
DROP TABLE programming_languages;

-- Create new programming_languages table
CREATE TABLE programming_languages (
  id SERIAL PRIMARY KEY,
  language VARCHAR(20),
  rating INT
);

-- Insert new data
INSERT INTO programming_languages (language, rating)
VALUES ('HTML', 95),
	('JS', 99),
	('JQuery', 98),
	('MySQL', 70),
	('MySQL', 70);

SELECT * FROM programming_languages;

-- Query the rows with the language "MySQL"
SELECT *
FROM programming_languages
WHERE language = 'MySQL';

-- Drop a duplicate row
DELETE FROM programming_languages
WHERE id = 5;

SELECT *
FROM programming_languages;

-- Add additional data
INSERT INTO programming_languages (language, rating)
VALUES ('Python', 98),
	('C++', 73),
	('R', 95);

SELECT *
FROM programming_languages;

-- Update "JS" to "JavaScript"
UPDATE programming_languages
SET language = 'JavaScript'
WHERE id = 2;

SELECT *
FROM programming_languages;

-- Change HTML's rating to 90
UPDATE programming_languages
SET rating = 90
WHERE id = 1;

SELECT *
FROM programming_languages;

-- BONUS
-- Add a "mastered" column with the boolean default of true
ALTER TABLE programming_languages
ADD COLUMN mastered BOOLEAN default true;

-- Drop table if exists
DROP TABLE wordassociation;

-- Create table and view column datatypes
CREATE TABLE wordassociation (
	author INT,
	word1 VARCHAR,
	word2 VARCHAR,
	source VARCHAR
);

SELECT *
FROM wordassociation;

-- Collect all rows with the word "stone" in the "word1" column
SELECT *
FROM wordassociation
WHERE word1 = 'stone';

-- Collect all rows where the author is within the 0-10 range
SELECT *
FROM wordassociation
WHERE
	author >= 1
	AND author <= 10;

-- Search for the word "pie" in both "word1" and "word2" columns
SELECT *
FROM wordassociation
WHERE
	word1 = 'pie'
	OR word2 = 'pie';

-- BONUS
-- Select all rows with a source of "BC"
SELECT *
FROM wordassociation
WHERE source = "BC";

-- Collect all rows where the author is within the 333-335 range and has a source of "BC"
SELECT *
FROM wordassociation
WHERE
	SOURCE = 'BC'
	AND author >= 333
	AND author <= 335;

-- Add primary key
ALTER TABLE firepower
ADD COLUMN id SERIAL PRIMARY KEY;

-- Delete and update data
DELETE FROM firepower
WHERE ReservePersonnel = 0;

UPDATE firepower
SET FighterAircraft = 1
WHERE FighterAircraft = 0;

UPDATE firepower
SET TotalAircraftStrength = TotalAircraftStrength + 1
WHERE FighterAircraft = 1;

-- Select averages and rename columns
SELECT AVG(TotalMilitaryPersonnel) AS AvgTotMilPersonnel,
	AVG(TotalAircraftStrength) AS AvgTotAircraftStrength,
	AVG(TotalHelicopterStrength) AS AvgTotHelicopterStrength,
	AVG(TotalPopulation) AS AvgTotalPopulation
FROM firepower;

-- Insert new data
INSERT INTO firepower(Country, TotalPopulation, TotalMilitaryPersonnel, TotalAircraftStrength, TotalHelicopterStrength)
VALUES ('GlobalLand', 60069024, 524358, 457, 183);

-- View table
SELECT * FROM firepower;

-- Drop table if exists
DROP TABLE players;

-- Create the players table
CREATE TABLE players (
	player_id INT,
	first_name VARCHAR,
	last_name VARCHAR,
	hand VARCHAR,
	country_code VARCHAR
);

-- Check data import
SELECT *
FROM players;

-- Create the matches table
CREATE TABLE matches (
	loser_age DEC,
	loser_id INT,
	loser_name VARCHAR,
	loser_rank INT,
	winner_age DEC,
	winner_id INT,
	winner_name VARCHAR,
	winner_rank INT
);

-- Check data import
SELECT *
FROM matches;

-- Perform an INNER JOIN on the two tables
SELECT players.first_name, players.last_name, players.hand, matches.loser_rank
FROM matches
INNER JOIN players ON
players.player_id=matches.loser_id;

-- Alternative solution:
-- Perform an INNER JOIN on the two tables
SELECT p.first_name, p.last_name, p.hand, m.loser_rank
FROM matches AS m
INNER JOIN players AS p ON
p.player_id=m.loser_id;

-- Drop table if exists
DROP TABLE players;

-- Create the players table
CREATE TABLE players (
	player_id INT,
	first_name VARCHAR,
	last_name VARCHAR,
	hand VARCHAR,
	country_code VARCHAR
);

-- Check data import
SELECT *
FROM players;

-- Create the matches table
CREATE TABLE matches (
	loser_age DEC,
	loser_id INT,
	loser_name VARCHAR,
	loser_rank INT,
	winner_age DEC,
	winner_id INT,
	winner_name VARCHAR,
	winner_rank INT
);

-- Check data import
SELECT *
FROM matches;

-- Perform an INNER JOIN on the two tables
SELECT players.first_name, players.last_name, players.hand, matches.loser_rank
FROM matches
INNER JOIN players ON
players.player_id=matches.loser_id;

-- Alternative solution:
-- Perform an INNER JOIN on the two tables
SELECT p.first_name, p.last_name, p.hand, m.loser_rank
FROM matches AS m
INNER JOIN players AS p ON
p.player_id=m.loser_id;

-- Join players with seasons_stats
SELECT players.id,
  players.player,
  players.height,
  players.weight,
  players.college,
  players.born,
  seasons_stats.position,
  seasons_stats.tm
FROM players
INNER JOIN seasons_stats ON
players.id = seasons_stats.player_id;


-- Join seasons_stats with players
SELECT seasons_stats.player_id,
  players.college,
  seasons_stats.year,
  seasons_stats.position,
  seasons_stats.Two_Point_Percentage,
  seasons_stats.FG_Percentage,
  seasons_stats.FT_Percentage,
  seasons_stats.TS_Percentage
FROM seasons_stats
INNER JOIN players ON
players.id = seasons_stats.player_id;


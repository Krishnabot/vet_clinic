/*Queries that provide answers to the questions from all projects.*/

/* create animals table */

SELECT * FROM animal WHERE name LIKE '%mon';
SELECT name FROM animal WHERE date_of_birth BETWEEN '2016/01/01' AND '2019/12/31';
SELECT name FROM animal WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animal WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animal WHERE weight_kg > 10.5;
SELECT * FROM animal WHERE neutered = true;
SELECT * FROM animal WHERE name != 'Gabumon';
SELECT * FROM animal WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* query and update animals table*/

BEGIN;
UPDATE animal
SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animal
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animal
SET species = 'pokemon'
WHERE name NOT LIKE '%mon';
COMMIT;

BEGIN;
DELETE FROM animal;
ROLLBACK;

BEGIN;
DELETE FROM animal WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete_animal;
SELECT * FROM animal; 
UPDATE animal
SET weight_kg = weight_kg * -1;
SELECT * FROM animal; 
ROLLBACK TO delete_animal;
UPDATE animal
SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animal;
COMMIT;

SELECT COUNT(*) FROM animal;
SELECT COUNT(*) FROM animal WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animal;
SELECT neutered, AVG(escape_attempts) AS average_escapes FROM animal GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animal GROUP BY species;
SELECT AVG(escape_attempts) FROM animal WHERE date_of_birth BETWEEN 'January 1, 1990' AND ' December 31, 2000';

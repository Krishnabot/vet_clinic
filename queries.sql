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


/* query multiple tables*/

SELECT name FROM animals INNER JOIN owners ON owner_id = owners.id WHERE full_name = 'Melody Pond';
SELECT animals.name FROM animals INNER JOIN species ON species_id = species.id WHERE species.name = 'Pokemon';
SELECT animals.name, owners.full_name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id;
SELECT COUNT(*), species.name AS species FROM animals JOIN species ON species_id = species.id GROUP BY species.name;
SELECT animals.name AS digimons_name, owners.full_name AS owner_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE animals.species_id = 2 AND owners.full_name = 'Jennifer Orwell';
SELECT animals.name, owners.full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';
SELECT full_name, COUNT(full_name) AS owns FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY full_name ORDER BY owns DESC LIMIT 1;


/* add "join table" for visits. */

SELECT animal.name, vets.name, visits.visit_date FROM animal JOIN visits 
ON animal.id = visits.animal_id JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.visit_date DESC
LIMIT 1;

SELECT animal.name, vets.name FROM animal JOIN visits 
ON animal.id = visits.animal_id JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.visit_date DESC
LIMIT 1;

SELECT vets.name, species.name FROM vets LEFT JOIN specializations
ON vets.id = specializations.vet_id LEFT JOIN species
ON specializations.species_id = species.id;

SELECT animal.name, vets.name, visits.visit_date FROM animal JOIN visits 
ON animal.id = visits.animal_id JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez' AND visits.visit_date > '2020-04-01'
AND visits.visit_date <= '2020-08-30'
ORDER BY visits.visit_date DESC;

SELECT animal.name, COUNT(visits.animal_id) FROM visits JOIN animal 
ON animal.id = visits.animal_id
GROUP BY animal.name
ORDER BY COUNT(visits.animal_id) DESC
LIMIT 1;

SELECT animal.name, vets.name, visits.visit_date FROM animal JOIN visits 
ON animal.id = visits.animal_id JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.visit_date ASC
LIMIT 1;

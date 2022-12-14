/* Populate database with sample data. */
/* create animals table */
INSERT INTO animal (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', 'February 3, 2020', 0, true, '10.23');
INSERT INTO animal (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', 'November 15, 2018', 2, true, '8');
INSERT INTO animal (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', 'January 7, 2021', 1, false, '15.04');
INSERT INTO animal (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', 'May 12, 2017', 5, true, '11');

/* query and update animals table */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', 'February 8, 2020', 0, false, '-11');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', 'November 15, 2021', 2, true, '-5.7');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', 'April 2, 1993', 3, false, '-12.13');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', 'June 12, 2005', 1, true, '-45');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', 'June 7, 2005', 7, true, '20.4');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', 'October 13, 1998', 3, true, '17');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', 'May 14, 2022', 4, true, '22');

/* query multiple tables*/

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

UPDATE animal SET species_id = 1 WHERE name LIKE '%mon';
UPDATE animal SET species_id = 2 WHERE name NOT LIKE '%mon';

UPDATE animal SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animal SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animal SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animal SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');


/* add "join table" for visits. */

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, 'April 23, 2000');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, 'January 17, 2019');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, 'May 4, 1981');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, 'June 8, 2008');

INSERT INTO specializations (vet_id, species_id) VALUES (1, 1);
INSERT INTO specializations (vet_id, species_id) VALUES (3, 1);
INSERT INTO specializations (vet_id, species_id) VALUES (3, 2);
INSERT INTO specializations (vet_id, species_id) VALUES (4, 2);

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), 'May 24, 2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 'July 22, 2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), 'February 2, 2021');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'January 5, 2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'March 8, 2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'May 14, 2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 'May 4, 2021');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), 'February 24, 2021');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'December 21, 2019');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), 'August 10, 2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'April 7, 2021');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 'September 29, 2019');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), 'October 3, 2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), 'November 4, 2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'January 24, 2019');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'May 15, 2019');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'February 27, 2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'August 3, 2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 'May 25, 2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animal WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), 'January 11, 2021');


/* Performance audit queries */

CREATE INDEX animal_idx ON visits(animal_id);

CREATE INDEX vet_idx ON visits(vet_id);

CREATE INDEX email_idx ON owners(email); 

/* Database schema to keep the structure of entire database. */

/* create animals table */

CREATE TABLE animal (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);

/* query and update animals table*/
ALTER TABLE animal ADD species VARCHAR(100); -- ALTER TABLE (species column added);

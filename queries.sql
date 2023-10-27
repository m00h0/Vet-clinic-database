SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth >= 'Dec 31 2016' AND date_of_birth <= 'Jan 01 2019';
SELECT name from animals WHERE neutered = 'True' and escape_attempts < '3';
SELECT date_of_birth from animals WHERE name = 'Agumon' or name = 'Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > '10.5';
SELECT * from animals WHERE neutered = 'True';
SELECT * from animals WHERE name NOT IN ('Gabumon');
SELECT * from animals WHERE weight_kg >= '10.4' and weight_kg <= '17.3';


BEGIN TRANSACTION;

UPDATE animals
SET species = 'unspecified'
WHERE species IS NULL;

SELECT * FROM animals;

ROLLBACK;

BEGIN TRANSACTION;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

SELECT * FROM animals;

COMMIT;


BEGIN TRANSACTION;

DELETE FROM animals;

ROLLBACK;

SELECT * FROM animals;


BEGIN TRANSACTION;

DELETE FROM animals 
WHERE date_of_birth > 'Jan 1 2022';

SAVEPOINT savepoint_weight;

UPDATE animals
SET weight_kg = weight_kg * -1;

ROLLBACK TO savepoint_weight;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;


SELECT COUNT(*) FROM animals;

SELECT COUNT(*)
FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg)
FROM animals;

SELECT neutered, COUNT(*) AS escape_count FROM animals
WHERE escape_attempts > 0
GROUP BY neutered
ORDER BY escape_count DESC
LIMIT 1;

SELECT species,
MIN(weight_kg) AS min_weight,
MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) AS 
avg_escape_attempts 
FROM animals
WHERE date_of_birth BETWEEN 'Jan 1 1990' AND 'Dec 31 2000'
GROUP BY species;

SELECT A.name, O.full_name
FROM animals A
JOIN owners O ON A.owner_id = O.id
WHERE O.full_name = 'Melody Pond';

SELECT A.name
FROM animals A
JOIN species S ON A.species_id = S.id
WHERE S.name = 'Pokemon';

SELECT A.name, O.full_name
FROM owners O
LEFT JOIN animals A ON O.id = A.owner_id;

SELECT S.name AS species_name, COUNT(A.id) AS animal_count
FROM species S
LEFT JOIN animals A ON S.id = A.species_id
GROUP BY S.name;

SELECT A.name AS digimon_name
FROM animals A
JOIN species S ON A.species_id = S.id
JOIN owners O ON A.owner_id = O.id
WHERE O.full_name = 'Jennifer Orwell'
AND S.name = 'Digimon';

SELECT A.NAME
FROM animals A
JOIN owners O ON A.owner_id = O.id
WHERE O.full_name = 'Dean Winchester'
AND A.escape_attempts = 0;

SELECT O.full_name AS owner_name, COUNT(A.id) AS animal_count
FROM owners O
LEFT JOIN animals A ON O.id = A.owner_id
GROUP BY O.full_name
ORDER BY COUNT(A.id) DESC
LIMIT 1;
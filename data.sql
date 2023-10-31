/* Populate database with sample data. */


INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES 
('1', 'Agumon', 'Feb 3 2020', '0', 'True', '10.23'),
('2', 'Gabumon', 'Nov 15 2018', '2', 'True', '8'),
('3', 'Pikachu', 'Jan 7 2021', '1', 'False', '15.04'),
('4', 'Devimon', 'May 12 2017', '5', 'True', '11'),
('5', 'Charmander', 'Feb 8 2020', '0', 'False', '-11'),
('6', 'Plantmon', 'Nov 15 2021', '2', 'True', '-5.7'),
('7', 'Squirtle', 'Apr 2 1993', '3', 'False', '-12.13'),
('8', 'Angemon', 'Jun 12 2005', '1', 'True', '-45'),
('9', 'Boarmon', 'Jun 7 2005', '7', 'True', '20.4'),
('10', 'Blossom', 'Oct 13 1998', '3', 'True', '17'),
('11', 'Ditto', 'May 14 2022', '4', 'True', '22');

INSERT INTO owners(full_name, age)
VALUES 
('Sam Smith', '34'),
('Jennifer Orwell', '19'),
('Bob', '45'),
('Melody Pond', '77'),
('Dean Winchester', '14'),
('Jodie Whittaker', '38');

INSERT INTO species(name) VALUES 
('Pokemon'),
('Digimon');

UPDATE animals 
SET species_id = CASE
    WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon' LIMIT 1)
    ELSE (SELECT id FROM species WHERE name = 'Pokemon' LIMIT 1)
END;

UPDATE animals
SET owner_id = CASE
    WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith' LIMIT 1)
    WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell' LIMIT 1)
    WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob' LIMIT 1)
    WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond' LIMIT 1)
    WHEN name IN ('Angemon', 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester' LIMIT 1)
END;

INSERT INTO vets (name, age, date_of_graduation) VALUES
	('William Tatcher', '45', 'Apr 23 2000'),
	('Maisy Smith', '26', 'Jan 17 2019'),
	('Stephanie Mendez', '64', 'May 4 1981'),
	('Jack Harkness', '38', 'Jun 8 2008');

INSERT INTO specializations (vet_id, species_id) VALUES
	('1', '1'),
	('3', '2'),
	('3', '1'),
	('4', '2');

INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES
	('1','1', 'May 24 2020'),
	('1', '3', 'Jul 22 2020'),
	('2', '4', 'Feb 2 2021'),
	('3', '2', 'Jan 5 2020'),
	('3', '2', 'Mar 8 2020'),
	('3', '2', 'May 14 2020'),
	('4', '3', 'May 4 2021'),
	('5', '4', 'Feb 24 2021'),
	('6', '2', 'Dec 21 2019'),
	('6', '1', 'Aug 10 2020'),
	('6', '2', 'Apr 7 2021'),
	('7', '3', 'Sep 29 2019'),
	('8', '4', 'Oct 3 2020'),
	('8', '4', 'Nov 4 2020'),
	('9', '2', 'Jan 24 2019'),
	('9', '2', 'May 15 2019'),
	('9', '2', 'Feb 27 2020'),
	('9', '2', 'Aug 3 2020'),
	('10', '3', 'May 24 2020'),
	('10', '1', 'Jan 11 2021');


/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id intger NOT NULL,
    name varchar(60),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal,
    primary key (id)
);

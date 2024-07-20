-- Active: 1720687396482@@127.0.0.1@3306@monkey_pox

CREATE TABLE monkey_pox(  
    location TEXT,
    iso_code TEXT,
    date DATETIME,
    total_cases INT,
    total_deaths INT,
    new_cases INT,
    new_deaths INT,
    new_cases_smoothed DOUBLE,
    new_deaths_smoothed INT,
    new_cases_per_million INT,
    total_cases_per_million INT,
    new_cases_smoothed_per_million DOUBLE,
    new_deaths_per_million INT,
    total_deaths_per_million DOUBLE,
    new_deaths_smoothed_per_million INT
) COMMENT '';

CREATE TABLE population(
        location TEXT,
        CODE TEXT,
        date INT,
        Population INT
) COMMENT '';

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE "E:/ML Learning/PROJECT_MONKEYPOX_OUTBREAK_VISUALIZATION/DATA/owid-monkeypox-data.csv"
into TABLE monkey_pox
fields TERMINATED BY ','
ignore 1 rows;

LOAD DATA LOCAL INFILE "E:/ML Learning/PROJECT_MONKEYPOX_OUTBREAK_VISUALIZATION/DATA/population-regions-with-projections.csv"
INTO TABLE population
fields TERMINATED BY ','
ignore 1 rows;


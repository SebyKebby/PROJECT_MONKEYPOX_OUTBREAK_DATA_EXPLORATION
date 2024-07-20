


SELECT iso_code,
    SUBSTRING_INDEX(iso_code, '_', -1)
FROM monkey_pox LIMIT 100;


UPDATE monkey_pox
SET iso_code = SUBSTRING_INDEX(iso_code, '_', -1);


select *
FROM population
where CODE = 'VNM' LIMIT 100;


select CODE
FROM population LIMIT 100;


select *
FROM population LIMIT 100;



select location, CODE
FROM population LIMIT 100;



select location, CODE
FROM population
WHERE CODE IS NULL or CODE = '' LIMIT 100;


SELECT location, iso_code
FROM monkey_pox LIMIT 100;


select location, CODE
FROM population
WHERE CODE IS NULL or CODE = '' LIMIT 100;


SELECT location, iso_code
FROM monkey_pox
WHERE location LIKE 'Europe%' LIMIT 100;


SELECT DISTINCT
location, iso_code
FROM monkey_pox
WHERE location LIKE 'Europe%' LIMIT 100;


select location, CODE
FROM population
WHERE CODE IS NULL or CODE = '' LIMIT 100;


SELECT DISTINCT
location, iso_code
FROM monkey_pox
WHERE location LIKE 'Afice%' LIMIT 100;


SELECT DISTINCT
location, iso_code
FROM monkey_pox
WHERE location LIKE 'Afica%' LIMIT 100;


SELECT DISTINCT
location, iso_code
FROM monkey_pox
WHERE location LIKE 'Africa%' LIMIT 100;


SELECT location, CODE
FROM population
WHERE CODE IS NULL or CODE = '' LIMIT 100;


SELECT DISTINCT
location, iso_code
FROM monkey_pox
WHERE location LIKE 'Africa%' LIMIT 100;


SELECT location, CODE
FROM population
WHERE CODE IS NULL or CODE = '' LIMIT 100;


SELECT DISTINCT
location, iso_code
FROM monkey_pox
WHERE location LIKE 'High-income countries%' LIMIT 100;


SELECT location, CODE
FROM population
WHERE CODE IS NULL or CODE = '' LIMIT 100;


SELECT DISTINCT
location, iso_code
FROM monkey_pox
WHERE location LIKE 'Asia%' LIMIT 100;


SELECT location, CODE
FROM population
WHERE CODE IS NULL or CODE = '' LIMIT 100;


SELECT DISTINCT
location, iso_code
FROM monkey_pox
WHERE location LIKE 'Americas%' LIMIT 100;


SELECT DISTINCT
location, iso_code
FROM monkey_pox
WHERE location LIKE 'America%' LIMIT 100;


SELECT DISTINCT
location, iso_code
FROM monkey_pox
WHERE location LIKE 'America' LIMIT 100;


SELECT DISTINCT
location, iso_code
FROM monkey_pox
WHERE location LIKE '%America' LIMIT 100;

-- 2024-07-20 08:21:20 [3 ms] - MySQL
SELECT location, CODE
FROM population
WHERE CODE IS NULL or CODE = '' LIMIT 100;

-- 2024-07-20 08:21:31 [93 ms] - MySQL
SELECT DISTINCT
location, iso_code
FROM monkey_pox
WHERE location LIKE '%America' LIMIT 100;

-- 2024-07-20 08:21:35 [94 ms] - MySQL
SELECT DISTINCT
location, iso_code
FROM monkey_pox
WHERE location LIKE '%America%' LIMIT 100;

-- 2024-07-20 09:19:31 [9 ms] - MySQL
SELECT DISTINCT location, CODE
FROM population
WHERE 
    location LIKE 'Europe %' OR
    location LIKE 'European %' OR
    location LIKE 'Africa %' OR
    location LIKE 'Asia %' OR
    location LIKE '% countries' OR 
    location LIKE '%(UN)' OR
    location LIKE 'South America %' OR
    location LIKE 'North America %' LIMIT 100;

    -- 2024-07-20 09:32:28 [998 ms] - MySQL
UPDATE monkey_pox
SET iso_code = SUBSTRING_INDEX(iso_code, '_', -1);


-- 2024-07-20 09:32:29 [10 ms] - MySQL
UPDATE population
SET CODE = SUBSTRING_INDEX(CODE, '_', -1);

-- 2024-07-20 09:32:31 [11 ms] - MySQL
DELETE FROM population
WHERE 
    location LIKE 'Europe %' OR
    location LIKE 'European %' OR
    location LIKE 'Africa %' OR
    location LIKE 'Asia %' OR
    location LIKE '% countries' OR 
    location LIKE '%(UN)' OR
    location LIKE 'South America %' OR
    location LIKE 'North America %';

    -- 2024-07-20 09:35:12 [68 ms] - MySQL
ALTER TABLE population
MODIFY COLUMN date YEAR;


-- 2024-07-20 09:35:15 [31 ms] - MySQL
ALTER TABLE monkey_pox
ADD COLUMN population BIGINT;

-- 2024-07-20 09:37:49 [606 ms] - MySQL
ALTER TABLE monkey_pox MODIFY COLUMN date DATE;

-- 2024-07-20 09:38:46 [313 ms] - MySQL
CREATE INDEX idx_monkey_pox_location_date 
ON monkey_pox(location(255), date);

-- 2024-07-20 09:39:03 [45 ms] - MySQL
CREATE INDEX idx_population_location_date 
ON population(location(255), date);

-- 2024-07-20 09:39:15 [4358 ms] - MySQL
UPDATE monkey_pox mp
JOIN population p ON mp.location = p.location AND YEAR(mp.date) = p.date
SET mp.population = p.Population
WHERE YEAR(mp.date) IN (2022, 2023, 2024);
-- Active: 1720687396482@@127.0.0.1@3306@monkey_po


SELECT *
FROM monkey_pox


Select location, date, total_cases, new_cases, total_deaths, population
FROM monkey_pox
where location = 'world'

-- Total cases vs total deaths

Select location, date, total_cases, new_cases, total_deaths, population, (total_deaths/total_cases) *100 AS cases_vs_deaths
FROM monkey_pox
WHERE location like '%States%'
ORDER BY date



-- Percentage of population got Monkey Pox
SELECT location,date,total_cases,new_cases,total_deaths,population, (total_deaths/total_cases) * 100 AS percentage_of_population
FROM monkey_pox
WHERE location LIKE '%States%'
ORDER BY date

--Infection rate per country

SELECT location, population, MAX(total_cases) AS highest_infection_count,
    MAX((total_cases/population)) * 100 AS infection_rate
FROM monkey_pox
GROUP BY location, population
ORDER BY infection_rate desc

--Highest deaths per population
SELECT location, population, MAX(total_deaths) AS total_death_count, MAX((total_deaths / population)) * 100 AS mortality_rate
FROM monkey_pox
GROUP BY location, population
ORDER BY mortality_rate desc

-- Highest death count
SELECT location, population, MAX(total_deaths) AS highest_death_count
FROM monkey_pox
GROUP BY location, population
order by highest_death_count desc;


--Global case count (with rolling total)
WITH cte AS
(SELECT 
    date,
    new_cases,
    new_deaths,
    SUM(new_cases) OVER (ORDER BY date) AS rolling_total_cases,
    SUM(new_deaths) OVER (ORDER BY date) AS rolling_total_deaths
FROM  monkey_pox
ORDER BY  date
)
SELECT date, new_cases,new_deaths,rolling_total_cases, rolling_total_deaths,
    CASE 
        WHEN rolling_total_cases = 0 THEN 0 
        ELSE  (rolling_total_deaths / rolling_total_cases) * 100  
        END
FROM cte
ORDER BY date;


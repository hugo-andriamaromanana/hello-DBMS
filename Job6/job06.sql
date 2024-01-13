--1
SELECT
    SUM(population) as total_population
FROM
    world;

--2
SELECT
    continent,
    SUM(population) as total_population
FROM
    world
GROUP BY
    continent;

--3
SELECT
    continent,
    SUM(gdp) as total_gdp
FROM
    world
GROUP BY
    continent;

--4
SELECT
    SUM(gdp) as total_gdp_africa
FROM
    world
WHERE
    continent = 'Africa';

--5
SELECT
    COUNT(*) as num_countries_large_area
FROM
    world
WHERE
    area >= 1000000;

--6
SELECT
    SUM(population) as total_population_baltics
FROM
    world
WHERE
    name IN ('Estonia', 'Latvia', 'Lithuania');

--7
SELECT
    continent,
    COUNT(*) as num_countries
FROM
    world
GROUP BY
    continent;

--8
SELECT
    continent,
    SUM(population) as total_population
FROM
    world
GROUP BY
    continent
HAVING
    SUM(population) >= 100000000;
SELECT
    population
FROM
    world
WHERE
    name = 'France';

SELECT
    name,
    population
FROM
    world
WHERE
    name IN ('Sweden', 'Norway', 'Denmark');

SELECT
    name,
    area
FROM
    world
WHERE
    area > 300000
    AND area < 200000;
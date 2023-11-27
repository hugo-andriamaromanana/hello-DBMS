-- 1
SELECT
    name
FROM
    world
WHERE
    name LIKE 'B%';

-- 2
SELECT
    name
FROM
    world
WHERE
    name LIKE 'Al%';

--3
SELECT
    name
FROM
    world
WHERE
    name LIKE '%y';

--4
SELECT
    name
FROM
    world
WHERE
    name LIKE '%land';

--5
SELECT
    name
FROM
    world
WHERE
    name LIKE '%w%';

--6
SELECT
    name
FROM
    world
WHERE
    name LIKE '%oo%'
    OR name LIKE '%ee%';

--7
SELECT
    name
FROM
    world
WHERE
    LENGTH(name) - LENGTH(REPLACE(name, 'a', '')) >= 3;

--8
SELECT
    name
FROM
    world
WHERE
    SUBSTRING(name, 2, 1) = 'r';
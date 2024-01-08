-- 1. Observing the relational model, we can observe one game table which itself relates to teams and this game table only consists of the game itself
-- not it's content. I would assume it is a  "M:N" Many to many db.
-- It can't be 1:N because every elements can be studied indiviually and unrelated to each other
-- 2. 
SELECT
    goal.matchid,
    goal.player
FROM
    goal
    JOIN eteam ON goal.teamid = eteam.id
WHERE
    eteam.teamname = 'GER';

-- 3.
SELECT
    id,
    stadium,
    team1,
    team2
FROM
    game
WHERE
    id = 1012;

--4.
SELECT
    goal.player,
    goal.teamid,
    game.stadium,
    game.mdate
FROM
    game
    JOIN goal ON game.id = goal.matchid
WHERE
    goal.teamid = 'GER';

--5.
SELECT
    game.team1,
    game.team2,
    goal.player
FROM
    game
    JOIN goal ON game.id = goal.matchid
WHERE
    goal.player LIKE 'Mario%';

-- 6.
SELECT
    goal.*,
    eteam.*
FROM
    goal
    JOIN eteam ON goal.teamid = eteam.id;

-- 7.
SELECT
    game.mdate,
    eteam.teamname
FROM
    game
    JOIN eteam ON game.team1 = eteam.id
WHERE
    eteam.coach = 'Fernando Santos';

-- 8.
SELECT
    goal.matchid,
    goal.player
FROM
    goal
    JOIN game ON goal.matchid = game.id
WHERE
    game.stadium = 'National Stadium, Warsaw';

--9.
SELECT
    goal.matchid,
    goal.player
FROM
    goal
    JOIN game ON goal.matchid = game.id
WHERE
    game.stadium = 'National Stadium, Warsaw';

--10.
SELECT
    teamid,
    COUNT(*) as total_goals
FROM
    goal
GROUP BY
    teamid;

-- 11.
SELECT
    game.stadium,
    COUNT(*) as total_goals
FROM
    game
    JOIN goal ON game.id = goal.matchid
GROUP BY
    game.stadium;

--12.
SELECT
    game.id as match_id,
    game.mdate as match_date,
    COUNT(*) as goals_scored
FROM
    game
    JOIN goal ON game.id = goal.matchid
WHERE
    goal.teamid = 'FRA'
GROUP BY
    game.id,
    game.mdate;
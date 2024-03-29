---------------- 1. ----------------
game
JOIN goal ON (id = matchid);
---------------- 2. ----------------
--  matchid, teamid, player, gtime, id, teamname, coach
---------------- 3. ----------------
SELECT
  player,
  teamid,
  COUNT(*)
FROM
  game
  JOIN goal ON matchid = id
WHERE
  (
    team1 = "GRE"
    OR team2 = "GRE"
  )
  AND teamid != 'GRE'
GROUP BY
  player,
  teamid;
---------------- 4. ----------------
SELECT
  DISTINCT teamid,
  mdate
FROM
  goal
  JOIN game on (matchid = id)
WHERE
  mdate = '9 June 2012';
---------------- 5. ----------------
SELECT
  DISTINCT player,
  teamid
FROM
  game
  JOIN goal ON matchid = id
WHERE
  stadium = 'National Stadium, Warsaw'
  AND (
    team1 = 'POL'
    OR team2 = 'POL'
  )
  AND teamid != 'POL';
---------------- 6. ----------------
SELECT
  DISTINCT player,
  teamid,
  gtime
FROM
  game
  JOIN goal ON matchid = id
WHERE
  stadium = 'Stadion Miejski (Wroclaw)'
  AND (
    (
      teamid = team2
      AND team1 != 'ITA'
    )
    OR (
      teamid = team1
      AND team2 != 'ITA'
    )
  );
---------------- 7. ----------------
SELECT
  teamname,
  COUNT(*)
FROM
  eteam
  JOIN goal ON teamid = id
GROUP BY
  teamname
HAVING
  COUNT(*) < 3;
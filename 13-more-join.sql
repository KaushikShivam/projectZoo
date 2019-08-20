---------------- 1. ----------------
SELECT
  id,
  title
FROM
  movie
WHERE
  yr = 1962;
---------------- 2. ----------------
SELECT
  yr
FROM
  movie
WHERE
  title = 'Citizen Kane';
---------------- 3. ----------------
SELECT
  id,
  title,
  yr
FROM
  movie
WHERE
  title LIKE '%Star Trek%'
ORDER BY
  yr;
---------------- 4. ----------------
SELECT
  id
FROM
  actor
WHERE
  name = 'Glenn Close';
---------------- 5. ----------------
SELECT
  actor.name
FROM
  movie
  JOIN casting ON casting.movieid = movie.id
  JOIN actor ON actor.id = casting.actorid
WHERE
  title = 'Casablanca';
---------------- 7. ----------------
SELECT
  actor.name
FROM
  movie
  JOIN casting ON casting.movieid = movie.id
  JOIN actor ON actor.id = casting.actorid
WHERE
  title = 'Alien';
---------------- 8. ----------------
SELECT
  movie.title
FROM
  movie
  JOIN casting ON casting.movieid = movie.id
  JOIN actor ON actor.id = casting.actorid
WHERE
  actor.name = 'Harrison Ford';
---------------- 9. ----------------
SELECT
  movie.title
FROM
  movie
  JOIN casting ON casting.movieid = movie.id
  JOIN actor ON actor.id = casting.actorid
WHERE
  actor.name = 'Harrison Ford'
  AND casting.ord != 1;
---------------- 10. ----------------
SELECT
  movie.title,
  actor.name
FROM
  movie
  JOIN casting ON casting.movieid = movie.id
  JOIN actor ON actor.id = casting.actorid
WHERE
  casting.ord = 1
  and yr = 1962;
---------------- 11. ----------------
SELECT
  yr,
  COUNT(title)
FROM
  movie
  JOIN casting ON movie.id = movieid
  JOIN actor ON actorid = actor.id
WHERE
  name = 'Rock Hudson'
GROUP BY
  yr
HAVING
  COUNT(title) > 2;
---------------- 12. ----------------
SELECT
  movie.title,
  actor.name
FROM
  movie
  JOIN casting ON movie.id = movieid
  AND ord = 1
  JOIN actor ON actorid = actor.id
WHERE
  movie.id IN (
    SELECT
      movieid
    FROM
      casting
    WHERE
      actorid IN (
        SELECT
          id
        FROM
          actor
        WHERE
          name = 'Julie Andrews'
      )
  );
---------------- 13. ----------------
SELECT
  actor.name
FROM
  movie
  JOIN casting ON movie.id = movieid
  AND ord = 1
  JOIN actor ON actorid = actor.id
GROUP BY
  actor.name
HAVING
  COUNT(movieid) >= 30;
---------------- 14. ----------------
SELECT
  movie.title,
  COUNT(actor.name)
FROM
  movie
  JOIN casting ON movie.id = movieid
  JOIN actor ON actorid = actor.id
WHERE
  yr = 1978
GROUP BY
  movie.title
ORDER BY
  COUNT(actor.name) DESC,
  movie.title;
---------------- 15. ----------------
SELECT
  DISTINCT name
FROM
  actor
  JOIN casting ON id = actorid
WHERE
  movieid IN (
    SELECT
      movieid
    FROM
      casting
      JOIN actor ON (
        actorid = id
        AND name = 'Art Garfunkel'
      )
  )
  AND name != 'Art Garfunkel'
GROUP BY
  name
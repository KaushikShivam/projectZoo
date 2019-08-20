---------------- 1. ----------------
SELECT
  COUNT(*)
FROM
  stops;
---------------- 2. ----------------
SELECT
  id
FROM
  stops
WHERE
  name = 'Craiglockhart';
---------------- 3. ----------------
SELECT
  id,
  name
FROM
  stops
  JOIN route ON stops.id = route.stop
WHERE
  num = 4
  AND company = 'LRT';
---------------- 4. ----------------
SELECT
  company,
  num,
  COUNT(*)
FROM
  route
WHERE
  stop = 149
  OR stop = 53
GROUP BY
  company,
  num
HAVING
  COUNT(*) = 2;
---------------- 5. ----------------
SELECT
  a.company,
  a.num,
  a.stop,
  b.stop
FROM
  route a
  JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
WHERE
  a.stop = 53
  and b.stop = 149;
---------------- 6. ----------------
SELECT
  a.company,
  a.num,
  stopa.name,
  stopb.name
FROM
  route a
  JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
WHERE
  stopa.name = 'Craiglockhart'
  AND stopb.name = 'London Road';
---------------- 7. ----------------
SELECT
  DISTINCT a.company,
  a.num
FROM
  route a
  JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
WHERE
  a.stop = 115
  and b.stop = 137;
---------------- 8. ----------------
SELECT
  a.company,
  a.num
FROM
  route a
  JOIN route b ON (a.num = b.num)
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
WHERE
  stopa.name = 'Craiglockhart'
  AND stopb.name = 'Tollcross';
---------------- 9. ----------------
SELECT
  DISTINCT stopb.name,
  b.company,
  b.num
FROM
  route a
  JOIN route b ON (
    a.num = b.num
    AND a.company = b.company
  )
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
WHERE
  stopa.name = 'Craiglockhart';
---------------- 10. ----------------
select
  tab_1.num,
  tab_1.company,
  tab_1.name,
  tab_2.num,
  tab_2.company
from
  (
    select
      stopsb.name,
      a.company,
      a.num
    from
      route a
      join route b on (
        a.company = b.company
        and a.num = b.num
      )
      join stops stopsa on (a.stop = stopsa.id)
      join stops stopsb on (b.stop = stopsb.id)
    where
      stopsa.name = 'Craiglockhart'
    group by
      a.company,
      a.num,
      stopsb.name
  ) as tab_1
  join (
    select
      stopsb.name,
      a.company,
      a.num
    from
      route a
      join route b on (
        a.company = b.company
        and a.num = b.num
      )
      join stops stopsa on (a.stop = stopsa.id)
      join stops stopsb on (b.stop = stopsb.id)
    where
      stopsa.name = 'Lochend'
    group by
      a.company,
      a.num,
      stopsb.name
  ) tab_2 on (
    tab_1.name = tab_2.name
    and tab_1.num <> tab_2.num
  )
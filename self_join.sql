-- 9 Self join:
-- https://sqlzoo.net/wiki/Self_join


/* 1.
How many stops are in the database.
*/
SELECT COUNT(*) from stops;

/* 2.
Find the id value for the stop 'Craiglockhart'
*/
SELECT id FROM stops
WHERE name='Craiglockhart';

/* 3.
Give the id and the name for the stops on the '4' 'LRT' service.
*/
SELECT stops.id,stops.name FROM route
JOIN stops ON route.stop = stops.id
WHERE company='LRT' AND num=4;

/* 4.
The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.
*/
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company,num
HAVING COUNT(*)>1;

/* 5.
Change the query so that it shows the services from Craiglockhart to London Road.
*/
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=(SELECT id FROM stops WHERE name='London Road');

/* 6
The query shown is similar to the previous one, however by joining two copies of the stops table we can refer to stops by name rather than by number. Change the query so that the services between 'Craiglockhart' and 'London Road' are shown.
*/
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road';

/* 7.
Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
*/
SELECT r1.company, r1.num
FROM route r1 JOIN route r2
ON (r1.company=r2.company AND r1.num=r2.num)
WHERE (r1.stop=115 AND r2.stop=137) OR (r1.stop=137 AND r2.stop=115)
GROUP BY r1.num,r1.company;



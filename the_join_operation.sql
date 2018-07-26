-- 6 The JOIN Operation: https://sqlzoo.net/wiki/The_JOIN_operation


/* 1.
Modify [the query] to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
*/
SELECT matchid,player FROM goal
WHERE teamid = 'GER';

/* 2.
Show id, stadium, team1, team2 for just game 1012
*/
SELECT DISTINCT id,stadium,team1,team2 FROM game
JOIN goal ON game.id=goal.matchid
WHERE matchid=1012;

/* 3.
Modify it to show the player, teamid, stadium and mdate for every German goal.
*/
SELECT player,teamid,stadium,mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid='GER';

/* 4.
Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
*/
SELECT team1,team2,player
FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'
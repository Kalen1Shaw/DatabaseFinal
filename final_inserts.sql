USE finaldb;

-- Inserts for Teams Table
INSERT INTO Teams(TEAM_ID, TEAM_NAME, SCHOOL, CITY, `STATE`) VALUES
(1, `Bears`, `Morgan State`, `Baltimore`, `MD`),
(2, `Rattlers`, `FAMU`, `Tallahassee`, `FL`),
(3, `Tigers`, `Jackson State`, `Jackson`, `MS`),
(4, `Wildcats`, `BCU`, `Daytona Beach`, `FL`);

--Inserts for Players Table
INSERT INTO Players(PLAYER_ID, FIRST_NAME, LAST_NAME, `NUMBER`, USERNAME, CONSOLE, GENDER, DOB) VALUES
(),
(),
(),
();

-- Inserts for Matches Table
INSERT INTO Matches(MATCH_ID, HOME_TEAM, AWAY_TEAM, SCORE, `DATE`,`TIME`, RD1MODE, RD2MODE, RD3MODE) VALUES
(),
(),
(),
(),
(),
(),
();

-- Inserts for Match_Stats Table
INSERT INTO Match_Stats(MATCH_ID, HOMERD1, AWAYRD1, HOMERD2, AWAYRD2, HOMERD3, AWAYRD3) VALUES
(),
(),
(),
(),
(),
(),
();

-- Inserts for Player_Stats Table
INSERT INTO Player_Stats(PLAYER_ID, MATCH_ID, KILLS, DEATHS, ASSISTS) VALUES
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
();

-- Inserts for Player_Team Table
INSERT INTO Player_Team(PLAYER_ID, TEAM_ID) VALUES
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
();

--Inserts for Mode Table
INSERT INTO Mode(MODE_CODE, MODE_NAME, DESCRIPT) VALUES
(40, `Domination`, `Capture and defend the designated positions to gain points.`),
(41, `Team Deathmatch`, `Use teamwork to eliminate players on the opposing team. The first team to reach the score limit wins.`),
(42, `Hardpoint`, `Secure a periodically-rotating objective while defending it from the opponent.`),
(43, `Search and Destroy`, `Teams take turns defending and destroying an objective. No respawn.`),
(44, `Control`, `Two teams alternate between attacking or defending two fixed capture zones on the map with limited respawns. 
Attackers either have to capture both zones or completely eliminate the Defenders before the time limit.`);

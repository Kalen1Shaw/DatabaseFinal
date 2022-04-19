USE finaldb;

-- Inserts for Teams Table
INSERT INTO Teams(TEAM_ID, TEAM_NAME, SCHOOL, CITY, `STATE`) VALUES
(1, `Bears`, `Morgan State`, `Baltimore`, `MD`),
(2, `Rattlers`, `FAMU`, `Tallahassee`, `FL`),
(3, `Tigers`, `Jackson State`, `Jackson`, `MS`),
(4, `Wildcats`, `BCU`, `Daytona Beach`, `FL`);

--Inserts for Players Table
INSERT INTO Players(PLAYER_ID, FIRST_NAME, LAST_NAME, `NUMBER`, USERNAME, CONSOLE, GENDER, DOB) VALUES
(100, `Kalen`, `Shaw`, 44, `KingFlashTV`, `PS`, `M`, `1998-07-23`),
(101, `Timothy`, `Richardson`, 12, `TKRich`, `PC`, `M`, `1997-03-21`),
(102, `Michael`, `Woodward`, 41, `MikeAtFamu`, `Xbox`, `F`, `2001-04-10`),
(103, `Jamie`, `Sharpe`, 00, `SharpGaming`, `PC`, `NS`, `2002-05-26`),
(104, `Kiari`, `Cephus`, 32, `Offsetyrn`, `PS`, `M`, `1996-12-14`),
(105, `Latabia`, `Woodward`, 50, `landkshaw`, `PC`, `F`, `1999-06-06`),
(106, `Arielle`, `McCall`, 77, `dndAriel`, `Xbox`, `F`, `1997-05-10`),
(107, `Kalen`, `Brown`, 18, `Brownsville`, `PS`, `M`, `1999-08-23`),
(108, `Belcalis`, `Cephus`, 53, `iamcardib`, `PC`, `F`, `1996-06-14`),
(109, `Jaylan`, `Holman`, 65, `JHolman`, `Xbox`, `M`, `1998-09-16`),
(110, `Reggie`, `Marrow`, `Made2Playa`, `PS`, `NS`, `2003-08-27`),
(111, `Diamond`, `Bishop`, 42, `LadyJefe`, `PC`, `M`, `1997-09-11`),
(112, "J'Briana", `Davis`, 18, `SummerBoss`, `PS`, `M`, `2000-01-25`)
(113, `Kevin`, `Shaw`, 26, `Kannon1`, `Xbox`, `M`, `2001-04-19`),
(114, `Jamaurya`, `Morris`, 12, `jamaurya`, `PS`, `M`, `1996-06-17`),
(115, `Sandra`, `Goodwin`, 25, `SweetPea`, `Xbox`, `F`, `1997-01-26`);

-- Inserts for Matches Table
INSERT INTO Matches(MATCH_ID, HOME_TEAM, AWAY_TEAM, SCORE, `DATE`,`TIME`, RD1MODE, RD2MODE, RD3MODE) VALUES
(1111, 1, 3, `2-0`, `2022-01-21`, `14:30`, 40, 42, NULL),
(2222, 2, 4, `1-2`, `2022-01-22`, `12:00`, 43, 44, 40),
(3333, 1, 4, `2-1`, `2022-01-23`, `15:50`, 41, 43, 42),
(4444, 2, 3, `2-0`, `2022-01-23`, `13:15`, 44, 42, NULL);

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
(100, 2),
(106, 2),
(105, 4),
(104, 2),
(103, 1),
(102, 1),
(112, 1),
(110, 4),
(109, 3),
(108, 3),
(107, 3),
(101, 4),
(111, 4),
(113, 3),
(114, 1),
(115, 2);

--Inserts for Mode Table
INSERT INTO Mode(MODE_CODE, MODE_NAME, DESCRIPT) VALUES
(40, `Domination`, `Capture and defend the designated positions to gain points.`),
(41, `Team Deathmatch`, `Use teamwork to eliminate players on the opposing team. The first team to reach the score limit wins.`),
(42, `Hardpoint`, `Secure a periodically-rotating objective while defending it from the opponent.`),
(43, `Search and Destroy`, `Teams take turns defending and destroying an objective. No respawn.`),
(44, `Control`, `Two teams alternate between attacking or defending two fixed capture zones on the map with limited respawns. 
Attackers either have to capture both zones or completely eliminate the Defenders before the time limit.`);mited respawns. 
Attackers either have to capture both zones or completely eliminate the Defenders before the time limit.`);

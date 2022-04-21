CREATE DATABASE finaldb;

USE finaldb;

-- Team Table
CREATE TABLE Teams (`TEAM_ID` INTEGER NOT NULL AUTO_INCREMENT,`TEAM_NAME` VARCHAR (155) NOT NULL, `SCHOOL`VARCHAR (155) NOT NULL , 
`CITY` VARCHAR (155), `STATE` VARCHAR (2),
PRIMARY KEY(TEAM_ID));

-- Player Table
CREATE TABLE Players(`PLAYER_ID` INTEGER NOT NULL AUTO_INCREMENT, `FIRST_NAME` VARCHAR(155), `LAST_NAME` VARCHAR(155), `NUMBER` INTEGER,
 `USERNAME` VARCHAR(155), `CONSOLE` ENUM('PS','PC','Xbox'), `GENDER`ENUM('M','F','NS'), `DOB` DATE,
 PRIMARY KEY (PLAYER_ID));

-- Match Table
CREATE TABLE Matches (`MATCH_ID` INTEGER NOT NULL,`HOME_TEAM` INTEGER NOT NULL, `AWAY_TEAM` INTEGER NOT NULL, `SCORE` VARCHAR(55),
 `DATE` DATE NOT NULL, `TIME` TIME NOT NULL, `RD1MODE` INTEGER NOT NULL, `RD2MODE` INTEGER NOT NULL, `RD3MODE` INTEGER,
 PRIMARY KEY(MATCH_ID),
 FOREIGN KEY(HOME_TEAM) REFERENCES Teams(TEAM_ID) ON UPDATE CASCADE,
 FOREIGN KEY(AWAY_TEAM) REFERENCES Teams(TEAM_ID) ON UPDATE CASCADE,
 FOREIGN KEY(RD1MODE) REFERENCES Mode(MODE_CODE) ON UPDATE CASCADE,
 FOREIGN KEY(RD2MODE) REFERENCES Mode(MODE_CODE) ON UPDATE CASCADE,
 FOREIGN KEY(RD3MODE) REFERENCES Mode(MODE_CODE) ON UPDATE CASCADE);

-- Match_Stats Table
CREATE TABLE Match_Stats (`MATCH_ID` INTEGER NOT NULL,`HOMERD1` INTEGER NOT NULL,
 `AWAYRD1` INTEGER NOT NULL, `HOMERD2` INTEGER NOT NULL, `AWAYRD2` INTEGER NOT NULL, `HOMERD3` INTEGER, `AWAYRD3` INTEGER,
 PRIMARY KEY(MATCH_ID),
 FOREIGN KEY(MATCH_ID) REFERENCES Matches(MATCH_ID));

-- Player_Stats Table
CREATE TABLE Player_Stats (`PLAYER_ID` INTEGER NOT NULL, `MATCH_ID` INTEGER NOT NULL,`KILLS` INTEGER NOT NULL, 
`DEATHS` INTEGER NOT NULL, `ASSISTS` INTEGER NOT NULL,
PRIMARY KEY (PLAYER_ID, MATCH_ID),
FOREIGN KEY(PLAYER_ID) REFERENCES Players(PLAYER_ID) ON UPDATE CASCADE,
FOREIGN KEY (MATCH_ID) REFERENCES Matches(MATCH_ID) ON UPDATE CASCADE);

-- Player_Team Table
CREATE TABLE Player_Team (`PLAYER_ID` INTEGER NOT NULL, `TEAM_ID` INTEGER NOT NULL,
PRIMARY KEY(PLAYER_ID, TEAM_ID),
FOREIGN KEY (PLAYER_ID) REFERENCES Players(PLAYER_ID) ON UPDATE CASCADE,
FOREIGN KEY (TEAM_ID) REFERENCES Teams(TEAM_ID) ON UPDATE CASCADE);

-- Mode Table
CREATE TABLE Mode (`MODE_CODE` INTEGER NOT NULL AUTO_INCREMENT, `MODE_NAME` VARCHAR(155) NOT NULL, `DESCRIPT` VARCHAR(255),
PRIMARY KEY(MODE_CODE));

-- Inserts for Teams Table
INSERT INTO Teams(TEAM_ID, TEAM_NAME, SCHOOL, CITY, `STATE`) VALUES
(1, 'Bears', 'Morgan State', 'Baltimore', 'MD'),
(2, 'Rattlers', 'FAMU', 'Tallahassee', 'FL'),
(3, 'Tigers', 'Jackson State', 'Jackson', 'MS'),
(4, 'Wildcats', 'BCU', 'Daytona Beach', 'FL');

--Inserts for Players Table
INSERT INTO Players(PLAYER_ID, FIRST_NAME, LAST_NAME, `NUMBER`, USERNAME, CONSOLE, GENDER, DOB) VALUES
(100, 'Kalen', 'Shaw', 44, 'KingFlashTV', 'PS', 'M', '1998-07-23'),
(101, 'Timothy', 'Richardson', 12, 'TKRich', 'PC', 'M', '1997-03-21'),
(102, 'Michael', 'Woodward', 41, 'MikeAtFamu', 'Xbox', 'F', '2001-04-10'),
(103, 'Jamie', 'Sharpe', 00, 'SharpGaming', 'PC', 'NS', '2002-05-26'),
(104, 'Kiari', 'Cephus', 32, 'Offsetyrn', 'PS', 'M', '1996-12-14'),
(105, 'Latabia', 'Woodward', 50, 'landkshaw', 'PC', 'F', '1999-06-06'),
(106, 'Arielle', 'McCall', 77, 'dndAriel', 'Xbox', 'F', '1997-05-10'),
(107, 'Kalen', 'Brown', 18, 'Brownsville', 'PS', 'M', '1999-08-23'),
(108, 'Belcalis', 'Cephus', 53, 'iamcardib', 'PC', 'F', '1996-06-14'),
(109, 'Jaylan', 'Holman', 65, 'JHolman', 'Xbox', 'M', '1998-09-16'),
(110, 'Reggie', 'Marrow', 48, 'Made2Playa', 'PS', 'NS', '2003-08-27'),
(111, 'Diamond', 'Bishop', 42, 'LadyJefe', 'PC', 'M', '1997-09-11'),
(112, "J'Briana", 'Davis', 18, 'SummerBoss', 'PS', 'M', '2000-01-25'),
(113, 'Kevin', 'Shaw', 26, 'Kannon1', 'Xbox', 'M', '2001-04-19'),
(114, 'Jamaurya', 'Morris', 12, 'jamaurya', 'PS', 'M', '1996-06-17'),
(115, 'Sandra', 'Goodwin', 25, 'SweetPea', 'Xbox', 'F', '1997-01-26');

-- Inserts for Matches Table
INSERT INTO Matches(MATCH_ID, HOME_TEAM, AWAY_TEAM, SCORE, `DATE`,`TIME`, RD1MODE, RD2MODE, RD3MODE) VALUES
(1111, 1, 3, '2-0', '2022-01-21', '14:30', 40, 42, NULL),
(2222, 2, 4, '1-2', '2022-01-22', '12:00', 43, 44, 40),
(3333, 1, 4, '2-1', '2022-01-23', '15:50', 41, 43, 42),
(4444, 2, 3, '2-0', '2022-01-23', '13:15', 44, 42, NULL);

-- Inserts for Match_Stats Table
INSERT INTO Match_Stats(MATCH_ID, HOMERD1, AWAYRD1, HOMERD2, AWAYRD2, HOMERD3, AWAYRD3) VALUES
(1111, 150, 123, 100, 48, NULL, NULL),
(2222, 4, 2, 0, 3, 144, 150),
(3333, 150, 133, 0, 4, 100, 97),
(4444, 3, 1, 100, 86, NULL, NULL);


-- Inserts for Player_Stats Table
INSERT INTO Player_Stats(PLAYER_ID, MATCH_ID, KILLS, DEATHS, ASSISTS) VALUES
(100, 2222, 22, 11, 4),
(100, 4444, 43, 21, 1 ),
(101, 2222, 12, 7, 3),
(101, 3333, 15, 4, 3),
(102, 1111, 14, 9, 2),
(102, 3333, 8, 7, 0),
(103, 1111, 5, 10, 3),
(103, 3333, 4, 2, 2),
(104, 2222, 9, 9, 7),
(104, 4444, 5, 5, 5),
(105, 2222, 10, 1, 6),
(105, 3333, 11, 4, 2),
(106, 2222, 4, 9, 4),
(106, 4444, 16, 4, 3),
(107, 1111, 18, 3, 6),
(107, 4444, 20, 12, 11),
(108, 1111, 3, 13, 11),
(108, 4444, 4, 14, 12),
(109, 1111, 12, 12, 2),
(109, 4444, 14, 5, 15),
(110, 2222, 16, 1, 1),
(110, 3333, 0, 12, 23),
(111, 2222, 8, 2, 5),
(111, 3333, 21, 9, 4),
(112, 1111, 11, 2, 3),
(112, 3333, 12, 2, 2),
(113, 1111, 6, 3, 2),
(113, 4444, 7, 8, 9),
(114, 1111, 12, 2, 4),
(114, 3333, 8, 9, 2),
(115, 2222, 4, 2, 2),
(115, 4444, 9, 9 ,9);

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
(40, 'Domination', 'Capture and defend the designated positions to gain points.'),
(41, 'Team Deathmatch', 'Use teamwork to eliminate players on the opposing team. The first team to reach the score limit wins.'),
(42, 'Hardpoint', 'Secure a periodically-rotating objective while defending it from the opponent.'),
(43, 'Search and Destroy', 'Teams take turns defending and destroying an objective. No respawn.'),
(44, 'Control', 'Two teams alternate between attacking or defending two fixed capture zones on the map with limited respawns. 
Attackers either have to capture both zones or completely eliminate the Defenders before the time limit.');




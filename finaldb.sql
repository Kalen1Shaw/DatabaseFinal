CREATE DATABASE finaldb;

USE finaldb;

CREATE TABLE Teams (`TEAM_ID` INTEGER NOT NULL,`TEAM_NAME` VARCHAR (155) NOT NULL, `SCHOOL` , 
`CITY`, `STATE`,
PRIMARY KEY(TEAM_ID));

CREATE TABLE Players(`PLAYER_ID` INTEGER NOT NULL, `FIRST_NAME` VARCHAR(155), `LAST_NAME` VARCHAR(155), `NUMBER` INTEGER,
 `USERNAME` VARCHAR(155), `CONSOLE` ENUM(`PS`,`PC`,`Xbox`), `GENDER`ENUM(`M`,`F`,`NS`), `DOB`, 
 PRIMARY KEY (PLAYER_ID));

CREATE TABLE Matches (`MATCH_ID` INTEGER NOT NULL,`HOME_TEAM` INTEGER NOT NULL, `AWAY_TEAM` INTEGER NOT NULL, `SCORE` VARCHAR(55),
 `DATE` DATE NOT NULL, `TIME` TIME NOT NULL, `RD1MODE` INTEGER NOT NULL, `RD2MODE` INTEGER NOT NULL, `RD3MODE` INTEGER,
 PRIMARY KEY(MATCH_ID),
 FOREIGN KEY(HOME_TEAM) REFERENCES Teams(TEAM_ID) ON UPDATE CASCADE DELETE RESTRICT,
 FOREIGN KEY(AWAY_TEAM) REFERENCES Teams(TEAM_ID) ON UPDATE CASCADE DELETE RESTRICT,
 FOREIGN KEY(RD1MODE) REFERENCES Mode(MODE_CODE) ON UPDATE,
 FOREIGN KEY(RD2MODE) REFERENCES Mode(MODE_CODE) ON UPDATE,
 FOREIGN KEY(RD3MODE) REFERENCES Mode(MODE_CODE) ON UPDATE
 );

CREATE TABLE Match_Stats (`MATCH_ID` NOT NULL,`HOMERD1` INTEGER NOT NULL,
 `AWAYRD1` INTEGER NOT NULL, `HOMERD2` INTEGER NOT NULL, `AWAYRD2` INTEGER NOT NULL, `HOMERD3` INTEGER, `AWAYRD3` INTEGER,
 PRIMARY KEY(MATCH_ID),
 FOREIGN KEY(MATCH_ID) REFERENCES Matches(MATCH_ID)
  );

CREATE TABLE Player_Stats (`PLAYER_ID` NOT NULL, `MATCH_ID` NOT NULL,`KILLS` INTEGER NOT NULL, 
`DEATHS` INTEGER NOT NULL, `ASSISTS` INTEGER NOT NULL, `KDA` AS (KILLS + ASSISTS) / DEATHS,
PRIMARY KEY (PLAYER_ID, MATCH_ID),
FOREIGN KEY(PLAYER_ID) REFERENCES Players(PLAYER_ID) ON UPDATE CASCADE DELETE RESTRICT,
FOREIGN KEY (MATCH_ID) REFERENCES Matches(MATCH_ID) ON UPDATE CASCADE DELETE RESTRICT);

CREATE TABLE Player_Team (`PLAYER_ID` NOT NULL, `TEAM_ID` NOT NULL);
CREATE TABLE Mode (`MODE_CODE`, `MODE_NAME`, `DESCRIPT`);
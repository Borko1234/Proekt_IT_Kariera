CREATE SCHEMA IF NOT EXISTS MARVEL;
USE MARVEL;

CREATE TABLE IF NOT EXISTS MARVEL_HEROES(
    HERO_ID INT NOT NULL PRIMARY KEY,
    HERO_NAME VARCHAR(50) NOT NULL,
    HERO_REAL_NAME VARCHAR(50) NOT NULL,
    HERO_ORIGIN VARCHAR(50) NOT NULL,
    HERO_FIRST_APPEARENCE YEAR NOT NULL,
    HERO_PLANET VARCHAR(50) NOT NULL,
    HERO_AGE INT NOT NULL
);

CREATE TABLE IF NOT EXISTS MARVEL_MOVIES(
    MOVIE_ID INT NOT NULL PRIMARY KEY,
    MOVIE_TITLE VARCHAR(50) NOT NULL,
    MOVIE_RELEASE_DATE DATE NOT NULL,
    MOVIE_RATING INT NOT NULL,
    MOVIE_BUDGET DECIMAL(15, 2) NOT NULL,
    MOVIE_BOX_OFFICE DECIMAL(15, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS MARVEL_HERO_MOVIES(
    HERO_ID INT NOT NULL,
    MOVIE_ID INT NOT NULL,
    PRIMARY KEY(HERO_ID, MOVIE_ID),
    FOREIGN KEY (HERO_ID) REFERENCES MARVEL_HEROES(HERO_ID),
    FOREIGN KEY (MOVIE_ID) REFERENCES MARVEL_MOVIES(MOVIE_ID)
);

CREATE TABLE IF NOT EXISTS MARVEL_HERO_TEAMS(
    TEAM_ID INT NOT NULL PRIMARY KEY,
    TEAM_NAME VARCHAR(50) NOT NULL,
    TEAM_FORMATION_DATE DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS MARVEL_HERO_TEAMS_LEADERS(
    TEAM_ID INT NOT NULL,
    HERO_ID INT NOT NULL,
    PRIMARY KEY(TEAM_ID, HERO_ID),
    FOREIGN KEY (TEAM_ID) REFERENCES MARVEL_HERO_TEAMS(TEAM_ID),
    FOREIGN KEY (HERO_ID) REFERENCES MARVEL_HEROES(HERO_ID)
);

CREATE TABLE IF NOT EXISTS MARVEL_HERO_POWERS (
    HERO_ID INT NOT NULL,
    POWER_NAME VARCHAR(100) NOT NULL,
    PRIMARY KEY (HERO_ID, POWER_NAME),
    FOREIGN KEY (HERO_ID) REFERENCES MARVEL_HEROES(HERO_ID)
);

CREATE TABLE IF NOT EXISTS MARVEL_PLANETS_GALAXIES (
    PLANET_NAME VARCHAR(50) NOT NULL PRIMARY KEY,
    GALAXY_NAME VARCHAR(50) NOT NULL,
    HERO_ID INT NOT NULL,
    FOREIGN KEY (HERO_ID) REFERENCES MARVEL_HEROES(HERO_ID)
);

CREATE TABLE IF NOT EXISTS MARVEL_MOVIE_PREMIERE_SCREENINGS (
    MOVIE_ID INT NOT NULL,
    SCREENING_DATE DATE NOT NULL,
    DAILY_BOX_OFFICE DECIMAL(15, 2) NOT NULL,
    PRIMARY KEY (MOVIE_ID, SCREENING_DATE),
    FOREIGN KEY (MOVIE_ID) REFERENCES MARVEL_MOVIES(MOVIE_ID)
);

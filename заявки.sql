USE MARVEL;
SELECT --викме герой и филми в които е участвал
    h.HERO_NAME AS "Име на героя",
    m.MOVIE_TITLE AS "Име на филма"
FROM 
    MARVEL_HERO_MOVIES hm
JOIN 
    MARVEL_HEROES h ON hm.HERO_ID = h.HERO_ID
JOIN 
    MARVEL_MOVIES m ON hm.MOVIE_ID = m.MOVIE_ID;

USE MARVEL;
SELECT --викаме отбор от супергерои и техните лидери
    ht.TEAM_NAME AS "Име на отбора", 
    h.HERO_NAME AS "Лидер на отбора"
FROM 
    MARVEL_HERO_TEAMS ht
JOIN 
    MARVEL_HERO_TEAMS_LEADERS htl ON ht.TEAM_ID = htl.TEAM_ID
JOIN 
    MARVEL_HEROES h ON htl.HERO_ID = h.HERO_ID;

USE MARVEL;
SELECT -- викаме всеки герой и какви са силите му
    h.HERO_NAME AS "Име на героя", 
    hp.POWER_NAME AS "Суперсила"
FROM 
    MARVEL_HEROES h
JOIN 
    MARVEL_HERO_POWERS hp ON h.HERO_ID = hp.HERO_ID;

USE MARVEL;
SELECT --викаме всички филми между 2010 и 2025
    m.MOVIE_TITLE AS "Име на филма", 
    m.MOVIE_RELEASE_DATE AS "Дата на премиера", 
    concat(m.MOVIE_RATING,"/10") AS "Рейтинг"
FROM 
    MARVEL_MOVIES m
WHERE 
    YEAR(m.MOVIE_RELEASE_DATE) BETWEEN 2010 AND 2025;


USE MARVEL;

SELECT --всички герои и истинските им имена
    h.HERO_NAME AS "Име на героя", 
    h.HERO_REAL_NAME AS "Истинско име на героя"
FROM 
    MARVEL_HEROES h;

USE MARVEL;
SELECT 
    MOVIE_TITLE AS "Име на филма", --топ 5 най скъпи филма
    CONCAT(MOVIE_BUDGET,"$") AS "Бюджет"
FROM MARVEL_MOVIES
ORDER BY MOVIE_BUDGET DESC
LIMIT 5;

USE MARVEL;
SELECT
    MOVIE_TITLE AS "Име на филма",--топ 5 филма искарали най малко пари
    CONCAT(MOVIE_BOX_OFFICE, "$") AS "Искарани пари"
ORDER BY MOVIE_BOX_OFFICE ASC
LIMIT 5;

USE MARVEL;
SELECT -- топ 10 които са искарали най много пари сравнение с бюджета
    MOVIE_TITLE AS "Име на филма",
    CONCAT(MOVIE_BUDGET, "$") AS "Бюджет на филма",
    CONCAT(MOVIE_BOX_OFFICE, "$") AS "Искарани пари",
    CONCAT((MOVIE_BOX_OFFICE - MOVIE_BUDGET), "$") AS "Разлика в печалбата"
FROM 
    MARVEL_MOVIES
ORDER BY 
    (MOVIE_BOX_OFFICE - MOVIE_BUDGET) DESC
LIMIT 10;



USE MARVEL;
SELECT -- всички герои от земята 
    HERO_NAME AS "Име на герой",
    HERO_REAL_NAME AS "Истинско име на героя",
    HERO_PLANET AS "Планета от която е"
FROM MARVEL_HEROES
WHERE HERO_PLANET != 'Earth';

USE MARVEL;
SELECT --всички герои между 30 и 50 години
    HERO_NAME AS "Име на герой",
    HERO_REAL_NAME AS "Истинско име на героя",
    HERO_AGE AS "Възраст на героя"
FROM MARVEL_HEROES
WHERE HERO_AGE BETWEEN 30 AND 50;





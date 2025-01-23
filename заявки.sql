USE MARVEL;
SELECT 
    MOVIE_TITLE AS "Име на филма",
    CONCAT(MOVIE_RATING, "/10") AS "Рейтинг"
FROM 
    MARVEL_MOVIES
WHERE 
    MOVIE_RATING > 7;


SELECT 
    HERO_NAME AS "Име на героя",
    HERO_REAL_NAME AS "Истинско име на героя",
    HERO_AGE AS "Възраст на героя"
FROM 
    MARVEL_HEROES
ORDER BY 
    HERO_AGE DESC;


SELECT 
    AVG(HERO_AGE) AS "Средна възраст на героите от Земята"
FROM 
    MARVEL_HEROES
WHERE 
    HERO_PLANET = 'Earth';


SELECT 
    MOVIE_TITLE AS "Име на филма",
    CONCAT(MOVIE_BOX_OFFICE, "$") AS "Приходи"
FROM 
    MARVEL_MOVIES
WHERE 
    MOVIE_BOX_OFFICE > 1000000000;


SELECT 
    h.HERO_NAME AS "Име на героя",
    COUNT(hm.MOVIE_ID) AS "Брой филми"
FROM 
    MARVEL_HEROES h
JOIN 
    MARVEL_HERO_MOVIES hm ON h.HERO_ID = hm.HERO_ID
GROUP BY 
    h.HERO_NAME
ORDER BY 
    COUNT(hm.MOVIE_ID) DESC
LIMIT 5;


SELECT /*ВЗИМА САМО ПО ЕДИН ГЕРОЙ ЗАЩОТО СМЕ СЛОЖИЛИ САМО ПО ЕДИН В ТАБЛИЦАТА MARVEL_PLANETS_GALAXIES*/
    pg.PLANET_NAME AS "Име на планетата",
    pg.GALAXY_NAME AS "Име на галактиката",
    GROUP_CONCAT(h.HERO_NAME SEPARATOR ', ') AS "Герои от тази планета"
FROM 
    MARVEL_PLANETS_GALAXIES pg
JOIN 
    MARVEL_HEROES h ON pg.HERO_ID = h.HERO_ID
GROUP BY 
    pg.PLANET_NAME, 
    pg.GALAXY_NAME;

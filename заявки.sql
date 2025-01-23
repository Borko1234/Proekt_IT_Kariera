USE MARVEL;
SELECT 
    MOVIE_TITLE AS 'Име на филма',
    CONCAT(MOVIE_RATING, "/10") AS 'Рейтинг'
FROM 
    MARVEL_MOVIES
WHERE 
    MOVIE_RATING > 7;


SELECT 
    ht.TEAM_NAME AS 'Име на отбора',
    h.HERO_NAME AS 'Лидер на отбора'
FROM 
    MARVEL_HERO_TEAMS ht
JOIN 
    MARVEL_HERO_TEAMS_LEADERS htl ON ht.TEAM_ID = htl.TEAM_ID
JOIN 
    MARVEL_HEROES h ON htl.HERO_ID = h.HERO_ID;



SELECT 
    h.HERO_NAME AS 'Име на героя',
    m.MOVIE_TITLE AS 'Име на филма'
FROM 
    MARVEL_HERO_MOVIES hm
JOIN 
    MARVEL_HEROES h ON hm.HERO_ID = h.HERO_ID
JOIN 
    MARVEL_MOVIES m ON hm.MOVIE_ID = m.MOVIE_ID;
    
    
SELECT 
    HERO_NAME AS 'Име на героя',
    HERO_REAL_NAME AS 'Истинско име на героя',
    HERO_AGE AS 'Възраст на героя'
FROM 
    MARVEL_HEROES
ORDER BY 
    HERO_AGE DESC;


SELECT 
    ROUND(AVG(HERO_AGE),0) AS 'Средна възраст на героите от Земята'
FROM 
    MARVEL_HEROES
WHERE 
    HERO_PLANET = 'Earth';


SELECT 
    MOVIE_TITLE AS 'Име на филма',
    CONCAT(MOVIE_BOX_OFFICE, '$') AS 'Приходи'
FROM 
    MARVEL_MOVIES
WHERE 
    MOVIE_BOX_OFFICE > 1000000000;


SELECT 
    h.HERO_NAME AS 'Име на героя',
    COUNT(hm.MOVIE_ID) AS 'Брой филми'
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
    pg.PLANET_NAME AS 'Име на планетата',
    pg.GALAXY_NAME AS 'Име на галактиката',
    h.HERO_NAME AS 'Герои от тази планета'
FROM 
    MARVEL_PLANETS_GALAXIES pg
JOIN 
    MARVEL_HEROES h ON pg.HERO_ID = h.HERO_ID
GROUP BY 
    pg.PLANET_NAME, 
    pg.GALAXY_NAME;
    

SELECT 
    YEAR(MOVIE_RELEASE_DATE) AS 'Година',
    CONCAT(ROUND(AVG(MOVIE_BUDGET),2),'$') AS 'Среден бюджет'
FROM 
    MARVEL_MOVIES
GROUP BY 
    YEAR(MOVIE_RELEASE_DATE)
ORDER BY 
    YEAR(MOVIE_RELEASE_DATE) ASC;


SELECT 
    h.HERO_NAME AS 'Име на героя',
    h.HERO_AGE AS 'Възраст',
    m.MOVIE_TITLE AS 'Филм',
    m.MOVIE_RELEASE_DATE AS 'Дата на премиера'
FROM 
    MARVEL_HEROES h
JOIN 
    MARVEL_HERO_MOVIES hm ON h.HERO_ID = hm.HERO_ID
JOIN 
    MARVEL_MOVIES m ON hm.MOVIE_ID = m.MOVIE_ID
WHERE 
    YEAR(m.MOVIE_RELEASE_DATE) > 2015
ORDER BY 
    h.HERO_AGE DESC;
    

SELECT 
    m.MOVIE_TITLE AS 'Име на филма',
    s.SCREENING_DATE AS 'Дата на прожекцията',
    ROUND(s.DAILY_BOX_OFFICE, 2) AS 'Дневни приходи ($)'
FROM 
    MARVEL_MOVIE_PREMIERE_SCREENINGS s
JOIN 
    MARVEL_MOVIES m ON s.MOVIE_ID = m.MOVIE_ID
ORDER BY 
    s.DAILY_BOX_OFFICE DESC
LIMIT 10;


SELECT 
    YEAR(s.SCREENING_DATE) AS 'Година',
    ROUND(AVG(s.DAILY_BOX_OFFICE), 2) AS 'Среден дневен приход ($)'
FROM 
    MARVEL_MOVIE_PREMIERE_SCREENINGS s
GROUP BY 
    YEAR(s.SCREENING_DATE)
ORDER BY 
    'Година' ASC;

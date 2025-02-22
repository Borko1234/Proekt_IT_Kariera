USE MARVEL;
CREATE OR REPLACE VIEW VIEW_MOVIE_BUDGET_LEVEL AS
SELECT 
    MOVIE_TITLE AS 'Име на филма', 
    CONCAT(MOVIE_BUDGET, '$') AS 'Бюджет на филма', 
    UDF_GET_MOVIE_BUDGET_LEVEL(MOVIE_BUDGET) AS 'Ниво на бюджета'
FROM 
    MARVEL_MOVIES;
    
    
    
CREATE OR REPLACE VIEW VIEW_MOVIE_PROFIT_DAY AS
SELECT 
    M.MOVIE_ID AS "ID на филма",
    M.MOVIE_TITLE AS "Име на филма",
    M.MOVIE_BUDGET AS "Бюджет",
    UDF_GET_MOVIE_PROFIT_DAY(M.MOVIE_ID) AS "Ден с приходи над бюджета"
FROM 
    MARVEL_MOVIES M
WHERE 
    UDF_GET_MOVIE_PROFIT_DAY(M.MOVIE_ID) IS NOT NULL
ORDER BY 
    M.MOVIE_ID ASC;



CREATE OR REPLACE VIEW VIEW_MOST_POPULAR_POWER AS
SELECT 
	UDF_GET_MOST_POPULAR_POWER(HERO_ID) AS 'Най-популярна сила',
    HERO_NAME AS 'Име на героя, който я притежава'
FROM 
	MARVEL_HEROES;
    
    
    
CREATE OR REPLACE VIEW VIEW_TOTAL_BOXOFFICE_BY_HERO AS 
SELECT 
    H.HERO_NAME AS 'Име на героя',
    CONCAT(UDF_TOTAL_BOX_OFFICE_BY_HERO(H.HERO_ID),'$') AS 'Общи приходи от филми'
FROM MARVEL_HEROES H;

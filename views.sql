CREATE VIEW view_movies_over_budget AS
SELECT 
    M.MOVIE_ID AS "ID на филма",
    M.MOVIE_TITLE AS "Име на филма",
    M.MOVIE_BUDGET AS "Бюджет",
    UDF_GET_OVER_BUDGET_DATE(M.MOVIE_ID) AS "Ден с приходи над бюджета"
FROM 
    MARVEL_MOVIES M
WHERE 
    UDF_GET_OVER_BUDGET_DATE(M.MOVIE_ID) IS NOT NULL
ORDER BY 
    M.MOVIE_ID ASC;

DELIMITER $$
START TRANSACTION;
SAVEPOINT NO_CHANGES;
INSERT INTO MARVEL_MOVIES (MOVIE_ID, MOVIE_TITLE, MOVIE_RELEASE_DATE, MOVIE_RATING, MOVIE_BUDGET, MOVIE_BOX_OFFICE) 
VALUES (94, 'Iron Man: Resurrection', '2025-07-01', 8, 200000000, 800000000);
SAVEPOINT INSERTED_MOVIE;
INSERT INTO MARVEL_HERO_MOVIES (HERO_ID, MOVIE_ID) VALUES
(1, 94),
(10, 94),
(8, 94); 
ROLLBACK TO NO_CHANGES;
COMMIT $$
DELIMITER ;

DELIMITER $$
START TRANSACTION;
SAVEPOINT NO_CHANGES;
DELETE FROM MARVEL_MOVIE_PREMIERE_SCREENINGS WHERE MOVIE_ID = 3;
SAVEPOINT DELETED_PREMIERE_SCREENING;
DELETE FROM MARVEL_MOVIES WHERE MOVIE_ID = 3;
ROLLBACK TO NO_CHANGES;
COMMIT $$
DELIMITER ;




use nutrs;

DELIMITER //
CREATE PROCEDURE create_meeting (
    IN meeting_date DATE,
    IN meeting_theme VARCHAR(500)
)
BEGIN
    INSERT INTO meeting (meeting_date, meeting_theme)
    VALUES (meeting_date, meeting_theme);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE add_table_to_meeting (
    IN meeting_id INT,
    IN cgm_id INT,
    IN game_name VARCHAR(500),
    IN num_players INT
)
BEGIN
    DECLARE game_id INT;

    -- Check if the game already exists
    SELECT game_id INTO game_id
    FROM game
    WHERE game_name = game_name;

    -- If game doesn't exist, insert it
    IF game_id IS NULL THEN
        INSERT INTO game (game_name, physical_copy, digital_copy)
        VALUES (game_name, 0, 0);
        SET game_id = LAST_INSERT_ID();
    END IF;

    -- Insert table into nutrs_table
    INSERT INTO nutrs_table (meeting_id, cgm_id, game_id, num_players)
    VALUES (meeting_id, cgm_id, game_id, num_players);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE add_cgm (
    IN cgm_first_name VARCHAR(500),
    IN cgm_last_name VARCHAR(500),
    IN cgm_email VARCHAR(500),
    IN cgm_discord_username VARCHAR(500),
    IN max_players INT
)
BEGIN
    INSERT INTO cgm (cgm_first_name, cgm_last_name, cgm_email, cgm_discord_username, max_players)
    VALUES (cgm_first_name, cgm_last_name, cgm_email, cgm_discord_username, max_players);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE add_game (
    IN game_name VARCHAR(500),
    IN publisher_name VARCHAR(500),
    IN system_name VARCHAR(500),
    IN physical_copy BOOL,
    IN digital_copy BOOL
)
BEGIN
    DECLARE publisher_id INT;
    DECLARE system_id INT;
    
    -- Check if publisher exists, otherwise insert
    SELECT publisher_id INTO publisher_id
    FROM publisher
    WHERE publisher_name = publisher_name
    LIMIT 1;
    
    IF publisher_id IS NULL THEN
        INSERT INTO publisher (publisher_name)
        VALUES (publisher_name);
        SET publisher_id = LAST_INSERT_ID();
    END IF;
    
    -- Check if system exists, otherwise insert
    SELECT system_id INTO system_id
    FROM nutrs_system
    WHERE system_name = system_name
    LIMIT 1;
    
    IF system_id IS NULL THEN
        INSERT INTO nutrs_system (system_name)
        VALUES (system_name);
        SET system_id = LAST_INSERT_ID();
    END IF;
    
    -- Insert game
    INSERT INTO game (game_name, publisher_id, system_id, physical_copy, digital_copy)
    VALUES (game_name, publisher_id, system_id, physical_copy, digital_copy);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE add_genre (
    IN genre_name VARCHAR(500)
)
BEGIN
    DECLARE genre_id INT;

    -- Check if the genre already exists
    SELECT genre_id INTO genre_id
    FROM genre
    WHERE genre_name = genre_name
    LIMIT 1;

    -- If genre doesn't exist, insert it
    IF genre_id IS NULL THEN
        INSERT INTO genre (genre_name)
        VALUES (genre_name);
        SELECT LAST_INSERT_ID() AS genre_id;
    ELSE
        SELECT genre_id;
    END IF;
    
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE add_game_genre (
    IN game_name VARCHAR(500),
    IN genre_name VARCHAR(500)
)
BEGIN
    DECLARE game_id_found INT;
    DECLARE genre_id_found INT;

    -- Check if game exists
    SELECT game_id INTO game_id_found
    FROM game
    WHERE game_name = game_name
    LIMIT 1;

    -- Check if genre exists
    SELECT genre_id INTO genre_id_found
    FROM genre
    WHERE genre_name = genre_name
    LIMIT 1;

    -- If game or genre does not exist, throw error
    IF game_id_found IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Game does not exist.';
    END IF;

    IF genre_id_found IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Genre does not exist.';
    END IF;

    -- Insert into game_genre table
    INSERT INTO game_genre (game_id, genre_id)
    VALUES (game_id_found, genre_id_found);

END //
DELIMITER ;

CALL create_meeting('2024-06-30', 'Summer Gaming Session');
CALL add_cgm('John', 'Doe', 'john.doe@email.com', 'johndoe#1234', 6);
CALL add_game('My Awesome Game', "NewPublisher", 1, TRUE, TRUE);
CALL add_table_to_meeting(1, 1, 'My Awesome Game', 4);
CALL add_genre("Horror!");
CALL add_game_genre('My Awesome Game', 'Horror!');

select * from meeting;
select * from cgm;
select * from game;
select * from nutrs_table;
select * from publisher;
select * from genre;
select * from game_genre;


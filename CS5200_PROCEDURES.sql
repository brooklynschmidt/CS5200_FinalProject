use nutrs;

drop procedure if exists create_meeting;
DELIMITER //
create procedure create_meeting (
    in meeting_date date,
    in meeting_theme varchar(500)
)
begin
    insert into meeting (meeting_date, meeting_theme)
    values (meeting_date, meeting_theme);
end //
DELIMITER ;

drop procedure if exists add_table_to_meeting;
DELIMITER //
create procedure add_table_to_meeting (
    in meeting_id int,
    in cgm_id int,
    in game_name varchar(500),
    in num_players int
)
begin
	declare game_id int;

    -- Check if the game already exists
    select game_id into game_id
    from game
    where game_name = game_name;
    
    -- If game doesn't exist, insert it
    if game_id is null then
        insert into game (game_name, physical_copy, digital_copy)
        values (game_name, 0, 0);
        set game_id = LAST_INSERT_ID();
    end if;

    -- Insert table into nutrs_table
    insert into nutrs_table (meeting_id, cgm_id, game_id, num_players)
    values (meeting_id, cgm_id, game_id, num_players);
end //
DELIMITER ;

drop procedure if exists add_cgm;
DELIMITER //
create procedure add_cgm (
    in cgm_first_name varchar(500),
    in cgm_last_name varchar(500),
    in cgm_email varchar(500),
    in cgm_discord_username varchar(500),
    in max_players int
)
begin
	insert into cgm (cgm_first_name, cgm_last_name, cgm_email, cgm_discord_username, max_players)
    values (cgm_first_name, cgm_last_name, cgm_email, cgm_discord_username, max_players);
end //
DELIMITER ;

drop procedure if exists add_game;
DELIMITER //
create procedure add_game (
    in game_name varchar(500),
    in publisher_name varchar(500),
    in system_name varchar(500),
    in physical_copy bool,
    in digital_copy bool
)
begin
    declare publisher_id int;
    declare system_id int;
    
    -- Check if publisher exists, otherwise insert
    select publisher_id into publisher_id
    from publisher
    where publisher_name = publisher_name
    limit 1;
    
    if publisher_id is null then
		insert into publisher (publisher_name)
        values (publisher_name);
        set publisher_id = LAST_INSERT_ID();
    end if;
    
    -- Check if system exists, otherwise insert
    select system_id into system_id
    from nutrs_system
    where system_name = system_name
    limit 1;
    
    if system_id is null then
        insert into nutrs_system (system_name)
        values (system_name);
        set system_id = LAST_INSERT_ID();
    end if;
    
    -- Insert game
    insert into game (game_name, publisher_id, system_id, physical_copy, digital_copy)
    values (game_name, publisher_id, system_id, physical_copy, digital_copy);
end //
DELIMITER ;

drop procedure if exists add_genre;
DELIMITER //
create procedure add_genre (
    in genre_name varchar(500)
)
begin
    declare genre_id int;

    -- Check if the genre already exists
    select genre_id into genre_id
    from genre
    where genre_name = genre_name
    limit 1;

    -- If genre doesn't exist, insert it
    if genre_id is null then
        insert into genre (genre_name)
        values (genre_name);
        select LAST_INSERT_ID() as genre_id;
    else
        select genre_id;
    end if;
    
end //
DELIMITER ;

drop procedure if exists add_game_genre;
DELIMITER //
create procedure add_game_genre (
    in game_name varchar(500),
    in genre_name varchar(500)
)
begin
    declare game_id_found int;
    declare genre_id_found int;

    -- Check if game exists
    select game_id into game_id_found
    from game
    where game_name = game_name
    limit 1;

    -- Check if genre exists
    select genre_id into genre_id_found
    from genre
    where genre_name = genre_name
    limit 1;

    -- If game or genre does not exist, throw error
    if game_id_found is null then
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Game does not exist.';
    end if;

    if genre_id_found is null then
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Genre does not exist.';
    end if;

    -- Insert into game_genre table
    insert into game_genre (game_id, genre_id)
    values (game_id_found, genre_id_found);

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

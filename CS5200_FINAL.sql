drop database if exists nutrs;
create database nutrs;
use nutrs;

create table nutrs_system (
	system_id int primary key auto_increment,
    system_name varchar(500) not null
    );
    
create table publisher (
	publisher_id int primary key auto_increment,
    publisher_name varchar(500) not null
    );

create table meeting (
	meeting_id int primary key auto_increment,
    meeting_date date not null,
    meeting_theme varchar(500) not null
	);
    
create table genre (
	genre_id int primary key auto_increment,
    genre_name varchar(500) not null
    );

create table cgm (
	cgm_id int primary key auto_increment,
    cgm_first_name varchar(500) not null,
    cgm_last_name varchar(500) not null,
    cgm_email varchar(500) not null,
    cgm_discord_username varchar(500),
    max_players int not null
    );

create table cgm_pref_genre (
	cgm_id int,
    genre_id int,
    primary key (cgm_id, genre_id),
	constraint cgm_id foreign key (cgm_id) references cgm (cgm_id),
    constraint genre_id foreign key (genre_id) references genre (genre_id)
    );

create table game (
	game_id int primary key auto_increment,
    game_name varchar(500) not null,
    publisher_id int,
    system_id int,
    constraint publisher_id foreign key (publisher_id) references publisher (publisher_id),
    constraint system_id foreign key (system_id) references nutrs_system (system_id),
    physical_copy bool not null,
    digital_copy bool not null
    );
    
create table game_genre (
	game_id int,
	genre_id int,
    primary key (game_id, genre_id),
	constraint game_id foreign key (game_id) references game (game_id),
    constraint genre_id_fk foreign key (genre_id) references genre (genre_id)
    );

create table cgm_preferred_game (
	cgm_id int,
    genre_id int,
    primary key (cgm_id, genre_id),
	constraint cgm_id_fk foreign key (cgm_id) references cgm (cgm_id),
    constraint genre_id_foreign foreign key (genre_id) references genre (genre_id)
    );
    
create table nutrs_table (
	table_id int primary key auto_increment,
    meeting_id int,
    cgm_id int,
    game_id int,
    constraint meeting_id foreign key (meeting_id) references meeting (meeting_id),
    constraint cgm_id_foreign foreign key (cgm_id) references cgm (cgm_id),
    constraint game_id_fk foreign key (game_id) references game (game_id),
    num_players int not null
    );
    
show tables;

    
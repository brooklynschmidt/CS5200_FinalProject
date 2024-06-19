use nutrs;

-- SET UP SYSTEMS
# select * from nutrs_system;
insert into nutrs_system values
    (1, 'Year Zero Engine'),
    (2, 'Custom System'),
    (3, 'D20 System'),
    (4, 'Forged in the Dark'),
    (5, 'Cortex Prime System'),
    (6, 'Cypher System'),
    (7, 'Interlock System'),
    (8, 'Jenga-based System'),
    (9, 'Playing Cards System'),
    (10, 'Fate System'),
    (11, 'Index Card RPG System'),
    (12, 'Narrative and Tactical System'),
    (13, 'Powered by the Apocalypse'),
    (14, 'Original D&D System'),
    (15, 'Quest System'),
    (16, 'Narrative Storytelling'),
    (17, 'Warhammer Fantasy System'),
    (18, 'Storyteller System'),
    (19, 'Without Number System');

-- SET UP PUBLISHERS
# select * from publisher;
insert into publisher values
(1, 'Free League Publishing'),
(2, 'Evil Hat Productions'),
(3, 'Chris Gonnerman'),
(4, 'Fandom Tabletop'),
(5, 'Monte Cook Games'),
(6, 'R. Talsorian Games'),
(7, 'Wizards of the Coast'),
(8, 'The Impossible Dream'),
(9, 'Stories You Play'),
(10, 'Bully Pulpit Games'),
(11, 'Runehammer Games'),
(12, 'Massif Press'),
(13, 'Magpie Games'),
(14, 'Green Ronin Publishing'),
(15, 'Mongoose Publishing'),
(16, 'Paizo Inc.'),
(17, 'The Adventure Guild'),
(18, 'Frog God Games'),
(19, 'Fantasy Flight Games'),
(20, 'Cubicle 7 Entertainment'),
(21, 'Modiphius Entertainment'),
(22, 'Sine Nomine Publishing');

-- SET UP GAME
# select * from game;

insert into game values
(1, 'Alien RPG', 1, 1, 1, 0),
(2, 'A Penny For My Thoughts', 2, 2, 0, 1),
(3, 'Basic Fantasy Role-Playing 3rd Edition', 3, 3, 1, 0),
(4, 'Blades In The Dark', 2, 4, 1, 0),
(5, 'Cortex Prime RPG', 4, 5, 1, 0),
(6, 'Cypher System', 5, 6, 1, 0),
(7, 'Cyberpunk Red', 6, 7, 1, 0),
(8, 'DND 5th Edition', 7, 3, 1, 0),
(9, 'DND Player\'s Handbook', 7, 3, 1, 0),
(10, 'Dread RPG', 8,  8, 1, 1),
(11, 'Dust Devils', 9,  9, 0, 1),
(12, 'Fate Core System', 2,  10, 1, 0),
(13, 'Fiasco', 10, 2,  1, 0),
(14, 'Index Card RPG', 11, 11,  1, 0),
(15, 'Lancer', 12, 12,  0, 1),
(16, 'Masks: A New Generation', 13, 13,  1, 0),
(17, 'Monster of the Week', 2,  13, 1, 0),
(18, 'Nine Worlds', 14, 2,  0, 1),
(19, 'Paranoia Perfect Edition', 2,  2, 1, 1),
(20, 'Pathfinder Core Rulebook', 3,  3, 1, 0),
(21, 'Quest', 15, 15,  0, 1),
(22, 'Scum and Villainy', 2,  4, 1, 1),
(23, 'Swords and Wizardry', 18, 14,  1, 0),
(24, 'Tales from the Loop RPG', 1,  1, 1, 0),
(25, 'The Extraordinary Adventures of Baron Munchausen', 19, 16,  1, 0),
(26, 'Warhammer Fantasy 4th Edition', 20, 17,  1, 0),
(27, 'Vampire Masquerade 5e', 21, 18,  1, 0),
(28, 'Stars Without Number', 22, 19, 0, 1);

-- SET UP GENRES (this list could probably be pared down but it's ok for demo)
# select * from genre;
insert into genre values
(1, 'Horror'),
(2, 'Sci-Fi'),
(3, 'Mystery'),
(4, 'Psychological Thriller'),
(5, 'High Fantasy'),
(6, 'Sword and Sorcery'),
(7, 'Steampunk'),
(8, 'Urban Fantasy'),
(9, 'Action'),
(10, 'Superheroes'),
(11, 'Science Fantasy'),
(12, 'Post-Apocalyptic'),
(13, 'Cyberpunk'),
(14, 'Dystopian'),
(15, 'Fantasy'),
(16, 'Bestiary'),
(17, 'Adventure'),
(18, 'Survival'),
(19, 'Western'),
(20, 'Supernatural'),
(21, 'Pulp'),
(22, 'Comedy'),
(23, 'Drama'),
(24, 'Minimalist'),
(25, 'Mecha'),
(26, 'Military Sci-Fi'),
(27, 'Teen Drama'),
(28, 'Mythic Fantasy'),
(29, 'Norse Mythology'),
(30, 'Satirical'),
(31, 'Old School Revival'),
(32, 'Classic Fantasy'),
(33, 'Space Opera'),
(34, 'Crime'),
(35, '1980s Nostalgia'),
(36, 'Historical Fiction'),
(37, 'Dark Fantasy'),
(38, 'Grimdark'),
(39, 'Gothic Horror'),
(40, 'Worldbuilding');

select * from game_genre;
insert into game_genre values
(1, 1), (1, 2),
(2, 3), (2, 4),
(3, 5), (3, 6),
(4, 7), (4, 8),
(5, 9), (5, 10),
(6, 11), (6, 12),
(7, 13), (7, 14),
(8, 15), (8, 17),
(9, 15), (9, 17),
(10, 1), (10, 18),
(11, 19), (11, 20),
(12, 15), (12, 21),
(13, 22), (13, 23),
(14, 24), (14, 9),
(15, 25), (15, 26),
(16, 10), (16, 27),
(17, 1), (17, 3),
(18, 28), (18, 29),
(19, 30), (19, 14),
(20, 5), (20, 17),
(21, 5), (21, 21),
(22, 31), (22, 20),
(23, 32), (23, 6),
(24, 3), (24, 33),
(25, 22), (25, 34),
(26, 35), (26, 36),
(27, 37), (27, 8),
(28, 2), (28, 31);

-- SET UP CGM
# select * from cgm;
insert into cgm values
    (1,
     'Rob', 'Maina', 'maina.r@northeastern.edu', 'Rmaina4', 6),
    (2,
     'Audrija','Sarkar','sarkar.a@northeastern.edu', 'cosmo.frog', 5),
    (3,
     'Oliver', 'Baer-Benson', 'Baer-benson.o@northeastern.edu', 'oliver', 8),
    (4,
     'Payton', 'Taylor', 'taylor.pa@northeastern.edu', 'kale5248', 7);

# select * from cgm_pref_genre;
insert into cgm_pref_genre values
    (1, 15), (1, 2),
    (2, 2), (2, 40),
    (3, 2), (3, 31), (3, 22),
    (4, 39), (4, 9);

insert into cgm_preferred_game values
    (1, 8),
    (2, 17), (2, 8), (2, 28),
    (3, 28), (3, 8),
    (4, 8);


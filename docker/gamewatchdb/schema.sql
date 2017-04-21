create table boardgames (
    title varchar(50) not null,
    player_count_best integer,
    avg_play_time_mins integer,
    primary key (title)
);

comment on table boardgames is 'Board games';
comment on column boardgames.title is 'Title on the box';
comment on column boardgames.player_count_best is 'The game is played best with this many players';
comment on column boardgames.avg_play_time_mins is 'Average play time in minutes';

insert into boardgames
    (title, player_count_best, avg_play_time_mins)
    values
    ('Terraforming Mars', 4, 120),
    ('Twilight Imperium 3rd', 6, 600),
    ('Twilight Struggle', 2, 240),
    ('Puerto Rico', 4, 120),
    ('Monopoly', 0, 180),
    ('Shogun', 5, 240),
    ('Azuchi Castle', 3, 30),
    ('Through the Ages', 3, 240),
    ('Concordia', 4, 120),
    ('Cosmic Encounter', 5, 180),
    ('Cacao', 4, 45),
    ('Carcassonne', 4, 60),
    ('Battle Line', 2, 30),
    ('Suburbia', 4, 120),
    ('Mage Knight', 3, 240),
    ('Sun Tzu', 2, 60),
    ('Pandemic', 4, 75),
    ('Blood Rage', 4, 120),
    ('Robinson Crusoe', 4, 180);

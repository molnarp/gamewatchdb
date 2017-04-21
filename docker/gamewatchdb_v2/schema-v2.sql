drop table if exists boardgames cascade;

create table boardgames (
    title character varying (50) not null,
    player_count_best integer,
    avg_play_time_mins integer not null,
    player_count_min integer not null,
    player_count_max integer not null,
    primary key (title)
);

comment on table boardgames is 'Board games';
comment on column boardgames.title is 'Title on the box';
comment on column boardgames.player_count_best is 'The game is played best with this many players.';
comment on column boardgames.avg_play_time_mins is 'Average play time in minutes';
comment on column boardgames.player_count_min is 'The game needs at least this many players.';
comment on column boardgames.player_count_max is 'The game needs at most this many players.';

drop table if exists rel_similar cascade;

create table rel_similar (
    title1 character varying (50) not null,
    title2 character varying (50) not null,
    primary key (title1, title2),
    constraint boardgames_title1_fkey foreign key (title1) references boardgames (title) on update cascade on delete cascade,
    constraint boardgames_title2_fkey foreign key (title2) references boardgames (title) on update cascade on delete cascade
);

comment on table rel_similar is 'Similarity relationship between two board games.';
comment on column rel_similar.title1 is 'Title of one board game.';
comment on column rel_similar.title2 is 'Title of another board game that is similar.';

insert into boardgames
    (title, player_count_best, avg_play_time_mins, player_count_min, player_count_max)
values
    ('Terraforming Mars', null, 120, 2, 5),
    ('Twilight Imperium 3rd', 6, 600, 3, 8),
    ('Twilight Struggle', 2, 240, 2, 2),
    ('Puerto Rico', 4, 120, 3, 5),
    ('Monopoly', 0, 180, 2, 6),
    ('Shogun', null, 240, 3, 5),
    ('Azuchi Castle', 3, 30, 2, 4),
    ('Through the Ages', 3, 240, 2, 4),
    ('Concordia', 4, 120, 3, 5),
    ('Cosmic Encounter', 5, 180, 3, 8),
    ('Cacao', 4, 45, 2, 4),
    ('Carcassonne', 4, 60, 2, 5),
    ('Battle Line', 2, 30, 2, 2),
    ('Suburbia', 4, 120, 2, 4),
    ('Mage Knight', 3, 240, 1, 4),
    ('Sun Tzu', 2, 60, 2, 2),
    ('Pandemic', 4, 75, 2, 4),
    ('Blood Rage', 4, 120, 2, 4),
    ('Robinson Crusoe', 4, 180, 1, 5);

insert into rel_similar
    (title1, title2)
values
    ('Terraforming Mars', 'Puerto Rico'),
    ('Puerto Rico', 'Terraforming Mars'),
    ('Robinson Crusoe', 'Terraforming Mars'),
    ('Terraforming Mars', 'Robinson Crusoe'),
    ('Blood Rage', 'Cosmic Encounter'),
    ('Cosmic Encounter', 'Blood Rage');

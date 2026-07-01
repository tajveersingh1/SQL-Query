create database cross_join_practice;
-- Create and populate 'colors' table
CREATE TABLE colors (
    color_id INT PRIMARY KEY,
    color_name VARCHAR(20)
);
INSERT INTO colors (color_id, color_name) VALUES 
(1, 'Red'), 
(2, 'Blue');

-- Create and populate 'sizes' table
CREATE TABLE sizes (
    size_id INT PRIMARY KEY,
    size_name VARCHAR(10)
);
INSERT INTO sizes (size_id, size_name) VALUES 
(1, 'Small'), 
(2, 'Medium'), 
(3, 'Large');

-- Create and populate 'teams' table
CREATE TABLE teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(30)
);
INSERT INTO teams (team_id, team_name) VALUES 
(101, 'Falcons'), 
(102, 'Panthers'), 
(103, 'Cobras');

select * from colors;
select * from sizes;

select 
c.color_name,
s.size_name
from colors c
cross join sizes s;


select
t1.team_name as home_team,
t2.team_name as away_team
from teams t1
cross join teams t2;
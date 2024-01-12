-- start by writing psql
psql 

--now create the server by creating a database, we called it prem_stats
CREATE DATABASE prem_stats;

--we need to grant all privileges to this server, so write out the following commands
GRANT ALL PRIVILEGES ON DATABASE "prem_stats" TO username; 
GRANT ALL PRIVILEGES ON DATABASE "prem_stats" TO postgres;

--now create a table for your server to store the data. Be extra careful in this step!
CREATE TABLE player_data (
    player_name VARCHAR(100),
    nation VARCHAR(50),
    position VARCHAR(10),
    age INTEGER,
    matches_played INTEGER,
    starts INTEGER,
    minutes_played FLOAT,
    goals FLOAT,
    assists FLOAT,
    penalties_scored FLOAT,
    yellow_cards FLOAT,
    red_cards FLOAT,
    expected_goals FLOAT,
    expected_assists FLOAT,
    team_name VARCHAR(100)
);

--confirm the table was created with empty data
SELECT * FROM player_data;

--copy the csv file over to postgres
\COPY player_data FROM 'destination_to_file' DELIMITER ',' CSV HEADER; 

--confirm the table was populated with your data
SELECT * FROM player_data;

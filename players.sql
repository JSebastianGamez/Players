-- Create FootballPlayers table
CREATE TABLE FootballPlayers (
    player_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INTEGER,
    preferred_foot VARCHAR(10),
    club VARCHAR(100),
    position VARCHAR(50),
    market_price DECIMAL(10, 2)
);

-- Create PlayerStats table
CREATE TABLE PlayerStats (
    stat_id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES FootballPlayers(player_id),
    goals_scored INTEGER,
    assists INTEGER,
    yellow_cards INTEGER,
    red_cards INTEGER,
    CONSTRAINT fk_player_id FOREIGN KEY (player_id) REFERENCES FootballPlayers(player_id)
);

-- Insert sample data into FootballPlayers table
INSERT INTO FootballPlayers (name, age, preferred_foot, club, position, market_price) 
VALUES ('Lionel Messi', 34, 'Left', 'Paris Saint-Germain', 'Forward', 1000000000.00),
       ('Cristiano Ronaldo', 37, 'Right', 'Manchester United', 'Forward', 750000000.00),
       ('Kevin De Bruyne', 30, 'Right', 'Manchester City', 'Midfielder', 150000000.00);

-- Insert sample data into PlayerStats table
INSERT INTO PlayerStats (player_id, goals_scored, assists, yellow_cards, red_cards) 
VALUES (1, 20, 15, 3, 0),
       (2, 25, 10, 2, 1),
       (3, 10, 20, 5, 0);

-- Query player information along with their stats
SELECT 
    p.name,
    p.age,
    p.preferred_foot,
    p.club,
    p.position,
    p.market_price,
    s.goals_scored,
    s.assists,
    s.yellow_cards,
    s.red_cards
FROM 
    FootballPlayers p
JOIN 
    PlayerStats s ON p.player_id = s.player_id;

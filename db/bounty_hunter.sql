DROP TABLE bounties;

CREATE TABLE bounties (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  bounty_value INT,
  danger_level VARCHAR(255)
);

INSERT INTO bounties (name, species, bounty_value, danger_level)
  VALUES ('Aileen', 'Tortoisewoman', 6000, 'low');
INSERT INTO bounties (name, species, bounty_value, danger_level)
  VALUES ('Seb', 'Surferman', 10000, 'medium');
INSERT INTO bounties (name, species, bounty_value, danger_level)
  VALUES ('Simon', 'Phycho Hose Beast', 500000, 'red alert');
INSERT INTO bounties (name, species, bounty_value, danger_level)
  VALUES ('Mike', 'Climber Creature', 100, 'low');
INSERT INTO bounties (name, species, bounty_value, danger_level)
  VALUES ('Rachael', 'Rock Fiend', 500, 'low');
INSERT INTO bounties (name, species, bounty_value, danger_level)
  VALUES ('Michelle', 'Bendy Yogi Monster', 2000, 'high');
INSERT INTO bounties (name, species, bounty_value, danger_level)
  VALUES ('Alex', 'West Coaster', 15000, 'red alert');
INSERT INTO bounties (name, species, bounty_value, danger_level)
  VALUES ('Pawel', 'Polish Programmer', 20000, 'red alert');
INSERT INTO bounties (name, species, bounty_value, danger_level)
  VALUES ('Keith', 'Guitarrist', 4000, 'medium');

DROP TABLE dates;
DROP TABLE palships;
DROP TABLE events;
DROP TABLE clients;
DROP TABLE pals;

CREATE TABLE clients(
id serial4 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE pals(
id serial4 PRIMARY KEY,
name VARCHAR(255),
type VARCHAR(255)
);

CREATE TABLE events(
id serial4 PRIMARY KEY,
type VARCHAR(255)
);

CREATE TABLE palships(
id serial4 PRIMARY KEY,
client_id int4 references clients(id) ON DELETE CASCADE,
pal_id int4 references pals(id) ON DELETE CASCADE
);

CREATE TABLE dates(
id serial4 PRIMARY KEY,
palship_id int4 references palships(id) ON DELETE CASCADE,
event_id int4 references events(id) ON DELETE CASCADE
);


DROP TABLE paldates;
DROP TABLE palships CASCADE;
DROP TABLE events CASCADE;
DROP TABLE clients CASCADE;
DROP TABLE pals CASCADE;


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
client_id int4 REFERENCES clients(id) ON DELETE CASCADE,
pal_id int4 REFERENCES pals(id) ON DELETE CASCADE
);

CREATE TABLE paldates(
id serial4 PRIMARY KEY,
palship_id int4 REFERENCES palships(id) ON DELETE CASCADE,
event_id int4 REFERENCES events(id) ON DELETE CASCADE
);


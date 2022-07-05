\echo 'Delete and recreate the app-storage database?'
\prompt 'Return for yes or Ctrl-C to cancel > ' answer

DROP DATABASE sneaky_badger;
CREATE DATABASE sneaky_badger;

\connect sneaky_badger;

\i sneaky-badger-schema.sql;

INSERT INTO dens 
(title, built_at)
VALUES 
('Willow Grove', '1890-01-01T14:00:00.007Z'),
('Nancy Drewville', '1450-01-01T14:00:00.007Z'),
('Great Meadows', '1888-01-01T14:00:00.007Z');

INSERT INTO badgers 
(title, email, birth, den_id)
VALUES 
('President', 'b1@badgers.com', '1978-01-01T14:00:00.007Z', 1),
('Treasurer', 'b2@badgers.com', '2000-01-01T14:00:00.007Z', 2),
('Secretary', 'b3@badgers.com', '2015-11-04T14:51:06.157Z', 2),
('Citizen', 'b18@badgers.com', '2003-11-04T14:51:06.157Z', 1),
('Citizen', 'b20@badgers.com', '1998-01-01T14:00:00.007Z', 2),
('Citizen', 'b32@badgers.com', '1989-11-04T14:51:06.157Z', 3);

SELECT * from badgers ORDER BY birth asc;
SELECT * from dens;
SELECT dens.title as den, badgers.email, badgers.title as "badger title" from dens LEFT JOIN badgers on dens.id = badgers.den_id;
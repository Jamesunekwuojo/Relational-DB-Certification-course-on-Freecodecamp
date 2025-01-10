```sql

psql --username=freecodecamp --dbname=postgres

```
CREATE DATABSE universe;

\c universe

CREATE TABLE galaxy (
  galaxy_id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  description TEXT  UNIQUE,
  approx_no_stars INT,
  approx_no_planets INT,
  galaxy_type VARCHAR(30),
  age_in_billions NUMERIC,
  has_life BOOLEAN,
  is_spherical BOOLEAN
);


CREATE TABLE star (
  star_id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  description TEXT  UNIQUE,
  type VARCHAR(20),
  approx_no_of_planets INT,
  age_in_millions_of_years NUMERIC,
  no_of_galaxy_present INT,
  has_life BOOLEAN,
  is_spherical BOOLEAN,
  galaxy_id INT,
  CONSTRAINT galaxy_stars FOREIGN KEY (galaxy_id) REFERENCES galaxy (galaxy_id)
);


CREATE TABLE planet (
  planet_id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  description TEXT UNIQUE,
  planet_types VARCHAR(30),
  approx_no_of_moons INT,
  no_of_star_present INT,
  age_in_billion_years NUMERIC,
  is_spherical BOOLEAN,
  has_life BOOLEAN,
  star_id INT,
  CONSTRAINT star_planet FOREIGN KEY (star_id) REFERENCES star (star_id)
);


CREATE TABLE moon (
  moon_id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  description TEXT UNIQUE,
  distance_from_planet_in_km INT,
  is_spherical BOOLEAN,
  has_life BOOLEAN,
  age_in_billions_years NUMERIC,
  no_of_planets_present  INT;
  planet_id INT,
  CONSTRAINT planet_moon FOREIGN KEY (planet_id) REFERENCES planet (planet_id)
);


CREATE TABLE comet (
  comet_id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  description TEXT  UNIQUE,
  comet_type VARCHAR(30),
  diameter INT,
  orbit_path NUMERIC,
  nucleus_no INT,
  has_ring BOOLEAN,
  has_coma BOOLEAN,
  planet_id INT,
  CONSTRAINT planet_satellite FOREIGN KEY (planet_id) REFERENCES planet (planet_id)
);



-- Inserting into the 'galaxy' table
INSERT INTO galaxy (name, description, approx_no_stars, approx_no_planets, Galaxy_type, age_in_billions, has_life, is_spherical)
VALUES
('Milky Way', 'Our home galaxy, contains the Solar System.', 200, 100, 'Spiral', 13.51, TRUE, TRUE),
('Andromeda', 'Nearest major galaxy to the Milky Way.', 1000, 1000, 'Spiral', 10, TRUE, TRUE),
('Triangulum', 'Part of the Local Group, smaller than Andromeda.', 400, 400, 'Spiral', 14, TRUE, TRUE),
('Whirlpool', 'Famous for its spiral shape.', 160, 160, 'Spiral', 10, FALSE, TRUE),
('Sombrero', 'Notable for its bright nucleus and large central bulge.', 80, 80, 'Spiral', 12, FALSE, TRUE),
('Messier 87', 'Supermassive black hole at the center.', 150, 150, 'Elliptical', 14, FALSE, FALSE);


-- Inserting into the 'star' table
INSERT INTO star (name, description, Type, approx_no_of_planets, age_in_millions_of_years, no_of_galaxy_present, has_life, is_spherical, galaxy_id)
VALUES
('Sun', 'The star at the center of the Solar System.', 'G-Type', 8, 4600, 1, TRUE, TRUE, 1),
('Proxima Centauri', 'Closest star to the Sun.', 'M-Type', 3, 4500, 1, FALSE, TRUE, 2),
('Betelgeuse', 'A red supergiant in the Orion constellation.', 'M-Type', 1, 10000, 1, FALSE, TRUE, 1),
('Sirius', 'Brightest star in the night sky.', 'A-Type', 0, 300, 1, FALSE, TRUE, 1),
('Vega', 'Part of the Lyra constellation.', 'A-Type', 0, 455, 1, FALSE, TRUE, 1),
('Alpha Centauri', 'Closest star system to the Solar System.', 'G-Type', 1, 4600, 1, TRUE, TRUE, 2);


-- Inserting into the 'planet' table
INSERT INTO planet (name, description, Planet_types, approx_no_of_moons, no_of_star_present, Age_in_billion_years, is_spherical, has_life, star_id)
VALUES
('Earth', 'Only planet known to support life.', 'Terrestrial', 1, 1, 4.54, TRUE, TRUE, 1),
('Mars', 'Known as the Red Planet.', 'Terrestrial', 2, 1, 4.6, TRUE, FALSE, 1),
('Venus', 'Second planet from the Sun.', 'Terrestrial', 0, 1, 4.5, TRUE, FALSE, 1),
('Jupiter', 'Largest planet in the Solar System.', 'Gas Giant', 79, 1, 4.6, TRUE, FALSE, 1),
('Saturn', 'Famous for its rings.', 'Gas Giant', 83, 1, 4.5, TRUE, FALSE, 1),
('Neptune', 'Farthest planet from the Sun.', 'Ice Giant', 14, 1, 4.5, TRUE, FALSE, 1),
('Uranus', 'Known for its blue-green color.', 'Ice Giant', 27, 1, 4.5, TRUE, FALSE, 1),
('Mercury', 'Smallest planet in the Solar System.', 'Terrestrial', 0, 1, 4.5, TRUE, FALSE, 1),
('Proxima b', 'Closest exoplanet to Earth.', 'Exoplanet', 0, 1, 4.8, TRUE, FALSE, 2),
('Kepler-452b', 'Known as Earth’s cousin.', 'Exoplanet', 0, 1, 6, TRUE, FALSE, 3),
('Betelgeuse I', 'Planet orbiting Betelgeuse.', 'Exoplanet', 0, 1, 2.3, TRUE, FALSE, 3),
('Sirius B', 'Planet orbiting Sirius.', 'Exoplanet', 0, 1, 5, TRUE, FALSE, 4);


-- Inserting into the 'moon' table
INSERT INTO moon (name, description, distance_from_planet_in_km, No_of_planets_present, is_spherical, Has_life, Age_in_billions_years, planet_id)
VALUES
('Moon', 'Earth’s only natural satellite.', 384, 1, TRUE, FALSE, 4.53, 1),
('Phobos', 'Larger moon of Mars.', 9, 1, TRUE, FALSE, 4.5, 2),
('Deimos', 'Smaller moon of Mars.', 23, 1, TRUE, FALSE, 4.5, 2),
('Europa', 'Icy moon of Jupiter, may have an ocean beneath its surface.', 670, 1, TRUE, FALSE, 4.5, 4),
('Ganymede', 'Largest moon in the Solar System.', 1070, 1, TRUE, FALSE, 4.5, 4),
('Callisto', 'Second-largest moon of Jupiter.', 1883, 1, TRUE, FALSE, 4.5, 4),
('Io', 'Most volcanically active body in the Solar System.', 421, 1, TRUE, FALSE, 4.5, 4),
('Titan', 'Largest moon of Saturn, has a thick atmosphere.', 1221, 1, TRUE, FALSE, 4.5, 5),
('Enceladus', 'Saturn moon with geysers of water.', 237, 1, TRUE, FALSE, 4.5, 5),
('Miranda', 'Uranus moon, known for its extreme geological activity.', 129, 1, TRUE, FALSE, 4.5, 6),
('Titania', 'Largest moon of Uranus.', 436, 1, TRUE, FALSE, 4.5, 6),
('Triton', 'Largest moon of Neptune, retrograde orbit.', 354, 1, TRUE, FALSE, 4.5, 6),
('Nereid', 'Third-largest moon of Neptune.', 5513, 1, TRUE, FALSE, 4.5, 6),
('Proxima Centauri b Moon', 'Hypothetical moon orbiting Proxima Centauri b.', 6, 1, TRUE, FALSE, 4.8, 9),
('Kepler-452b Moon', 'Hypothetical moon orbiting Kepler-452b.', 5, 1, TRUE, FALSE, 6, 10),
('Betelgeuse I Moon', 'Hypothetical moon orbiting Betelgeuse I.', 7, 1, TRUE, FALSE, 2.3, 11),
('Sirius B Moon', 'Hypothetical moon orbiting Sirius B.', 8, 1, TRUE, FALSE, 5, 12),
('Europa 2', 'Fictional second moon of Jupiter.', 70, 1, TRUE, FALSE, 4.5, 4),
('Ganymede 2', 'Fictional second moon of Ganymede.', 120, 1, TRUE, FALSE, 4.5, 4),
('Callisto 2', 'Fictional second moon of Callisto.', 190, 1, TRUE, FALSE, 4.5, 4);

--Inserting into comet
INSERT INTO comet (name, description, comet_type, diameter, orbit_path, nucleus_no, has_ring, has_coma, planet_id)
VALUES
('Halley Comet', 'The most famous of all comets.', 'Periodic', 11, 76, 1, FALSE, TRUE, 3),
('Hale-Bopp', 'One of the brightest comets seen in many decades.', 'Long-period', 60, 2500, 1, FALSE, TRUE, 3),
('Comet NEOWISE', 'Discovered in 2020, visible to the naked eye.', 'Periodic', 5, 5000, 1, FALSE, TRUE, 3),
('Comet Encke', 'Shortest-known orbital period of any known comet.', 'Periodic', 4, 3, 1, FALSE, TRUE, 3),
('Comet Tempel-Tuttle', 'Source of the Leonid meteor shower.', 'Periodic', 4, 33, 1, FALSE, TRUE, 3),
('Comet Shoemaker-Levy 9', 'Famous for its collision with Jupiter.', 'Fragmented', 1, 200, 1, FALSE, TRUE, 4);



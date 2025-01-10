--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    comet_type character varying(30),
    diameter integer,
    orbit_path numeric,
    nucleus_no integer,
    has_ring boolean,
    has_coma boolean,
    planet_id integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    approx_no_stars integer,
    approx_no_planets integer,
    galaxy_type character varying(30),
    age_in_billions numeric,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_from_planet_in_km integer,
    is_spherical boolean,
    has_life boolean,
    age_in_billions_years numeric,
    planet_id integer,
    no_of_planets_present integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    planet_types character varying(30),
    approx_no_of_moons integer,
    no_of_star_present integer,
    age_in_billion_years numeric,
    is_spherical boolean,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    type character varying(20),
    approx_no_of_planets integer,
    age_in_millions_of_years numeric,
    no_of_galaxy_present integer,
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley Comet', 'The most famous of all comets.', 'Periodic', 11, 76, 1, false, true, 3);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'One of the brightest comets seen in many decades.', 'Long-period', 60, 2500, 1, false, true, 3);
INSERT INTO public.comet VALUES (3, 'Comet NEOWISE', 'Discovered in 2020, visible to the naked eye.', 'Periodic', 5, 5000, 1, false, true, 3);
INSERT INTO public.comet VALUES (4, 'Comet Encke', 'Shortest-known orbital period of any known comet.', 'Periodic', 4, 3, 1, false, true, 3);
INSERT INTO public.comet VALUES (5, 'Comet Tempel-Tuttle', 'Source of the Leonid meteor shower.', 'Periodic', 4, 33, 1, false, true, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, contains the Solar System.', 200, 100, 'Spiral', 13.51, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy to the Milky Way.', 1000, 1000, 'Spiral', 10, true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Part of the Local Group, smaller than Andromeda.', 400, 400, 'Spiral', 14, true, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Famous for its spiral shape.', 160, 160, 'Spiral', 10, false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Notable for its bright nucleus and large central bulge.', 80, 80, 'Spiral', 12, false, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Supermassive black hole at the center.', 150, 150, 'Elliptical', 14, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth’s only natural satellite.', 384, true, false, 4.53, 1, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Larger moon of Mars.', 9, true, false, 4.5, 2, 1);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller moon of Mars.', 23, true, false, 4.5, 2, 1);
INSERT INTO public.moon VALUES (4, 'Europa', 'Icy moon of Jupiter, may have an ocean beneath its surface.', 670, true, false, 4.5, 4, 1);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Largest moon in the Solar System.', 1070, true, false, 4.5, 4, 1);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Second-largest moon of Jupiter.', 1883, true, false, 4.5, 4, 1);
INSERT INTO public.moon VALUES (7, 'Io', 'Most volcanically active body in the Solar System.', 421, true, false, 4.5, 4, 1);
INSERT INTO public.moon VALUES (8, 'Titan', 'Largest moon of Saturn, has a thick atmosphere.', 1221, true, false, 4.5, 5, 1);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Saturn moon with geysers of water.', 237, true, false, 4.5, 5, 1);
INSERT INTO public.moon VALUES (10, 'Miranda', 'Uranus moon, known for its extreme geological activity.', 129, true, false, 4.5, 6, 1);
INSERT INTO public.moon VALUES (11, 'Titania', 'Largest moon of Uranus.', 436, true, false, 4.5, 6, 1);
INSERT INTO public.moon VALUES (12, 'Triton', 'Largest moon of Neptune, retrograde orbit.', 354, true, false, 4.5, 6, 1);
INSERT INTO public.moon VALUES (13, 'Nereid', 'Third-largest moon of Neptune.', 5513, true, false, 4.5, 6, 1);
INSERT INTO public.moon VALUES (14, 'Proxima Centauri b Moon', 'Hypothetical moon orbiting Proxima Centauri b.', 6, true, false, 4.8, 9, 1);
INSERT INTO public.moon VALUES (15, 'Kepler-452b Moon', 'Hypothetical moon orbiting Kepler-452b.', 5, true, false, 6, 10, 1);
INSERT INTO public.moon VALUES (16, 'Betelgeuse I Moon', 'Hypothetical moon orbiting Betelgeuse I.', 7, true, false, 2.3, 11, 1);
INSERT INTO public.moon VALUES (17, 'Sirius B Moon', 'Hypothetical moon orbiting Sirius B.', 8, true, false, 5, 12, 1);
INSERT INTO public.moon VALUES (18, 'Europa 2', 'Fictional second moon of Jupiter.', 70, true, false, 4.5, 4, 1);
INSERT INTO public.moon VALUES (19, 'Ganymede 2', 'Fictional second moon of Ganymede.', 120, true, false, 4.5, 4, 1);
INSERT INTO public.moon VALUES (20, 'Callisto 2', 'Fictional second moon of Callisto.', 190, true, false, 4.5, 4, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Only planet known to support life.', 'Terrestrial', 1, 1, 4.54, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Known as the Red Planet.', 'Terrestrial', 2, 1, 4.6, true, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Second planet from the Sun.', 'Terrestrial', 0, 1, 4.5, true, false, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Largest planet in the Solar System.', 'Gas Giant', 79, 1, 4.6, true, false, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Famous for its rings.', 'Gas Giant', 83, 1, 4.5, true, false, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Farthest planet from the Sun.', 'Ice Giant', 14, 1, 4.5, true, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Known for its blue-green color.', 'Ice Giant', 27, 1, 4.5, true, false, 1);
INSERT INTO public.planet VALUES (8, 'Mercury', 'Smallest planet in the Solar System.', 'Terrestrial', 0, 1, 4.5, true, false, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Closest exoplanet to Earth.', 'Exoplanet', 0, 1, 4.8, true, false, 2);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 'Known as Earth’s cousin.', 'Exoplanet', 0, 1, 6, true, false, 3);
INSERT INTO public.planet VALUES (11, 'Betelgeuse I', 'Planet orbiting Betelgeuse.', 'Exoplanet', 0, 1, 2.3, true, false, 3);
INSERT INTO public.planet VALUES (12, 'Sirius B', 'Planet orbiting Sirius.', 'Exoplanet', 0, 1, 5, true, false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System.', 'G-Type', 8, 4600, 1, true, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Closest star to the Sun.', 'M-Type', 3, 4500, 1, false, true, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red supergiant in the Orion constellation.', 'M-Type', 1, 10000, 1, false, true, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 'Brightest star in the night sky.', 'A-Type', 0, 300, 1, false, true, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'Part of the Lyra constellation.', 'A-Type', 0, 455, 1, false, true, 1);
INSERT INTO public.star VALUES (6, 'Alpha Centauri', 'Closest star system to the Solar System.', 'G-Type', 1, 4600, 1, true, true, 2);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet unique_comet_description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT unique_comet_description UNIQUE (description);


--
-- Name: galaxy unique_galaxy_description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_description UNIQUE (description);


--
-- Name: moon unique_moon_description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_description UNIQUE (description);


--
-- Name: planet unique_planet_description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_description UNIQUE (description);


--
-- Name: star unique_star_description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_description UNIQUE (description);


--
-- Name: star galaxy_stars; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_stars FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: comet planet_satellite; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT planet_satellite FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_planet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


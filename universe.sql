
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    radius_in_light_years integer,
    description text,
    galaxy_type character varying(60)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    radius_in_kilometers integer,
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    name character varying(60) NOT NULL,
    nebula_id integer NOT NULL,
    width_in_light_years integer,
    description text,
    height_in_light_years integer
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    radius_in_kilometers integer,
    potentially_habitable boolean,
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    mass_in_solar_mass numeric(4,1),
    description text,
    is_single_star_system boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 52850, 'The galaxy that includes our Solar System, with the same name decribing the appearance from Earth.', 'Barred Spiral Galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 110000, 'Nearest large galaxy to the Milky Way.  The name stems from the area of the sky in which it appears, the constellation of Andromeda, which is named after the Ehiopian princess who was the wife of Perseus in Greek Mythos.', 'Barred Spiral Galaxy');
INSERT INTO public.galaxy VALUES (3, 'Black Eye Galaxy', 26481, 'Also known as the Sleeping Beauty Galaxy or Evil Eye Galaxy.  Located in the mildly northern constellation of Coma Verenices.  Discovered by Edward Pigott in March 1779 and independently by Johann Elert Bode in April of the same year.', 'Spiral Galaxy');
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 25000, 'Discovered May 11, 1781 by Pierre Mechain.  It has a bright nucleus and an unusually large central bulge and a prominent dust lane in its outer disk, which is viewed almost edge-on.', 'Elliptical Galaxy');
INSERT INTO public.galaxy VALUES (5, 'Tadpole Galaxy', 195000, 'Located in the northern constellation Draco.  Its most dramatic feature is a trail of stars about 280000 light-years long.  Its size has been attributed to a merge with a smaller galaxy taht is believed to have occurred about 100 million years ago.', 'Disrupted Barred Spiral Galaxy');
INSERT INTO public.galaxy VALUES (6, 'Hoag''s Object', 60500, 'Named after Arthur Hoag, who discovered it in 1950 and identified it as either a planetary nebula or a peculiar galaxy.  It is nearly a perfect ring of young hot blue stars circling the older yellow nucleus.', 'Ring Galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, 'Our moon!', 2);
INSERT INTO public.moon VALUES (2, 'Europa', 1560, 'Smallest of the four Galilean moons orbiting Jupiter.', 8);
INSERT INTO public.moon VALUES (3, 'Ganymede', 2634, 'Largest and most massive of the Solar System''s moons.', 8);
INSERT INTO public.moon VALUES (4, 'Titan', 2574, 'Largest moon of Saturn and the second-largest natural satellite in the Solar System.', 9);
INSERT INTO public.moon VALUES (5, 'Io', 1821, 'Third-largest of the four Galilean moons.', 8);
INSERT INTO public.moon VALUES (6, 'Enceladus', 252, 'Sixth-largest moon of Saturn.', 9);
INSERT INTO public.moon VALUES (8, 'Iapetus', 734, 'Third-largest natural satellite of Saturn.', 9);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410, 'Second-largest moon of Jupiter.', 8);
INSERT INTO public.moon VALUES (9, 'Mimas', 198, 'The smallest astronomical body that is known to still be rounded in shape because of self-gravitation.', 9);
INSERT INTO public.moon VALUES (10, 'Phobos', 11, 'Innermost and larger of the two natural satellites of Mars.', 7);
INSERT INTO public.moon VALUES (11, 'Deimos', 6, 'Smaller of the two natural satellites of Mars.', 7);
INSERT INTO public.moon VALUES (12, 'Triton', 1353, 'Largest natural satellite of the planet Neptune.', 11);
INSERT INTO public.moon VALUES (13, 'Dione', 561, 'Moon of Saturn discovered in 1684 by astronomer Giovanni Domenico Cassini.', 9);
INSERT INTO public.moon VALUES (14, 'Nereid', 170, 'Third-largest moon of Neptune and of all known moons in the Solar System, it has the most eccentric orbit.', 11);
INSERT INTO public.moon VALUES (15, 'Tethys', 531, 'Saturn III, a mid-sized moon of Saturn.', 9);
INSERT INTO public.moon VALUES (16, 'Titania', 788, 'Uranus III, largest of the moons of Uranus.', 10);
INSERT INTO public.moon VALUES (17, 'Oberon', 761, 'Outermost major moon of the planet Uranus.', 10);
INSERT INTO public.moon VALUES (19, 'Amalthea', 83, 'Third closest orbit around Jupiter among its known moons.', 8);
INSERT INTO public.moon VALUES (18, 'Himalia', 85, 'Largest irregular satellite of Jupiter.', 8);
INSERT INTO public.moon VALUES (20, 'Umbriel', 584, 'Moon of Uranus discovered on October 24, 1851 by William Lassell.', 11);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES ('Eagle Nebula', 1, 70, 'Discovered in 1745 by Jean-Phillippe Loys de Cheseaux.  Also known as the Star Queen Nebula and The Spire.  Famously known for the Pillars of Creation imaged by the Hubble Space Telescope.', 55);
INSERT INTO public.nebula VALUES ('Horsehead Nebula', 2, 8, 'A small dark nebula in the constellation Origon.  The nebula is located just to the south of Alnitak, the easternmost star of Orions Belt.  The nebula was first recorded in 1888 by Scottish astronomer Williamina Fleming.', 6);
INSERT INTO public.nebula VALUES ('Orion Nebula', 3, 65, 'A diffuse nebula situated in the Milky Way, south of Orions Belt.  One of the brightest nebulae and is visible to the naked eye in the night sky.  It is the closest region of massive star formation to Earth.', 60);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Proxima Centauri b', 8292, true, 'The closest, potentially habitable exoplanet to Earth.  Orbits the habitable zone of the red dwarf star Proxima Centauri.', 2);
INSERT INTO public.planet VALUES (2, 'Earth', 6371, true, 'Our planet!', 1);
INSERT INTO public.planet VALUES (3, 'Luyten b', 8610, true, 'A confirmed exoplanet, likely rocky, orbiting within the habitable zone of the nearby red dwarf Luyten''s Star.  It is one of the most Earth-like planets ever found and is the fifth-closest potentially habitable exoplanet known, at a distance of 12.2 light-years.', 1);
INSERT INTO public.planet VALUES (4, 'TRAPPIST-1d', 5000, true, 'A small exoplanet which orbits on the inner edge of the habitable zone of the ultracool dwarf star TRAPPIST-1.', 4);
INSERT INTO public.planet VALUES (5, 'Mercury', 2439, false, 'Closest planet to the Sun', 1);
INSERT INTO public.planet VALUES (6, 'Venus', 6051, false, 'Second planet from the Sun and named after the Roman goddess of love and beauty.  The brightest natural object in Earth'' night sky after the moon.', 1);
INSERT INTO public.planet VALUES (7, 'Mars', 3389, false, 'Fourth planet from the Sun and the second-smallest planet in the Solar system.', 1);
INSERT INTO public.planet VALUES (8, 'Jupiter', 71492, false, 'Fifth planet from the Sun and the largest planet in the Solar system. A gas giant with a mass more than two and a half times that of all the other planets in the Solar System combined', 1);
INSERT INTO public.planet VALUES (9, 'Saturn', 58232, false, 'Sixth planet from the Sun and the second-largest in the Solar System, after Jupiter.', 1);
INSERT INTO public.planet VALUES (10, 'Uranus', 25362, false, 'Seventh planet from the sun.', 1);
INSERT INTO public.planet VALUES (11, 'Neptune', 24622, false, 'Eighth and farthest-known Solar planet from the Sun.', 1);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri c', 20227, false, 'Exoplanet discovered in 2020 that could be a super-earth or mini-neptune.', 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.0, 'The star in our solar system.', true, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1.1, 'A gravitationally bound system of the closest stars and exoplanets to our Solar System.', false, 1);
INSERT INTO public.star VALUES (3, 'Luyten''s Star', 0.3, 'Red dwarf in the constellation Canis Minor located roughly 12.36 light-years from the Sun.  It is named after Willem Jacob Luyten, who, in collaboration with Edwin G. Ebbighausen.', true, 1);
INSERT INTO public.star VALUES (4, 'TRAPPIST-1', 0.1, 'Ultra-cool red dwarf star in the constellation Aquarius.  Estimated to be about 7.6 billion years old, making it older than our solar system.', true, 1);
INSERT INTO public.star VALUES (5, 'Sirius', 2.1, 'Brightest star in the night sky.', false, 1);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 11.0, '10th brightestt star in the night sky.  At near-infrared wavelengths, it is the brightest.  A red supergiant.', true, 1);
INSERT INTO public.star VALUES (7, 'Rigel', 18.0, 'A blue supergiant star in the constellation of Orion.  Part of a four star system.', false, 1);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 3, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

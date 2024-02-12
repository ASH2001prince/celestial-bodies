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
    name character varying(225) NOT NULL,
    distance_from_earth double precision,
    is_active boolean,
    number_of_satellite_galaxies integer,
    mass numeric(20,9)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255),
    planet_id integer NOT NULL,
    diameter_km double precision,
    orbital_period_days double precision,
    discovery_year integer,
    is_spherical boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(225) NOT NULL,
    diameter_km numeric(10,2),
    number_of_moons integer,
    orbital_period_days numeric(10,2),
    discovery_year integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: researchnotes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.researchnotes (
    researchnotes_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    note text,
    date_added date,
    name character varying(225)
);


ALTER TABLE public.researchnotes OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(225) NOT NULL,
    type character varying(225),
    distance_light_years numeric(10,2),
    magnitude real,
    constellation character varying(225),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkey Way', 0, true, 59, 1.500000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000, false, 14, 1.760000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 2723000, false, 0, 5.000000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool (M51)', 23000000, false, 1, 160.000000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero (M104)', 31100000, true, 0, 800.000000000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel (M101)', 20900000, false, 0, 100.000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ganymede', 1, 5262, 7.15, 1610, true);
INSERT INTO public.moon VALUES (2, 'Titan', 2, 5150, 15.95, 1655, true);
INSERT INTO public.moon VALUES (3, 'Phobos', 3, 22.2, 0.32, 1877, false);
INSERT INTO public.moon VALUES (4, 'Europa', 4, 3122, 3.55, 1610, true);
INSERT INTO public.moon VALUES (5, 'Triton', 5, 2706, -5.88, 1846, true);
INSERT INTO public.moon VALUES (6, 'Deimos', 6, 12.4, 1.26, 1877, false);
INSERT INTO public.moon VALUES (7, 'lo', 7, 3643, 1.77, 1610, true);
INSERT INTO public.moon VALUES (8, 'Callisto', 8, 4821, 16.69, 1610, true);
INSERT INTO public.moon VALUES (9, 'Lapetus', 9, 1469, 79.33, 1671, true);
INSERT INTO public.moon VALUES (10, 'Rhea', 10, 1527, 4.52, 1672, true);
INSERT INTO public.moon VALUES (11, 'Oberon', 11, 1522.8, 13.46, 1787, true);
INSERT INTO public.moon VALUES (12, 'Titania', 12, 1577.8, 8.71, 1787, true);
INSERT INTO public.moon VALUES (13, 'Enceladus', 1, 504, 1.37, 1789, true);
INSERT INTO public.moon VALUES (14, 'Dione', 2, 1123, 2.74, 1684, true);
INSERT INTO public.moon VALUES (15, 'Tethys', 3, 1062, 1.89, 1684, true);
INSERT INTO public.moon VALUES (16, 'Ariel', 4, 1158, 2.52, 1851, true);
INSERT INTO public.moon VALUES (17, 'Umbriel', 5, 1169, 4.14, 1851, true);
INSERT INTO public.moon VALUES (18, 'Miranda', 6, 471.1, 1.41, 1948, true);
INSERT INTO public.moon VALUES (19, 'Mimas', 7, 396, 0.94, 1789, true);
INSERT INTO public.moon VALUES (20, 'Hyperion', 8, 270, 21.28, 1848, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4879.00, 0, 88.00, -1, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 121014.00, 0, 225.00, -1, 2);
INSERT INTO public.planet VALUES (3, 'Earth', 12724.00, 1, 365.25, -1, 3);
INSERT INTO public.planet VALUES (4, 'Mars', 6779.00, 2, 687.00, -1, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139820.00, 79, 4333.00, -1, 5);
INSERT INTO public.planet VALUES (6, 'Saturn', 116460.00, 82, 10759.00, -1, 6);
INSERT INTO public.planet VALUES (7, 'Uranus', 50724.00, 27, 30687.15, 1781, 7);
INSERT INTO public.planet VALUES (8, 'Neptune', 49244.00, 14, 60190.03, 1846, 8);
INSERT INTO public.planet VALUES (9, 'Pluto', 2374.00, 5, 90560.00, 1930, 9);
INSERT INTO public.planet VALUES (10, 'Cares', 946.00, 0, 1679.67, 1801, 10);
INSERT INTO public.planet VALUES (11, 'Eris', 2326.00, 1, 203830.00, 2005, 11);
INSERT INTO public.planet VALUES (12, 'Haumea', 1632.00, 2, 103774.00, 2004, 12);


--
-- Data for Name: researchnotes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.researchnotes VALUES (1, 1, 'The Milky Way galaxy is a barred spiral galaxy, with an estimated visible diameter of 100,000–200,000 light-years.', '2024-02-11', 'Milky Way Overview');
INSERT INTO public.researchnotes VALUES (2, 2, 'Andromeda Galaxy is the nearest spiral galaxy to the Milky Way, our galaxy. Andromeda is approximately 2.537 million light years away from Earth.', '2024-02-12', 'Andromeda Facts');
INSERT INTO public.researchnotes VALUES (3, 3, 'The Whirlpool Galaxy, also known as Messier 51a, is a grand-design spiral galaxy located in the constellation Canes Venatici.', '2024-02-13', 'Whirlpool Galaxy Details');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alnitak', 'Blue supergiant', 1260.00, 2, 'Orion', 1);
INSERT INTO public.star VALUES (2, 'Alnilam', 'Blue supergiant', 2000.00, 1.69, 'Orion', 2);
INSERT INTO public.star VALUES (3, 'Mintaka', 'Multiple star system', 1200.00, 2.23, 'Orion', 3);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant', 548.00, 0.58, 'Orion', 4);
INSERT INTO public.star VALUES (5, 'Sirius', 'Binary star system', 8.60, -1.46, 'Canis Major', 5);
INSERT INTO public.star VALUES (6, 'Rigel', 'Blue supergiant', 860.00, 0.12, 'Orion', 6);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 'Red Dwarf', 4.24, 11.05, 'Centaurus', 1);
INSERT INTO public.star VALUES (8, 'Vega', 'White Dwarf', 25.04, 0.03, 'Lyra', 2);
INSERT INTO public.star VALUES (9, 'Capella', 'Binary star system', 42.80, 0.08, 'Auriga', 3);
INSERT INTO public.star VALUES (10, 'Polaris', 'Multiple star system', 323.00, 1.98, 'Ursa minor', 4);
INSERT INTO public.star VALUES (11, 'Antares', 'Red supergiant', 550.00, 1.6, 'Scorpius', 5);
INSERT INTO public.star VALUES (12, 'Spica', 'Binary star system', 250.00, 0.97, 'Virgo', 6);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: researchnotes researchnotes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.researchnotes
    ADD CONSTRAINT researchnotes_pkey PRIMARY KEY (researchnotes_id);


--
-- Name: researchnotes researchnotes_researchnotes_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.researchnotes
    ADD CONSTRAINT researchnotes_researchnotes_id_key UNIQUE (researchnotes_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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
-- Name: researchnotes researchnotes_celestial_body_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.researchnotes
    ADD CONSTRAINT researchnotes_celestial_body_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


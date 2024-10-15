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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_km numeric(8,2),
    is_potentially_hazardous boolean NOT NULL,
    orbit_class text,
    discovery_year integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    diameter_in_light_years integer,
    is_spiral boolean NOT NULL,
    has_black_hole boolean,
    number_of_stars numeric(20,0)
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
    name character varying(50) NOT NULL,
    planet_id integer,
    orbital_period_days numeric(10,2),
    diameter_km integer,
    is_spherical boolean NOT NULL,
    has_atmosphere boolean,
    surface_type text
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
    name character varying(50) NOT NULL,
    star_id integer,
    orbit_period_days numeric(10,2),
    mass_earth_relative numeric(8,2),
    is_habitable boolean NOT NULL,
    has_rings boolean,
    planet_type text
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
    name character varying(50) NOT NULL,
    galaxy_id integer,
    age_in_millions_of_years integer,
    temperature_kelvin integer,
    is_binary boolean NOT NULL,
    has_planets boolean,
    spectral_type text
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939.40, false, 'Main Belt', 1801);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525.40, false, 'Main Belt', 1807);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 511.00, false, 'Main Belt', 1802);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 431.00, false, 'Main Belt', 1849);
INSERT INTO public.asteroid VALUES (5, 'Bennu', 0.49, true, 'Apollo', 1999);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 100000, true, true, 250000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 220000, true, true, 1000000000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 5000, 60000, true, false, 40000000000);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 13270, 97000, false, true, 100000000000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 400, 60000, true, false, 100000000000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 13250, 50000, false, true, 100000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 27.32, 3474, true, false, 'Rocky');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 0.32, 22, false, false, 'Rocky');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 1.26, 13, false, false, 'Rocky');
INSERT INTO public.moon VALUES (4, 'Io', 3, 1.77, 3642, true, true, 'Volcanic');
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3.55, 3122, true, true, 'Icy');
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 7.15, 5268, true, true, 'Icy');
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 16.69, 4821, true, true, 'Icy');
INSERT INTO public.moon VALUES (8, 'Titan', 5, 15.95, 5150, true, true, 'Icy');
INSERT INTO public.moon VALUES (9, 'Enceladus', 5, 1.37, 504, true, true, 'Icy');
INSERT INTO public.moon VALUES (10, 'Mimas', 5, 0.94, 396, true, false, 'Icy');
INSERT INTO public.moon VALUES (11, 'Triton', 6, 5.88, 2707, true, true, 'Icy');
INSERT INTO public.moon VALUES (12, 'Nereid', 6, 360.14, 340, false, false, 'Icy');
INSERT INTO public.moon VALUES (13, 'Charon', 8, 6.39, 1212, true, false, 'Icy');
INSERT INTO public.moon VALUES (14, 'Oberon', 8, 13.46, 1523, true, false, 'Icy');
INSERT INTO public.moon VALUES (15, 'Titania', 8, 8.71, 1578, true, false, 'Icy');
INSERT INTO public.moon VALUES (16, 'Miranda', 8, 1.41, 472, false, false, 'Icy');
INSERT INTO public.moon VALUES (17, 'Ariel', 8, 2.52, 1158, true, false, 'Icy');
INSERT INTO public.moon VALUES (18, 'Umbriel', 8, 4.14, 1169, true, false, 'Icy');
INSERT INTO public.moon VALUES (19, 'Dione', 5, 2.74, 1123, true, false, 'Icy');
INSERT INTO public.moon VALUES (20, 'Tethys', 5, 1.89, 1062, true, false, 'Icy');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 365.26, 1.00, true, false, 'Terrestrial');
INSERT INTO public.planet VALUES (2, 'Mars', 1, 686.98, 0.11, false, false, 'Terrestrial');
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 4332.59, 317.80, false, true, 'Gas Giant');
INSERT INTO public.planet VALUES (4, 'Venus', 1, 224.70, 0.82, false, false, 'Terrestrial');
INSERT INTO public.planet VALUES (5, 'Saturn', 1, 10759.22, 95.20, false, true, 'Gas Giant');
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 60190.03, 17.10, false, false, 'Ice Giant');
INSERT INTO public.planet VALUES (7, 'Mercury', 1, 87.97, 0.06, false, false, 'Terrestrial');
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 30688.50, 14.50, false, true, 'Ice Giant');
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 11.19, 1.07, true, false, 'Super Earth');
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 3, 3.24, 1.13, false, false, 'Super Earth');
INSERT INTO public.planet VALUES (11, 'Kepler-16b', 4, 228.78, 0.33, false, false, 'Circumbinary');
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 5, 3.52, 0.69, false, false, 'Hot Jupiter');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 5778, false, true, 'G2V');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850, 3042, false, true, 'M5.5Ve');
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 5300, 5790, true, true, 'G2V');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 8, 3500, false, false, 'M1-2');
INSERT INTO public.star VALUES (5, 'Sirius', 1, 230, 9940, true, false, 'A1V');
INSERT INTO public.star VALUES (6, 'Vega', 1, 455, 9602, false, true, 'A0V');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


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
-- Name: asteroid asteroid_name_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_id_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_id_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_id_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_id_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_id_key UNIQUE (name);


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
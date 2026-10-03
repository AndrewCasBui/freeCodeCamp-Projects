--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(50) NOT NULL,
    orbital_period_years integer NOT NULL,
    is_periodic boolean,
    description text
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
    name character varying(50) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    has_life boolean,
    description text
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
    planet_id integer NOT NULL,
    diameter_km integer,
    is_spherical boolean,
    has_life boolean,
    description text
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
    star_id integer NOT NULL,
    planet_types character varying(30),
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    has_life boolean NOT NULL,
    is_spherical boolean,
    description text
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
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    is_spherical boolean,
    description text
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

INSERT INTO public.comet VALUES (1, 'Halley', 76, true, 'Most famous comet');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 2533, false, 'Great comet of 1997');
INSERT INTO public.comet VALUES (3, 'Encke', 3, true, 'Shortest known period of a major comet');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2537000, false, 'Nearest large galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 10000, 2730000, false, 'Third largest in the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 400, 23000000, false, 'Interacting grand-design spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Lenticular', 13250, 29000000, false, 'Bright nucleus and dust lane');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 13000, 163000, false, 'Satellite of the Milky Way');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, true, false, 'Earth natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, false, false, 'Larger moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, false, false, 'Smaller moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, true, false, 'Most volcanic body known');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, true, false, 'Subsurface ocean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, true, false, 'Largest moon in the Solar System');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, true, false, 'Heavily cratered');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 167, false, false, 'Irregular reddish moon');
INSERT INTO public.moon VALUES (9, 'Titan', 6, 5150, true, false, 'Thick atmosphere');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 504, true, false, 'Ice geysers');
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 396, true, false, 'Death Star lookalike');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 1527, true, false, 'Second largest moon of Saturn');
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, 1469, true, false, 'Two-toned surface');
INSERT INTO public.moon VALUES (14, 'Titania', 7, 1578, true, false, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (15, 'Oberon', 7, 1523, true, false, 'Outermost major moon of Uranus');
INSERT INTO public.moon VALUES (16, 'Miranda', 7, 472, true, false, 'Strange patchwork terrain');
INSERT INTO public.moon VALUES (17, 'Triton', 8, 2707, true, false, 'Retrograde orbit');
INSERT INTO public.moon VALUES (18, 'Nereid', 8, 340, false, false, 'Highly eccentric orbit');
INSERT INTO public.moon VALUES (19, 'Proxima b I', 9, 800, true, false, 'Hypothetical moon');
INSERT INTO public.moon VALUES (20, 'Proxima b II', 9, 600, true, false, 'Hypothetical moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 4500, 0.000010, false, true, 'Closest planet to the Sun');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 4500, 0.000004, false, true, 'Hottest planet');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 4500, 0, true, true, 'Our home');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 4500, 0.000007, false, true, 'The red planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas giant', 4500, 0.000066, false, true, 'Largest planet');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas giant', 4500, 0.000135, false, true, 'Famous for its rings');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant', 4500, 0.000303, false, true, 'Rotates on its side');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice giant', 4500, 0.000475, false, true, 'Farthest known planet of the Sun');
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 'Terrestrial', 4850, 4.24, false, true, 'In the habitable zone');
INSERT INTO public.planet VALUES (10, 'Proxima c', 2, 'Super-Earth', 4850, 4.24, false, true, 'Cold super-Earth candidate');
INSERT INTO public.planet VALUES (11, 'Sirius I', 3, 'Gas giant', 242, 8.6, false, true, 'Hypothetical planet of Sirius');
INSERT INTO public.planet VALUES (12, 'Betelgeuse I', 4, 'Gas giant', 10, 548, false, true, 'Hypothetical planet of Betelgeuse');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 0.000016, true, 'Our star');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850, 4.24, true, 'Closest star to the Sun');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 242, 8.6, true, 'Brightest star in the night sky');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 10, 548, true, 'Red supergiant');
INSERT INTO public.star VALUES (5, 'Andros Prime', 2, 5000, 2537000, true, 'Main star in Andromeda');
INSERT INTO public.star VALUES (6, 'Triangulum Alpha', 3, 3000, 2730000, true, 'Main star in Triangulum');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


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
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_name character varying(50),
    galaxy_age integer,
    distance_km numeric DEFAULT 1000000 NOT NULL,
    discovered_year numeric DEFAULT 2026 NOT NULL,
    name character varying(50)
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
    planets_in_orbit numeric,
    moon_colour text,
    has_eclipse boolean NOT NULL,
    planet_id integer
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
    name character varying(50),
    planet_age integer NOT NULL,
    has_sun boolean,
    description text NOT NULL,
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
-- Name: spaceships; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spaceships (
    spaceships_id integer NOT NULL,
    name character varying(50),
    model integer,
    manufacturer character varying(50) NOT NULL,
    colour text NOT NULL,
    star_id integer
);


ALTER TABLE public.spaceships OWNER TO freecodecamp;

--
-- Name: spaceships_spaceship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spaceships_spaceship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spaceships_spaceship_id_seq OWNER TO freecodecamp;

--
-- Name: spaceships_spaceship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spaceships_spaceship_id_seq OWNED BY public.spaceships.spaceships_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    galaxy_name character varying(50),
    burning character varying(50) DEFAULT 'YES'::character varying NOT NULL,
    lifespan integer DEFAULT 50 NOT NULL
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
-- Name: spaceships spaceships_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceships ALTER COLUMN spaceships_id SET DEFAULT nextval('public.spaceships_spaceship_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 2000, 1000000, 2026, NULL);
INSERT INTO public.galaxy VALUES (2, 'Sonos', 1500, 1000000, 2026, NULL);
INSERT INTO public.galaxy VALUES (3, 'Krept', 3800, 1000000, 2026, NULL);
INSERT INTO public.galaxy VALUES (4, 'Gester', 5000, 1000000, 2026, NULL);
INSERT INTO public.galaxy VALUES (5, 'Trooper', 50, 1000000, 2026, NULL);
INSERT INTO public.galaxy VALUES (6, 'Kratos', 9000, 1000000, 2026, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Moon', 3, 'Grey', true, 7);
INSERT INTO public.moon VALUES (4, 'Orba', 7, 'Red', false, 3);
INSERT INTO public.moon VALUES (6, 'Twill', 10, 'Purple', false, 12);
INSERT INTO public.moon VALUES (8, 'Brix', 0, 'Orange', true, 1);
INSERT INTO public.moon VALUES (10, 'Trag', 2, 'Lilac', true, 10);
INSERT INTO public.moon VALUES (12, 'San', 8, 'Green', true, 8);
INSERT INTO public.moon VALUES (14, 'Xora', 13, 'Blue', false, 4);
INSERT INTO public.moon VALUES (16, 'Sanz', 4, 'Black', true, 5);
INSERT INTO public.moon VALUES (18, 'Azag', 7, 'Blue', true, 11);
INSERT INTO public.moon VALUES (20, 'Forz', 9, 'Pink', true, 2);
INSERT INTO public.moon VALUES (22, 'Torg', 12, 'Magenta', false, 11);
INSERT INTO public.moon VALUES (24, 'Lagos', 3, 'Neon green', true, 12);
INSERT INTO public.moon VALUES (26, 'Santo', 25, 'Yellow', false, 1);
INSERT INTO public.moon VALUES (42, 'Beg', 9, 'Brown', true, 2);
INSERT INTO public.moon VALUES (28, 'Baxter', 10, 'Gold', true, 3);
INSERT INTO public.moon VALUES (30, 'Wanda', 28, 'Neon Pink', false, 4);
INSERT INTO public.moon VALUES (32, 'Scypt', 13, 'Brown', true, 5);
INSERT INTO public.moon VALUES (34, 'Grain', 6, 'Red', false, 6);
INSERT INTO public.moon VALUES (44, 'Coco', 1, 'Blue', true, 7);
INSERT INTO public.moon VALUES (36, 'Vision', 7, 'Purple', false, 8);
INSERT INTO public.moon VALUES (38, 'Marvel', 11, 'Peach', true, 9);
INSERT INTO public.moon VALUES (40, 'Stag', 9, 'Yellow', false, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Uranus', 120, true, 'Very cold, dusty and no water', 6);
INSERT INTO public.planet VALUES (2, 'Blester', 150, false, 'Constantly dark, planet is covered by cloud causing darkness', 4);
INSERT INTO public.planet VALUES (3, 'Galatico', 1000, true, 'Higher gravity than Earth, pulls everything to core', 2);
INSERT INTO public.planet VALUES (4, 'Bullball', 250, false, 'Planet of superheroes that can fly', 5);
INSERT INTO public.planet VALUES (5, 'Gray', 300, true, 'Grey planet with supernova temperatures', 4);
INSERT INTO public.planet VALUES (6, 'Doughnut', 500, false, 'Dougnut shaped planet with an empty enter', 3);
INSERT INTO public.planet VALUES (7, 'Zorb', 12, true, 'Newly discovered planet with rings like the angel from the Bible', 2);
INSERT INTO public.planet VALUES (8, 'Xelda', 700, true, 'Oldest planet in the system, on the verge of death', 1);
INSERT INTO public.planet VALUES (9, 'Qeza', 90, false, 'Suffered planetary devistation', 1);
INSERT INTO public.planet VALUES (10, 'Lupo', 25, true, 'Planet with aliens that can shapeshift', 2);
INSERT INTO public.planet VALUES (11, 'Orba', 650, false, 'Dangerous planet with lava spitting plants', 3);
INSERT INTO public.planet VALUES (12, 'Sudo', 200, true, 'Quicksand planet, literally the whole planet', 5);


--
-- Data for Name: spaceships; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spaceships VALUES (1, 'Rover', 5, 'NASA', 'White', 1);
INSERT INTO public.spaceships VALUES (2, 'Shuttle', 2, 'SpaceX', 'Black', 2);
INSERT INTO public.spaceships VALUES (3, 'Trader', 1, 'Stark', 'Red', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'North star', 'Milky Way', 'YES', 50);
INSERT INTO public.star VALUES (2, 'Saphron', 'Sonos', 'YES', 50);
INSERT INTO public.star VALUES (3, 'Krypton', 'Krept', 'YES', 50);
INSERT INTO public.star VALUES (4, 'Starfire', 'Gester', 'YES', 50);
INSERT INTO public.star VALUES (5, 'Fire', 'Trooper', 'YES', 50);
INSERT INTO public.star VALUES (6, 'Sophos', 'Milky Way', 'YES', 50);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: spaceships_spaceship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spaceships_spaceship_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (galaxy_name);


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
-- Name: spaceships spaceships_model_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceships
    ADD CONSTRAINT spaceships_model_key UNIQUE (model);


--
-- Name: spaceships spaceships_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceships
    ADD CONSTRAINT spaceships_pkey PRIMARY KEY (spaceships_id);


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
-- Name: spaceships spaceships_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceships
    ADD CONSTRAINT spaceships_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_name_fkey FOREIGN KEY (galaxy_name) REFERENCES public.galaxy(galaxy_name);


--
-- PostgreSQL database dump complete
--


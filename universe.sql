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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size integer NOT NULL,
    distance_from_earth numeric,
    is_active boolean DEFAULT true NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter integer NOT NULL,
    distance_from_planet numeric,
    is_terraformable boolean DEFAULT false NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    mass integer NOT NULL,
    orbit_distance numeric,
    has_ring boolean DEFAULT false NOT NULL
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
-- Name: space_stations; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_stations (
    space_stations_id integer NOT NULL,
    name character varying(100) NOT NULL,
    location text NOT NULL,
    capacity integer NOT NULL,
    operational boolean DEFAULT true
);


ALTER TABLE public.space_stations OWNER TO freecodecamp;

--
-- Name: space_stations_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_stations_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_stations_station_id_seq OWNER TO freecodecamp;

--
-- Name: space_stations_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_stations_station_id_seq OWNED BY public.space_stations.space_stations_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    brightness integer NOT NULL,
    temperature numeric,
    is_visible boolean DEFAULT true NOT NULL
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
-- Name: space_stations space_stations_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_stations ALTER COLUMN space_stations_id SET DEFAULT nextval('public.space_stations_station_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 100000, 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andrómeda', 220000, 2530000, true);
INSERT INTO public.galaxy VALUES (3, 'Triángulo', 60000, 3000000, true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 80000, 28000000, true);
INSERT INTO public.galaxy VALUES (5, 'Escultor', 50000, 10000000, true);
INSERT INTO public.galaxy VALUES (6, 'Nubes de Magallanes', 150000, 163000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 3474, 384400, false);
INSERT INTO public.moon VALUES (2, 'Fobos', 4, 22, 6000, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 24000, false);
INSERT INTO public.moon VALUES (4, 'Europa', 5, 3121, 670900, true);
INSERT INTO public.moon VALUES (5, 'Ganímedes', 5, 5262, 1070000, true);
INSERT INTO public.moon VALUES (6, 'Calisto', 5, 4821, 1882700, false);
INSERT INTO public.moon VALUES (7, 'Titán', 6, 5150, 1221870, true);
INSERT INTO public.moon VALUES (8, 'Rea', 6, 1530, 527040, false);
INSERT INTO public.moon VALUES (9, 'Iapetus', 6, 1469, 3564400, false);
INSERT INTO public.moon VALUES (10, 'Miranda', 7, 472, 129000, false);
INSERT INTO public.moon VALUES (11, 'Ariel', 7, 1165, 127000, false);
INSERT INTO public.moon VALUES (12, 'Umbriel', 7, 1176, 266000, false);
INSERT INTO public.moon VALUES (13, 'Oberón', 7, 1523, 583000, false);
INSERT INTO public.moon VALUES (14, 'Titania', 7, 1577, 435000, false);
INSERT INTO public.moon VALUES (15, 'Tritón', 8, 2706, 357000, true);
INSERT INTO public.moon VALUES (16, 'Proteus', 8, 420, 117000, false);
INSERT INTO public.moon VALUES (17, 'Nereida', 8, 340, 480000, false);
INSERT INTO public.moon VALUES (18, 'Carón', 3, 1212, 19600, false);
INSERT INTO public.moon VALUES (19, 'Mimas', 5, 396, 185520, false);
INSERT INTO public.moon VALUES (20, 'Encelado', 6, 504, 238000, true);
INSERT INTO public.moon VALUES (21, 'Tetis', 6, 1062, 294600, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 1, 330, 57.91, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 4868, 108.21, false);
INSERT INTO public.planet VALUES (3, 'Tierra', 1, 5974, 149.60, false);
INSERT INTO public.planet VALUES (4, 'Marte', 1, 641, 227.92, false);
INSERT INTO public.planet VALUES (5, 'Júpiter', 2, 1898000, 778.57, true);
INSERT INTO public.planet VALUES (6, 'Saturno', 2, 568000, 1433.53, true);
INSERT INTO public.planet VALUES (7, 'Urano', 3, 86800, 2872.46, true);
INSERT INTO public.planet VALUES (8, 'Neptuno', 3, 102000, 4495.06, false);
INSERT INTO public.planet VALUES (9, 'Plutón', 3, 1366, 5906.38, false);
INSERT INTO public.planet VALUES (10, 'Erís', 3, 1600, 9600, false);
INSERT INTO public.planet VALUES (11, 'Haumea', 3, 400, 6177, true);
INSERT INTO public.planet VALUES (12, 'Makemake', 3, 1000, 6531, false);


--
-- Data for Name: space_stations; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_stations VALUES (1, 'Estación Internacional', 'Orbita baja de la Tierra', 6, true);
INSERT INTO public.space_stations VALUES (2, 'Estación Lunar', 'Luna', 4, false);
INSERT INTO public.space_stations VALUES (3, 'Estación Marciana', 'Marte', 3, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 100, 5778, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 250, 9940, true);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 75, 3042, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, 150, 3480, true);
INSERT INTO public.star VALUES (5, 'Rigel', 2, 130, 12100, true);
INSERT INTO public.star VALUES (6, 'Aldebarán', 3, 90, 4000, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_stations_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_stations_station_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: space_stations space_stations_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_stations
    ADD CONSTRAINT space_stations_name_key UNIQUE (name);


--
-- Name: space_stations space_stations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_stations
    ADD CONSTRAINT space_stations_pkey PRIMARY KEY (space_stations_id);


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
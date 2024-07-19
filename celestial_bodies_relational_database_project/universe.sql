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
    name character varying(50) NOT NULL,
    date_of_discovery integer,
    constellation text NOT NULL,
    morphology character varying(50) NOT NULL,
    obs_technology_id integer
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
    date_of_discovery integer,
    atmosphere boolean,
    planet_id integer,
    obs_technology_id integer
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
-- Name: obs_technology; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.obs_technology (
    obs_technology_id integer NOT NULL,
    name character varying(50) NOT NULL,
    dev_year integer,
    country character varying(50),
    developer character varying(50)
);


ALTER TABLE public.obs_technology OWNER TO freecodecamp;

--
-- Name: obs_technology_obs_technology_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.obs_technology_obs_technology_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obs_technology_obs_technology_id_seq OWNER TO freecodecamp;

--
-- Name: obs_technology_obs_technology_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.obs_technology_obs_technology_id_seq OWNED BY public.obs_technology.obs_technology_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    date_of_discovery integer,
    moons boolean NOT NULL,
    star_id integer,
    earth_analog boolean NOT NULL,
    obs_technology_id integer
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
    date_of_discovery integer,
    age_in_billion_years numeric(4,3) NOT NULL,
    spectral_type character varying(50) NOT NULL,
    galaxy_id integer,
    obs_technology_id integer
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
-- Name: obs_technology obs_technology_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.obs_technology ALTER COLUMN obs_technology_id SET DEFAULT nextval('public.obs_technology_obs_technology_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1610, 'Sagittarius', 'Spiral', 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 964, 'Andromeda', 'Spiral', 1);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 1503, 'Dorado/Mensa', 'Irregular', 1);
INSERT INTO public.galaxy VALUES (4, 'Hercules A', 1959, 'Hercules', 'Elliptical', 2);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel Galaxy', 1941, 'Sculptor', 'Lenticular', 3);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 1826, 'Centaurus', 'Lenticular/Elliptical', 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, false, 3, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, false, 4, 5);
INSERT INTO public.moon VALUES (3, 'Deimos', 1877, true, 4, 5);
INSERT INTO public.moon VALUES (4, 'Io', 1610, true, 5, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1610, true, 5, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1610, false, 5, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1610, true, 5, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 1655, true, 6, 5);
INSERT INTO public.moon VALUES (9, 'Rhea', 1672, true, 6, 5);
INSERT INTO public.moon VALUES (10, 'Umbriel', 1851, false, 7, 5);
INSERT INTO public.moon VALUES (11, 'Titania', 1787, true, 7, 5);
INSERT INTO public.moon VALUES (12, 'Nereid', 1949, NULL, 8, 5);
INSERT INTO public.moon VALUES (13, 'Triton', 1846, true, 8, 5);
INSERT INTO public.moon VALUES (14, 'Proteus', 1989, NULL, 8, 5);
INSERT INTO public.moon VALUES (15, 'Charon', 1978, false, 9, 5);
INSERT INTO public.moon VALUES (16, 'Styx', 2012, NULL, 9, 5);
INSERT INTO public.moon VALUES (17, 'Nix', 2005, NULL, 9, 5);
INSERT INTO public.moon VALUES (18, 'Kerberos', 2011, NULL, 9, 5);
INSERT INTO public.moon VALUES (19, 'Hydra', 2005, NULL, 9, 5);
INSERT INTO public.moon VALUES (20, 'Vanth', 2005, false, 11, 5);
INSERT INTO public.moon VALUES (21, 'Namaka', 2005, NULL, 12, 5);
INSERT INTO public.moon VALUES (22, 'Hiiaka', 2005, NULL, 12, 5);
INSERT INTO public.moon VALUES (23, 'Weywot', 2006, NULL, 13, 5);


--
-- Data for Name: obs_technology; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.obs_technology VALUES (1, 'Naked eye', NULL, NULL, NULL);
INSERT INTO public.obs_technology VALUES (2, 'Interferometer', 1816, 'France', 'Francois Arago');
INSERT INTO public.obs_technology VALUES (3, 'Wide-field image', NULL, NULL, NULL);
INSERT INTO public.obs_technology VALUES (4, 'Astrographic camera', NULL, NULL, NULL);
INSERT INTO public.obs_technology VALUES (5, 'Telescope', 1608, 'Netherlands', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1610, false, 1, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 1610, false, 1, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, true, 1, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1534, true, 1, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1610, true, 1, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 1655, true, 1, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 1781, true, 1, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 1612, true, 1, false, 5);
INSERT INTO public.planet VALUES (9, 'Pluto', 1930, true, 1, false, 4);
INSERT INTO public.planet VALUES (10, 'Ceres', 1761, false, 1, false, 5);
INSERT INTO public.planet VALUES (11, 'Orcus', 2004, true, 1, false, 5);
INSERT INTO public.planet VALUES (12, 'Haumea', 2005, true, 1, false, 5);
INSERT INTO public.planet VALUES (13, 'Quaoar', 2002, true, 1, false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 4.600, 'Yellow dwarf', 1, 1);
INSERT INTO public.star VALUES (2, 'Alpheratz', 1781, 0.060, 'Blue-white subgiant', 2, 1);
INSERT INTO public.star VALUES (3, 'Alpha Doradus', 1603, 0.065, 'Blue subgiant', 3, 1);
INSERT INTO public.star VALUES (4, 'Kornephoros', 1977, 0.420, 'Yellow giant', 4, 1);
INSERT INTO public.star VALUES (5, 'Alpha Sculptoris', 1751, 0.093, 'Blue-white subgiant', 5, 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1915, 1.000, 'Orange dwarf', 6, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: obs_technology_obs_technology_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.obs_technology_obs_technology_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


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
-- Name: obs_technology obs_technology_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.obs_technology
    ADD CONSTRAINT obs_technology_name_key UNIQUE (name);


--
-- Name: obs_technology obs_technology_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.obs_technology
    ADD CONSTRAINT obs_technology_pkey PRIMARY KEY (obs_technology_id);


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
-- Name: galaxy galaxy_obs_technology_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_obs_technology_id_fkey FOREIGN KEY (obs_technology_id) REFERENCES public.obs_technology(obs_technology_id);


--
-- Name: moon moon_obs_technology_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_obs_technology_id_fkey FOREIGN KEY (obs_technology_id) REFERENCES public.obs_technology(obs_technology_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_obs_technology_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_obs_technology_id_fkey FOREIGN KEY (obs_technology_id) REFERENCES public.obs_technology(obs_technology_id);


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
-- Name: star star_obs_technology_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_obs_technology_id_fkey FOREIGN KEY (obs_technology_id) REFERENCES public.obs_technology(obs_technology_id);


--
-- PostgreSQL database dump complete
--


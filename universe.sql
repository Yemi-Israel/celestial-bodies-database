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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    diameter_km numeric NOT NULL,
    composition text,
    is_potentially_hazardous boolean NOT NULL,
    distance_from_earth numeric
);


ALTER TABLE public.asteroid OWNER TO postgres;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO postgres;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    description text,
    distance_from_earth numeric,
    has_black_hole boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    diameter_km numeric NOT NULL,
    is_spherical boolean NOT NULL,
    composition text
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    has_life boolean NOT NULL,
    radius_km numeric,
    mass integer,
    planet_type character varying(50) NOT NULL
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    age_in_millions_of_years numeric,
    luminosity integer,
    is_supernova boolean NOT NULL
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939.4, 'Rocky/Icy', false, 414000000);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 512, 'Rocky', false, 414000000);
INSERT INTO public.asteroid VALUES (3, 'Vesta', 525, 'Rocky', false, 353000000);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 430, 'Rocky', false, 470000000);
INSERT INTO public.asteroid VALUES (5, 'Eros', 16.8, 'Rocky', true, 22000000);
INSERT INTO public.asteroid VALUES (6, 'Itokawa', 0.33, 'Rocky', true, 3000000);
INSERT INTO public.asteroid VALUES (7, 'Apophis', 0.325, 'Rocky', true, 38000000);
INSERT INTO public.asteroid VALUES (8, 'Bennu', 0.492, 'Rocky', true, 12000000);
INSERT INTO public.asteroid VALUES (9, 'Gaspra', 18.2, 'Rocky', false, 30000000);
INSERT INTO public.asteroid VALUES (10, 'Ida', 15.7, 'Rocky', false, 50000000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Home galaxy', 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Nearest spiral', 2537000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'Small galaxy', 3000000, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 'Famous spiral', 23000000, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 'Large bulge', 31000000, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 'Face-on spiral', 21000000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, true, 'Rocky');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, true, 'Rocky');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, true, 'Rocky');
INSERT INTO public.moon VALUES (4, 'Europa', 5, 3122, true, 'Ice and Rock');
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, 5268, true, 'Ice and Rock');
INSERT INTO public.moon VALUES (6, 'Callisto', 5, 4821, true, 'Ice and Rock');
INSERT INTO public.moon VALUES (7, 'Io', 5, 3643, true, 'Rocky and Volcanic');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5151, true, 'Ice and Rock');
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 1528, true, 'Ice');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 504, true, 'Ice');
INSERT INTO public.moon VALUES (11, 'Triton', 7, 2706, true, 'Ice');
INSERT INTO public.moon VALUES (12, 'Oberon', 8, 1523, true, 'Rocky');
INSERT INTO public.moon VALUES (13, 'Umbriel', 8, 1169, true, 'Rocky');
INSERT INTO public.moon VALUES (14, 'Titania', 8, 1578, true, 'Rocky');
INSERT INTO public.moon VALUES (15, 'Ariel', 8, 1158, true, 'Rocky');
INSERT INTO public.moon VALUES (16, 'Miranda', 8, 471, true, 'Rocky');
INSERT INTO public.moon VALUES (17, 'Io-2', 9, 3640, true, 'Rocky');
INSERT INTO public.moon VALUES (18, 'Europa-2', 9, 3120, true, 'Ice');
INSERT INTO public.moon VALUES (19, 'Ganymede-2', 9, 5260, true, 'Ice');
INSERT INTO public.moon VALUES (20, 'Callisto-2', 9, 4820, true, 'Ice');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 6371, 5972, 'Terrestrial');
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 3389, 641, 'Terrestrial');
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, 6051, 4868, 'Terrestrial');
INSERT INTO public.planet VALUES (4, 'Mercury', 1, false, 2439, 330, 'Terrestrial');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, 69911, 1898600, 'Gas Giant');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, 58232, 568460, 'Gas Giant');
INSERT INTO public.planet VALUES (7, 'Proxima b', 2, false, 7160, 850, 'Terrestrial');
INSERT INTO public.planet VALUES (8, 'Sirius b1', 3, false, 5500, 950, 'Gas Giant');
INSERT INTO public.planet VALUES (9, 'Rigel I', 4, false, 7200, 1200, 'Terrestrial');
INSERT INTO public.planet VALUES (10, 'Betelgeuse I', 5, false, 6800, 1100, 'Terrestrial');
INSERT INTO public.planet VALUES (11, 'Vega I', 6, false, 6400, 1000, 'Terrestrial');
INSERT INTO public.planet VALUES (12, 'Vega II', 6, false, 6000, 950, 'Terrestrial');
INSERT INTO public.planet VALUES (13, 'Altair I', 7, false, 6100, 970, 'Terrestrial');
INSERT INTO public.planet VALUES (14, 'Altair II', 7, false, 6200, 980, 'Terrestrial');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 100, false);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4500, 0, false);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 242, 25, false);
INSERT INTO public.star VALUES (4, 'Rigel', 2, 8, 120000, true);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 2, 10, 140000, true);
INSERT INTO public.star VALUES (6, 'Vega', 3, 455, 40, false);
INSERT INTO public.star VALUES (7, 'Altair', 3, 1000, 50, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: TABLE asteroid; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.asteroid TO freecodecamp;


--
-- Name: SEQUENCE asteroid_asteroid_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.asteroid_asteroid_id_seq TO freecodecamp;


--
-- Name: TABLE galaxy; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.galaxy TO freecodecamp;


--
-- Name: SEQUENCE galaxy_galaxy_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.galaxy_galaxy_id_seq TO freecodecamp;


--
-- Name: TABLE moon; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.moon TO freecodecamp;


--
-- Name: SEQUENCE moon_moon_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.moon_moon_id_seq TO freecodecamp;


--
-- Name: TABLE planet; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.planet TO freecodecamp;


--
-- Name: SEQUENCE planet_planet_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.planet_planet_id_seq TO freecodecamp;


--
-- Name: TABLE star; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.star TO freecodecamp;


--
-- Name: SEQUENCE star_star_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.star_star_id_seq TO freecodecamp;


--
-- PostgreSQL database dump complete
--


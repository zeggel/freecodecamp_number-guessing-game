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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    name character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_game integer NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, '', 1, 0);
INSERT INTO public.players VALUES (3, 'asd', 1, 0);
INSERT INTO public.players VALUES (2, 'qwe', 3, 13);
INSERT INTO public.players VALUES (4, 'zxc', 1, 8);
INSERT INTO public.players VALUES (18, 'user_1685891884577', 2, 523);
INSERT INTO public.players VALUES (6, 'user_1685891178151', 2, 531);
INSERT INTO public.players VALUES (17, 'user_1685891884578', 4, 49);
INSERT INTO public.players VALUES (5, 'user_1685891178152', 4, 140);
INSERT INTO public.players VALUES (20, 'user_1685891937762', 2, 439);
INSERT INTO public.players VALUES (8, 'user_1685891440228', 2, 118);
INSERT INTO public.players VALUES (7, 'user_1685891440229', 5, 134);
INSERT INTO public.players VALUES (19, 'user_1685891937763', 4, 177);
INSERT INTO public.players VALUES (10, 'user_1685891539172', 2, 127);
INSERT INTO public.players VALUES (9, 'user_1685891539174', 4, 107);
INSERT INTO public.players VALUES (22, 'user_1685891964839', 2, 778);
INSERT INTO public.players VALUES (12, 'user_1685891609044', 2, 359);
INSERT INTO public.players VALUES (21, 'user_1685891964840', 5, 172);
INSERT INTO public.players VALUES (11, 'user_1685891609045', 4, 103);
INSERT INTO public.players VALUES (13, 'wqe', 1, 7);
INSERT INTO public.players VALUES (16, 'user_1685891768443', 1, 155);
INSERT INTO public.players VALUES (24, 'user_1685892005702', 2, 4);
INSERT INTO public.players VALUES (14, 'user_1685891768444', 3, 246);
INSERT INTO public.players VALUES (23, 'user_1685892005703', 5, 242);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 24, true);


--
-- Name: players players_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_name_key UNIQUE (name);


--
-- PostgreSQL database dump complete
--


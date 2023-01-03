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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(25),
    games_played integer DEFAULT 0,
    best integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'real', 1, 4);
INSERT INTO public.users VALUES (3, 'newreal', 1, 5);
INSERT INTO public.users VALUES (5, 'user_1672747945345', 2, 553);
INSERT INTO public.users VALUES (16, 'user_1672748351744', 2, 398);
INSERT INTO public.users VALUES (4, 'user_1672747945346', 5, 934);
INSERT INTO public.users VALUES (15, 'user_1672748351745', 5, 38);
INSERT INTO public.users VALUES (30, 'user_1672748666463', 2, 980);
INSERT INTO public.users VALUES (7, 'user_1672748013931', 2, 954);
INSERT INTO public.users VALUES (6, 'user_1672748013932', 5, 835);
INSERT INTO public.users VALUES (29, 'user_1672748666464', 5, 342);
INSERT INTO public.users VALUES (1, 'testing', 1, 0);
INSERT INTO public.users VALUES (18, 'user_1672748441892', 2, 617);
INSERT INTO public.users VALUES (17, 'user_1672748441893', 5, 116);
INSERT INTO public.users VALUES (9, 'user_1672748059677', 2, 420);
INSERT INTO public.users VALUES (8, 'user_1672748059678', 5, 977);
INSERT INTO public.users VALUES (20, 'user_1672748505411', 2, 714);
INSERT INTO public.users VALUES (12, 'user_1672748259410', 2, 566);
INSERT INTO public.users VALUES (19, 'user_1672748505412', 5, 73);
INSERT INTO public.users VALUES (11, 'user_1672748259411', 5, 993);
INSERT INTO public.users VALUES (14, 'user_1672748299019', 2, 633);
INSERT INTO public.users VALUES (13, 'user_1672748299020', 5, 376);
INSERT INTO public.users VALUES (22, 'user_1672748519426', 2, 981);
INSERT INTO public.users VALUES (21, 'user_1672748519427', 5, 617);
INSERT INTO public.users VALUES (10, 'test', 3, 5);
INSERT INTO public.users VALUES (24, 'user_1672748543184', 2, 203);
INSERT INTO public.users VALUES (23, 'user_1672748543185', 5, 763);
INSERT INTO public.users VALUES (26, 'user_1672748573934', 2, 415);
INSERT INTO public.users VALUES (25, 'user_1672748573935', 5, 46);
INSERT INTO public.users VALUES (28, 'user_1672748577887', 2, 328);
INSERT INTO public.users VALUES (27, 'user_1672748577888', 5, 30);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 30, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--


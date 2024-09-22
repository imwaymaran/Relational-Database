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

DROP DATABASE guessing_game;
--
-- Name: guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE guessing_game OWNER TO freecodecamp;

\connect guessing_game

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    number_of_guesses integer DEFAULT 0,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (5, 2, 2);
INSERT INTO public.games VALUES (6, 7, 3);
INSERT INTO public.games VALUES (7, 5, 3);
INSERT INTO public.games VALUES (8, 11, 4);
INSERT INTO public.games VALUES (9, 9, 4);
INSERT INTO public.games VALUES (10, 13, 3);
INSERT INTO public.games VALUES (11, 8, 3);
INSERT INTO public.games VALUES (12, 3, 3);
INSERT INTO public.games VALUES (13, 4, 5);
INSERT INTO public.games VALUES (14, 3, 5);
INSERT INTO public.games VALUES (15, 2, 6);
INSERT INTO public.games VALUES (16, 11, 6);
INSERT INTO public.games VALUES (17, 3, 7);
INSERT INTO public.games VALUES (18, 6, 7);
INSERT INTO public.games VALUES (19, 9, 6);
INSERT INTO public.games VALUES (20, 7, 6);
INSERT INTO public.games VALUES (21, 8, 6);
INSERT INTO public.games VALUES (22, 4, 8);
INSERT INTO public.games VALUES (23, 8, 8);
INSERT INTO public.games VALUES (24, 4, 9);
INSERT INTO public.games VALUES (25, 6, 9);
INSERT INTO public.games VALUES (26, 11, 8);
INSERT INTO public.games VALUES (27, 6, 8);
INSERT INTO public.games VALUES (28, 5, 8);
INSERT INTO public.games VALUES (29, 3, 10);
INSERT INTO public.games VALUES (30, 6, 10);
INSERT INTO public.games VALUES (31, 7, 11);
INSERT INTO public.games VALUES (32, 4, 11);
INSERT INTO public.games VALUES (33, 9, 10);
INSERT INTO public.games VALUES (34, 6, 10);
INSERT INTO public.games VALUES (35, 4, 10);
INSERT INTO public.games VALUES (36, 7, 12);
INSERT INTO public.games VALUES (37, 7, 12);
INSERT INTO public.games VALUES (38, 5, 13);
INSERT INTO public.games VALUES (39, 3, 13);
INSERT INTO public.games VALUES (40, 9, 12);
INSERT INTO public.games VALUES (41, 2, 12);
INSERT INTO public.games VALUES (42, 2, 12);
INSERT INTO public.games VALUES (43, 10, 14);
INSERT INTO public.games VALUES (44, 10, 14);
INSERT INTO public.games VALUES (45, 4, 15);
INSERT INTO public.games VALUES (46, 2, 15);
INSERT INTO public.games VALUES (47, 10, 14);
INSERT INTO public.games VALUES (48, 7, 14);
INSERT INTO public.games VALUES (49, 3, 14);
INSERT INTO public.games VALUES (50, 7, 16);
INSERT INTO public.games VALUES (51, 7, 16);
INSERT INTO public.games VALUES (52, 2, 17);
INSERT INTO public.games VALUES (53, 7, 17);
INSERT INTO public.games VALUES (54, 12, 16);
INSERT INTO public.games VALUES (55, 3, 16);
INSERT INTO public.games VALUES (56, 11, 16);
INSERT INTO public.games VALUES (57, 2, 18);
INSERT INTO public.games VALUES (58, 4, 18);
INSERT INTO public.games VALUES (59, 5, 19);
INSERT INTO public.games VALUES (60, 8, 19);
INSERT INTO public.games VALUES (61, 1, 18);
INSERT INTO public.games VALUES (62, 9, 18);
INSERT INTO public.games VALUES (63, 3, 18);
INSERT INTO public.games VALUES (64, 6, 20);
INSERT INTO public.games VALUES (65, 9, 20);
INSERT INTO public.games VALUES (66, 3, 21);
INSERT INTO public.games VALUES (67, 4, 21);
INSERT INTO public.games VALUES (68, 1, 20);
INSERT INTO public.games VALUES (69, 10, 20);
INSERT INTO public.games VALUES (70, 3, 20);
INSERT INTO public.games VALUES (71, 4, 22);
INSERT INTO public.games VALUES (72, 5, 22);
INSERT INTO public.games VALUES (73, 11, 23);
INSERT INTO public.games VALUES (74, 5, 23);
INSERT INTO public.games VALUES (75, 11, 22);
INSERT INTO public.games VALUES (76, 9, 22);
INSERT INTO public.games VALUES (77, 10, 22);
INSERT INTO public.games VALUES (78, 10, 24);
INSERT INTO public.games VALUES (79, 5, 24);
INSERT INTO public.games VALUES (80, 6, 25);
INSERT INTO public.games VALUES (81, 9, 25);
INSERT INTO public.games VALUES (82, 7, 24);
INSERT INTO public.games VALUES (83, 2, 24);
INSERT INTO public.games VALUES (84, 4, 24);
INSERT INTO public.games VALUES (85, 11, 26);
INSERT INTO public.games VALUES (86, 11, 26);
INSERT INTO public.games VALUES (87, 10, 27);
INSERT INTO public.games VALUES (88, 3, 27);
INSERT INTO public.games VALUES (89, 10, 26);
INSERT INTO public.games VALUES (90, 8, 26);
INSERT INTO public.games VALUES (91, 5, 26);
INSERT INTO public.games VALUES (92, 4, 28);
INSERT INTO public.games VALUES (93, 4, 28);
INSERT INTO public.games VALUES (94, 6, 29);
INSERT INTO public.games VALUES (95, 8, 29);
INSERT INTO public.games VALUES (96, 11, 28);
INSERT INTO public.games VALUES (97, 2, 28);
INSERT INTO public.games VALUES (98, 5, 28);
INSERT INTO public.games VALUES (99, 10, 30);
INSERT INTO public.games VALUES (100, 10, 30);
INSERT INTO public.games VALUES (101, 8, 31);
INSERT INTO public.games VALUES (102, 11, 31);
INSERT INTO public.games VALUES (103, 7, 30);
INSERT INTO public.games VALUES (104, 11, 30);
INSERT INTO public.games VALUES (105, 8, 30);
INSERT INTO public.games VALUES (106, 9, 32);
INSERT INTO public.games VALUES (107, 6, 32);
INSERT INTO public.games VALUES (108, 11, 33);
INSERT INTO public.games VALUES (109, 10, 33);
INSERT INTO public.games VALUES (110, 5, 32);
INSERT INTO public.games VALUES (111, 3, 32);
INSERT INTO public.games VALUES (112, 11, 32);
INSERT INTO public.games VALUES (113, 5, 34);
INSERT INTO public.games VALUES (114, 10, 34);
INSERT INTO public.games VALUES (115, 4, 35);
INSERT INTO public.games VALUES (116, 7, 35);
INSERT INTO public.games VALUES (117, 13, 34);
INSERT INTO public.games VALUES (118, 11, 34);
INSERT INTO public.games VALUES (119, 7, 34);
INSERT INTO public.games VALUES (120, 3, 36);
INSERT INTO public.games VALUES (121, 9, 36);
INSERT INTO public.games VALUES (122, 6, 37);
INSERT INTO public.games VALUES (123, 10, 37);
INSERT INTO public.games VALUES (124, 10, 36);
INSERT INTO public.games VALUES (125, 5, 36);
INSERT INTO public.games VALUES (126, 7, 36);
INSERT INTO public.games VALUES (127, 4, 38);
INSERT INTO public.games VALUES (128, 6, 38);
INSERT INTO public.games VALUES (129, 8, 39);
INSERT INTO public.games VALUES (130, 9, 39);
INSERT INTO public.games VALUES (131, 12, 38);
INSERT INTO public.games VALUES (132, 10, 38);
INSERT INTO public.games VALUES (133, 11, 38);
INSERT INTO public.games VALUES (134, 6, 40);
INSERT INTO public.games VALUES (135, 5, 40);
INSERT INTO public.games VALUES (136, 3, 41);
INSERT INTO public.games VALUES (137, 10, 41);
INSERT INTO public.games VALUES (138, 5, 40);
INSERT INTO public.games VALUES (139, 8, 40);
INSERT INTO public.games VALUES (140, 11, 40);
INSERT INTO public.games VALUES (141, 4, 42);
INSERT INTO public.games VALUES (142, 2, 42);
INSERT INTO public.games VALUES (143, 6, 43);
INSERT INTO public.games VALUES (144, 4, 43);
INSERT INTO public.games VALUES (145, 6, 42);
INSERT INTO public.games VALUES (146, 11, 42);
INSERT INTO public.games VALUES (147, 10, 42);
INSERT INTO public.games VALUES (148, 10, 44);
INSERT INTO public.games VALUES (149, 5, 44);
INSERT INTO public.games VALUES (150, 6, 45);
INSERT INTO public.games VALUES (151, 9, 45);
INSERT INTO public.games VALUES (152, 9, 44);
INSERT INTO public.games VALUES (153, 8, 44);
INSERT INTO public.games VALUES (154, 9, 44);
INSERT INTO public.games VALUES (155, 9, 46);
INSERT INTO public.games VALUES (156, 4, 46);
INSERT INTO public.games VALUES (157, 8, 47);
INSERT INTO public.games VALUES (158, 5, 47);
INSERT INTO public.games VALUES (159, 5, 46);
INSERT INTO public.games VALUES (160, 8, 46);
INSERT INTO public.games VALUES (161, 5, 46);
INSERT INTO public.games VALUES (162, 9, 48);
INSERT INTO public.games VALUES (163, 5, 48);
INSERT INTO public.games VALUES (164, 6, 49);
INSERT INTO public.games VALUES (165, 3, 49);
INSERT INTO public.games VALUES (166, 12, 48);
INSERT INTO public.games VALUES (167, 7, 48);
INSERT INTO public.games VALUES (168, 7, 48);
INSERT INTO public.games VALUES (169, 7, 50);
INSERT INTO public.games VALUES (170, 6, 50);
INSERT INTO public.games VALUES (171, 8, 51);
INSERT INTO public.games VALUES (172, 2, 51);
INSERT INTO public.games VALUES (173, 8, 50);
INSERT INTO public.games VALUES (174, 11, 50);
INSERT INTO public.games VALUES (175, 7, 50);
INSERT INTO public.games VALUES (176, 4, 52);
INSERT INTO public.games VALUES (177, 3, 52);
INSERT INTO public.games VALUES (178, 11, 53);
INSERT INTO public.games VALUES (179, 3, 53);
INSERT INTO public.games VALUES (180, 12, 52);
INSERT INTO public.games VALUES (181, 2, 52);
INSERT INTO public.games VALUES (182, 5, 52);
INSERT INTO public.games VALUES (183, 8, 54);
INSERT INTO public.games VALUES (184, 8, 54);
INSERT INTO public.games VALUES (185, 11, 55);
INSERT INTO public.games VALUES (186, 9, 55);
INSERT INTO public.games VALUES (187, 10, 54);
INSERT INTO public.games VALUES (188, 6, 54);
INSERT INTO public.games VALUES (189, 3, 54);
INSERT INTO public.games VALUES (190, 6, 56);
INSERT INTO public.games VALUES (191, 10, 56);
INSERT INTO public.games VALUES (192, 3, 57);
INSERT INTO public.games VALUES (193, 10, 57);
INSERT INTO public.games VALUES (194, 6, 56);
INSERT INTO public.games VALUES (195, 5, 56);
INSERT INTO public.games VALUES (196, 4, 56);
INSERT INTO public.games VALUES (197, 6, 58);
INSERT INTO public.games VALUES (198, 2, 58);
INSERT INTO public.games VALUES (199, 2, 59);
INSERT INTO public.games VALUES (200, 8, 59);
INSERT INTO public.games VALUES (201, 7, 58);
INSERT INTO public.games VALUES (202, 7, 58);
INSERT INTO public.games VALUES (203, 10, 58);
INSERT INTO public.games VALUES (204, 10, 60);
INSERT INTO public.games VALUES (205, 9, 60);
INSERT INTO public.games VALUES (206, 7, 61);
INSERT INTO public.games VALUES (207, 11, 61);
INSERT INTO public.games VALUES (208, 7, 60);
INSERT INTO public.games VALUES (209, 11, 60);
INSERT INTO public.games VALUES (210, 5, 60);
INSERT INTO public.games VALUES (211, 7, 62);
INSERT INTO public.games VALUES (212, 10, 62);
INSERT INTO public.games VALUES (213, 2, 63);
INSERT INTO public.games VALUES (214, 6, 63);
INSERT INTO public.games VALUES (215, 7, 62);
INSERT INTO public.games VALUES (216, 9, 62);
INSERT INTO public.games VALUES (217, 10, 62);
INSERT INTO public.games VALUES (218, 8, 64);
INSERT INTO public.games VALUES (219, 10, 64);
INSERT INTO public.games VALUES (220, 3, 65);
INSERT INTO public.games VALUES (221, 5, 65);
INSERT INTO public.games VALUES (222, 5, 64);
INSERT INTO public.games VALUES (223, 3, 64);
INSERT INTO public.games VALUES (224, 3, 64);
INSERT INTO public.games VALUES (225, 5, 66);
INSERT INTO public.games VALUES (226, 9, 66);
INSERT INTO public.games VALUES (227, 6, 67);
INSERT INTO public.games VALUES (228, 6, 67);
INSERT INTO public.games VALUES (229, 9, 66);
INSERT INTO public.games VALUES (230, 4, 66);
INSERT INTO public.games VALUES (231, 11, 66);
INSERT INTO public.games VALUES (232, 3, 68);
INSERT INTO public.games VALUES (233, 5, 68);
INSERT INTO public.games VALUES (234, 3, 69);
INSERT INTO public.games VALUES (235, 2, 69);
INSERT INTO public.games VALUES (236, 6, 68);
INSERT INTO public.games VALUES (237, 6, 68);
INSERT INTO public.games VALUES (238, 9, 68);
INSERT INTO public.games VALUES (239, 11, 70);
INSERT INTO public.games VALUES (240, 2, 70);
INSERT INTO public.games VALUES (241, 7, 71);
INSERT INTO public.games VALUES (242, 6, 71);
INSERT INTO public.games VALUES (243, 6, 70);
INSERT INTO public.games VALUES (244, 5, 70);
INSERT INTO public.games VALUES (245, 11, 70);
INSERT INTO public.games VALUES (246, 7, 72);
INSERT INTO public.games VALUES (247, 2, 72);
INSERT INTO public.games VALUES (248, 10, 73);
INSERT INTO public.games VALUES (249, 8, 73);
INSERT INTO public.games VALUES (250, 13, 72);
INSERT INTO public.games VALUES (251, 8, 72);
INSERT INTO public.games VALUES (252, 4, 72);
INSERT INTO public.games VALUES (253, 10, 74);
INSERT INTO public.games VALUES (254, 8, 74);
INSERT INTO public.games VALUES (255, 8, 75);
INSERT INTO public.games VALUES (256, 4, 75);
INSERT INTO public.games VALUES (257, 12, 74);
INSERT INTO public.games VALUES (258, 10, 74);
INSERT INTO public.games VALUES (259, 11, 74);
INSERT INTO public.games VALUES (260, 11, 76);
INSERT INTO public.games VALUES (261, 9, 76);
INSERT INTO public.games VALUES (262, 7, 77);
INSERT INTO public.games VALUES (263, 11, 77);
INSERT INTO public.games VALUES (264, 10, 76);
INSERT INTO public.games VALUES (265, 2, 76);
INSERT INTO public.games VALUES (266, 2, 76);
INSERT INTO public.games VALUES (267, 7, 78);
INSERT INTO public.games VALUES (268, 9, 78);
INSERT INTO public.games VALUES (269, 11, 79);
INSERT INTO public.games VALUES (270, 9, 79);
INSERT INTO public.games VALUES (271, 8, 78);
INSERT INTO public.games VALUES (272, 10, 78);
INSERT INTO public.games VALUES (273, 10, 78);
INSERT INTO public.games VALUES (274, 668, 80);
INSERT INTO public.games VALUES (275, 982, 80);
INSERT INTO public.games VALUES (276, 497, 81);
INSERT INTO public.games VALUES (277, 123, 81);
INSERT INTO public.games VALUES (278, 703, 80);
INSERT INTO public.games VALUES (279, 172, 80);
INSERT INTO public.games VALUES (280, 580, 80);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (80, 'user_1726984149308', 5);
INSERT INTO public.users VALUES (68, 'user_1726984072839', 5);
INSERT INTO public.users VALUES (42, 'user_1726984038960', 5);
INSERT INTO public.users VALUES (40, 'user_1726983957319', 5);
INSERT INTO public.users VALUES (24, 'user_1726983899863', 5);
INSERT INTO public.users VALUES (20, 'user_1726983835378', 5);
INSERT INTO public.users VALUES (12, 'user_1726983777965', 5);
INSERT INTO public.users VALUES (8, 'user_1726983715642', 5);
INSERT INTO public.users VALUES (2, 'Ru', 5);
INSERT INTO public.users VALUES (3, 'user_1726983183821', 5);
INSERT INTO public.users VALUES (4, 'user_1726983183820', 5);
INSERT INTO public.users VALUES (5, 'Gennadii', 5);
INSERT INTO public.users VALUES (6, 'user_1726983607885', 5);
INSERT INTO public.users VALUES (7, 'user_1726983607884', 5);
INSERT INTO public.users VALUES (9, 'user_1726983715641', 5);
INSERT INTO public.users VALUES (10, 'user_1726983766118', 5);
INSERT INTO public.users VALUES (11, 'user_1726983766117', 5);
INSERT INTO public.users VALUES (71, 'user_1726984074937', 5);
INSERT INTO public.users VALUES (73, 'user_1726984077094', 5);
INSERT INTO public.users VALUES (74, 'user_1726984079542', 5);
INSERT INTO public.users VALUES (70, 'user_1726984074938', 5);
INSERT INTO public.users VALUES (76, 'user_1726984081996', 5);
INSERT INTO public.users VALUES (50, 'user_1726984054534', 5);
INSERT INTO public.users VALUES (51, 'user_1726984054533', 5);
INSERT INTO public.users VALUES (48, 'user_1726984052555', 5);
INSERT INTO public.users VALUES (52, 'user_1726984056594', 5);
INSERT INTO public.users VALUES (53, 'user_1726984056593', 5);
INSERT INTO public.users VALUES (13, 'user_1726983777964', 5);
INSERT INTO public.users VALUES (14, 'user_1726983795576', 5);
INSERT INTO public.users VALUES (15, 'user_1726983795575', 5);
INSERT INTO public.users VALUES (16, 'user_1726983802572', 5);
INSERT INTO public.users VALUES (39, 'user_1726983951761', 5);
INSERT INTO public.users VALUES (31, 'user_1726983919047', 5);
INSERT INTO public.users VALUES (32, 'user_1726983923220', 5);
INSERT INTO public.users VALUES (33, 'user_1726983923219', 5);
INSERT INTO public.users VALUES (35, 'user_1726983934285', 5);
INSERT INTO public.users VALUES (37, 'user_1726983943344', 5);
INSERT INTO public.users VALUES (46, 'user_1726984050529', 5);
INSERT INTO public.users VALUES (29, 'user_1726983911679', 5);
INSERT INTO public.users VALUES (30, 'user_1726983919048', 5);
INSERT INTO public.users VALUES (43, 'user_1726984038959', 5);
INSERT INTO public.users VALUES (47, 'user_1726984050528', 5);
INSERT INTO public.users VALUES (49, 'user_1726984052554', 5);
INSERT INTO public.users VALUES (38, 'user_1726983951762', 5);
INSERT INTO public.users VALUES (41, 'user_1726983957318', 5);
INSERT INTO public.users VALUES (45, 'user_1726984045905', 5);
INSERT INTO public.users VALUES (44, 'user_1726984045906', 5);
INSERT INTO public.users VALUES (78, 'user_1726984095297', 5);
INSERT INTO public.users VALUES (81, 'user_1726984149307', 5);
INSERT INTO public.users VALUES (56, 'user_1726984060703', 5);
INSERT INTO public.users VALUES (34, 'user_1726983934286', 5);
INSERT INTO public.users VALUES (17, 'user_1726983802571', 5);
INSERT INTO public.users VALUES (18, 'user_1726983811047', 5);
INSERT INTO public.users VALUES (19, 'user_1726983811046', 5);
INSERT INTO public.users VALUES (21, 'user_1726983835377', 5);
INSERT INTO public.users VALUES (22, 'user_1726983860871', 5);
INSERT INTO public.users VALUES (23, 'user_1726983860870', 5);
INSERT INTO public.users VALUES (25, 'user_1726983899862', 5);
INSERT INTO public.users VALUES (26, 'user_1726983908969', 5);
INSERT INTO public.users VALUES (27, 'user_1726983908968', 5);
INSERT INTO public.users VALUES (28, 'user_1726983911680', 5);
INSERT INTO public.users VALUES (54, 'user_1726984058609', 5);
INSERT INTO public.users VALUES (55, 'user_1726984058608', 5);
INSERT INTO public.users VALUES (57, 'user_1726984060702', 5);
INSERT INTO public.users VALUES (58, 'user_1726984062799', 5);
INSERT INTO public.users VALUES (36, 'user_1726983943345', 5);
INSERT INTO public.users VALUES (69, 'user_1726984072838', 5);
INSERT INTO public.users VALUES (59, 'user_1726984062798', 5);
INSERT INTO public.users VALUES (60, 'user_1726984064842', 5);
INSERT INTO public.users VALUES (61, 'user_1726984064841', 5);
INSERT INTO public.users VALUES (62, 'user_1726984066847', 5);
INSERT INTO public.users VALUES (63, 'user_1726984066846', 5);
INSERT INTO public.users VALUES (64, 'user_1726984068796', 5);
INSERT INTO public.users VALUES (65, 'user_1726984068795', 5);
INSERT INTO public.users VALUES (66, 'user_1726984070843', 5);
INSERT INTO public.users VALUES (67, 'user_1726984070842', 5);
INSERT INTO public.users VALUES (72, 'user_1726984077095', 5);
INSERT INTO public.users VALUES (75, 'user_1726984079541', 5);
INSERT INTO public.users VALUES (77, 'user_1726984081995', 5);
INSERT INTO public.users VALUES (79, 'user_1726984095296', 5);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 280, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 81, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


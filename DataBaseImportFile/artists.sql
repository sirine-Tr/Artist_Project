--
-- PostgreSQL database dump
--

-- Dumped from database version 13.16
-- Dumped by pg_dump version 13.16

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
-- Name: Artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Artists" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    mbid character varying(255),
    url character varying(255),
    image_small character varying(255),
    image character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Artists" OWNER TO postgres;

--
-- Name: Artists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Artists_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Artists_id_seq" OWNER TO postgres;

--
-- Name: Artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Artists_id_seq" OWNED BY public."Artists".id;


--
-- Name: Artists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Artists" ALTER COLUMN id SET DEFAULT nextval('public."Artists_id_seq"'::regclass);


--
-- Data for Name: Artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Artists" (id, name, mbid, url, image_small, image, "createdAt", "updatedAt") FROM stdin;
2	Artist1	001	http://example.com/artist1	http://example.com/artist1_small.jpg	http://example.com/artist1.jpg	2024-09-06 12:36:05.764339+02	2024-09-06 12:36:05.764339+02
3	Artist2	002	http://example.com/artist2	http://example.com/artist2_small.jpg	http://example.com/artist2.jpg	2024-09-06 12:36:05.764339+02	2024-09-06 12:36:05.764339+02
4	Artist3	003	http://example.com/artist3	http://example.com/artist3_small.jpg	http://example.com/artist3.jpg	2024-09-06 12:36:05.764339+02	2024-09-06 12:36:05.764339+02
5	Artist4	004	http://example.com/artist4	http://example.com/artist4_small.jpg	http://example.com/artist4.jpg	2024-09-06 12:36:05.764339+02	2024-09-06 12:36:05.764339+02
6	Artist5	005	http://example.com/artist5	http://example.com/artist5_small.jpg	http://example.com/artist5.jpg	2024-09-06 12:36:05.764339+02	2024-09-06 12:36:05.764339+02
7	Artist6	006	http://example.com/artist6	http://example.com/artist6_small.jpg	http://example.com/artist6.jpg	2024-09-06 12:36:05.764339+02	2024-09-06 12:36:05.764339+02
8	Artist7	007	http://example.com/artist7	http://example.com/artist7_small.jpg	http://example.com/artist7.jpg	2024-09-06 12:36:05.764339+02	2024-09-06 12:36:05.764339+02
\.


--
-- Name: Artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Artists_id_seq"', 8, true);


--
-- Name: Artists Artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Artists"
    ADD CONSTRAINT "Artists_pkey" PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2022-06-24 16:08:37

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 829 (class 1247 OID 16396)
-- Name: gender; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.gender AS ENUM (
    'L',
    'P'
);


ALTER TYPE public.gender OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16453)
-- Name: komen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.komen (
    id integer NOT NULL,
    konten character varying NOT NULL,
    user_id integer NOT NULL,
    postingan_id integer NOT NULL
);


ALTER TABLE public.komen OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16452)
-- Name: komen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.komen ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.komen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 16440)
-- Name: postingan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.postingan (
    id integer NOT NULL,
    judul character varying NOT NULL,
    tanggal_dibuat timestamp without time zone NOT NULL,
    konten text NOT NULL,
    lokasi character varying NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.postingan OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16439)
-- Name: postingan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.postingan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.postingan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 209 (class 1259 OID 16401)
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile (
    id integer NOT NULL,
    gender public.gender NOT NULL,
    no_telp character varying NOT NULL,
    tanggal_lahir date NOT NULL,
    tempat_lahir character varying NOT NULL,
    bio character varying,
    saldo numeric NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.profile OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16404)
-- Name: profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.profile ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 16411)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    nik character varying NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16410)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."user" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3345 (class 0 OID 16453)
-- Dependencies: 216
-- Data for Name: komen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.komen (id, konten, user_id, postingan_id) FROM stdin;
\.


--
-- TOC entry 3343 (class 0 OID 16440)
-- Dependencies: 214
-- Data for Name: postingan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.postingan (id, judul, tanggal_dibuat, konten, lokasi, user_id) FROM stdin;
\.


--
-- TOC entry 3338 (class 0 OID 16401)
-- Dependencies: 209
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile (id, gender, no_telp, tanggal_lahir, tempat_lahir, bio, saldo, user_id) FROM stdin;
\.


--
-- TOC entry 3341 (class 0 OID 16411)
-- Dependencies: 212
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, nik, name, email, password) FROM stdin;
\.


--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 215
-- Name: komen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.komen_id_seq', 1, false);


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 213
-- Name: postingan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.postingan_id_seq', 1, false);


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 210
-- Name: profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_id_seq', 1, false);


--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 211
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- TOC entry 3194 (class 2606 OID 16459)
-- Name: komen komen_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komen
    ADD CONSTRAINT komen_id PRIMARY KEY (id);


--
-- TOC entry 3192 (class 2606 OID 16446)
-- Name: postingan postingan.id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postingan
    ADD CONSTRAINT "postingan.id" PRIMARY KEY (id);


--
-- TOC entry 3183 (class 2606 OID 16431)
-- Name: profile profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_id PRIMARY KEY (id);


--
-- TOC entry 3185 (class 2606 OID 16433)
-- Name: profile profile_user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_user_id UNIQUE (user_id);


--
-- TOC entry 3188 (class 2606 OID 16422)
-- Name: user user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pk PRIMARY KEY (id);


--
-- TOC entry 3190 (class 2606 OID 16417)
-- Name: user user_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_un UNIQUE (id);


--
-- TOC entry 3186 (class 1259 OID 16418)
-- Name: user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_id_idx ON public."user" USING btree (id);


--
-- TOC entry 3197 (class 2606 OID 16460)
-- Name: komen komen_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komen
    ADD CONSTRAINT komen_fk FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 3198 (class 2606 OID 16465)
-- Name: komen komen_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komen
    ADD CONSTRAINT komen_fk_1 FOREIGN KEY (postingan_id) REFERENCES public.postingan(id);


--
-- TOC entry 3196 (class 2606 OID 16447)
-- Name: postingan postingan_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postingan
    ADD CONSTRAINT postingan_fk FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 3195 (class 2606 OID 16434)
-- Name: profile profile_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_fk FOREIGN KEY (user_id) REFERENCES public."user"(id);


-- Completed on 2022-06-24 16:08:38

--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

\restrict roclWk4v6HJQp7fEaYcKFu5fxsitMcl5jOBcFL18vTTYtNPNLtIoeiIRaqcs5Ds

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: availability_slots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.availability_slots (
    availability_id integer NOT NULL,
    resource_id integer NOT NULL,
    day_of_week character varying(9) NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    CONSTRAINT valid_day CHECK (((day_of_week)::text = ANY ((ARRAY['Monday'::character varying, 'Tuesday'::character varying, 'Wednesday'::character varying, 'Thursday'::character varying, 'Friday'::character varying, 'Saturday'::character varying, 'Sunday'::character varying])::text[]))),
    CONSTRAINT valid_time_range CHECK ((start_time < end_time))
);


--
-- Name: availability_slots_availability_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.availability_slots_availability_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: availability_slots_availability_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.availability_slots_availability_id_seq OWNED BY public.availability_slots.availability_id;


--
-- Name: buildings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.buildings (
    building_id integer NOT NULL,
    building_code character varying(20) NOT NULL,
    building_name character varying(150) NOT NULL,
    address character varying(255)
);


--
-- Name: buildings_building_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.buildings_building_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: buildings_building_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.buildings_building_id_seq OWNED BY public.buildings.building_id;


--
-- Name: campus_resources; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.campus_resources (
    resource_id integer NOT NULL,
    category_id integer NOT NULL,
    building_id integer NOT NULL,
    resource_name character varying(150) NOT NULL,
    description text,
    room_number character varying(30),
    appointment_required boolean DEFAULT false NOT NULL
);


--
-- Name: campus_resources_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.campus_resources_resource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: campus_resources_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.campus_resources_resource_id_seq OWNED BY public.campus_resources.resource_id;


--
-- Name: resource_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resource_categories (
    category_id integer NOT NULL,
    category_name character varying(100) NOT NULL,
    description text
);


--
-- Name: resource_categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resource_categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resource_categories_category_id_seq OWNED BY public.resource_categories.category_id;


--
-- Name: study_space_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.study_space_details (
    resource_id integer NOT NULL,
    noise_level character varying(20) NOT NULL,
    seating_capacity integer,
    outlet_count integer DEFAULT 0 NOT NULL,
    group_study_allowed boolean DEFAULT false NOT NULL,
    reservation_required boolean DEFAULT false NOT NULL,
    CONSTRAINT valid_noise_level CHECK (((noise_level)::text = ANY ((ARRAY['Quiet'::character varying, 'Moderate'::character varying, 'Collaborative'::character varying])::text[]))),
    CONSTRAINT valid_outlet_count CHECK ((outlet_count >= 0)),
    CONSTRAINT valid_seating_capacity CHECK ((seating_capacity > 0))
);


--
-- Name: availability_slots availability_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.availability_slots ALTER COLUMN availability_id SET DEFAULT nextval('public.availability_slots_availability_id_seq'::regclass);


--
-- Name: buildings building_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.buildings ALTER COLUMN building_id SET DEFAULT nextval('public.buildings_building_id_seq'::regclass);


--
-- Name: campus_resources resource_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.campus_resources ALTER COLUMN resource_id SET DEFAULT nextval('public.campus_resources_resource_id_seq'::regclass);


--
-- Name: resource_categories category_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_categories ALTER COLUMN category_id SET DEFAULT nextval('public.resource_categories_category_id_seq'::regclass);


--
-- Data for Name: availability_slots; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.availability_slots (availability_id, resource_id, day_of_week, start_time, end_time) FROM stdin;
1	1	Monday	08:00:00	20:00:00
2	2	Monday	09:00:00	18:00:00
3	3	Monday	10:00:00	16:00:00
4	4	Monday	09:00:00	16:00:00
5	5	Monday	09:00:00	16:00:00
6	1	Tuesday	08:00:00	20:00:00
7	2	Tuesday	09:00:00	18:00:00
8	3	Tuesday	10:00:00	16:00:00
9	4	Tuesday	09:00:00	16:00:00
10	5	Tuesday	09:00:00	16:00:00
11	1	Wednesday	08:00:00	20:00:00
12	2	Wednesday	09:00:00	18:00:00
13	3	Wednesday	10:00:00	16:00:00
14	4	Wednesday	09:00:00	16:00:00
15	5	Wednesday	09:00:00	16:00:00
16	1	Thursday	08:00:00	20:00:00
17	2	Thursday	09:00:00	18:00:00
18	3	Thursday	10:00:00	16:00:00
19	4	Thursday	09:00:00	16:00:00
20	5	Thursday	09:00:00	16:00:00
21	1	Friday	08:00:00	18:00:00
22	2	Friday	09:00:00	17:00:00
23	3	Friday	10:00:00	15:00:00
24	4	Friday	09:00:00	15:00:00
25	5	Friday	09:00:00	15:00:00
\.


--
-- Data for Name: buildings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.buildings (building_id, building_code, building_name, address) FROM stdin;
1	LL	Love Library	SDSU campus
2	SSW	Student Services West	SDSU campus
3	CAL	Calpulli Center	SDSU campus
\.


--
-- Data for Name: campus_resources; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.campus_resources (resource_id, category_id, building_id, resource_name, description, room_number, appointment_required) FROM stdin;
1	1	1	Library Quiet Study Area	A quiet area for individual studying.	Third Floor	f
2	1	1	Library Group Study Area	A collaborative space for student groups.	Second Floor	f
3	2	1	Writing Center	Writing assistance for SDSU students.	Library	f
4	2	2	Academic Advising Center	General academic advising assistance.	\N	t
5	3	3	Basic Needs Center	Information and support for basic student needs.	Third floor, Calpuli centre	f
\.


--
-- Data for Name: resource_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.resource_categories (category_id, category_name, description) FROM stdin;
1	Study Spaces	Quiet and group study locations
2	Academic Support	Academic advising and learning support
3	Student Services	Services that support student needs
\.


--
-- Data for Name: study_space_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.study_space_details (resource_id, noise_level, seating_capacity, outlet_count, group_study_allowed, reservation_required) FROM stdin;
1	Quiet	40	20	f	f
2	Collaborative	30	12	t	f
\.


--
-- Name: availability_slots_availability_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.availability_slots_availability_id_seq', 25, true);


--
-- Name: buildings_building_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.buildings_building_id_seq', 3, true);


--
-- Name: campus_resources_resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.campus_resources_resource_id_seq', 6, true);


--
-- Name: resource_categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.resource_categories_category_id_seq', 3, true);


--
-- Name: availability_slots availability_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.availability_slots
    ADD CONSTRAINT availability_slots_pkey PRIMARY KEY (availability_id);


--
-- Name: buildings buildings_building_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.buildings
    ADD CONSTRAINT buildings_building_code_key UNIQUE (building_code);


--
-- Name: buildings buildings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.buildings
    ADD CONSTRAINT buildings_pkey PRIMARY KEY (building_id);


--
-- Name: campus_resources campus_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.campus_resources
    ADD CONSTRAINT campus_resources_pkey PRIMARY KEY (resource_id);


--
-- Name: resource_categories resource_categories_category_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_categories
    ADD CONSTRAINT resource_categories_category_name_key UNIQUE (category_name);


--
-- Name: resource_categories resource_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_categories
    ADD CONSTRAINT resource_categories_pkey PRIMARY KEY (category_id);


--
-- Name: study_space_details study_space_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.study_space_details
    ADD CONSTRAINT study_space_details_pkey PRIMARY KEY (resource_id);


--
-- Name: campus_resources unique_resource_location; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.campus_resources
    ADD CONSTRAINT unique_resource_location UNIQUE (resource_name, building_id);


--
-- Name: availability_slots fk_availability_resource; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.availability_slots
    ADD CONSTRAINT fk_availability_resource FOREIGN KEY (resource_id) REFERENCES public.campus_resources(resource_id) ON DELETE CASCADE;


--
-- Name: campus_resources fk_resource_building; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.campus_resources
    ADD CONSTRAINT fk_resource_building FOREIGN KEY (building_id) REFERENCES public.buildings(building_id);


--
-- Name: campus_resources fk_resource_category; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.campus_resources
    ADD CONSTRAINT fk_resource_category FOREIGN KEY (category_id) REFERENCES public.resource_categories(category_id);


--
-- Name: study_space_details fk_study_space_resource; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.study_space_details
    ADD CONSTRAINT fk_study_space_resource FOREIGN KEY (resource_id) REFERENCES public.campus_resources(resource_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict roclWk4v6HJQp7fEaYcKFu5fxsitMcl5jOBcFL18vTTYtNPNLtIoeiIRaqcs5Ds


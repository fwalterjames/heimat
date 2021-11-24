
-- real_estate data dump


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
-- Name: agencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agencies (
    agency_id integer NOT NULL,
    agency_name text NOT NULL,
    phone character varying(20),
    address character varying(60)
);


ALTER TABLE public.agencies OWNER TO postgres;

--
-- Name: agencies_agency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agencies_agency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agencies_agency_id_seq OWNER TO postgres;

--
-- Name: agencies_agency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agencies_agency_id_seq OWNED BY public.agencies.agency_id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    client_id integer NOT NULL,
    buyer boolean NOT NULL,
    renter boolean NOT NULL,
    household_income integer NOT NULL,
    last_name character varying(50),
    first_name character varying(20),
    desired_property_id integer
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: clients_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_client_id_seq OWNER TO postgres;

--
-- Name: clients_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_client_id_seq OWNED BY public.clients.client_id;


--
-- Name: owners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.owners (
    owner_id integer NOT NULL,
    owner_name text NOT NULL,
    owner_phone character varying(25),
    owner_email character varying(55),
    property_id integer
);


ALTER TABLE public.owners OWNER TO postgres;

--
-- Name: owners_owner_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.owners_owner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.owners_owner_id_seq OWNER TO postgres;

--
-- Name: owners_owner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.owners_owner_id_seq OWNED BY public.owners.owner_id;


--
-- Name: properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.properties (
    property_id integer NOT NULL,
    features text,
    property_type text NOT NULL,
    pet_friendly boolean NOT NULL,
    bedroom_amt integer NOT NULL,
    bathroom_amt integer NOT NULL,
    school_district_rank integer,
    postal_code integer NOT NULL,
    year_built date,
    list_price money,
    owner_id integer,
    realtor_id integer,
    square_ft integer
);


ALTER TABLE public.properties OWNER TO postgres;

--
-- Name: properties_property_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.properties_property_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.properties_property_id_seq OWNER TO postgres;

--
-- Name: properties_property_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.properties_property_id_seq OWNED BY public.properties.property_id;


--
-- Name: realtors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realtors (
    agent_id integer NOT NULL,
    last_name text NOT NULL,
    first_name text NOT NULL,
    agency_id integer NOT NULL
);


ALTER TABLE public.realtors OWNER TO postgres;

--
-- Name: realtors_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.realtors_agent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.realtors_agent_id_seq OWNER TO postgres;

--
-- Name: realtors_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.realtors_agent_id_seq OWNED BY public.realtors.agent_id;


--
-- Name: agencies agency_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agencies ALTER COLUMN agency_id SET DEFAULT nextval('public.agencies_agency_id_seq'::regclass);


--
-- Name: clients client_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN client_id SET DEFAULT nextval('public.clients_client_id_seq'::regclass);


--
-- Name: owners owner_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners ALTER COLUMN owner_id SET DEFAULT nextval('public.owners_owner_id_seq'::regclass);


--
-- Name: properties property_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties ALTER COLUMN property_id SET DEFAULT nextval('public.properties_property_id_seq'::regclass);


--
-- Name: realtors agent_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realtors ALTER COLUMN agent_id SET DEFAULT nextval('public.realtors_agent_id_seq'::regclass);


--
-- Data for Name: agencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agencies (agency_id, agency_name, phone, address) FROM stdin;
3	Maximum Realty	9945559090	23 Rosecrantz Ave, North Hill, CA 91942
4	Melinda and Associates	9945552223	109 Pasadena Rd, Coronado, CA 92025
5	Whitman, Whitman and Pearl	9085551432	55 Wilshire RD, Beton Hill, CA 92025
6	Century 21	9085553021	808 Inglewood St, San Diego, CA 90078
7	Made to Sell	2215559026	355 Sea Breeze Ave, Chula Vista, CA 90099
8	SoCal Places	6885559026	18 High Valley Rd, Grant Mountain, CA 99993
9	Das Alle Wohnung Company	9895550001	7608 Blue Crest Way Suite A, San Diego, CA 98989
10	Votre Maison Realty	7785556458	11 Crested Wave Rd Suite C, San Diego, CA 93366
11	Huis and Bedrijf LLC	6095551117	615 Henderson Street Suite H, National City, CA 93399
12	Song Realtors	9085554455	12 Schenken Ave Suite 12B, Escondido, CA 99008
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (client_id, buyer, renter, household_income, last_name, first_name, desired_property_id) FROM stdin;
1	f	t	85000	Stack	Aaron	27
2	f	t	45000	Destine	Ada	62
3	t	f	121000	Warlock	Adam	55
4	t	f	90000	Rollins	Trey	29
5	t	f	50000	Harkness	Agatha	30
6	f	t	65000	Lan	Gabriel	12
7	f	t	165000	Cleary	Albert	60
8	t	f	300000	Masters	Olivia	4
9	t	f	1300000	Cho	Amadeus	54
10	f	t	700000	Maker	Calvin	49
11	f	t	55000	Strongbow	Jason	30
12	f	t	87000	Ichiki	Hisako	30
27	f	t	63000	Braddock	Betsy	81
13	f	t	99000	Lang	Scott	2
14	t	f	199000	Pym	Hank	28
15	t	f	2199000	Odinsdottir	Aldrif	55
28	f	t	63000	Danvers	Carol	63
16	t	f	6199000	Worthington	Warren	71
18	f	t	38000	Rourke	Theresa	61
29	t	f	100000	Rogers	Steve	72
19	f	t	60000	Mordo	Karl	58
20	f	t	68000	Zemo	Helmut	60
21	f	t	77000	Jenkins	Abner	60
22	f	t	70000	Romanoff	Natasha	77
23	f	t	90000	Cassidy	Tom	78
24	f	t	69000	Belova	Yelena	82
25	f	t	85000	Grey	Nate	81
26	f	t	45200	Walker	Christian	80
30	t	f	1100000	Xavier	Charles	71
31	t	f	90000	Barton	Clint	73
32	t	f	100000	Wing	Colleen	74
33	t	f	190000	Unuscione	Carmella	74
34	t	f	799000	Rand	Danny	28
35	t	f	99000	Gray	Dorian	29
36	t	f	1899000	Milaje	Dora	30
37	f	t	87000	Ktor	Dargo	45
38	f	t	82000	Samson	Doc	43
39	f	t	92000	Moonstar	Dani	44
40	f	t	52000	Brock	Eddie	41
41	f	t	72000	Frost	Emma	40
42	f	t	72000	Jarvis	Edwin	45
43	f	t	92000	Stane	Ezekiel	44
44	f	t	44000	Wiggin	Ender	75
45	f	t	64000	Lushton	Sylvie	81
46	f	t	66000	Bloodstone	Else	68
47	f	t	68000	Kaifi	Bloodstone	70
48	f	t	71000	Cortes	Fabian	47
49	f	t	73000	Hardy	Felicia	2
64	f	t	47000	Summers	Hope	52
50	f	t	82000	Wilson	Sam	3
51	f	t	87000	Storm	Franklin	10
52	f	t	90000	Ebersol	Paul	12
53	f	t	93000	Potter	Melvon	13
54	f	t	93000	Green	Joseph	11
55	f	t	59000	Osborn	Barry	14
56	f	t	61000	Christians	Isa	15
57	f	t	64000	Stacy	Gwen	17
65	f	t	48000	TheDucK	Howard	70
58	f	t	67000	Sailors	Gene	18
59	f	t	79000	Talbot	Gale	5
60	f	t	63000	Kinney	Gabrielle	5
61	f	t	70000	Walker	Patsy	8
62	f	t	94000	Banner	Bruce	38
63	f	t	43000	Bishop	Kate	43
66	f	t	49000	Borne	Robin	75
77	t	f	122000	Parker	Peter	22
67	f	t	50000	Carpenter	Julie	15
68	f	t	51000	Jones	Jessica	59
69	f	t	59000	Grey	Jean	49
70	f	t	79000	Woo	Jimmy	43
71	f	t	77000	Dane	Lorna	44
72	f	t	57000	Pierre	Lucky	44
73	f	t	59000	Snow	Luna	17
74	f	t	51000	Coulson	Phil	18
75	t	f	100000	Quire	Quentin	21
76	t	f	199000	Stark	Tony	20
78	t	f	205000	Summers	Scott	23
79	t	f	400000	Black	Carmilla	24
80	t	f	330000	Castle	Frank	30
81	t	f	308000	Shaw	Sebastian	34
82	t	f	308000	Shaw	Sebastian	32
83	t	f	98900	Diego	Donna	23
84	t	f	92900	Langkowski	Walter	22
87	t	f	79900	Carter	Peggy	29
85	t	f	82900	Quill	Peter	26
86	t	f	85600	Monroe	Ororo	27
88	t	f	99900	Delgado	Susan	37
89	t	f	2999000	Okonwo	Tchalla	36
90	t	f	81000	Ross	Thaddeus	71
91	t	f	91000	Falsworth	Montgomery	25
92	t	f	89000	Porter	Telford	71
93	f	t	33000	Stryker	William	76
94	f	t	53000	Demara	Rita	63
95	f	t	60000	Parrington	Samantha	60
17	t	f	88000	Halloway	Thomas	55
\.


--
-- Data for Name: owners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.owners (owner_id, owner_name, owner_phone, owner_email, property_id) FROM stdin;
2	Peter Abelard	4425552312	pabel@bmail.com	\N
3	Mary Astel	4425559977	astelpalace@bmail.com	\N
4	Aristotle Lopez	6525550099	astelpalace@bmail.com	\N
5	Karl Rahner	6195553422	rahner1984@koolmail.com	\N
6	Erwin Schrodinger	7095551010	foreshadownger60@koolmail.com	\N
7	Timon Philius	7095557768	timonmyside@earlymail.com	\N
8	Leo Tolstoy	9905552131	pilsburytolstoy@bmail.com	\N
9	Hermann Ulrici	8825552303	derlogicmann@bmail.com	\N
10	Samuel Butler	2125550004	butlers560@earlymail.com	\N
11	John Calvin	8185559066	jcalvin@koolmail.com	\N
12	Rudolf Carnap	2135551113	carnapthegreat@koolmail.com	\N
13	Cheng Hao	3115558007	outsidedao@dualmail.com	\N
14	Angela Davis	2125551944	yvonnedavis@bmail.com	\N
15	Fyodor Dostoevsky	9895551864	notesevsky81@earlymail.com	\N
16	Robert Fludd	7765553433	astrofludd74@herrmail.com	\N
17	Pope Gregory	6665552217	firstgreatgreg@holymail.com	\N
18	Dorothy Wrinch	2225556533	mathmaudwrinch@bmail.com	\N
19	James Ward Holdings	8825552109	properties@jwholdings.com	\N
20	Hao Wang Estate Group	3225558766	estates@hwgrp.com	\N
21	Alfred Tarski Investments	9195553322	inquiries@tarskiinvestments.com	\N
22	The Rosa Luxemburg Community Land Firm	9095554442	realestate@rllandfirm.com	\N
23	The Novalis Company	2225550194	holdings@novalis.com	\N
\.


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.properties (property_id, features, property_type, pet_friendly, bedroom_amt, bathroom_amt, school_district_rank, postal_code, year_built, list_price, owner_id, realtor_id, square_ft) FROM stdin;
1	central air, hardwood floors, electric stove	single-family home	t	4	3	4	90210	2006-02-01	$800,000.99	8	4	\N
42	shared laundry	two-family home	t	1	1	3	98799	2000-10-01	$1,690.00	7	20	\N
44	shared laundry	two-family home	t	1	1	3	98799	2000-10-01	$1,900.00	8	5	\N
23	smart appliances, walk-in closets, hardwood floors, solar panels, swimming pool, jacuzzi, washer-dryer	single-family home	t	4	3	4	90213	2017-03-01	$950,000.00	11	7	\N
26	walk-in closets, hardwood floor, washer-dryer	single-family home	t	3	3	3	91187	2005-10-01	$788,000.00	16	9	\N
25	smart appliances, walk-in closets, hardwood floor, electric car charging station, washer-dryer	single-family home	t	2	2	3	99888	2008-11-01	$1,275,000.00	2	13	\N
5	walk-in closet, patio/balcony, shared laundry	two-family home	f	2	1	3	90990	2008-10-01	$1,890.00	6	5	\N
54	security system, hardwood floors, two-car garage	single-family home	t	3	2	5	92193	2004-12-01	$2,950,000.00	20	8	2000
55	security system, hardwood floors, two-car garage, gated property	single-family home	t	3	2	5	92193	2005-10-01	$999,975.00	15	27	\N
53	security system, hardwood floors, two-car garage	single-family home	t	2	2	5	92193	2004-12-01	$2,800,000.00	14	2	\N
13	off-site parking, oil heating	apartment	t	3	2	5	90210	2019-01-01	$2,600.00	23	7	650
21	smart appliances, walk-in closets, solar panels, swimming pool, jacuzzi	single-family home	t	3	2	5	90214	2017-03-01	$999,940.00	22	3	3500
4	smart appliances, electric heating, fully carpeted	single-family home	t	5	5	4	90222	2012-08-01	$1,900,000.00	6	22	\N
43	shared laundry	two-family home	t	1	1	3	98799	2000-10-01	$1,798.00	7	21	\N
56	security system, hardwood floors, two-car garage, gated property	single-family home	t	4	4	3	92193	2005-10-01	$1,150,000.00	20	8	2000
30	central air-conditioning, carpets	single-family home	t	2	2	2	91181	2016-01-01	$500,000.00	13	26	\N
24	smart appliances, walk-in closets, hardwood floor, electric car charging station, washer-dryer	single-family home	t	3	2	4	99888	2017-03-01	$875,000.00	20	8	2000
28	central air-conditioning, hardwood floor, washer-dryer	single-family home	t	3	2	2	91182	2012-10-01	$750,000.00	21	14	3000
27	electric stove, central air-conditioning, hardwood floor, washer-dryer	single-family home	t	3	2	2	91182	2005-10-01	$600,750.00	21	2	3000
20	smart appliances, walk-in closets, solar panels, robot butler	single-family home	t	4	3	5	90214	2017-03-01	$2,100,000.00	22	9	3500
29	central air-conditioning, hardwood floor, washer-dryer	single-family home	t	2	2	2	91181	2011-01-01	$610,000.00	23	18	4000
19	smart appliances, walk-in closets, solar panels	single-family home	t	3	3	5	90214	2017-03-01	$1,200,000.00	8	35	\N
39	shared laundry, community pool, dishwasher	two-family home	f	2	2	4	99920	1988-07-01	$1,075.00	11	13	\N
40	shared laundry, community pool, dishwasher, shared patio	two-family home	f	3	2	4	99920	1992-08-01	$1,100.00	3	15	\N
8	off-site parking, hardwood floors, balcony	apartment	t	2	1	4	90919	2011-05-01	$2,100.00	18	31	650
3	hardwood floors, electric heating, on-site parking	apartment	f	2	2	2	91190	1988-01-01	$1,275.00	5	13	750
45	shared laundry, on-site parking	two-family home	t	2	1	3	98919	2002-09-01	$1,800.00	8	24	\N
38	shared laundry, community pool, dishwasher	two-family home	f	2	2	4	99920	1988-07-01	$1,050.00	11	16	\N
51	shared laundry, off-site parking	apartment	f	1	1	4	92193	2000-03-01	$1,800.00	21	23	750
12	on-site parking, fitness center, community swimming pool	apartment	t	2	1	3	92104	2013-07-01	$1,655.00	4	29	650
58	shared laundry, on-site parking	apartment	f	2	1	3	90091	2003-08-01	$2,000.00	20	8	750
50	hardwood floors, smart appliances, washer-dryer, on-site parking	apartment	t	2	2	4	92194	2013-07-01	$3,075.00	20	8	650
15	on-site parking, maid service, oil heating	apartment	t	3	3	5	90210	2019-01-01	$3,000.00	22	29	650
41	shared laundry, community pool, dishwasher, shared patio	two-family home	f	3	3	4	99925	1997-02-01	$980.00	4	18	\N
14	off-site parking, oil heating	apartment	t	1	1	5	90210	2019-01-01	$2,050.00	23	6	650
46	hardwood floors, washer-dryer, on-site parking	apartment	t	2	1	3	92199	2010-03-01	$2,250.00	9	17	650
22	smart appliances, walk-in closets, hardwood floors, solar panels, swimming pool	single-family home	t	5	4	5	90214	2017-03-01	$2,800,000.00	17	10	\N
18	near city center, microwave included, hardwood floors	townhouse	f	3	1	2	90009	1997-09-01	$1,500.00	7	33	\N
52	shared laundry, off-site parking	apartment	f	2	2	4	92193	2000-03-01	$2,050.00	20	25	750
16	near city center, microwave included, dishwasher, garbage disposal	townhouse	f	2	1	2	90009	1997-09-01	$1,300.00	5	33	\N
17	near city center, microwave included, hardwood floors	townhouse	f	1	1	2	90009	1997-09-01	$1,200.00	6	33	\N
60	shared laundry, on-site parking	apartment	f	3	2	3	90091	2003-08-01	$2,379.00	20	8	750
47	hardwood floors, washer-dryer, on-site parking	apartment	t	2	2	3	92199	2010-03-01	$2,760.00	3	17	650
76	newly-renovated, washer-dryer hookups, fully carpeted	apartment	t	2	1	3	90001	2011-05-25	$2,700.00	20	8	650
78	newly-renovated, washer-dryer hookups, fully carpeted	apartment	t	2	1	3	90001	2011-05-25	$1,900.00	20	8	650
72	marble floors, granite counters, olympic pool	single-family home	t	6	5	4	90009	2005-04-21	$3,200,000.00	23	32	4000
36	first floor, corner space, large windows	office space	f	0	2	0	90210	2011-03-01	$5,100.00	19	16	\N
71	marble floors, granite counters	single-family home	f	5	5	4	90009	2005-04-09	$3,000,000.00	23	31	4000
7	tenth floor space, elevators	office space	f	0	4	0	90911	1999-09-01	$7,500.00	19	12	\N
37	first floor, corner space, large windows	office space	f	0	3	0	90210	2011-03-01	$6,400.00	19	17	\N
48	hardwood floors, smart appliances, penthouse, washer-dryer, on-site parking	apartment	t	3	2	3	92199	2010-03-01	$4,100.00	20	22	650
79	newly-renovated, washer-dryer hookups, fully carpeted	apartment	t	2	2	3	90001	2011-05-25	$2,700.00	9	26	650
11	central air-conditioning,	apartment	t	1	1	3	92100	2007-11-01	$1,550.00	23	6	650
77	newly-renovated, washer-dryer hookups, fully carpeted	apartment	t	1	1	3	90001	2011-05-25	$1,400.00	20	11	650
9	electric stove, maid service, hardwood floors, fitness center	apartment	t	2	2	5	92199	2021-05-01	$3,200.00	23	26	650
32	corner space, sixth floor, elevators	office space	f	0	2	0	91180	2009-06-01	$7,700.00	19	12	\N
35	first floor	office space	f	0	2	0	90210	2011-03-01	$4,900.00	19	12	\N
70	walk-in closet, on-site parking	apartment	t	2	2	3	98873	1992-01-01	$1,100.00	23	26	650
80	gated complex, on-site parking, guest parking	apartment	t	2	2	3	90888	2007-06-19	$2,600.00	23	26	650
31	corner space, tenth floor, elevators	office space	f	0	0	4	91180	2009-06-01	$5,600.00	19	12	\N
65	shared laundry, studio, on-site parking	apartment	f	0	1	3	90991	2016-07-01	$1,070.00	22	22	750
66	shared laundry, shared patio, off-site parking	apartment	f	1	1	2	92333	2015-11-01	$950.00	22	22	750
33	corner space, sixth floor, elevators	office space	f	0	1	0	91180	2009-06-01	$7,200.00	19	15	\N
81	gated complex, on-site parking, guest parking	apartment	t	3	2	3	90888	2007-06-19	$3,000.00	23	26	650
82	gated complex, on-site parking, guest parking	apartment	t	2	2	3	90888	2007-06-19	$2,000.00	23	26	650
67	shared laundry, shared patio, off-site parking	apartment	f	2	1	2	92333	2015-11-01	$1,000.00	22	22	750
68	shared laundry, shared patio, off-site parking	apartment	f	2	2	2	92333	2015-11-01	$1,220.00	22	22	750
57	second floor	office space	f	0	4	3	92990	1977-03-01	$7,000.00	21	2	\N
61	shared laundry, on-site parking	apartment	f	1	1	3	90091	2003-08-01	$1,679.00	21	28	750
49	hardwood floors, smart appliances, penthouse, washer-dryer, on-site parking	apartment	t	3	2	3	92194	2013-07-01	$3,600.00	20	8	650
75	panic room, smart appliances, two-car garage, jacuzzi	apartment	t	2	1	3	90001	2011-05-25	$2,200.00	12	35	650
73	marble floors, granite counters, smart appliances, three-car garage	single-family home	t	3	3	4	90009	2005-04-21	$1,900,000.00	10	33	2000
74	panic room, smart appliances, two-car garage, jacuzzi	single-family home	t	2	2	4	90002	2002-01-30	$1,900,000.00	11	34	2000
2	fitness center, oil heating, washer-dryer	townhouse	f	2	1	3	90299	1998-04-01	$2,400.00	20	33	\N
6	second-floor, elevators	office space	f	0	2	0	90911	1999-09-01	$6,000.00	6	20	\N
34	corner space, sixth floor, elevators	office space	f	0	4	0	91180	2009-06-01	$8,200.00	2	31	\N
69	washer-dryer, on-site parking	apartment	f	2	2	3	98873	2000-10-01	$975.00	22	30	750
10	washer-dryer, microwave included, hardwood floors	apartment	f	2	1	4	92100	1999-12-01	$2,200.00	23	26	750
59	shared laundry, on-site parking	apartment	f	2	2	3	90091	2003-08-01	$2,250.00	23	26	750
62	shared laundry, on-site parking	apartment	f	1	2	3	90091	2003-08-01	$1,700.00	21	2	750
63	shared laundry, studio, on-site parking	apartment	f	0	1	3	90091	2003-08-01	$1,400.00	21	2	750
64	shared laundry, studio, on-site parking	apartment	f	0	1	3	90091	2003-08-01	$1,260.00	21	2	750
\.


--
-- Data for Name: realtors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realtors (agent_id, last_name, first_name, agency_id) FROM stdin;
2	Stark	Aregelle	3
3	Baelish	Petr	3
4	Frey	Walder	3
5	Codd	Dagon	3
6	Dondarrion	Beric	3
7	Stark	Ellard	3
8	Prester	Forley	4
9	Templton	Gerold	4
10	Stark	Arya	4
11	Oakheart	Arys	4
12	Dustin	Barbry	5
13	King	Grey	5
14	Harte	Hazel	5
15	Bulwer	Jack	5
16	Targaryen	Jaehaera	5
17	Rivers	Jeyne	5
18	Longstrider	Lomas	5
19	Drumm	Hulmar	6
20	Tyrell	Leona	6
21	Long	Lew	7
22	Myles	Toyne	7
23	Sand	Nymeria	7
24	Martell	Qoren	8
25	Peake	Laswell	8
26	Harper	Hamish	8
27	Swann	Clifford	8
28	Coldhands	Mr.	8
29	Frey	Perra	9
30	Leek	Rufus	9
31	Tully	Prentys	9
32	Velaryon	Rhogar	9
33	Fossoway	Steffon	10
34	Lannister	Tybolt	11
35	Lannister	Jaime	11
36	Whent	Walter	12
\.


--
-- Name: agencies_agency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agencies_agency_id_seq', 12, true);


--
-- Name: clients_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_client_id_seq', 95, true);


--
-- Name: owners_owner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.owners_owner_id_seq', 23, true);


--
-- Name: properties_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.properties_property_id_seq', 82, true);


--
-- Name: realtors_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.realtors_agent_id_seq', 37, true);


--
-- Name: agencies agencies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agencies
    ADD CONSTRAINT agencies_pkey PRIMARY KEY (agency_id);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (client_id);


--
-- Name: owners owners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (owner_id);


--
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (property_id);


--
-- Name: realtors realtors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realtors
    ADD CONSTRAINT realtors_pkey PRIMARY KEY (agent_id);


--
-- Name: clients fk_clients_properties; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT fk_clients_properties FOREIGN KEY (desired_property_id) REFERENCES public.properties(property_id);


--
-- Name: owners fk_owners_properties; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT fk_owners_properties FOREIGN KEY (property_id) REFERENCES public.properties(property_id);


--
-- Name: properties fk_properties_owners; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT fk_properties_owners FOREIGN KEY (owner_id) REFERENCES public.owners(owner_id);


--
-- Name: properties fk_properties_realtors; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT fk_properties_realtors FOREIGN KEY (realtor_id) REFERENCES public.realtors(agent_id);


--
-- Name: realtors fk_realtors_agencies; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realtors
    ADD CONSTRAINT fk_realtors_agencies FOREIGN KEY (agency_id) REFERENCES public.agencies(agency_id);


--
-- PostgreSQL database dump complete
--


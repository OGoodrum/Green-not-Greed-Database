--
-- PostgreSQL database dump
--

-- Dumped from database version 10.23 (Ubuntu 10.23-0ubuntu0.18.04.2+esm1)
-- Dumped by pg_dump version 14.10 (Ubuntu 14.10-0ubuntu0.22.04.1)

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

--
-- Name: campaign; Type: TABLE; Schema: public; Owner: c370_s166
--

CREATE TABLE public.campaign (
    campaignid integer NOT NULL,
    name character(50),
    startdate date,
    enddate date
);


ALTER TABLE public.campaign OWNER TO c370_s166;

--
-- Name: campaign_campaignid_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.campaign_campaignid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campaign_campaignid_seq OWNER TO c370_s166;

--
-- Name: campaign_campaignid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.campaign_campaignid_seq OWNED BY public.campaign.campaignid;


--
-- Name: cost; Type: TABLE; Schema: public; Owner: c370_s166
--

CREATE TABLE public.cost (
    fund integer NOT NULL,
    campaign integer NOT NULL
);


ALTER TABLE public.cost OWNER TO c370_s166;

--
-- Name: cost_campaign_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.cost_campaign_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cost_campaign_seq OWNER TO c370_s166;

--
-- Name: cost_campaign_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.cost_campaign_seq OWNED BY public.cost.campaign;


--
-- Name: cost_fund_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.cost_fund_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cost_fund_seq OWNER TO c370_s166;

--
-- Name: cost_fund_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.cost_fund_seq OWNED BY public.cost.fund;


--
-- Name: donor; Type: TABLE; Schema: public; Owner: c370_s166
--

CREATE TABLE public.donor (
    donorid integer NOT NULL,
    name character(40)
);


ALTER TABLE public.donor OWNER TO c370_s166;

--
-- Name: donor_donorid_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.donor_donorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.donor_donorid_seq OWNER TO c370_s166;

--
-- Name: donor_donorid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.donor_donorid_seq OWNED BY public.donor.donorid;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: c370_s166
--

CREATE TABLE public.employee (
    employeeid integer NOT NULL,
    name character(30),
    title character(30),
    salary real,
    CONSTRAINT employee_salary_check CHECK ((salary >= (0)::double precision))
);


ALTER TABLE public.employee OWNER TO c370_s166;

--
-- Name: employee_employeeid_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.employee_employeeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_employeeid_seq OWNER TO c370_s166;

--
-- Name: employee_employeeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.employee_employeeid_seq OWNED BY public.employee.employeeid;


--
-- Name: event; Type: TABLE; Schema: public; Owner: c370_s166
--

CREATE TABLE public.event (
    campaignid integer NOT NULL,
    date date NOT NULL,
    location character(30) NOT NULL,
    starttime time without time zone,
    endtime time without time zone
);


ALTER TABLE public.event OWNER TO c370_s166;

--
-- Name: event_campaignid_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.event_campaignid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_campaignid_seq OWNER TO c370_s166;

--
-- Name: event_campaignid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.event_campaignid_seq OWNED BY public.event.campaignid;


--
-- Name: fund; Type: TABLE; Schema: public; Owner: c370_s166
--

CREATE TABLE public.fund (
    fundid integer NOT NULL,
    date date,
    "time" time without time zone,
    amount real
);


ALTER TABLE public.fund OWNER TO c370_s166;

--
-- Name: fund_fundid_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.fund_fundid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fund_fundid_seq OWNER TO c370_s166;

--
-- Name: fund_fundid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.fund_fundid_seq OWNED BY public.fund.fundid;


--
-- Name: fundraised; Type: TABLE; Schema: public; Owner: c370_s166
--

CREATE TABLE public.fundraised (
    fund integer NOT NULL,
    campaign integer NOT NULL
);


ALTER TABLE public.fundraised OWNER TO c370_s166;

--
-- Name: fundraised_campaign_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.fundraised_campaign_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fundraised_campaign_seq OWNER TO c370_s166;

--
-- Name: fundraised_campaign_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.fundraised_campaign_seq OWNED BY public.fundraised.campaign;


--
-- Name: fundraised_fund_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.fundraised_fund_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fundraised_fund_seq OWNER TO c370_s166;

--
-- Name: fundraised_fund_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.fundraised_fund_seq OWNED BY public.fundraised.fund;


--
-- Name: givesto; Type: TABLE; Schema: public; Owner: c370_s166
--

CREATE TABLE public.givesto (
    donor integer NOT NULL,
    fund integer NOT NULL
);


ALTER TABLE public.givesto OWNER TO c370_s166;

--
-- Name: givesto_donor_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.givesto_donor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.givesto_donor_seq OWNER TO c370_s166;

--
-- Name: givesto_donor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.givesto_donor_seq OWNED BY public.givesto.donor;


--
-- Name: givesto_fund_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.givesto_fund_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.givesto_fund_seq OWNER TO c370_s166;

--
-- Name: givesto_fund_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.givesto_fund_seq OWNED BY public.givesto.fund;


--
-- Name: member; Type: TABLE; Schema: public; Owner: c370_s166
--

CREATE TABLE public.member (
    memberid integer NOT NULL,
    name character(40)
);


ALTER TABLE public.member OWNER TO c370_s166;

--
-- Name: member_memberid_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.member_memberid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_memberid_seq OWNER TO c370_s166;

--
-- Name: member_memberid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.member_memberid_seq OWNED BY public.member.memberid;


--
-- Name: office; Type: TABLE; Schema: public; Owner: c370_s166
--

CREATE TABLE public.office (
    address character(50) NOT NULL,
    rent real
);


ALTER TABLE public.office OWNER TO c370_s166;

--
-- Name: paid; Type: TABLE; Schema: public; Owner: c370_s166
--

CREATE TABLE public.paid (
    fund integer NOT NULL,
    employee integer NOT NULL
);


ALTER TABLE public.paid OWNER TO c370_s166;

--
-- Name: paid_employee_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.paid_employee_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paid_employee_seq OWNER TO c370_s166;

--
-- Name: paid_employee_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.paid_employee_seq OWNED BY public.paid.employee;


--
-- Name: paid_fund_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.paid_fund_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paid_fund_seq OWNER TO c370_s166;

--
-- Name: paid_fund_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.paid_fund_seq OWNED BY public.paid.fund;


--
-- Name: participates; Type: TABLE; Schema: public; Owner: c370_s166
--

CREATE TABLE public.participates (
    volunteer integer NOT NULL,
    campaignid integer NOT NULL,
    date date,
    location character(30)
);


ALTER TABLE public.participates OWNER TO c370_s166;

--
-- Name: participates_campaignid_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.participates_campaignid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.participates_campaignid_seq OWNER TO c370_s166;

--
-- Name: participates_campaignid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.participates_campaignid_seq OWNED BY public.participates.campaignid;


--
-- Name: participates_volunteer_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.participates_volunteer_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.participates_volunteer_seq OWNER TO c370_s166;

--
-- Name: participates_volunteer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.participates_volunteer_seq OWNED BY public.participates.volunteer;


--
-- Name: rentpayement; Type: TABLE; Schema: public; Owner: c370_s166
--

CREATE TABLE public.rentpayement (
    office character(40),
    fund integer NOT NULL
);


ALTER TABLE public.rentpayement OWNER TO c370_s166;

--
-- Name: rentpayement_fund_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.rentpayement_fund_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rentpayement_fund_seq OWNER TO c370_s166;

--
-- Name: rentpayement_fund_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.rentpayement_fund_seq OWNED BY public.rentpayement.fund;


--
-- Name: supports; Type: TABLE; Schema: public; Owner: c370_s166
--

CREATE TABLE public.supports (
    member integer NOT NULL,
    campaign integer NOT NULL
);


ALTER TABLE public.supports OWNER TO c370_s166;

--
-- Name: supports_campaign_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.supports_campaign_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supports_campaign_seq OWNER TO c370_s166;

--
-- Name: supports_campaign_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.supports_campaign_seq OWNED BY public.supports.campaign;


--
-- Name: supports_member_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.supports_member_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supports_member_seq OWNER TO c370_s166;

--
-- Name: supports_member_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.supports_member_seq OWNED BY public.supports.member;


--
-- Name: volunteer; Type: TABLE; Schema: public; Owner: c370_s166
--

CREATE TABLE public.volunteer (
    volunteerid integer NOT NULL,
    name character varying(20),
    tier integer
);


ALTER TABLE public.volunteer OWNER TO c370_s166;

--
-- Name: volunteer_volunteerid_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.volunteer_volunteerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteer_volunteerid_seq OWNER TO c370_s166;

--
-- Name: volunteer_volunteerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.volunteer_volunteerid_seq OWNED BY public.volunteer.volunteerid;


--
-- Name: websiteposting; Type: TABLE; Schema: public; Owner: c370_s166
--

CREATE TABLE public.websiteposting (
    campaignid integer NOT NULL,
    date date NOT NULL,
    "time" time without time zone NOT NULL,
    author character(30)
);


ALTER TABLE public.websiteposting OWNER TO c370_s166;

--
-- Name: websiteposting_campaignid_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.websiteposting_campaignid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.websiteposting_campaignid_seq OWNER TO c370_s166;

--
-- Name: websiteposting_campaignid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.websiteposting_campaignid_seq OWNED BY public.websiteposting.campaignid;


--
-- Name: worksat; Type: TABLE; Schema: public; Owner: c370_s166
--

CREATE TABLE public.worksat (
    employee integer NOT NULL,
    office character(40)
);


ALTER TABLE public.worksat OWNER TO c370_s166;

--
-- Name: worksat_employee_seq; Type: SEQUENCE; Schema: public; Owner: c370_s166
--

CREATE SEQUENCE public.worksat_employee_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.worksat_employee_seq OWNER TO c370_s166;

--
-- Name: worksat_employee_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c370_s166
--

ALTER SEQUENCE public.worksat_employee_seq OWNED BY public.worksat.employee;


--
-- Name: campaign campaignid; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.campaign ALTER COLUMN campaignid SET DEFAULT nextval('public.campaign_campaignid_seq'::regclass);


--
-- Name: cost fund; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.cost ALTER COLUMN fund SET DEFAULT nextval('public.cost_fund_seq'::regclass);


--
-- Name: cost campaign; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.cost ALTER COLUMN campaign SET DEFAULT nextval('public.cost_campaign_seq'::regclass);


--
-- Name: donor donorid; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.donor ALTER COLUMN donorid SET DEFAULT nextval('public.donor_donorid_seq'::regclass);


--
-- Name: employee employeeid; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.employee ALTER COLUMN employeeid SET DEFAULT nextval('public.employee_employeeid_seq'::regclass);


--
-- Name: event campaignid; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.event ALTER COLUMN campaignid SET DEFAULT nextval('public.event_campaignid_seq'::regclass);


--
-- Name: fund fundid; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.fund ALTER COLUMN fundid SET DEFAULT nextval('public.fund_fundid_seq'::regclass);


--
-- Name: fundraised fund; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.fundraised ALTER COLUMN fund SET DEFAULT nextval('public.fundraised_fund_seq'::regclass);


--
-- Name: fundraised campaign; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.fundraised ALTER COLUMN campaign SET DEFAULT nextval('public.fundraised_campaign_seq'::regclass);


--
-- Name: givesto donor; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.givesto ALTER COLUMN donor SET DEFAULT nextval('public.givesto_donor_seq'::regclass);


--
-- Name: givesto fund; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.givesto ALTER COLUMN fund SET DEFAULT nextval('public.givesto_fund_seq'::regclass);


--
-- Name: member memberid; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.member ALTER COLUMN memberid SET DEFAULT nextval('public.member_memberid_seq'::regclass);


--
-- Name: paid fund; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.paid ALTER COLUMN fund SET DEFAULT nextval('public.paid_fund_seq'::regclass);


--
-- Name: paid employee; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.paid ALTER COLUMN employee SET DEFAULT nextval('public.paid_employee_seq'::regclass);


--
-- Name: participates volunteer; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.participates ALTER COLUMN volunteer SET DEFAULT nextval('public.participates_volunteer_seq'::regclass);


--
-- Name: participates campaignid; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.participates ALTER COLUMN campaignid SET DEFAULT nextval('public.participates_campaignid_seq'::regclass);


--
-- Name: rentpayement fund; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.rentpayement ALTER COLUMN fund SET DEFAULT nextval('public.rentpayement_fund_seq'::regclass);


--
-- Name: supports member; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.supports ALTER COLUMN member SET DEFAULT nextval('public.supports_member_seq'::regclass);


--
-- Name: supports campaign; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.supports ALTER COLUMN campaign SET DEFAULT nextval('public.supports_campaign_seq'::regclass);


--
-- Name: volunteer volunteerid; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.volunteer ALTER COLUMN volunteerid SET DEFAULT nextval('public.volunteer_volunteerid_seq'::regclass);


--
-- Name: websiteposting campaignid; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.websiteposting ALTER COLUMN campaignid SET DEFAULT nextval('public.websiteposting_campaignid_seq'::regclass);


--
-- Name: worksat employee; Type: DEFAULT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.worksat ALTER COLUMN employee SET DEFAULT nextval('public.worksat_employee_seq'::regclass);


--
-- Data for Name: campaign; Type: TABLE DATA; Schema: public; Owner: c370_s166
--

COPY public.campaign (campaignid, name, startdate, enddate) FROM stdin;
1	Green for All                                     	2024-05-09	2024-06-18
2	Forest Fun                                        	2024-03-19	2024-07-13
3	Jungle Jam                                        	2024-05-09	2024-06-18
4	Island Fest                                       	2024-06-27	2024-11-01
5	Dessert Days                                      	2024-03-23	2024-12-25
6	Snow Show                                         	2024-12-01	2025-01-25
7	Rain Dance                                        	2024-08-30	2024-09-29
8	Test                                              	2024-11-09	2024-12-09
\.


--
-- Data for Name: cost; Type: TABLE DATA; Schema: public; Owner: c370_s166
--

COPY public.cost (fund, campaign) FROM stdin;
16	1
17	2
18	3
19	4
20	5
21	6
22	7
\.


--
-- Data for Name: donor; Type: TABLE DATA; Schema: public; Owner: c370_s166
--

COPY public.donor (donorid, name) FROM stdin;
1	Micah Richards                          
2	Jamie Carragher                         
3	Thierry Henry                           
4	Kate Abdo                               
5	Gary Lineke                             
6	Alan Shearer                            
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: c370_s166
--

COPY public.employee (employeeid, name, title, salary) FROM stdin;
1	Jim Brown                     	Chief Executive Offficer      	50000
2	King Ghidra                   	Accountant                    	20000
3	Victor Von Doom               	Lawyer                        	30000
4	Noel Fielding                 	Cook                          	10000
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: c370_s166
--

COPY public.event (campaignid, date, location, starttime, endtime) FROM stdin;
3	2024-05-27	Stanley Park                  	08:00:00	17:00:00
2	2024-04-06	Times Square                  	07:00:00	12:00:00
6	2025-01-01	Mount Washington              	09:00:00	16:00:00
5	2024-05-20	The Sahara                    	01:00:00	07:00:00
1	2024-06-01	The Amazon                    	07:00:00	12:00:00
4	2024-07-06	Haida Gwaii                   	12:00:00	18:00:00
7	2024-09-22	Times Square                  	06:00:00	11:00:00
1	2024-06-17	The Thames                    	04:00:00	13:00:00
2	2024-05-22	Rio Grande                    	00:00:00	02:00:00
8	2024-11-21	Test                          	09:00:00	12:00:00
\.


--
-- Data for Name: fund; Type: TABLE DATA; Schema: public; Owner: c370_s166
--

COPY public.fund (fundid, date, "time", amount) FROM stdin;
1	2024-03-01	12:00:00	-535.349976
2	2024-02-01	09:00:00	-535.349976
3	2024-01-01	13:00:00	-535.349976
4	2023-12-01	14:00:00	-535.349976
5	2024-01-01	09:00:00	-50000
6	2024-01-01	09:00:00	-20000
7	2024-01-01	09:00:00	-30000
8	2024-01-01	09:00:00	-10000
9	2024-06-18	17:00:00	5000
10	2024-07-13	17:00:00	7000
11	2024-06-18	17:00:00	3000
12	2024-11-01	17:00:00	10000
13	2024-12-25	17:00:00	1000
14	2025-01-25	17:00:00	6000
15	2024-09-29	17:00:00	1000
16	2024-05-09	09:00:00	-500
17	2024-03-19	09:00:00	-100
18	2024-05-09	09:00:00	-200
19	2024-06-27	09:00:00	-400
20	2024-03-23	09:00:00	-600
21	2024-12-01	09:00:00	-700
22	2024-08-30	09:00:00	-200
23	2023-05-09	12:00:00	10000
24	2024-01-30	13:00:00	50000
25	2023-12-25	09:00:00	100000
26	2024-02-17	17:00:00	70000
27	2023-10-20	14:00:00	30000
28	2023-11-02	12:00:00	80000
29	2024-04-03	08:00:00	20000
\.


--
-- Data for Name: fundraised; Type: TABLE DATA; Schema: public; Owner: c370_s166
--

COPY public.fundraised (fund, campaign) FROM stdin;
9	1
10	2
11	3
12	4
13	5
14	6
15	7
\.


--
-- Data for Name: givesto; Type: TABLE DATA; Schema: public; Owner: c370_s166
--

COPY public.givesto (donor, fund) FROM stdin;
1	23
2	24
3	25
4	26
5	27
6	28
1	29
\.


--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: c370_s166
--

COPY public.member (memberid, name) FROM stdin;
1	Harry Nilsson                           
2	David Bowie                             
3	Nathanial Merriweather                  
4	Joe Shmoe                               
5	Sisyphus                                
6	Diogenes                                
7	Marcus Aurelius                         
8	Friedrich Nietzsche                     
9	Lou Reed                                
10	Daniel Dumile                           
\.


--
-- Data for Name: office; Type: TABLE DATA; Schema: public; Owner: c370_s166
--

COPY public.office (address, rent) FROM stdin;
3953 Gordon Head road                             	535.349976
\.


--
-- Data for Name: paid; Type: TABLE DATA; Schema: public; Owner: c370_s166
--

COPY public.paid (fund, employee) FROM stdin;
5	1
6	2
7	3
8	4
\.


--
-- Data for Name: participates; Type: TABLE DATA; Schema: public; Owner: c370_s166
--

COPY public.participates (volunteer, campaignid, date, location) FROM stdin;
1	3	2024-05-27	Stanley Park                  
1	7	2024-09-22	Times Square                  
2	4	2024-07-06	Haida Gwaii                   
2	1	2024-06-17	The Thames                    
4	2	2024-05-22	Rio Grande                    
5	6	2025-01-01	Mount Washington              
6	2	2024-04-06	Times Square                  
7	5	2024-05-20	The Sahara                    
8	5	2024-05-20	The Sahara                    
13	4	2024-07-06	Haida Gwaii                   
12	3	2024-05-27	Stanley Park                  
\.


--
-- Data for Name: rentpayement; Type: TABLE DATA; Schema: public; Owner: c370_s166
--

COPY public.rentpayement (office, fund) FROM stdin;
3953 Gordon Head road                   	1
3953 Gordon Head road                   	2
3953 Gordon Head road                   	3
3953 Gordon Head road                   	4
\.


--
-- Data for Name: supports; Type: TABLE DATA; Schema: public; Owner: c370_s166
--

COPY public.supports (member, campaign) FROM stdin;
1	1
1	5
2	4
3	2
3	7
3	5
4	3
5	6
7	2
7	3
8	5
9	6
10	1
\.


--
-- Data for Name: volunteer; Type: TABLE DATA; Schema: public; Owner: c370_s166
--

COPY public.volunteer (volunteerid, name, tier) FROM stdin;
1	Barry White	1
2	Herby Hancock	2
3	Mary Jane	1
4	Gary Nevile	1
5	Michael Ballack	2
6	Bruce Wayne	2
7	Alan Davies	2
8	Sandi Toksvig	1
9	John Wayne	2
10	Clint Eastwood	2
11	Marilyn Monroe	1
12	Ebeniser Scrooge	2
13	Thomas Muller	2
15	Harry Testing	1
\.


--
-- Data for Name: websiteposting; Type: TABLE DATA; Schema: public; Owner: c370_s166
--

COPY public.websiteposting (campaignid, date, "time", author) FROM stdin;
2	2024-03-20	12:00:00	George Orwell                 
2	2024-04-20	15:00:00	George Orwell                 
3	2024-06-01	03:00:00	Mother Theresa                
4	2024-11-01	09:00:00	Margaret Atwood               
5	2024-06-20	18:00:00	Stephen King                  
6	2024-12-25	09:00:00	JRR Tolkien                   
7	2024-09-09	09:00:00	George Orwell                 
1	2024-05-09	09:00:00	Margaret Atwood               
\.


--
-- Data for Name: worksat; Type: TABLE DATA; Schema: public; Owner: c370_s166
--

COPY public.worksat (employee, office) FROM stdin;
2	3953 Gordon Head road                   
3	3953 Gordon Head road                   
4	3953 Gordon Head road                   
1	3953 Gordon Head road                   
\.


--
-- Name: campaign_campaignid_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.campaign_campaignid_seq', 8, true);


--
-- Name: cost_campaign_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.cost_campaign_seq', 1, false);


--
-- Name: cost_fund_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.cost_fund_seq', 1, false);


--
-- Name: donor_donorid_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.donor_donorid_seq', 6, true);


--
-- Name: employee_employeeid_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.employee_employeeid_seq', 4, true);


--
-- Name: event_campaignid_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.event_campaignid_seq', 1, false);


--
-- Name: fund_fundid_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.fund_fundid_seq', 29, true);


--
-- Name: fundraised_campaign_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.fundraised_campaign_seq', 1, false);


--
-- Name: fundraised_fund_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.fundraised_fund_seq', 1, false);


--
-- Name: givesto_donor_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.givesto_donor_seq', 1, false);


--
-- Name: givesto_fund_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.givesto_fund_seq', 1, false);


--
-- Name: member_memberid_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.member_memberid_seq', 10, true);


--
-- Name: paid_employee_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.paid_employee_seq', 1, false);


--
-- Name: paid_fund_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.paid_fund_seq', 1, false);


--
-- Name: participates_campaignid_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.participates_campaignid_seq', 1, false);


--
-- Name: participates_volunteer_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.participates_volunteer_seq', 1, false);


--
-- Name: rentpayement_fund_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.rentpayement_fund_seq', 1, false);


--
-- Name: supports_campaign_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.supports_campaign_seq', 1, false);


--
-- Name: supports_member_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.supports_member_seq', 1, false);


--
-- Name: volunteer_volunteerid_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.volunteer_volunteerid_seq', 15, true);


--
-- Name: websiteposting_campaignid_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.websiteposting_campaignid_seq', 1, false);


--
-- Name: worksat_employee_seq; Type: SEQUENCE SET; Schema: public; Owner: c370_s166
--

SELECT pg_catalog.setval('public.worksat_employee_seq', 1, false);


--
-- Name: campaign campaign_pkey; Type: CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_pkey PRIMARY KEY (campaignid);


--
-- Name: donor donor_pkey; Type: CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.donor
    ADD CONSTRAINT donor_pkey PRIMARY KEY (donorid);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employeeid);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (date, location);


--
-- Name: fund fund_pkey; Type: CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.fund
    ADD CONSTRAINT fund_pkey PRIMARY KEY (fundid);


--
-- Name: member member_pkey; Type: CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (memberid);


--
-- Name: office office_pkey; Type: CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.office
    ADD CONSTRAINT office_pkey PRIMARY KEY (address);


--
-- Name: volunteer volunteer_pkey; Type: CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.volunteer
    ADD CONSTRAINT volunteer_pkey PRIMARY KEY (volunteerid);


--
-- Name: websiteposting websiteposting_pkey; Type: CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.websiteposting
    ADD CONSTRAINT websiteposting_pkey PRIMARY KEY (date, "time");


--
-- Name: cost cost_campaign_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.cost
    ADD CONSTRAINT cost_campaign_fkey FOREIGN KEY (campaign) REFERENCES public.campaign(campaignid);


--
-- Name: event event_campaignid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_campaignid_fkey FOREIGN KEY (campaignid) REFERENCES public.campaign(campaignid);


--
-- Name: fundraised fundraised_campaign_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.fundraised
    ADD CONSTRAINT fundraised_campaign_fkey FOREIGN KEY (campaign) REFERENCES public.campaign(campaignid);


--
-- Name: givesto givesto_donor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.givesto
    ADD CONSTRAINT givesto_donor_fkey FOREIGN KEY (donor) REFERENCES public.donor(donorid);


--
-- Name: paid paid_employee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.paid
    ADD CONSTRAINT paid_employee_fkey FOREIGN KEY (employee) REFERENCES public.employee(employeeid);


--
-- Name: participates participates_campaignid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.participates
    ADD CONSTRAINT participates_campaignid_fkey FOREIGN KEY (campaignid) REFERENCES public.campaign(campaignid);


--
-- Name: participates participates_date_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.participates
    ADD CONSTRAINT participates_date_fkey FOREIGN KEY (date, location) REFERENCES public.event(date, location);


--
-- Name: participates participates_volunteer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.participates
    ADD CONSTRAINT participates_volunteer_fkey FOREIGN KEY (volunteer) REFERENCES public.volunteer(volunteerid);


--
-- Name: rentpayement rentpayement_office_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.rentpayement
    ADD CONSTRAINT rentpayement_office_fkey FOREIGN KEY (office) REFERENCES public.office(address);


--
-- Name: supports supports_campaign_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.supports
    ADD CONSTRAINT supports_campaign_fkey FOREIGN KEY (campaign) REFERENCES public.campaign(campaignid);


--
-- Name: supports supports_member_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.supports
    ADD CONSTRAINT supports_member_fkey FOREIGN KEY (member) REFERENCES public.member(memberid);


--
-- Name: websiteposting websiteposting_campaignid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.websiteposting
    ADD CONSTRAINT websiteposting_campaignid_fkey FOREIGN KEY (campaignid) REFERENCES public.campaign(campaignid);


--
-- Name: worksat worksat_employee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.worksat
    ADD CONSTRAINT worksat_employee_fkey FOREIGN KEY (employee) REFERENCES public.employee(employeeid);


--
-- Name: worksat worksat_office_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c370_s166
--

ALTER TABLE ONLY public.worksat
    ADD CONSTRAINT worksat_office_fkey FOREIGN KEY (office) REFERENCES public.office(address);


--
-- PostgreSQL database dump complete
--


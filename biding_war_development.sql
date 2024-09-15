--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Ubuntu 14.13-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.13 (Ubuntu 14.13-0ubuntu0.22.04.1)

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
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO postgres;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_variant_records_id_seq OWNER TO postgres;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: bids; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bids (
    id bigint NOT NULL,
    amount numeric,
    bid_date timestamp without time zone,
    user_id bigint,
    product_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    end_time timestamp without time zone,
    image_url character varying,
    finalized_at timestamp without time zone
);


ALTER TABLE public.bids OWNER TO postgres;

--
-- Name: bids_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bids_id_seq OWNER TO postgres;

--
-- Name: bids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bids_id_seq OWNED BY public.bids.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: faqs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faqs (
    id bigint NOT NULL,
    question character varying,
    answer text,
    role integer,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    parent_id bigint,
    answered_by_user_id integer
);


ALTER TABLE public.faqs OWNER TO postgres;

--
-- Name: faqs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.faqs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faqs_id_seq OWNER TO postgres;

--
-- Name: faqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faqs_id_seq OWNED BY public.faqs.id;


--
-- Name: histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.histories (
    id bigint NOT NULL,
    product_id bigint,
    user_id bigint,
    bid_amount numeric,
    bid_date timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.histories OWNER TO postgres;

--
-- Name: histories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.histories_id_seq OWNER TO postgres;

--
-- Name: histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.histories_id_seq OWNED BY public.histories.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    user_id bigint,
    message text,
    notification_type character varying,
    notification_date timestamp without time zone,
    viewed boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id bigint NOT NULL,
    user_id bigint,
    product_id bigint,
    amount numeric,
    payment_date timestamp without time zone,
    payment_method character varying,
    status character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying,
    description text,
    category character varying,
    initial_price numeric,
    auction_start_date timestamp without time zone,
    auction_end_date timestamp without time zone,
    image character varying,
    seller_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    category_id bigint
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    product_id bigint,
    user_id bigint,
    rating integer,
    comment text,
    review_date timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    address character varying,
    phone_number character varying,
    role integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    failed_attempts integer,
    unlock_token character varying,
    locked_at timestamp without time zone,
    last_request_at timestamp without time zone,
    sign_in_count integer,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    remember_created_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: bids id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bids ALTER COLUMN id SET DEFAULT nextval('public.bids_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: faqs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faqs ALTER COLUMN id SET DEFAULT nextval('public.faqs_id_seq'::regclass);


--
-- Name: histories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.histories ALTER COLUMN id SET DEFAULT nextval('public.histories_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
1	image	Product	1	1	2024-09-05 10:55:00.642896
2	image	Product	2	2	2024-09-05 12:35:03.875904
3	image	Product	3	3	2024-09-05 12:39:06.34206
4	image	Product	4	4	2024-09-05 13:15:52.771409
5	image	Product	5	5	2024-09-05 14:45:03.645428
6	image	Product	6	6	2024-09-06 17:43:33.747079
7	image	Product	7	7	2024-09-06 21:14:12.709104
8	image	Product	8	8	2024-09-08 12:41:33.90066
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
1	9h5p2j1m00cq2jxwltzudkr9ssjg	Sans titre.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	8382	aQX2LT377WHTfJNJ34PS+g==	2024-09-05 10:55:00.592788
2	cffjtmgsq0zxq83hcchuip79nq1n	Sans titre1.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	9065	4MYqjJeUcvOBOJGPfUZXkg==	2024-09-05 12:35:03.868705
3	iae3lxn8nfj7vqk0si6fng8glqiv	1Sans titre.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	31886	Zrq+GX0AfWqUYJI/tL8gxg==	2024-09-05 12:39:06.336326
4	eg5ucm53whdlvmfadi6ptoqph84b	images.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	12165	LRhHzv0+zEDV4e5/oRNqZQ==	2024-09-05 13:15:52.762832
5	6cbmsplqp5pmo6njw8xa3uwteli8	Sans1 titre.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	13874	wBlSEPbfg0JbV2+23tPHfg==	2024-09-05 14:45:03.640089
6	fgj1pcilthslvnuf4iqxlml2tha1	images1.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	5570	/9FPD0QOsVoCVeFGKl4d6w==	2024-09-06 17:43:33.677624
7	vp32d0dso5npxi4d19cgr4lrrdpd	1images.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	5464	URCCwCk8itMv49ZpMLu6jw==	2024-09-06 21:14:12.698223
8	tuqmqizkoqtl40ktfz66ci7llfvq	11Sans titre.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	5236	kOudFx/l6JzEW4OC4eNI3Q==	2024-09-08 12:41:33.805975
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-08-31 19:07:52.791006	2024-08-31 19:07:52.791006
\.


--
-- Data for Name: bids; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bids (id, amount, bid_date, user_id, product_id, created_at, updated_at, end_time, image_url, finalized_at) FROM stdin;
1	81.0	\N	3	3	2024-09-05 18:38:30.88784	2024-09-05 18:38:30.88784	\N	\N	\N
2	46.0	\N	3	2	2024-09-05 18:42:41.964149	2024-09-05 18:42:41.964149	\N	\N	\N
4	49.0	\N	3	2	2024-09-05 18:58:01.979339	2024-09-05 18:58:01.979339	\N	\N	\N
5	53.0	\N	3	2	2024-09-05 18:58:09.583125	2024-09-05 18:58:09.583125	\N	\N	\N
6	103.0	\N	3	5	2024-09-05 18:58:40.08694	2024-09-05 18:58:40.08694	\N	\N	\N
7	108.0	\N	3	5	2024-09-05 18:58:47.262224	2024-09-05 18:58:47.262224	\N	\N	\N
8	111.0	\N	3	5	2024-09-05 18:59:01.173505	2024-09-05 18:59:01.173505	\N	\N	\N
9	57.0	\N	3	2	2024-09-05 18:59:47.862064	2024-09-05 18:59:47.862064	\N	\N	\N
10	64.0	\N	3	2	2024-09-05 19:01:50.838131	2024-09-05 19:01:50.838131	\N	\N	\N
11	72.0	\N	3	2	2024-09-05 19:02:01.898729	2024-09-05 19:02:01.898729	\N	\N	\N
12	75.0	\N	3	2	2024-09-05 19:09:36.274092	2024-09-05 19:09:36.274092	\N	\N	\N
13	78.0	\N	3	2	2024-09-05 19:09:42.724194	2024-09-05 19:09:42.724194	\N	\N	\N
14	84.0	\N	3	2	2024-09-05 19:15:56.043326	2024-09-05 19:15:56.043326	\N	\N	\N
15	85.0	\N	3	2	2024-09-05 19:16:02.602581	2024-09-05 19:16:02.602581	\N	\N	\N
16	86.0	\N	3	2	2024-09-05 19:17:41.206866	2024-09-05 19:17:41.206866	\N	\N	\N
21	91.01	\N	5	2	2024-09-05 22:56:33.564836	2024-09-05 22:56:33.564836	\N	\N	\N
22	94.01	\N	5	2	2024-09-05 23:23:35.726589	2024-09-05 23:23:35.726589	\N	\N	\N
23	96.01	\N	5	2	2024-09-05 23:48:14.853965	2024-09-05 23:48:14.853965	\N	\N	\N
26	101.01	\N	5	2	2024-09-05 23:52:20.407404	2024-09-05 23:52:20.407404	\N	\N	\N
29	103.01	\N	5	2	2024-09-06 01:07:52.481859	2024-09-06 01:07:52.481859	\N	\N	\N
32	107.01	\N	3	2	2024-09-06 10:59:58.888466	2024-09-06 10:59:58.888466	\N	\N	\N
37	110.01	\N	3	2	2024-09-06 12:21:35.441124	2024-09-06 12:21:35.441124	\N	\N	\N
38	116.01	\N	3	2	2024-09-06 12:23:50.406179	2024-09-06 12:23:50.406179	\N	\N	\N
39	118.01	\N	5	2	2024-09-06 17:59:23.900503	2024-09-06 17:59:23.900503	\N	\N	\N
40	83.0	\N	3	3	2024-09-06 19:38:13.004054	2024-09-06 19:38:13.004054	\N	\N	\N
41	119.01	\N	3	2	2024-09-06 19:47:05.356506	2024-09-06 19:47:05.356506	\N	\N	\N
42	121.01	\N	3	2	2024-09-08 12:34:52.846981	2024-09-08 12:34:52.846981	\N	\N	\N
43	123.01	\N	3	2	2024-09-08 21:57:51.32036	2024-09-08 21:57:51.32036	\N	\N	\N
44	125.01	\N	3	2	2024-09-10 09:59:28.389739	2024-09-10 09:59:28.389739	\N	\N	\N
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, description, created_at, updated_at) FROM stdin;
1	Art	Œuvres d'art et créations artistiques	2024-09-04 23:57:11.496738	2024-09-04 23:57:11.496738
2	Beauté	Produits de beauté et soins personnels	2024-09-04 23:57:11.534686	2024-09-04 23:57:11.534686
3	Trésors	Articles de collection et objets rares	2024-09-04 23:57:11.545561	2024-09-04 23:57:11.545561
4	Games	Jeux vidéo et jeux de société	2024-09-04 23:57:11.556751	2024-09-04 23:57:11.556751
\.


--
-- Data for Name: faqs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faqs (id, question, answer, role, user_id, created_at, updated_at, parent_id, answered_by_user_id) FROM stdin;
1	j'aime la platforme	oui elle est cool	1	4	2024-09-03 14:46:40.512045	2024-09-03 14:54:20.767007	\N	\N
39	je suis nouveau	oui	1	10	2024-09-04 15:00:46.81814	2024-09-04 15:02:09.613112	\N	10
34	j suis chanceux	moi aussi	0	3	2024-09-04 13:56:31.356288	2024-09-04 15:03:23.257485	\N	9
54	salutttttttttttttttttttttttttttttttttttttt	bien	0	3	2024-09-06 12:28:39.268099	2024-09-06 12:28:48.286948	\N	3
7	etp4a	une formation de qualiter pour tous	1	4	2024-09-03 15:44:28.302685	2024-09-03 15:51:34.277039	\N	\N
3	template\r\n	oui avec etp4a j'ai apris ce que c'est qu'un template  et beaucoup d'autres chose	1	4	2024-09-03 15:09:47.539714	2024-09-03 15:53:42.570269	\N	\N
41	yooooooooooooooo	yaaaaaaaaaaaaaaaaaa	0	9	2024-09-04 15:04:40.741941	2024-09-04 15:05:02.918373	\N	9
2	hummm	euhh	1	4	2024-09-03 14:55:14.926783	2024-09-03 16:07:05.039257	\N	\N
4	courage\r\n	merci\r\n	1	4	2024-09-03 15:11:21.038679	2024-09-03 19:13:11.181282	\N	\N
8	le projet est dementiel	je confirme\r\n	1	4	2024-09-03 15:52:45.074272	2024-09-03 19:45:00.465739	\N	\N
42	Quel est votre budget pour cet achat?	Réponse à définir	0	9	2024-09-04 15:11:26.651287	2024-09-04 15:11:26.651287	\N	\N
9	je suis avec toi	oui mon frere	1	4	2024-09-03 19:45:16.891832	2024-09-03 19:46:06.641699	\N	\N
10	serieusement	oui chou	1	4	2024-09-03 19:45:46.885146	2024-09-03 19:59:30.142099	\N	\N
5	ok	ok	1	4	2024-09-03 15:42:03.881885	2024-09-03 20:27:05.507339	\N	\N
6	merci	jtp	1	4	2024-09-03 15:42:28.819043	2024-09-03 20:30:54.981514	\N	\N
13	champion	oui	1	4	2024-09-03 20:31:11.785485	2024-09-03 20:37:49.059568	\N	\N
12	brother	ahbon	1	4	2024-09-03 20:31:01.987908	2024-09-03 21:07:26.300054	\N	\N
11	jesuis heureux de travailler avec toi Rahim	on dirai	1	4	2024-09-03 20:27:37.340303	2024-09-03 21:12:44.892516	\N	\N
17	je suis ton brother	\N	1	4	2024-09-03 21:42:40.349081	2024-09-03 21:42:40.349081	\N	\N
16	je suis là	bien	1	4	2024-09-03 21:35:02.543151	2024-09-03 21:46:43.355576	\N	\N
18	welcome to etp4A	merci	1	4	2024-09-03 21:47:13.213489	2024-09-03 21:52:47.049326	\N	\N
20	je suis le prmier vendeur	ahbonnn	0	3	2024-09-03 22:04:38.509173	2024-09-03 22:05:48.093601	\N	\N
43	Quelle est la fréquence d'utilisation prévue?	Réponse à définir	0	9	2024-09-04 15:11:26.717525	2024-09-04 15:11:26.717525	\N	\N
22	broooooooo	ouiiiiiii	0	3	2024-09-03 22:06:21.254976	2024-09-03 22:06:33.536215	\N	\N
44	Quels types de produits vendez-vous?	Réponse à définir	1	10	2024-09-04 15:11:26.823211	2024-09-04 15:11:26.823211	\N	\N
23	Rahimmmmmmmmmmmmmm	ouiiiiiiiiiiiiiiiiii	0	3	2024-09-03 22:07:39.424768	2024-09-03 22:07:50.620622	\N	\N
45	Quel est le délai de livraison pour vos produits?	Réponse à définir	1	10	2024-09-04 15:11:26.851034	2024-09-04 15:11:26.851034	\N	\N
25	hummmmmmmmmmmmmm	euhhhhhhhhhhhhhhhhhhhhhhhhhhhh	0	3	2024-09-03 22:55:55.821944	2024-09-03 23:05:13.442237	\N	\N
24	daccord	euhhhh	1	4	2024-09-03 22:55:30.804556	2024-09-03 23:05:38.288848	\N	\N
21	je vendrai mon logiciel à etp5a	ahbonnnnnnnnnnn?	0	3	2024-09-03 22:05:24.052838	2024-09-03 23:12:03.095656	\N	\N
14	salut	sa va?	1	4	2024-09-03 21:12:56.245172	2024-09-03 23:37:21.996919	\N	5
29	bizarrrrrrrrrrrrrrrrrrrrrrrrrrrrrre	les test st rudes	1	4	2024-09-04 00:19:45.492689	2024-09-04 13:40:05.108942	\N	4
33	aujourdh'hui c'est dimanche	ahhhhhhbon?	0	3	2024-09-04 13:40:56.973314	2024-09-04 13:41:07.613121	\N	3
35	broooooooooooooooooooooooooo	oui bro	2	5	2024-09-04 14:16:35.473367	2024-09-04 14:27:02.139759	\N	5
36	j'aime ce projet	moi aussi	2	5	2024-09-04 14:27:15.352721	2024-09-04 14:27:23.344265	\N	5
32	je suis heureux	moi aussi	1	4	2024-09-04 13:40:18.147608	2024-09-04 14:57:36.638831	\N	10
15	les coourageux	en prsonne	1	4	2024-09-03 21:13:16.201119	2024-09-04 14:58:17.849531	\N	10
37	un nouveau compagnon	ouiiiiiiiiii	1	4	2024-09-04 14:59:22.74342	2024-09-04 14:59:46.654315	\N	10
27	oooooooooooooooooooooooooooooo	ahhhhhhhhhhhhhh	1	4	2024-09-04 00:12:17.145309	2024-09-04 15:01:05.548789	\N	10
30	sdfghj	ahhhhhhhhh	1	4	2024-09-04 00:22:01.716603	2024-09-04 15:01:33.901622	\N	10
28	pokemon	oui	0	3	2024-09-04 00:14:36.760956	2024-09-04 15:13:01.733014	\N	9
31	pikatchu	ouiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii	0	3	2024-09-04 00:22:37.744321	2024-09-04 15:13:34.325688	\N	9
46	i am 	you are	0	9	2024-09-04 15:12:30.830706	2024-09-04 15:13:49.163062	\N	9
26	ok	pk	1	4	2024-09-03 23:59:40.780977	2024-09-04 15:14:59.902904	\N	10
49	yooooooooooo\r\n	\N	2	5	2024-09-04 15:34:32.61943	2024-09-04 15:34:32.61943	\N	\N
19	je suis tres heureux ici à etp4a	moi aussi frere	1	4	2024-09-03 21:53:11.053644	2024-09-04 15:39:28.072466	\N	10
47	i am busy	or i am free	1	10	2024-09-04 15:14:50.048492	2024-09-04 15:41:34.480355	\N	4
38	je suis ravis d'arriver ici\r\n		1	10	2024-09-04 15:00:16.864018	2024-09-04 15:42:06.48009	\N	4
40	moi aussi	cooooooooool	0	9	2024-09-04 15:03:41.94243	2024-09-04 16:06:27.553204	\N	3
48	i am free	why why why why	2	8	2024-09-04 15:17:57.844184	2024-09-04 16:07:59.292516	\N	5
50	i am a studen for etp4A platform	meeeeeeeeeeeeeeeeeeee toooooooooooooooooooooooooooooooooooo	2	8	2024-09-04 15:45:30.887089	2024-09-04 16:08:45.398699	\N	5
51	almost	yes ready	2	5	2024-09-04 16:02:14.377815	2024-09-04 16:17:07.125088	\N	8
53	salut Rahim	salut	0	3	2024-09-06 12:25:37.110907	2024-09-06 12:26:52.883511	\N	9
52	i am atomic	salut	2	8	2024-09-04 16:11:15.463871	2024-09-06 12:31:11.856393	\N	5
55	je veux encherir encore et encore	\N	2	5	2024-09-06 12:53:41.219097	2024-09-06 12:53:41.219097	\N	\N
56	brother\r\n	yes broooooooooooooooo	0	3	2024-09-06 14:11:19.241452	2024-09-06 14:11:50.69228	\N	9
57	le dimanche c'est la fete	\N	0	9	2024-09-06 14:12:50.495315	2024-09-06 14:12:50.495315	\N	\N
58	j'aime la pluie	moi ausi	0	9	2024-09-06 14:15:22.783902	2024-09-06 14:15:49.463381	\N	3
59	saluttttttttttttttttttttt	sa va?	0	3	2024-09-08 12:37:26.358444	2024-09-08 12:38:10.157686	\N	9
\.


--
-- Data for Name: histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.histories (id, product_id, user_id, bid_amount, bid_date, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, user_id, message, notification_type, notification_date, viewed, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, user_id, product_id, amount, payment_date, payment_method, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, description, category, initial_price, auction_start_date, auction_end_date, image, seller_id, created_at, updated_at, category_id) FROM stdin;
1	aaaaa	aaaaaaaaaaaa	\N	5.0	2024-09-05 10:54:00	2024-09-05 14:54:00	\N	4	2024-09-05 10:55:00.555687	2024-09-05 10:55:00.668541	2
2	kunai	c'est le dernier kunai	\N	43.0	2024-09-05 12:34:00	2024-12-05 12:34:00	\N	10	2024-09-05 12:35:03.763626	2024-09-05 12:35:03.884624	3
3	design	le dernier oeuvre de picasso	\N	80.0	2024-09-05 12:36:00	2026-09-05 12:36:00	\N	10	2024-09-05 12:39:06.323728	2024-09-05 12:39:06.348063	1
4	manette	la derniere manette nouvelle generation	\N	10.0	2024-09-05 13:14:00	2024-12-05 13:14:00	\N	5	2024-09-05 13:15:52.732711	2024-09-05 13:15:52.783416	4
5	auqarelle	le dernier le numero 193	\N	100.0	2024-09-05 14:43:00	2024-11-05 14:43:00	\N	5	2024-09-05 14:45:03.626275	2024-09-05 14:45:03.70106	1
6	produit de beauté	le dernier du pays de belgique	\N	66.0	2024-09-06 23:40:00	2025-09-06 17:40:00	\N	5	2024-09-06 17:43:33.547872	2024-09-06 17:43:33.844043	2
7	skincare	Skin Care - Produits de beauté naturels et bio pour la peau\r\nLes produits Skin Care permettent de de lutter contre le vieillissement prématuré de la peau en hydratant et en revitalisant votre peau pour lui rendre souplesse et douceur.	\N	210.0	2024-09-06 21:12:00	2025-12-06 21:18:00	\N	8	2024-09-06 21:14:12.555728	2024-09-06 21:14:12.715138	2
8	play station 5	jeux video	\N	700.0	2024-09-08 12:40:00	2028-09-08 12:40:00	\N	10	2024-09-08 12:41:33.778245	2024-09-08 12:41:33.924325	4
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, product_id, user_id, rating, comment, review_date, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20240831010149
20240831010150
20240831010152
20240831010153
20240831010154
20240831010157
20240831010158
20240831010159
20240831190432
20240831190434
20240831190435
20240831190436
20240901125825
20240901131912
20240901223019
20240901223207
20240902131429
20240902150409
20240903125219
20240903231440
20240904215851
20240904235518
20240905105002
20240905191903
20240905230853
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, address, phone_number, role, created_at, updated_at, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, failed_attempts, unlock_token, locked_at, last_request_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, encrypted_password, remember_created_at) FROM stdin;
3	Nom d'utilisateur	email@example.com	\N	\N	0	2024-09-02 15:30:56.628481	2024-09-10 10:07:21.065396	BE6oqz_bxHmL7Z-yvGLz	2024-09-02 15:32:46.358301	2024-09-02 15:30:56.628743	\N	\N	\N	\N	\N	58	2024-09-10 10:07:21.064957	2024-09-10 09:58:42.027739	127.0.0.1	127.0.0.1	$2a$12$m8gzWiDPFvmxtMczh4rNwubIIyAAvPpgwqWNL1vylm68V7GFdUTNe	\N
10	Vendeur	vendeur@example.com	\N	\N	1	2024-09-04 14:56:04.087362	2024-09-10 10:07:37.884	bpWVNToHRz1NrFCytGVT	2024-09-04 14:56:04.170268	2024-09-04 14:56:04.087468	\N	\N	\N	\N	\N	20	2024-09-10 10:07:37.88367	2024-09-10 10:00:32.205514	127.0.0.1	127.0.0.1	$2a$12$0N0SFLpqZV8C6bUW/mpWOeNOGZWOXumW1ygGFWnrZDhvT0AIv5bqS	\N
5	Utilisateur Both	utilisateurboth@example.com	\N	\N	2	2024-09-03 00:09:03.345195	2024-09-10 10:07:54.961207	\N	2024-09-03 00:07:42.544052	\N	\N	\N	\N	\N	\N	39	2024-09-10 10:07:54.96083	2024-09-08 22:01:31.106483	127.0.0.1	127.0.0.1	$2a$12$ox5PiXklY6eAywRWHblMg.ycNkkzWs20wHUc9UR4gZEWHho5ogJdW	\N
4	Nom du Vendeur	nouveau-vendeur@example.com	\N	\N	1	2024-09-02 23:22:00.379599	2024-09-06 21:10:17.338099	HoZeocmhTxd-28v_-9JU	2024-09-02 23:23:14.987018	2024-09-02 23:22:00.379883	\N	\N	\N	\N	\N	38	2024-09-06 21:10:17.337742	2024-09-06 21:10:01.397396	127.0.0.1	127.0.0.1	$2a$12$JklB85PAXUX3.BJHVR/o2.Jxl2gPPQW8y2RCpYdlfSxVX8hwmSau6	\N
8	Both	both_new@example.com	\N	\N	2	2024-09-04 14:51:45.152431	2024-09-06 21:11:06.91462	jGeP4rU3Mqr1yXmWejzQ	2024-09-04 14:51:45.224805	2024-09-04 14:51:45.152525	\N	\N	\N	\N	\N	5	2024-09-06 21:11:06.914275	2024-09-04 16:09:10.23525	127.0.0.1	127.0.0.1	$2a$12$2KeSxJVi2dEg5v0VYnvjouTVztozKuzIRpBZuoYxuyggnLLu4020W	\N
9	Acheteur	acheteur@example.com	\N	\N	0	2024-09-04 14:55:39.653052	2024-09-08 12:37:42.446493	y7BRxzjZbHCJ5P-MJyQH	2024-09-04 14:55:39.724348	2024-09-04 14:55:39.653144	\N	\N	\N	\N	\N	5	2024-09-08 12:37:42.44614	2024-09-06 14:11:38.536266	127.0.0.1	127.0.0.1	$2a$12$DPUDRvKY3424mc17U6r98uT6FOoE958gDO/UyRIAgkC6B6oX6XLjO	\N
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 8, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 8, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: bids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bids_id_seq', 44, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 4, true);


--
-- Name: faqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faqs_id_seq', 59, true);


--
-- Name: histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.histories_id_seq', 1, false);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 8, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: bids bids_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bids
    ADD CONSTRAINT bids_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: faqs faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faqs
    ADD CONSTRAINT faqs_pkey PRIMARY KEY (id);


--
-- Name: histories histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.histories
    ADD CONSTRAINT histories_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_bids_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_bids_on_product_id ON public.bids USING btree (product_id);


--
-- Name: index_bids_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_bids_on_user_id ON public.bids USING btree (user_id);


--
-- Name: index_faqs_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_faqs_on_user_id ON public.faqs USING btree (user_id);


--
-- Name: index_histories_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_histories_on_product_id ON public.histories USING btree (product_id);


--
-- Name: index_histories_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_histories_on_user_id ON public.histories USING btree (user_id);


--
-- Name: index_notifications_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_notifications_on_user_id ON public.notifications USING btree (user_id);


--
-- Name: index_payments_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_payments_on_product_id ON public.payments USING btree (product_id);


--
-- Name: index_payments_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_payments_on_user_id ON public.payments USING btree (user_id);


--
-- Name: index_products_on_seller_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_products_on_seller_id ON public.products USING btree (seller_id);


--
-- Name: index_reviews_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_reviews_on_product_id ON public.reviews USING btree (product_id);


--
-- Name: index_reviews_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_reviews_on_user_id ON public.reviews USING btree (user_id);


--
-- Name: payments fk_rails_081dc04a02; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_rails_081dc04a02 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: histories fk_rails_2d3eabb939; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.histories
    ADD CONSTRAINT fk_rails_2d3eabb939 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: bids fk_rails_4aac2f19d2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bids
    ADD CONSTRAINT fk_rails_4aac2f19d2 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: reviews fk_rails_74a66bd6c5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_74a66bd6c5 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: products fk_rails_82f3b66938; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_82f3b66938 FOREIGN KEY (seller_id) REFERENCES public.users(id);


--
-- Name: faqs fk_rails_901529645b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faqs
    ADD CONSTRAINT fk_rails_901529645b FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: notifications fk_rails_b080fb4855; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk_rails_b080fb4855 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: reviews fk_rails_bedd9094d4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_bedd9094d4 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: histories fk_rails_ddbf5f9cca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.histories
    ADD CONSTRAINT fk_rails_ddbf5f9cca FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: payments fk_rails_e0aaa31e44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_rails_e0aaa31e44 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: bids fk_rails_e173de2ed3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bids
    ADD CONSTRAINT fk_rails_e173de2ed3 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--


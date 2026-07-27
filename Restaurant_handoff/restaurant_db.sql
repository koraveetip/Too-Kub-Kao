--
-- PostgreSQL database dump
--

\restrict Frw14jcf0j9Nnw3UpBfzVFY7PeM74TnHxGlbW6aeMU7cSaGmmcCTCdMndkv6L7I

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4 (Postgres.app)

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

DROP INDEX IF EXISTS public.orders_status_idx;
DROP INDEX IF EXISTS public.orders_created_at_idx;
ALTER TABLE IF EXISTS ONLY public.stock_items DROP CONSTRAINT IF EXISTS stock_items_pkey;
ALTER TABLE IF EXISTS ONLY public.orders DROP CONSTRAINT IF EXISTS orders_pkey;
ALTER TABLE IF EXISTS ONLY public.menu_items DROP CONSTRAINT IF EXISTS menu_items_pkey;
ALTER TABLE IF EXISTS public.stock_items ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.menu_items ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.stock_items_id_seq;
DROP TABLE IF EXISTS public.stock_items;
DROP TABLE IF EXISTS public.orders;
DROP SEQUENCE IF EXISTS public.menu_items_id_seq;
DROP TABLE IF EXISTS public.menu_items;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: menu_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_items (
    id integer NOT NULL,
    category text NOT NULL,
    type text NOT NULL,
    subcategory text,
    name text NOT NULL,
    meat text,
    price integer DEFAULT 0 NOT NULL,
    image_url text,
    theme text,
    available boolean DEFAULT true NOT NULL,
    subcategory_en text,
    name_en text,
    meat_en text,
    sort_order integer,
    CONSTRAINT menu_items_theme_chk CHECK ((theme = ANY (ARRAY['day'::text, 'night'::text, 'both'::text, 'none'::text])))
);


ALTER TABLE public.menu_items OWNER TO postgres;

--
-- Name: menu_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_items_id_seq OWNER TO postgres;

--
-- Name: menu_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_items_id_seq OWNED BY public.menu_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id text NOT NULL,
    no text,
    invoice_no text,
    table_no text,
    status text DEFAULT 'new'::text NOT NULL,
    shift text,
    total numeric(12,2) DEFAULT 0 NOT NULL,
    order_time text,
    created_at bigint,
    note text,
    by_user text,
    items jsonb DEFAULT '[]'::jsonb NOT NULL,
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: stock_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock_items (
    id integer NOT NULL,
    category text NOT NULL,
    name text NOT NULL,
    quantity integer DEFAULT 0 NOT NULL,
    image_url text
);


ALTER TABLE public.stock_items OWNER TO postgres;

--
-- Name: stock_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_items_id_seq OWNER TO postgres;

--
-- Name: stock_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_items_id_seq OWNED BY public.stock_items.id;


--
-- Name: menu_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items ALTER COLUMN id SET DEFAULT nextval('public.menu_items_id_seq'::regclass);


--
-- Name: stock_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_items ALTER COLUMN id SET DEFAULT nextval('public.stock_items_id_seq'::regclass);


--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_items (id, category, type, subcategory, name, meat, price, image_url, theme, available, subcategory_en, name_en, meat_en, sort_order) FROM stdin;
5	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดน้ำมันหอยราดข้าว	หมู	50	https://i.postimg.cc/hj4GprPk/n-am-nhxy.jpg	day	t	With Rice	Stir-Fried with Oyster Sauce on Rice	Pork	0
445	อาหาร	เมนูหลัก	เมนูราดข้าว	ทอดน้ำปลาราดข้าว	หมู	50	https://i.postimg.cc/pTVdqZX7/thxdn-apla.jpg	day	t	\N	Stir-Fried with Fish Sauce on Rice	Pork	217
446	อาหาร	เมนูหลัก	เมนูราดข้าว	ทอดน้ำปลาราดข้าว	ไก่	50	https://i.postimg.cc/pTVdqZX7/thxdn-apla.jpg	day	t	\N	Stir-Fried with Fish Sauce on Rice	Chicken	217
447	อาหาร	เมนูหลัก	เมนูราดข้าว	ทอดน้ำปลาราดข้าว	หมูกรอบ	60	https://i.postimg.cc/pTVdqZX7/thxdn-apla.jpg	day	t	\N	Stir-Fried with Fish Sauce on Rice	Crispy Pork	217
448	อาหาร	เมนูหลัก	เมนูราดข้าว	ทอดน้ำปลาราดข้าว	ทะเล	70	https://i.postimg.cc/pTVdqZX7/thxdn-apla.jpg	day	t	\N	Stir-Fried with Fish Sauce on Rice	Seafood	217
28	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดพริกราดข้าว	หมู	50	https://i.postimg.cc/rmypQJwM/ph-dphr-k.jpg	day	t	With Rice	Stir-Fried with Fresh Chili on Rice	Pork	5
29	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดพริกราดข้าว	ไก่	50	https://i.postimg.cc/rmypQJwM/ph-dphr-k.jpg	day	t	With Rice	Stir-Fried with Fresh Chili on Rice	Chicken	5
30	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดพริกราดข้าว	หมูกรอบ	60	https://i.postimg.cc/rmypQJwM/ph-dphr-k.jpg	day	t	With Rice	Stir-Fried with Fresh Chili on Rice	Crispy Pork	5
31	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดพริกราดข้าว	ทะเล	70	https://i.postimg.cc/rmypQJwM/ph-dphr-k.jpg	day	t	With Rice	Stir-Fried with Fresh Chili on Rice	Seafood	5
12	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดกระเทียมพริกไทยราดข้าว	ทะเล	70	https://i.postimg.cc/6Qf3rSwh/kra-the-ymphr-kthiy.jpg	day	t	With Rice	Stir-Fried with Garlic and Pepper on Rice	Seafood	1
64	อาหาร	รายการเสริม	รายการเสริม	ไข่ดาว	\N	10	\N	day	t	Additional	Fried Egg	\N	\N
65	อาหาร	รายการเสริม	รายการเสริม	ไข่เจียว	\N	10	\N	day	t	Additional	Thai Omelet	\N	\N
66	อาหาร	รายการเสริม	รายการเสริม	พิเศษ	\N	15	\N	day	t	Additional	Special / Extra Portion	\N	\N
67	อาหาร	รายการเสริม	รายการเสริม	เป็นกับข้าว	\N	30	\N	day	t	Additional	To Share (No Rice)	\N	\N
68	อาหาร	รายการเสริม	รายการเสริม	สั่งกลับบ้าน	\N	0	\N	day	t	Additional	Takeaway	\N	\N
76	เพิ่มเติม	รายการเสริม	ข้าว	สั่งกลับบ้าน	\N	0	\N	day	t	Rice	Takeaway	\N	\N
58	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดซีอิ๊ว	หมู	50	https://i.postimg.cc/k4M5fcgP/ph-ds-x-w.jpg	day	t	Single Dish	Pad See Ew (Stir-Fried Rice Noodles with Soy Sauce)	Pork	13
77	อาหาร	เมนูหลัก	ข้าว	ข้าวสวย	\N	20	https://i.postimg.cc/fLWbBKTK/kh-aw.jpg	day	t	Rice	Steamed Rice	\N	19
122	เครื่องดื่ม	รายการเสริม	ขนาด	ไซส์ M	\N	0	\N	day	t	Size	Size M	\N	\N
123	เครื่องดื่ม	รายการเสริม	ขนาด	ไซส์ L	\N	5	\N	day	t	Size	Size L	\N	\N
124	เครื่องดื่ม	รายการเสริม	ระดับความหวาน	100% (หวานปกติ)	\N	0	\N	day	t	Sweetness	100% (Standard Sweetness)	\N	\N
125	เครื่องดื่ม	รายการเสริม	ระดับความหวาน	50% (หวานกลาง)	\N	0	\N	day	t	Sweetness	50% (Medium Sweetness)	\N	\N
126	เครื่องดื่ม	รายการเสริม	ระดับความหวาน	25% (หวานน้อย)	\N	0	\N	day	t	Sweetness	25% (Less Sweet)	\N	\N
127	เครื่องดื่ม	รายการเสริม	ระดับความหวาน	0% (ไม่หวาน)	\N	0	\N	day	t	Sweetness	0% (No Sugar)	\N	\N
128	เครื่องดื่ม	รายการเสริม	ระดับความหวาน	120% (หวานมาก)	\N	0	\N	day	t	Sweetness	120% (Extra Sweet)	\N	\N
129	เครื่องดื่ม	รายการเสริม	ท็อปปิ้ง	ไข่มุก	\N	5	\N	day	t	Topping	Boba	\N	\N
130	เครื่องดื่ม	รายการเสริม	ท็อปปิ้ง	บุก	\N	5	\N	day	t	Topping	Konjac Jelly	\N	\N
131	เครื่องดื่ม	รายการเสริม	ท็อปปิ้ง	บุกเฉาก๊วย	\N	5	\N	day	t	Topping	Grass Jelly Konjac	\N	\N
132	เครื่องดื่ม	รายการเสริม	ท็อปปิ้ง	มุกป๊อปแอปเปิ้ล	\N	5	\N	day	t	Topping	Apple Popping Boba	\N	\N
133	เครื่องดื่ม	รายการเสริม	ท็อปปิ้ง	มุกป๊อปลิ้นจี่	\N	5	\N	day	t	Topping	Lychee Popping Boba	\N	\N
134	เครื่องดื่ม	รายการเสริม	ท็อปปิ้ง	มุกป๊อปบลูเบอร์รี่	\N	5	\N	day	t	Topping	Blueberry Popping Boba	\N	\N
135	เครื่องดื่ม	รายการเสริม	ท็อปปิ้ง	มุกป๊อปสตรอเบอร์รี่	\N	5	\N	day	t	Topping	Strawberry Popping Boba	\N	\N
26	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดน้ำพริกเผาราดข้าว	เนื้อ	70	https://i.postimg.cc/bJYv3Twh/ph-dn-aphr-kphea.jpg	day	t	With Rice	Stir-Fried with Chili Paste on Rice	Beef	4
27	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดน้ำพริกเผาราดข้าว	หอยลาย	80	https://i.postimg.cc/bJYv3Twh/ph-dn-aphr-kphea.jpg	day	t	With Rice	Stir-Fried with Chili Paste on Rice	Clams	4
50	อาหาร	เมนูหลัก	เมนูราดข้าว	ข้าวผัดกะเพราไข่เยี่ยวม้า	ไก่	50	https://i.postimg.cc/Y92Sb3qg/ka-pheraa-khi-ye-ywm-a.jpg	day	t	With Rice	Basil Fried Rice with Century Egg	Chicken	9
51	อาหาร	เมนูหลัก	เมนูราดข้าว	ข้าวผัดกะเพราไข่เยี่ยวม้า	หมูกรอบ	70	https://i.postimg.cc/Y92Sb3qg/ka-pheraa-khi-ye-ywm-a.jpg	day	t	With Rice	Basil Fried Rice with Century Egg	Crispy Pork	9
52	อาหาร	เมนูหลัก	เมนูราดข้าว	ข้าวผัดกะเพราวุ้นเส้น	หมูสับ	60	https://i.postimg.cc/yYCbtYZ9/ka-phe-raaw-nse-n.jpg	day	t	With Rice	Basil Fried Rice with Glass Noodles	Minced Pork	10
53	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดพริกแกงราดข้าว	ปลาดุกทอด	70	https://i.postimg.cc/63HpSv8x/ph-dphr-kkaeng.jpg	day	t	With Rice	Stir-Fried Red Curry Paste on Rice	Fried Catfish	11
54	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดพริกแกงราดข้าว	ปลาดุก	70	https://i.postimg.cc/63HpSv8x/ph-dphr-kkaeng.jpg	day	t	With Rice	Stir-Fried Red Curry Paste on Rice	Catfish	11
55	อาหาร	เมนูหลัก	อาหารจานเดียว	ข้าวผัด	หมู	50	https://i.postimg.cc/0Q5Ncf2c/kh-awph-d.jpg	day	t	Single Dish	Fried Rice	Pork	12
56	อาหาร	เมนูหลัก	อาหารจานเดียว	ข้าวผัด	ไก่	50	https://i.postimg.cc/0Q5Ncf2c/kh-awph-d.jpg	day	t	Single Dish	Fried Rice	Chicken	12
57	อาหาร	เมนูหลัก	อาหารจานเดียว	ข้าวผัด	ทะเล	70	https://i.postimg.cc/0Q5Ncf2c/kh-awph-d.jpg	day	t	Single Dish	Fried Rice	Seafood	12
59	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดซีอิ๊ว	ไก่	50	https://i.postimg.cc/k4M5fcgP/ph-ds-x-w.jpg	day	t	Single Dish	Pad See Ew (Stir-Fried Rice Noodles with Soy Sauce)	Chicken	13
60	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดซีอิ๊ว	ทะเล	70	https://i.postimg.cc/k4M5fcgP/ph-ds-x-w.jpg	day	t	Single Dish	Pad See Ew (Stir-Fried Rice Noodles with Soy Sauce)	Seafood	13
61	อาหาร	เมนูหลัก	อาหารจานเดียว	ราดหน้า	หมู	50	https://i.postimg.cc/d1WVXyhv/rad-hn-a.jpg	day	t	Single Dish	Rad Na (Noodles in Gravy Sauce)	Pork	14
62	อาหาร	เมนูหลัก	อาหารจานเดียว	ราดหน้า	ไก่	50	https://i.postimg.cc/d1WVXyhv/rad-hn-a.jpg	day	t	Single Dish	Rad Na (Noodles in Gravy Sauce)	Chicken	14
224	อาหาร	เมนูหลัก	อาหารจานเดียว	คั่วพริกเกลือราดข้าว	หมู	70	https://i.postimg.cc/RFC0XRVg/kh-wphr-kkel-x.jpg	night	t	Single Dish	Stir-Fried Chili & Salt with Rice	Pork	142
259	อาหาร	รายการเสริม	อาหารจานเดียว	ไข่ดาว	\N	10	\N	night	t	Single Dish	Fried Egg	\N	\N
260	อาหาร	รายการเสริม	อาหารจานเดียว	ไข่เจียว	\N	10	\N	night	t	Single Dish	Thai Omelet	\N	\N
261	อาหาร	รายการเสริม	อาหารจานเดียว	เป็นกับข้าว	\N	30	\N	night	t	Single Dish	A la carte (No rice)	\N	\N
262	อาหาร	รายการเสริม	อาหารจานเดียว	สั่งกลับบ้าน	\N	0	\N	night	t	Single Dish	Takeaway	\N	\N
33	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดเผ็ดราดข้าว	หมู	50	https://i.postimg.cc/j5qjZXSK/ph-dphe-d.jpg	day	t	With Rice	Spicy Stir-Fried Curry Paste on Rice	Pork	6
34	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดเผ็ดราดข้าว	ไก่	50	https://i.postimg.cc/j5qjZXSK/ph-dphe-d.jpg	day	t	With Rice	Spicy Stir-Fried Curry Paste on Rice	Chicken	6
35	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดเผ็ดราดข้าว	เนื้อ	70	https://i.postimg.cc/j5qjZXSK/ph-dphe-d.jpg	day	t	With Rice	Spicy Stir-Fried Curry Paste on Rice	Beef	6
36	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดเผ็ดราดข้าว	กบ	80	https://i.postimg.cc/j5qjZXSK/ph-dphe-d.jpg	day	t	With Rice	Spicy Stir-Fried Curry Paste on Rice	Frog	6
37	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดเผ็ดราดข้าว	หมููป่า	80	https://i.postimg.cc/j5qjZXSK/ph-dphe-d.jpg	day	t	With Rice	Spicy Stir-Fried Curry Paste on Rice	Wild Boar	6
38	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดเผ็ดราดข้าว	ปลาดุก	80	https://i.postimg.cc/j5qjZXSK/ph-dphe-d.jpg	day	t	With Rice	Spicy Stir-Fried Curry Paste on Rice	Catfish	6
39	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดผักคะน้าราดข้าว	หมู	50	https://i.postimg.cc/TwHttTXD/ph-dkhan-a.jpg	day	t	With Rice	Stir-Fried Chinese Kale on Rice	Pork	7
40	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดผักคะน้าราดข้าว	ไก่	50	https://i.postimg.cc/TwHttTXD/ph-dkhan-a.jpg	day	t	With Rice	Stir-Fried Chinese Kale on Rice	Chicken	7
41	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดผักคะน้าราดข้าว	หมูกรอบ	60	https://i.postimg.cc/TwHttTXD/ph-dkhan-a.jpg	day	t	With Rice	Stir-Fried Chinese Kale on Rice	Crispy Pork	7
42	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดผักคะน้าราดข้าว	ทะเล	70	https://i.postimg.cc/TwHttTXD/ph-dkhan-a.jpg	day	t	With Rice	Stir-Fried Chinese Kale on Rice	Seafood	7
43	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดผักคะน้าราดข้าว	ปลาเค็ม	70	https://i.postimg.cc/TwHttTXD/ph-dkhan-a.jpg	day	t	With Rice	Stir-Fried Chinese Kale on Rice	Salted Fish	7
44	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดกะเพราราดข้าว	หมู	50	https://i.postimg.cc/Gpx2FNrK/kaphera.jpg	day	t	With Rice	Stir-Fried Holy Basil on Rice (Pad Ka Pao)	Pork	8
45	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดกะเพราราดข้าว	ไก่	50	https://i.postimg.cc/Gpx2FNrK/kaphera.jpg	day	t	With Rice	Stir-Fried Holy Basil on Rice (Pad Ka Pao)	Chicken	8
46	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดกะเพราราดข้าว	หมูกรอบ	70	https://i.postimg.cc/Gpx2FNrK/kaphera.jpg	day	t	With Rice	Stir-Fried Holy Basil on Rice (Pad Ka Pao)	Crispy Pork	8
47	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดกะเพราราดข้าว	เนื้อ	70	https://i.postimg.cc/Gpx2FNrK/kaphera.jpg	day	t	With Rice	Stir-Fried Holy Basil on Rice (Pad Ka Pao)	Beef	8
48	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดกะเพราราดข้าว	ปลาดุก	70	https://i.postimg.cc/Gpx2FNrK/kaphera.jpg	day	t	With Rice	Stir-Fried Holy Basil on Rice (Pad Ka Pao)	Catfish	8
49	อาหาร	เมนูหลัก	เมนูราดข้าว	ข้าวผัดกะเพราไข่เยี่ยวม้า	หมู	50	https://i.postimg.cc/Y92Sb3qg/ka-pheraa-khi-ye-ywm-a.jpg	day	t	With Rice	Basil Fried Rice with Century Egg	Pork	9
63	อาหาร	เมนูหลัก	อาหารจานเดียว	ราดหน้า	ทะเล	70	https://i.postimg.cc/d1WVXyhv/rad-hn-a.jpg	day	t	Single Dish	Rad Na (Noodles in Gravy Sauce)	Seafood	14
78	เครื่องดื่ม	เมนูหลัก	ชา	ชาดำเย็น	\N	35	https://i.postimg.cc/bJ5rPxFG/chada.png	day	t	Tea	Iced Black Tea	\N	20
79	เครื่องดื่ม	เมนูหลัก	ชา	ชาเย็น	\N	35	https://i.postimg.cc/KvZwb6BK/Gemini-Generated-Image-mnue5bmnue5bmnue.png	day	t	Tea	Thai Iced Milk Tea	\N	21
80	เครื่องดื่ม	เมนูหลัก	ชา	ชาเขียวลองกรีน	\N	35	https://i.postimg.cc/BQqk3rH6/Gemini-Generated-Image-mnue5bmnue5bmnue-(2).png	day	t	Tea	Long Green Tea	\N	22
81	เครื่องดื่ม	เมนูหลัก	ชา	ชาเขียวเย็น	\N	35	https://i.postimg.cc/BQqk3rH6/Gemini-Generated-Image-mnue5bmnue5bmnue-(2).png	day	t	Tea	Iced Green Milk Tea	\N	23
82	เครื่องดื่ม	เมนูหลัก	โกโก้ นม	โกโก้เย็น	\N	40	https://i.postimg.cc/zXJ6NsKv/Gemini-Generated-Image-mnue5bmnue5bmnue-(1).png	day	t	Milk	Iced Cocoa	\N	24
83	เครื่องดื่ม	เมนูหลัก	โกโก้ นม	โกโก้กรีนที	\N	40	https://i.postimg.cc/JzXVp9Xy/ko-kr-n.png	day	t	Milk	Cocoa Green Tea	\N	25
84	เครื่องดื่ม	เมนูหลัก	โกโก้ นม	ชาโคลน	\N	40	https://i.postimg.cc/DwGkxtGb/cha-kholn.png	day	t	Milk	Mud Milk Tea	\N	26
85	เครื่องดื่ม	เมนูหลัก	โกโก้ นม	โกโก้ทีเลิฟ	\N	40	https://i.postimg.cc/fRdn86dt/th-le-f.png	day	t	Milk	Cocoa Tea Love	\N	27
86	เครื่องดื่ม	เมนูหลัก	โกโก้ นม	นมชมพู	\N	35	https://i.postimg.cc/ZRQnm8DW/nm-yen.png	day	t	Milk	Pink Milk (Iced Sweet Pink Milk)	\N	28
7	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดน้ำมันหอยราดข้าว	หมูกรอบ	60	https://i.postimg.cc/hj4GprPk/n-am-nhxy.jpg	day	t	With Rice	Stir-Fried with Oyster Sauce on Rice	Crispy Pork	0
69	เพิ่มเติม	เมนูหลัก	เมนูต้ม	ต้มข่าไก่	\N	70	https://i.postimg.cc/d1Q04BtN/t-mkh-aki.jpg	day	t	Soup	Tom Kha Gai (Chicken Coconut Soup)	\N	15
70	เพิ่มเติม	เมนูหลัก	เมนูต้ม	ต้มจืดเต้าหู้	หมูสับ	70	https://i.postimg.cc/85kCtHPn/t-mc-d.jpg	day	t	Soup	Tofu Clear Soup	Minced pork	16
71	เพิ่มเติม	เมนูหลัก	เมนูต้ม	ต้มจืดเต้าหู้	ไก่สับ	70	https://i.postimg.cc/85kCtHPn/t-mc-d.jpg	day	t	Soup	Tofu Clear Soup	Minced Chicken	16
72	เพิ่มเติม	เมนูหลัก	เมนูต้ม	ผัดสะตอกุ้ง	\N	80	https://i.postimg.cc/26HSJZ1D/ph-d-satx.jpg	day	t	Soup	Stir-Fried Stink Beans with Shrimps	\N	17
73	เพิ่มเติม	เมนูหลัก	เมนูต้ม	แกงส้ม	ปลา	80	https://i.postimg.cc/tgNT3fy5/kaengs-m.jpg	day	t	Soup	Sour Curry (Kaeng Som)	Fish	18
74	เพิ่มเติม	เมนูหลัก	เมนูต้ม	แกงส้ม	หมู	80	https://i.postimg.cc/tgNT3fy5/kaengs-m.jpg	day	t	Soup	Sour Curry (Kaeng Som)	Pork	18
75	เพิ่มเติม	เมนูหลัก	เมนูต้ม	แกงส้ม	กุ้ง	80	https://i.postimg.cc/tgNT3fy5/kaengs-m.jpg	day	t	Soup	Sour Curry (Kaeng Som)	Shrimp	18
13	อาหาร	เมนูหลัก	เมนูราดข้าว	คั่วพริกเกลือราดข้าว	หมู	50	https://i.postimg.cc/RFC0XRVg/kh-wphr-kkel-x.jpg	day	t	With Rice	Stir-Fried Chili & Salt on Rice	Pork	2
9	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดกระเทียมพริกไทยราดข้าว	หมู	50	https://i.postimg.cc/6Qf3rSwh/kra-the-ymphr-kthiy.jpg	day	t	With Rice	Stir-Fried with Garlic and Pepper on Rice	Pork	1
10	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดกระเทียมพริกไทยราดข้าว	ไก่	50	https://i.postimg.cc/6Qf3rSwh/kra-the-ymphr-kthiy.jpg	day	t	With Rice	Stir-Fried with Garlic and Pepper on Rice	Chicken	1
11	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดกระเทียมพริกไทยราดข้าว	หมูกรอบ	60	https://i.postimg.cc/6Qf3rSwh/kra-the-ymphr-kthiy.jpg	day	t	With Rice	Stir-Fried with Garlic and Pepper on Rice	Crispy Pork	1
6	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดน้ำมันหอยราดข้าว	ไก่	50	https://i.postimg.cc/hj4GprPk/n-am-nhxy.jpg	day	t	With Rice	Stir-Fried with Oyster Sauce on Rice	Chicken	0
8	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดน้ำมันหอยราดข้าว	ทะเล	70	https://i.postimg.cc/hj4GprPk/n-am-nhxy.jpg	day	t	With Rice	Stir-Fried with Oyster Sauce on Rice	Seafood	0
87	เครื่องดื่ม	เมนูหลัก	โกโก้ นม	นมเขียว	\N	35	https://i.postimg.cc/1tdXSGY4/nmkhe-yw.png	day	t	Milk	Green Milk (Iced Sweet Green Milk)	\N	29
88	เครื่องดื่ม	เมนูหลัก	โกโก้ นม	โอวัลตินเย็น	\N	40	https://i.postimg.cc/tJ4Xs2YQ/ovaltine.png	day	t	Milk	Iced Ovaltine	\N	30
89	เครื่องดื่ม	เมนูหลัก	กาแฟ	เอสเปรสโซ่เย็น	\N	35	https://i.postimg.cc/G37LZxsR/xe-s-per-s-so.png	day	t	Coffee	Iced Espresso	\N	31
90	เครื่องดื่ม	เมนูหลัก	กาแฟ	ลาเต้เย็น	\N	35	https://i.postimg.cc/bJLyYQCL/late.png	day	t	Coffee	Iced Latte	\N	32
91	เครื่องดื่ม	เมนูหลัก	กาแฟ	คาปูชิโน่เย็น	\N	35	https://i.postimg.cc/Xqzndn00/khap-ch-no.png	day	t	Coffee	Iced Cappuccino	\N	33
92	เครื่องดื่ม	เมนูหลัก	กาแฟ	มอคค่าเย็น	\N	40	https://i.postimg.cc/c19xVB8G/mxkhkh-a.png	day	t	Coffee	Iced Mocha	\N	34
93	เครื่องดื่ม	เมนูหลัก	กาแฟ	อเมริกาโน่เย็น	\N	35	https://i.postimg.cc/50ryJBkF/xmer-kano.png	day	t	Coffee	Iced Americano	\N	35
94	เครื่องดื่ม	เมนูหลัก	กาแฟ	อเมริกาโน่น้ำผึ้งเย็น	\N	40	https://i.postimg.cc/50ryJBkF/xmer-kano.png	day	t	Coffee	Iced Honey Americano	\N	36
95	เครื่องดื่ม	เมนูหลัก	กาแฟ	อเมริกาโน่น้ำผึ้งมะนาว	\N	40	https://i.postimg.cc/50ryJBkF/xmer-kano.png	day	t	Coffee	Iced Honey Lime Americano	\N	37
96	เครื่องดื่ม	เมนูหลัก	น้ำผลไม้โซดา	น้ำแดงโซดา	\N	30	https://i.postimg.cc/05K60NQ2/daeng-so-cr-ng__.png	day	t	Fruit Soda	Red Soda (Salak Flavored Soda)	\N	38
97	เครื่องดื่ม	เมนูหลัก	น้ำผลไม้โซดา	น้ำเขียวโซดา	\N	30	https://i.postimg.cc/wMv617Zw/khe-yw.png	day	t	Fruit Soda	Green Soda (Cream Soda)	\N	39
98	เครื่องดื่ม	เมนูหลัก	น้ำผลไม้โซดา	น้ำมะนาวโซดา	\N	30	https://i.postimg.cc/Kj8Z1JR2/honey.png	day	t	Fruit Soda	Lime Soda	\N	40
99	เครื่องดื่ม	เมนูหลัก	น้ำผลไม้โซดา	น้ำบ๊วยโซดา	\N	30	https://i.postimg.cc/tT9RHrzv/b-wy-soda.png	day	t	Fruit Soda	Plum Soda	\N	41
100	เครื่องดื่ม	เมนูหลัก	น้ำผลไม้โซดา	น้ำองุ่นโซดา	\N	30	https://i.postimg.cc/RhFMWNyk/m-wng.png	day	t	Fruit Soda	Grape Soda	\N	42
101	เครื่องดื่ม	เมนูหลัก	น้ำผลไม้โซดา	น้ำน้ำผึ้งโซดา	\N	30	https://i.postimg.cc/Kj8Z1JR2/honey.png	day	t	Fruit Soda	Honey Soda	\N	43
102	เครื่องดื่ม	เมนูหลัก	น้ำผลไม้โซดา	น้ำลิ้นจี่โซดา	\N	30	https://i.postimg.cc/MG7ZNkyk/l-nso.png	day	t	Fruit Soda	Lychee Soda	\N	44
103	เครื่องดื่ม	เมนูหลัก	น้ำผลไม้โซดา	น้ำส้มโซดา	\N	30	https://i.postimg.cc/rmqyLh9Y/s-mso.png	day	t	Fruit Soda	Orange Soda	\N	45
104	เครื่องดื่ม	เมนูหลัก	น้ำผลไม้โซดา	น้ำแคนตาลูปโซดา	\N	30	https://i.postimg.cc/YS62Zc1K/manaw-so.png	day	t	Fruit Soda	Cantaloupe Soda	\N	46
105	เครื่องดื่ม	เมนูหลัก	น้ำผลไม้โซดา	น้ำแตงโมโซดา	\N	30	https://i.postimg.cc/2y6z1VM2/daeng.png	day	t	Fruit Soda	Watermelon Soda	\N	47
106	เครื่องดื่ม	เมนูหลัก	น้ำผลไม้โซดา	น้ำมะม่วงโซดา	\N	30	https://i.postimg.cc/rmqyLh9Y/s-mso.png	day	t	Fruit Soda	Mango Soda	\N	48
107	เครื่องดื่ม	เมนูหลัก	น้ำผลไม้โซดา	น้ำแอปเปิ้ลเขียวโซดา	\N	30	https://i.postimg.cc/YS62Zc1K/manaw-so.png	day	t	Fruit Soda	Green Apple Soda	\N	49
108	เครื่องดื่ม	เมนูหลัก	น้ำผลไม้โซดา	น้ำสตรอเบอร์รี่โซดา	\N	30	https://i.postimg.cc/05K60NQ2/daeng-so-cr-ng__.png	day	t	Fruit Soda	Strawberry Soda	\N	50
109	เครื่องดื่ม	เมนูหลัก	น้ำผลไม้โซดา	น้ำผึ้งมะนาวโซดา	\N	30	https://i.postimg.cc/Kj8Z1JR2/honey.png	day	t	Fruit Soda	Honey Lime Soda	\N	51
110	เครื่องดื่ม	เมนูหลัก	ชาผลไม้	ชามะนาว	\N	30	https://i.postimg.cc/tT9RHrzv/b-wy-soda.png	day	t	Fruit Tea	Lemon Tea	\N	52
111	เครื่องดื่ม	เมนูหลัก	ชาผลไม้	ชาบ๊วย	\N	30	https://i.postimg.cc/tT9RHrzv/b-wy-soda.png	day	t	Fruit Tea	Plum Tea	\N	53
112	เครื่องดื่ม	เมนูหลัก	ชาผลไม้	ชาองุ่น	\N	30	https://i.postimg.cc/tT9RHrzv/b-wy-soda.png	day	t	Fruit Tea	Grape Tea	\N	54
113	เครื่องดื่ม	เมนูหลัก	ชาผลไม้	ชาน้ำผึ้ง	\N	30	https://i.postimg.cc/tT9RHrzv/b-wy-soda.png	day	t	Fruit Tea	Honey Tea	\N	55
114	เครื่องดื่ม	เมนูหลัก	ชาผลไม้	ชาลิ้นจี่	\N	30	https://i.postimg.cc/tT9RHrzv/b-wy-soda.png	day	t	Fruit Tea	Lychee Tea	\N	56
115	เครื่องดื่ม	เมนูหลัก	ชาผลไม้	ชาแคนตาลูป	\N	30	https://i.postimg.cc/tT9RHrzv/b-wy-soda.png	day	t	Fruit Tea	Cantaloupe Tea	\N	57
116	เครื่องดื่ม	เมนูหลัก	ชาผลไม้	ชาแตงโม	\N	30	https://i.postimg.cc/tT9RHrzv/b-wy-soda.png	day	t	Fruit Tea	Watermelon Tea	\N	58
117	เครื่องดื่ม	เมนูหลัก	ชาผลไม้	ชามะม่วง	\N	30	https://i.postimg.cc/tT9RHrzv/b-wy-soda.png	day	t	Fruit Tea	Mango Tea	\N	59
118	เครื่องดื่ม	เมนูหลัก	ชาผลไม้	ชาแอปเปิ้ลเขียว	\N	30	https://i.postimg.cc/tT9RHrzv/b-wy-soda.png	day	t	Fruit Tea	Green Apple Tea	\N	60
119	เครื่องดื่ม	เมนูหลัก	ชาผลไม้	ชาสตรอเบอร์รี่	\N	30	https://i.postimg.cc/tT9RHrzv/b-wy-soda.png	day	t	Fruit Tea	Strawberry Tea	\N	61
120	เครื่องดื่ม	เมนูหลัก	ชาผลไม้	ชาน้ำผึ้งมะนาว	\N	30	https://i.postimg.cc/tT9RHrzv/b-wy-soda.png	day	t	Fruit Tea	Honey Lemon Tea	\N	62
121	เครื่องดื่ม	เมนูหลัก	ชาผลไม้	ชาส้ม	\N	30	https://i.postimg.cc/tT9RHrzv/b-wy-soda.png	day	t	Fruit Tea	Orange Tea	\N	63
136	อาหาร	เมนูหลัก	ของหวาน	เฉาก๊วยชากังราว	\N	30	https://i.postimg.cc/3NQ3BYS0/k-wyk-ng.jpg	day	t	Dessert	Cha-Kang-Rao Grass Jelly	\N	64
137	อาหาร	เมนูหลัก	ของหวาน	เฉาก๊วยนมสด	\N	40	https://i.postimg.cc/5yWf3b7x/k-wy.jpg	day	t	Dessert	Grass Jelly with Fresh Milk	\N	65
138	เครื่องดื่ม	เมนูหลัก	น้ำดื่ม	น้ำดื่มทิพย์	\N	10	https://i.postimg.cc/VvFPWM02/n-ath-phy.jpg	both	t	Water	Drinking Water	\N	66
14	อาหาร	เมนูหลัก	เมนูราดข้าว	คั่วพริกเกลือราดข้าว	ไก่	50	https://i.postimg.cc/RFC0XRVg/kh-wphr-kkel-x.jpg	day	t	With Rice	Stir-Fried Chili & Salt on Rice	Chicken	2
15	อาหาร	เมนูหลัก	เมนูราดข้าว	คั่วพริกเกลือราดข้าว	หมูกรอบ	60	https://i.postimg.cc/RFC0XRVg/kh-wphr-kkel-x.jpg	day	t	With Rice	Stir-Fried Chili & Salt on Rice	Crispy Pork	2
16	อาหาร	เมนูหลัก	เมนูราดข้าว	คั่วพริกเกลือราดข้าว	ทะเล	70	https://i.postimg.cc/RFC0XRVg/kh-wphr-kkel-x.jpg	day	t	With Rice	Stir-Fried Chili & Salt on Rice	Seafood	2
17	อาหาร	เมนูหลัก	เมนูราดข้าว	คั่วพริกเกลือราดข้าว	เนื้อ	70	https://i.postimg.cc/RFC0XRVg/kh-wphr-kkel-x.jpg	day	t	With Rice	Stir-Fried Chili & Salt on Rice	Beef	2
22	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดน้ำพริกเผาราดข้าว	หมู	50	https://i.postimg.cc/bJYv3Twh/ph-dn-aphr-kphea.jpg	day	t	With Rice	Stir-Fried with Chili Paste on Rice	Pork	4
23	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดน้ำพริกเผาราดข้าว	ไก่	50	https://i.postimg.cc/bJYv3Twh/ph-dn-aphr-kphea.jpg	day	t	With Rice	Stir-Fried with Chili Paste on Rice	Chicken	4
24	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดน้ำพริกเผาราดข้าว	หมูกรอบ	60	https://i.postimg.cc/bJYv3Twh/ph-dn-aphr-kphea.jpg	day	t	With Rice	Stir-Fried with Chili Paste on Rice	Crispy Pork	4
25	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดน้ำพริกเผาราดข้าว	ทะเล	70	https://i.postimg.cc/bJYv3Twh/ph-dn-aphr-kphea.jpg	day	t	With Rice	Stir-Fried with Chili Paste on Rice	Seafood	4
140	เครื่องดื่ม	เมนูหลัก	น้ำอัดลม	โค้ก	\N	20	https://i.postimg.cc/PJHkDKJm/coke.jpg	both	t	Soft Drinks	Coca-Cola (Coke)	\N	68
141	เครื่องดื่ม	เมนูหลัก	น้ำอัดลม	โค้กซีโร่	\N	20	https://i.postimg.cc/brPjnLrk/coke-zeor.jpg	both	t	Soft Drinks	Coke Zero	\N	69
142	เครื่องดื่ม	เมนูหลัก	น้ำอัดลม	สไปรต์	\N	20	https://i.postimg.cc/hv0R1xQr/Sprite.jpg	both	t	Soft Drinks	Sprite	\N	70
143	เครื่องดื่ม	เมนูหลัก	น้ำอัดลม	บ๊วยเลมอนโซดา	\N	20	https://i.postimg.cc/WpmVVRYN/b-wy-lemxn.webp	both	t	Soft Drinks	Plum Lemon Soda	\N	71
144	เครื่องดื่ม	เมนูหลัก	น้ำอัดลม	แฟนต้าเขียว	\N	20	https://i.postimg.cc/pVQvvNcV/faen-khe-yw.jpg	both	t	Soft Drinks	Fanta Green	\N	72
145	เครื่องดื่ม	เมนูหลัก	น้ำอัดลม	แฟนต้าแดง	\N	20	https://i.postimg.cc/QNgDDLYM/faen-daeng.jpg	both	t	Soft Drinks	Fanta Red	\N	73
146	เครื่องดื่ม	เมนูหลัก	น้ำอัดลม	แฟนต้าน้ำส้ม	\N	20	https://i.postimg.cc/HW0mmGvJ/faens-m.jpg	both	t	Soft Drinks	Fanta Orange	\N	74
147	เครื่องดื่ม	เมนูหลัก	ไวน์คูลเลอร์	สปายเรด	\N	70	https://i.postimg.cc/MHYJmRfF/spy-red.jpg	both	t	Wine Coolers	SPY Red	\N	75
148	เครื่องดื่ม	เมนูหลัก	ไวน์คูลเลอร์	สปายคลาสสิค	\N	70	https://i.postimg.cc/Kj5hDL39/spy-classic.jpg	both	t	Wine Coolers	SPY Classic	\N	76
149	เครื่องดื่ม	เมนูหลัก	ไวน์คูลเลอร์	สปายบลูไลม์	\N	70	https://i.postimg.cc/qqGHxn6j/Spy-Blue.jpg	both	t	Wine Coolers	SPY Blue Lime	\N	77
150	เครื่องดื่ม	เมนูหลัก	ไวน์คูลเลอร์	สปายมิกซ์เบอร์รี	\N	70	https://i.postimg.cc/RhTxLfJb/spy-mixed.jpg	both	t	Wine Coolers	SPY Mixed Berry	\N	78
151	เครื่องดื่ม	เมนูหลัก	ไวน์คูลเลอร์	สปายแซ่บคิส	\N	70	https://i.postimg.cc/T1cvJm5F/spy-zap.jpg	both	t	Wine Coolers	SPY Zab Kiss	\N	79
152	เครื่องดื่ม	เมนูหลัก	ไซเดอร์	มูสไซเดอร์ ออริจินัล	\N	150	https://i.postimg.cc/fyvQfXSX/Moose-Original.jpg	both	t	Cider	Moose Cider Original	\N	80
153	เครื่องดื่ม	เมนูหลัก	ไซเดอร์	มูสอินดี้ ซัมเมอร์	\N	150	https://i.postimg.cc/QCqZJ5KT/Moose-Indie-Summer.jpg	both	t	Cider	Moose Indy Summer	\N	81
154	เครื่องดื่ม	เมนูหลัก	ไซเดอร์	แม็กเนอร์ส	\N	190	https://i.postimg.cc/qqGHxn6C/magner.jpg	both	t	Cider	Magners	\N	82
155	เครื่องดื่ม	เมนูหลัก	ไซเดอร์	แอนนา	\N	230	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Cider	Anna	\N	83
156	เครื่องดื่ม	เมนูหลัก	ไซเดอร์	คริสปี้	\N	230	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Cider	Crispy	\N	84
157	เครื่องดื่ม	เมนูหลัก	เบียร์	ช้าง เล็ก	\N	60	https://i.postimg.cc/SRGbf8Y5/ch-ang.jpg	both	t	Beer	Chang (Small)	\N	85
158	เครื่องดื่ม	เมนูหลัก	เบียร์	ช้าง ใหญ่	\N	90	https://i.postimg.cc/SRGbf8Y5/ch-ang.jpg	both	t	Beer	Chang (Large)	\N	86
159	เครื่องดื่ม	เมนูหลัก	เบียร์	สิงห์ เล็ก	\N	65	https://i.postimg.cc/j2hY4Nnz/Singha-Beer.jpg	both	t	Beer	Singha (Small)	\N	87
160	เครื่องดื่ม	เมนูหลัก	เบียร์	สิงห์ ใหญ่	\N	100	https://i.postimg.cc/j2hY4Nnz/Singha-Beer.jpg	both	t	Beer	Singha (Large)	\N	88
161	เครื่องดื่ม	เมนูหลัก	เบียร์	ลีโอ เล็ก	\N	60	https://i.postimg.cc/XNKWWM1k/l-xo.jpg	both	t	Beer	Leo (Small)	\N	89
162	เครื่องดื่ม	เมนูหลัก	เบียร์	ลีโอ ใหญ่	\N	90	https://i.postimg.cc/XNKWWM1k/l-xo.jpg	both	t	Beer	Leo (Large)	\N	90
163	เครื่องดื่ม	เมนูหลัก	เบียร์	ไฮเนเก้น เล็ก	\N	70	https://i.postimg.cc/QCqZJ5KH/Heineken-Beer.jpg	both	t	Beer	Heineken (Small)	\N	91
164	เครื่องดื่ม	เมนูหลัก	เบียร์	ไฮเนเก้น ใหญ่	\N	120	https://i.postimg.cc/QCqZJ5KH/Heineken-Beer.jpg	both	t	Beer	Heineken (Large)	\N	92
165	เครื่องดื่ม	เมนูหลัก	เบียร์	บัดไวเซอร์	\N	120	https://i.postimg.cc/8cbgmWfq/b-d-wi-se-xr.jpg	both	t	Beer	Budweiser	\N	93
166	เครื่องดื่ม	เมนูหลัก	เบียร์	โคโรน่า เอ็กซ์ตร้า	\N	150	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Beer	Corona Extra	\N	94
167	เครื่องดื่ม	เมนูหลัก	เบียร์	เรดฮอร์ส	\N	150	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Beer	Red Horse	\N	95
168	เครื่องดื่ม	เมนูหลัก	เบียร์	แทปเปอร์	\N	200	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Beer	Tapper	\N	96
169	เครื่องดื่ม	เมนูหลัก	เบียร์	อาร์โคบรอว์ เฮลเลส	\N	250	https://i.postimg.cc/hvnqmMvx/Arcobrau-Helles.jpg	both	t	Beer	Arcobrau Helles	\N	97
170	เครื่องดื่ม	เมนูหลัก	เบียร์ขาว	โฮการ์เดน วิทเบียร์	\N	155	https://i.postimg.cc/Kc7bbXpJ/ho-kar-den-witbier.jpg	both	t	Wheat Beer	Hoegaarden Witbier	\N	98
171	เครื่องดื่ม	เมนูหลัก	เบียร์ขาว	โฮการ์เดน โรเซ่	\N	155	https://i.postimg.cc/G3PRR0gX/ho-ro-se.jpg	both	t	Wheat Beer	Hoegaarden Rosee	\N	99
172	เครื่องดื่ม	เมนูหลัก	เบียร์ขาว	เออดีนเจอร์ ดังเคิล	\N	250	https://i.postimg.cc/RhmztGh7/Erdinger-Dunkle.jpg	both	t	Wheat Beer	Erdinger Dunkel	\N	100
173	เครื่องดื่ม	เมนูหลัก	เบียร์ขาว	วิฬาร์	\N	220	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Wheat Beer	Wila	\N	101
174	เครื่องดื่ม	เมนูหลัก	เบียร์คราฟต์	เบียร์ควาย	\N	150	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Craft Beer	Kwai Beer	\N	102
175	เครื่องดื่ม	เมนูหลัก	เบียร์คราฟต์	ราเวน ไอพีเอ	\N	150	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Craft Beer	Raven IPA	\N	103
139	เครื่องดื่ม	เมนูหลัก	น้ำอัดลม	โซดา	\N	20	https://i.postimg.cc/zvkYFWHw/soda-rock.jpg	both	t	Soft Drinks	Soda Water	\N	67
176	เครื่องดื่ม	เมนูหลัก	เบียร์คราฟต์	ราเวน	\N	220	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Craft Beer	Raven	\N	104
177	เครื่องดื่ม	เมนูหลัก	เบียร์คราฟต์	คริสปี้	\N	220	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Craft Beer	Crispy	\N	105
178	เครื่องดื่ม	เมนูหลัก	เบียร์คราฟต์	มวยไทย โชคดี	\N	150	https://i.postimg.cc/vTvwt9xf/Muai-Thai-chokhd.jpg	both	t	Craft Beer	Muay Thai Chokdee	\N	106
179	เครื่องดื่ม	เมนูหลัก	บรั่นดี รัม	รีเจนซี่ แบน	\N	450	https://i.postimg.cc/G3PRR0gy/r-baen.jpg	both	t	Brandy/Rum	Regency (Flat)	\N	107
180	เครื่องดื่ม	เมนูหลัก	บรั่นดี รัม	รีเจนซี่ กลม	\N	650	https://i.postimg.cc/sfPzzFH7/r-klm.jpg	both	t	Brandy/Rum	Regency (Round)	\N	108
181	เครื่องดื่ม	เมนูหลัก	บรั่นดี รัม	เมอริเดียน แบน	\N	325	https://i.postimg.cc/dQRFFMNk/mexr-baen.jpg	both	t	Brandy/Rum	Meridian (Flat)	\N	109
182	เครื่องดื่ม	เมนูหลัก	บรั่นดี รัม	เมอริเดียน กลม	\N	595	https://i.postimg.cc/dQRFFMNk/mexr-baen.jpg	both	t	Brandy/Rum	Meridian (Round)	\N	110
183	เครื่องดื่ม	เมนูหลัก	บรั่นดี รัม	แสงโสม แบน	\N	250	https://i.postimg.cc/CMC00yr4/saeng-baen.webp	both	t	Brandy/Rum	SangSom (Flat)	\N	111
184	เครื่องดื่ม	เมนูหลัก	บรั่นดี รัม	แสงโสม กลม	\N	350	https://i.postimg.cc/jq6TTV3H/saeng-klm.jpg	both	t	Brandy/Rum	SangSom (Round)	\N	112
185	เครื่องดื่ม	เมนูหลัก	บรั่นดี รัม	หงส์ทอง แบน	\N	225	https://i.postimg.cc/Y2N77cD8/hng-baen.jpg	both	t	Brandy/Rum	Hong Thong (Flat)	\N	113
186	เครื่องดื่ม	เมนูหลัก	บรั่นดี รัม	หงส์ทอง กลม	\N	350	https://i.postimg.cc/pVQvvNcC/hngk-lm.jpg	both	t	Brandy/Rum	Hong Thong (Round)	\N	114
187	เครื่องดื่ม	เมนูหลัก	ไวน์	กาเบอร์เนต โซวิญง	\N	935	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Wine	Cabernet Sauvignon	\N	115
188	เครื่องดื่ม	เมนูหลัก	ไวน์	กรองด์ มาซอง	\N	890	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Wine	Grand Maison	\N	116
189	เครื่องดื่ม	เมนูหลัก	ไวน์	ชาโต โอ เบยแซก	\N	1175	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Wine	Chateau Haut-Beyssac	\N	117
190	เครื่องดื่ม	เมนูหลัก	ไวน์	ปอจโจ อัลโต	\N	740	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Wine	Poggio Alto	\N	118
191	เครื่องดื่ม	เมนูหลัก	ไวน์	ตอร์เรบรูน่า	\N	950	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Wine	Torrebruna	\N	119
192	เครื่องดื่ม	เมนูหลัก	ไวน์	มอนเต้ โซโว	\N	1025	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Wine	Monte Zovo	\N	120
193	เครื่องดื่ม	เมนูหลัก	ไวน์	เอาท์สเตชั่น วินยาร์ดส์	\N	725	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Wine	Outstation Vineyards	\N	121
194	เครื่องดื่ม	เมนูหลัก	ไวน์	เพนโฟลด์ แมกซ์	\N	1475	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Wine	Penfolds Max's	\N	122
195	เครื่องดื่ม	เมนูหลัก	ไวน์	โทมัส กอส	\N	980	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Wine	Thomas Goss	\N	123
196	เครื่องดื่ม	เมนูหลัก	ไวน์	ชาร์ดอนเนย์	\N	980	https://i.postimg.cc/mkDWYh57/chang999.jpg	both	t	Wine	Chardonnay	\N	124
197	เพิ่มเติม	เมนูหลัก	ขนมขบเคี้ยว	โก๋แก่ ถั่วปากอ้าอบเกลือ	\N	9999	https://i.postimg.cc/zBZnnRrS/ko-kae-th-w-pa-kx-a-xb-kel-x.jpg	both	t	Snacks	Koh-Kae Salted Broad Beans	\N	125
198	เพิ่มเติม	เมนูหลัก	ขนมขบเคี้ยว	โก๋แก่ ถั่วลิสงอบเกลือ	\N	9999	https://i.postimg.cc/26QnT8k1/ko-kae-th-wl-sng-xb-kel-x.jpg	both	t	Snacks	Koh-Kae Salted Peanuts	\N	126
199	เพิ่มเติม	เมนูหลัก	ขนมขบเคี้ยว	โก๋แก่ บาบีคิว	\N	9999	https://i.postimg.cc/1tGDM5mn/ko-kae-bab-kh-w.jpg	both	t	Snacks	Koh-Kae BBQ Peanuts	\N	127
200	เพิ่มเติม	เมนูหลัก	ขนมขบเคี้ยว	โก๋แก่ เม็ดมะม่วงอบเกลือ	\N	9999	https://i.postimg.cc/JnNjK4rJ/ko-kae-me-dmam-wng-xb-kel-x.jpg	both	t	Snacks	Koh-Kae Salted Cashews	\N	128
201	เพิ่มเติม	เมนูหลัก	ขนมขบเคี้ยว	โก๋แก่ วาซาบิ	\N	9999	https://i.postimg.cc/Y96Q8qr3/ko-kae-wa-sab.jpg	both	t	Snacks	Koh-Kae Wasabi Peanuts	\N	129
202	เพิ่มเติม	เมนูหลัก	ขนมขบเคี้ยว	เทสโต้	\N	9999	https://i.postimg.cc/FRy0GsrG/the-s-to.jpg	both	t	Snacks	Tasto	\N	130
203	เพิ่มเติม	เมนูหลัก	ขนมขบเคี้ยว	เทสโต้ ปูอัด	\N	9999	https://i.postimg.cc/fLcY5Tzj/the-s-to-p-x-d.jpg	both	t	Snacks	Tasto Crab Stick	\N	131
204	เพิ่มเติม	เมนูหลัก	ขนมขบเคี้ยว	เทสโต้ สาหร่าย	\N	9999	https://i.postimg.cc/qRs2QMJG/the-s-to-sahr-ay.jpg	both	t	Snacks	Tasto Seaweed	\N	132
205	เพิ่มเติม	เมนูหลัก	ขนมขบเคี้ยว	เมล็ดทานตะวัน	\N	9999	https://i.postimg.cc/763SXYHB/mel-d-than-taw-n.jpg	both	t	Snacks	Sunflower Seeds	\N	133
206	เพิ่มเติม	เมนูหลัก	ขนมขบเคี้ยว	เลย์ ร็อค กลิ่นเอ็กซ์ตร้าบาร์บีคิว	\N	9999	https://i.postimg.cc/Hxwb3sYR/ley-r-xkh-kl-nxe-ks-tr-abar-b-kh-w.jpg	both	t	Snacks	Lay's Rock Extra BBQ	\N	134
207	เพิ่มเติม	เมนูหลัก	ขนมขบเคี้ยว	เลย์ สาหร่าย	\N	9999	https://i.postimg.cc/FRy0Gsr6/ley-sahr-ay.jpg	both	t	Snacks	Lay's Nori Seaweed	\N	135
208	เพิ่มเติม	เมนูหลัก	ขนมขบเคี้ยว	เลย์ร็อค Original	\N	9999	https://i.postimg.cc/NM6RbfsV/ley-r-xkh-Original.jpg	both	t	Snacks	Lay's Rock Original	\N	136
209	เพิ่มเติม	เมนูหลัก	ผ้าเย็น	ผ้าเย็นขนหนู 9*9	\N	9999	https://i.postimg.cc/2jdYYp9z/ph-aye-n.webp	both	t	Cold Towel	Cold Towel 9x9	\N	137
210	อาหาร	เมนูหลัก	อาหารจานเดียว	ข้าวผัด	หมู	70	https://i.postimg.cc/0Q5Ncf2c/kh-awph-d.jpg	night	t	Single Dish	Fried Rice	Pork	138
211	อาหาร	เมนูหลัก	อาหารจานเดียว	ข้าวผัด	ไก่	70	https://i.postimg.cc/0Q5Ncf2c/kh-awph-d.jpg	night	t	Single Dish	Fried Rice	Chicken	138
212	อาหาร	เมนูหลัก	อาหารจานเดียว	ข้าวผัด	ทะเล	70	https://i.postimg.cc/0Q5Ncf2c/kh-awph-d.jpg	night	t	Single Dish	Fried Rice	Seafood	138
213	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดน้ำมันหอยราดข้าว	หมู	70	https://i.postimg.cc/hj4GprPk/n-am-nhxy.jpg	night	t	Single Dish	Stir-Fried Oyster Sauce on Rice	Pork	139
214	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดน้ำมันหอยราดข้าว	ไก่	70	https://i.postimg.cc/hj4GprPk/n-am-nhxy.jpg	night	t	Single Dish	Stir-Fried Oyster Sauce on Rice	Chicken	139
215	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดน้ำมันหอยราดข้าว	ทะเล	70	https://i.postimg.cc/hj4GprPk/n-am-nhxy.jpg	night	t	Single Dish	Stir-Fried Oyster Sauce on Rice	Seafood	139
216	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดน้ำมันหอยราดข้าว	หมูกรอบ	80	https://i.postimg.cc/hj4GprPk/n-am-nhxy.jpg	night	t	Single Dish	Stir-Fried Oyster Sauce on Rice	Crispy Pork	139
217	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดกระเทียมพริกไทยราดข้าว	หมู	70	https://i.postimg.cc/6Qf3rSwh/kra-the-ymphr-kthiy.jpg	night	t	Single Dish	Stir-Fried Garlic and Pepper on Rice	Pork	140
218	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดกระเทียมพริกไทยราดข้าว	ไก่	70	https://i.postimg.cc/6Qf3rSwh/kra-the-ymphr-kthiy.jpg	night	t	Single Dish	Stir-Fried Garlic and Pepper on Rice	Chicken	140
219	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดกระเทียมพริกไทยราดข้าว	ทะเล	70	https://i.postimg.cc/6Qf3rSwh/kra-the-ymphr-kthiy.jpg	night	t	Single Dish	Stir-Fried Garlic and Pepper on Rice	Seafood	140
220	อาหาร	เมนูหลัก	อาหารจานเดียว	ทอดน้ำปลาราดข้าว	หมู	70	https://i.postimg.cc/pTVdqZX7/thxdn-apla.jpg	day	t	Single Dish	Fried with Fish Sauce on Rice	Pork	141
221	อาหาร	เมนูหลัก	อาหารจานเดียว	ทอดน้ำปลาราดข้าว	ไก่	70	https://i.postimg.cc/pTVdqZX7/thxdn-apla.jpg	day	t	Single Dish	Fried with Fish Sauce on Rice	Chicken	141
222	อาหาร	เมนูหลัก	อาหารจานเดียว	ทอดน้ำปลาราดข้าว	ทะเล	70	https://i.postimg.cc/pTVdqZX7/thxdn-apla.jpg	day	t	Single Dish	Fried with Fish Sauce on Rice	Seafood	141
223	อาหาร	เมนูหลัก	อาหารจานเดียว	ทอดน้ำปลาราดข้าว	หมูกรอบ	80	https://i.postimg.cc/pTVdqZX7/thxdn-apla.jpg	day	t	Single Dish	Fried with Fish Sauce on Rice	Crispy Pork	141
225	อาหาร	เมนูหลัก	อาหารจานเดียว	คั่วพริกเกลือราดข้าว	ไก่	70	https://i.postimg.cc/RFC0XRVg/kh-wphr-kkel-x.jpg	night	t	Single Dish	Stir-Fried Chili & Salt with Rice	Chicken	142
226	อาหาร	เมนูหลัก	อาหารจานเดียว	คั่วพริกเกลือราดข้าว	ทะเล	70	https://i.postimg.cc/RFC0XRVg/kh-wphr-kkel-x.jpg	night	t	Single Dish	Stir-Fried Chili & Salt with Rice	Seafood	142
227	อาหาร	เมนูหลัก	อาหารจานเดียว	คั่วพริกเกลือราดข้าว	เนื้อ	80	https://i.postimg.cc/RFC0XRVg/kh-wphr-kkel-x.jpg	night	t	Single Dish	Stir-Fried Chili & Salt with Rice	Beef	142
228	อาหาร	เมนูหลัก	อาหารจานเดียว	คั่วพริกเกลือราดข้าว	หมูกรอบ	80	https://i.postimg.cc/RFC0XRVg/kh-wphr-kkel-x.jpg	night	t	Single Dish	Stir-Fried Chili & Salt with Rice	Crispy Pork	142
229	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดผงกะหรี่ราดข้าว	หมู	70	https://i.postimg.cc/QtNM0bdD/ph-d-phng-kahr.jpg	night	t	Single Dish	Stir-Fried Curry Powder on Rice	Pork	143
230	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดผงกะหรี่ราดข้าว	ไก่	70	https://i.postimg.cc/QtNM0bdD/ph-d-phng-kahr.jpg	night	t	Single Dish	Stir-Fried Curry Powder on Rice	Chicken	143
231	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดผงกะหรี่ราดข้าว	ทะเล	70	https://i.postimg.cc/QtNM0bdD/ph-d-phng-kahr.jpg	night	t	Single Dish	Stir-Fried Curry Powder on Rice	Seafood	143
232	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดผงกะหรี่ราดข้าว	หมูกรอบ	80	https://i.postimg.cc/QtNM0bdD/ph-d-phng-kahr.jpg	night	t	Single Dish	Stir-Fried Curry Powder on Rice	Crispy Pork	143
233	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดน้ำพริกเผาราดข้าว	หมู	70	https://i.postimg.cc/bJYv3Twh/ph-dn-aphr-kphea.jpg	night	t	Single Dish	Stir-Fried Chili Paste on Rice	Pork	144
234	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดน้ำพริกเผาราดข้าว	ไก่	70	https://i.postimg.cc/bJYv3Twh/ph-dn-aphr-kphea.jpg	night	t	Single Dish	Stir-Fried Chili Paste on Rice	Chicken	144
235	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดน้ำพริกเผาราดข้าว	ทะเล	70	https://i.postimg.cc/bJYv3Twh/ph-dn-aphr-kphea.jpg	night	t	Single Dish	Stir-Fried Chili Paste on Rice	Seafood	144
236	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดน้ำพริกเผาราดข้าว	เนื้อ	80	https://i.postimg.cc/bJYv3Twh/ph-dn-aphr-kphea.jpg	night	t	Single Dish	Stir-Fried Chili Paste on Rice	Beef	144
237	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดเผ็ดราดข้าว	หมู	70	https://i.postimg.cc/j5qjZXSK/ph-dphe-d.jpg	night	t	Single Dish	Spicy Stir-Fried Red Curry Paste on Rice	Pork	145
238	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดเผ็ดราดข้าว	ไก่	70	https://i.postimg.cc/j5qjZXSK/ph-dphe-d.jpg	night	t	Single Dish	Spicy Stir-Fried Red Curry Paste on Rice	Chicken	145
239	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดเผ็ดราดข้าว	ทะเล	70	https://i.postimg.cc/j5qjZXSK/ph-dphe-d.jpg	night	t	Single Dish	Spicy Stir-Fried Red Curry Paste on Rice	Seafood	145
240	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดเผ็ดทะเลราดข้าว	ปลาหมึก	70	https://i.postimg.cc/wxSs1HNr/ph-dphe-d-thale.jpg	night	t	Single Dish	Spicy Stir-Fried Seafood on Rice	Squid	146
241	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดเผ็ดทะเลราดข้าว	กุ้ง	70	https://i.postimg.cc/wxSs1HNr/ph-dphe-d-thale.jpg	night	t	Single Dish	Spicy Stir-Fried Seafood on Rice	Shrimp	146
242	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดพริกราดข้าว	หมู	70	https://i.postimg.cc/rmypQJwM/ph-dphr-k.jpg	night	t	Single Dish	Stir-Fried Fresh Chili on Rice	Pork	147
243	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดพริกราดข้าว	ไก่	70	https://i.postimg.cc/rmypQJwM/ph-dphr-k.jpg	night	t	Single Dish	Stir-Fried Fresh Chili on Rice	Chicken	147
244	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดพริกราดข้าว	ทะเล	70	https://i.postimg.cc/rmypQJwM/ph-dphr-k.jpg	night	t	Single Dish	Stir-Fried Fresh Chili on Rice	Seafood	147
245	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดพริกราดข้าว	เนื้อ	80	https://i.postimg.cc/rmypQJwM/ph-dphr-k.jpg	night	t	Single Dish	Stir-Fried Fresh Chili on Rice	Beef	147
246	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดผักคะน้าราดข้าว	หมู	70	https://i.postimg.cc/TwHttTXD/ph-dkhan-a.jpg	night	t	Single Dish	Stir-Fried Chinese Kale on Rice	Pork	148
247	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดผักคะน้าราดข้าว	ไก่	70	https://i.postimg.cc/TwHttTXD/ph-dkhan-a.jpg	night	t	Single Dish	Stir-Fried Chinese Kale on Rice	Chicken	148
248	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดผักคะน้าราดข้าว	ทะเล	70	https://i.postimg.cc/TwHttTXD/ph-dkhan-a.jpg	night	t	Single Dish	Stir-Fried Chinese Kale on Rice	Seafood	148
249	อาหาร	เมนูหลัก	อาหารจานเดียว	ข้าวผัดกะเพรา	หมู	70	https://i.postimg.cc/Gpx2FNrK/kaphera.jpg	night	t	Single Dish	Basil Fried Rice (Pad Kra Pao)	Pork	149
250	อาหาร	เมนูหลัก	อาหารจานเดียว	ข้าวผัดกะเพรา	ไก่	70	https://i.postimg.cc/Gpx2FNrK/kaphera.jpg	night	t	Single Dish	Basil Fried Rice (Pad Kra Pao)	Chicken	149
251	อาหาร	เมนูหลัก	อาหารจานเดียว	ข้าวผัดกะเพรา	ทะเล	70	https://i.postimg.cc/Gpx2FNrK/kaphera.jpg	night	t	Single Dish	Basil Fried Rice (Pad Kra Pao)	Seafood	149
252	อาหาร	เมนูหลัก	อาหารจานเดียว	ข้าวผัดกะเพรา	เนื้อ	80	https://i.postimg.cc/Gpx2FNrK/kaphera.jpg	night	t	Single Dish	Basil Fried Rice (Pad Kra Pao)	Beef	149
253	อาหาร	เมนูหลัก	อาหารจานเดียว	ข้าวผัดกะเพรา	หมูกรอบ	80	https://i.postimg.cc/Gpx2FNrK/kaphera.jpg	night	t	Single Dish	Basil Fried Rice (Pad Kra Pao)	Crispy Pork	149
254	อาหาร	เมนูหลัก	อาหารจานเดียว	ข้าวผัดกะเพราวุ้นเส้นหมูสับ	\N	70	https://i.postimg.cc/yYCbtYZ9/ka-phe-raaw-nse-n.jpg	night	t	Single Dish	Basil Fried Rice with Glass Noodle and Minced Pork	\N	150
255	อาหาร	เมนูหลัก	อาหารจานเดียว	ข้าวผัดกะเพราไข่เยี่ยวม้า	หมู	70	https://i.postimg.cc/Y92Sb3qg/ka-pheraa-khi-ye-ywm-a.jpg	night	t	Single Dish	Basil Fried Rice with Century Egg	Pork	151
256	อาหาร	เมนูหลัก	อาหารจานเดียว	ข้าวผัดกะเพราไข่เยี่ยวม้า	ไก่	70	https://i.postimg.cc/Y92Sb3qg/ka-pheraa-khi-ye-ywm-a.jpg	night	t	Single Dish	Basil Fried Rice with Century Egg	Chicken	151
257	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดเครื่องแกงราดข้าว	เนื้อ	80	https://i.postimg.cc/9f8p4MyM/kher-xng-kaeng.webp	night	t	Single Dish	Stir-Fried Curry Paste on Rice	Beef	152
258	อาหาร	เมนูหลัก	อาหารจานเดียว	ผัดเครื่องแกงราดข้าว	หมูกรอบ	80	https://i.postimg.cc/9f8p4MyM/kher-xng-kaeng.webp	night	t	Single Dish	Stir-Fried Curry Paste on Rice	Crispy Pork	152
263	อาหาร	เมนูหลัก	เมนูเส้น	ผัดซีอิ๊ว	หมู	70	https://i.postimg.cc/k4M5fcgP/ph-ds-x-w.jpg	night	t	Noodle	Pad See Ew (Stir-Fried Rice Noodles with Soy Sauce)	Pork	153
264	อาหาร	เมนูหลัก	เมนูเส้น	ผัดซีอิ๊ว	ไก่	70	https://i.postimg.cc/k4M5fcgP/ph-ds-x-w.jpg	night	t	Noodle	Pad See Ew (Stir-Fried Rice Noodles with Soy Sauce)	Chicken	153
265	อาหาร	เมนูหลัก	เมนูเส้น	ผัดซีอิ๊ว	ทะเล	70	https://i.postimg.cc/k4M5fcgP/ph-ds-x-w.jpg	night	t	Noodle	Pad See Ew (Stir-Fried Rice Noodles with Soy Sauce)	Seafood	153
266	อาหาร	เมนูหลัก	เมนูเส้น	ผัดวุ้นเส้น	หมู	70	https://i.postimg.cc/sftZMyW0/ph-dw-nse-n.jpg	night	t	Noodle	Stir-Fried Glass Noodles	Pork	154
267	อาหาร	เมนูหลัก	เมนูเส้น	ผัดวุ้นเส้น	ไก่	70	https://i.postimg.cc/sftZMyW0/ph-dw-nse-n.jpg	night	t	Noodle	Stir-Fried Glass Noodles	Chicken	154
268	อาหาร	เมนูหลัก	เมนูเส้น	ผัดวุ้นเส้น	ทะเล	70	https://i.postimg.cc/sftZMyW0/ph-dw-nse-n.jpg	night	t	Noodle	Stir-Fried Glass Noodles	Seafood	154
269	อาหาร	เมนูหลัก	กับข้าว	ผัดผักคะน้า	หมู	70	https://i.postimg.cc/tRLVsy6h/ph-dkhan-ak-b.jpg	night	t	To Share	Stir-Fried Chinese Kale	Pork	155
270	อาหาร	เมนูหลัก	กับข้าว	ผัดผักคะน้า	ไก่	70	https://i.postimg.cc/tRLVsy6h/ph-dkhan-ak-b.jpg	night	t	To Share	Stir-Fried Chinese Kale	Chicken	155
271	อาหาร	เมนูหลัก	กับข้าว	ผัดผักคะน้า	ทะเล	70	https://i.postimg.cc/tRLVsy6h/ph-dkhan-ak-b.jpg	night	t	To Share	Stir-Fried Chinese Kale	Seafood	155
272	อาหาร	เมนูหลัก	กับข้าว	ผัดผักคะน้า	ปลาเค็ม	70	https://i.postimg.cc/tRLVsy6h/ph-dkhan-ak-b.jpg	night	t	To Share	Stir-Fried Chinese Kale	Salted Fish	155
273	อาหาร	เมนูหลัก	กับข้าว	ผัดผักคะน้า	หมูกรอบ	90	https://i.postimg.cc/tRLVsy6h/ph-dkhan-ak-b.jpg	night	t	To Share	Stir-Fried Chinese Kale	Crispy Pork	155
274	อาหาร	เมนูหลัก	กับข้าว	ผัดผักรวม	หมู	70	https://i.postimg.cc/3rPDk7GF/ph-dph-krwm.jpg	night	t	To Share	Stir-Fried Mixed Vegetables	Pork	156
275	อาหาร	เมนูหลัก	กับข้าว	ผัดผักรวม	ไก่	70	https://i.postimg.cc/3rPDk7GF/ph-dph-krwm.jpg	night	t	To Share	Stir-Fried Mixed Vegetables	Chicken	156
276	อาหาร	เมนูหลัก	กับข้าว	ผัดผักรวม	ทะเล	70	https://i.postimg.cc/3rPDk7GF/ph-dph-krwm.jpg	night	t	To Share	Stir-Fried Mixed Vegetables	Seafood	156
277	อาหาร	เมนูหลัก	กับข้าว	ผัดผักรวม	หมูกรอบ	90	https://i.postimg.cc/3rPDk7GF/ph-dph-krwm.jpg	night	t	To Share	Stir-Fried Mixed Vegetables	Crispy Pork	156
278	อาหาร	เมนูหลัก	กับข้าว	ใบเหลียงผัดไข่	\N	70	https://i.postimg.cc/SQwznq92/bi-hel-yng.webp	night	t	To Share	Stir-Fried Liang Leaves with Egg	\N	157
279	อาหาร	เมนูหลัก	กับข้าว	ผัดผักบุ้ง	\N	70	https://i.postimg.cc/dQzThvCB/ph-kb-ng.webp	night	t	To Share	Stir-Fried Morning Glory	\N	158
280	อาหาร	เมนูหลัก	กับข้าว	ผัดขี้เมา	หมู	70	https://i.postimg.cc/VLQdYgQc/kh-mea.jpg	night	t	To Share	Stir-Fried Spicy Herbs (Khee Mao)	Pork	159
281	อาหาร	เมนูหลัก	กับข้าว	ผัดขี้เมา	ไก่	70	https://i.postimg.cc/VLQdYgQc/kh-mea.jpg	night	t	To Share	Stir-Fried Spicy Herbs (Khee Mao)	Chicken	159
282	อาหาร	เมนูหลัก	กับข้าว	ผัดขี้เมา	ทะเล	70	https://i.postimg.cc/VLQdYgQc/kh-mea.jpg	night	t	To Share	Stir-Fried Spicy Herbs (Khee Mao)	Seafood	159
283	อาหาร	เมนูหลัก	กับข้าว	ผัดกะเพรา	หมู	70	https://i.postimg.cc/rFXK8j6Q/k-bka-phera.jpg	night	t	To Share	Basil Fried (Pad Kra Pao)	Pork	160
284	อาหาร	เมนูหลัก	กับข้าว	ผัดกะเพรา	ไก่	70	https://i.postimg.cc/rFXK8j6Q/k-bka-phera.jpg	night	t	To Share	Basil Fried (Pad Kra Pao)	Chicken	160
285	อาหาร	เมนูหลัก	กับข้าว	ผัดกะเพรา	ทะเล	70	https://i.postimg.cc/rFXK8j6Q/k-bka-phera.jpg	night	t	To Share	Basil Fried (Pad Kra Pao)	Seafood	160
286	อาหาร	เมนูหลัก	กับข้าว	ผัดพริก	หมู	70	https://i.postimg.cc/59ZFX1z7/ph-dphr-kk-b.jpg	night	t	To Share	Stir-Fried Fresh Chili	Pork	161
287	อาหาร	เมนูหลัก	กับข้าว	ผัดพริก	ไก่	70	https://i.postimg.cc/59ZFX1z7/ph-dphr-kk-b.jpg	night	t	To Share	Stir-Fried Fresh Chili	Chicken	161
288	อาหาร	เมนูหลัก	กับข้าว	ผัดพริก	ทะเล	70	https://i.postimg.cc/59ZFX1z7/ph-dphr-kk-b.jpg	night	t	To Share	Stir-Fried Fresh Chili	Seafood	161
289	อาหาร	เมนูหลัก	กับข้าว	ผัดพริก	หมูกรอบ	100	https://i.postimg.cc/59ZFX1z7/ph-dphr-kk-b.jpg	night	t	To Share	Stir-Fried Fresh Chili	Crispy Pork	161
290	อาหาร	เมนูหลัก	กับข้าว	ผัดเครื่องแกง	หมู	70	https://i.postimg.cc/HswjjMdp/kher-xng-kae-ngk-b.jpg	night	t	To Share	Stir-Fried Curry Paste	Pork	162
291	อาหาร	เมนูหลัก	กับข้าว	ผัดเครื่องแกง	ไก่	70	https://i.postimg.cc/HswjjMdp/kher-xng-kae-ngk-b.jpg	night	t	To Share	Stir-Fried Curry Paste	Chicken	162
292	อาหาร	เมนูหลัก	กับข้าว	ผัดเครื่องแกง	ทะเล	70	https://i.postimg.cc/HswjjMdp/kher-xng-kae-ngk-b.jpg	night	t	To Share	Stir-Fried Curry Paste	Seafood	162
293	อาหาร	เมนูหลัก	กับข้าว	ผัดเครื่องแกง	หมูกรอบ	90	https://i.postimg.cc/HswjjMdp/kher-xng-kae-ngk-b.jpg	night	t	To Share	Stir-Fried Curry Paste	Crispy Pork	162
294	อาหาร	เมนูหลัก	กับข้าว	ผัดเผ็ดปลาดุก	\N	80	https://i.postimg.cc/nV6QXZmy/phe-d-plad-k.jpg	night	t	To Share	Spicy Stir-Fried Catfish	\N	163
295	อาหาร	เมนูหลัก	กับข้าว	หอยลายผัดพริกเผา	\N	80	https://i.postimg.cc/7ZNCt2W2/hxy-la-yk-b.webp	night	t	To Share	Stir-Fried Clams with Chili Paste	\N	164
296	อาหาร	เมนูหลัก	กับข้าว	กุ้งผัดกะปิสะตอ	\N	80	https://i.postimg.cc/WbLh28RW/k-ngkap.jpg	night	t	To Share	Stir-Fried Shrimps with Stink Beans and Shrimp Paste	\N	165
297	อาหาร	เมนูหลัก	กับข้าว	แกงส้ม	ปลา	80	https://i.postimg.cc/tgNT3fy5/kaengs-m.jpg	night	t	To Share	Sour Curry (Gaeng Som)	Fish	166
298	อาหาร	เมนูหลัก	กับข้าว	แกงส้ม	หมู	80	https://i.postimg.cc/tgNT3fy5/kaengs-m.jpg	night	t	To Share	Sour Curry (Gaeng Som)	Pork	166
299	อาหาร	เมนูหลัก	กับข้าว	แกงส้ม	กุ้ง	80	https://i.postimg.cc/tgNT3fy5/kaengs-m.jpg	night	t	To Share	Sour Curry (Gaeng Som)	Shrimp	166
300	อาหาร	เมนูหลัก	กับข้าว	ต้มข่าไก่	\N	80	https://i.postimg.cc/d1Q04BtN/t-mkh-aki.jpg	night	t	To Share	Tom Kha Gai (Chicken Coconut Soup)	\N	167
301	อาหาร	เมนูหลัก	กับข้าว	ต้มยำ	หมู	80	https://i.postimg.cc/mgVDyGP3/t-mya.jpg	night	t	To Share	Tom Yum	Pork	168
302	อาหาร	เมนูหลัก	กับข้าว	ต้มยำ	ไก่	80	https://i.postimg.cc/mgVDyGP3/t-mya.jpg	night	t	To Share	Tom Yum	Chicken	168
303	อาหาร	เมนูหลัก	กับข้าว	ต้มยำ	ทะเล	100	https://i.postimg.cc/mgVDyGP3/t-mya.jpg	night	t	To Share	Tom Yum	Seafood	168
304	อาหาร	เมนูหลัก	กับข้าว	แกงกะทิใบชะพลูหมูสับ	\N	80	https://i.postimg.cc/8PRssvNF/chaphl.jpg	night	t	To Share	Minced Pork Coconut Curry with Wild Betel Leaves	\N	169
305	อาหาร	เมนูหลัก	กับข้าว	แกงกะทิอกไก่	\N	80	https://i.postimg.cc/Nf6LLXBM/ngae-kkath.jpg	night	t	To Share	Chicken Breast Coconut Curry	\N	170
306	อาหาร	เมนูหลัก	กับข้าว	ต้มจืดเต้าหู้	หมูสับ	80	https://i.postimg.cc/85kCtHPn/t-mc-d.jpg	night	t	To Share	Tofu Clear Soup	Minced Pork	171
307	อาหาร	เมนูหลัก	กับข้าว	ต้มจืดเต้าหู้	ไก่สับ	80	https://i.postimg.cc/85kCtHPn/t-mc-d.jpg	night	t	To Share	Tofu Clear Soup	Minced Chicken	171
308	อาหาร	เมนูหลัก	ยำ	ยำเรินเก่า	\N	120	https://i.postimg.cc/mkDWYh57/chang999.jpg	night	t	Spicy Salad	Ruen Kao Special Spicy Salad	\N	172
309	อาหาร	เมนูหลัก	ยำ	ยำมะม่วง	\N	70	https://i.postimg.cc/DwhJcgB2/ya-mam-wng.jpg	night	t	Spicy Salad	Spicy Mango Salad	\N	173
310	อาหาร	เมนูหลัก	ยำ	ยำไข่เจียวกรอบ	\N	70	https://i.postimg.cc/65n4RSLN/yakhi-c-yw.jpg	night	t	Spicy Salad	Spicy Crispy Omelet Salad	\N	174
311	อาหาร	เมนูหลัก	ยำ	ยำไข่ดาว	\N	70	https://i.postimg.cc/kgC6ycfg/yakhi-daw.webp	night	t	Spicy Salad	Spicy Fried Egg Salad	\N	175
312	อาหาร	เมนูหลัก	ยำ	ยำไข่เค็ม	\N	70	https://i.postimg.cc/J4ZHJgch/yakhi-khe-m.jpg	night	t	Spicy Salad	Spicy Salted Egg Salad	\N	176
313	อาหาร	เมนูหลัก	ยำ	ยำไข่เยี่ยวม้า	\N	70	https://i.postimg.cc/sgzQJcwX/yaye-m.jpg	night	t	Spicy Salad	Spicy Century Egg Salad	\N	177
314	อาหาร	เมนูหลัก	ยำ	ยำผักบุ้งทอดกรอบ	\N	70	https://i.postimg.cc/jSTwhXZt/yaph-kb-ng.jpg	night	t	Spicy Salad	Crispy Fried Morning Glory Salad	\N	178
315	อาหาร	เมนูหลัก	ยำ	ยำกุนเชียง	\N	70	https://i.postimg.cc/m2C1MqNW/yak-n.jpg	night	t	Spicy Salad	Spicy Chinese Sausage Salad	\N	179
316	อาหาร	เมนูหลัก	ยำ	ยำวุ้นเส้นหมูยอ	\N	80	https://i.postimg.cc/YC7Gx3bj/yaw-nse-n.jpg	night	t	Spicy Salad	Spicy Glass Noodles Salad with Vietnamese Pork Sausage	\N	180
317	อาหาร	เมนูหลัก	ยำ	ยำวุ้นเส้นไก่ยอ	\N	80	https://i.postimg.cc/YC7Gx3bj/yaw-nse-n.jpg	night	t	Spicy Salad	Spicy Glass Noodles Salad with Chicken Sausage	\N	181
318	อาหาร	เมนูหลัก	ยำ	ยำแหนม	\N	80	https://i.postimg.cc/7Z4GNVm7/ya-haenm.jpg	night	t	Spicy Salad	Spicy Fermented Pork Sausage Salad	\N	182
319	อาหาร	เมนูหลัก	ยำ	ยำเส้นแก้ว	\N	80	https://i.postimg.cc/x1QJPRtc/yase-nkae-w.jpg	night	t	Spicy Salad	Spicy Kelp Noodles Salad	\N	183
320	อาหาร	เมนูหลัก	ยำ	ยำหอยแครง	\N	80	https://i.postimg.cc/vZygvz3x/ya-hxy.jpg	night	t	Spicy Salad	Spicy Cockle Salad	\N	184
321	อาหาร	เมนูหลัก	ยำ	ยำกุ้งสด	\N	90	https://i.postimg.cc/fTmSXF7q/yak-ng.jpg	night	t	Spicy Salad	Spicy Raw Shrimp Salad	\N	185
322	อาหาร	เมนูหลัก	ยำ	ยำหมูกรอบ	\N	90	https://i.postimg.cc/9Q2RBpJ4/yahm-krxb.jpg	night	t	Spicy Salad	Spicy Crispy Pork Salad	\N	186
323	อาหาร	เมนูหลัก	ยำ	ยำหมูมะนาว	\N	90	https://i.postimg.cc/W1VF7nXs/ya-mhm-manaw.jpg	night	t	Spicy Salad	Spicy Lime Pork Salad	\N	187
324	อาหาร	เมนูหลัก	ยำ	ยำเนื้อมะนาว	\N	100	https://i.postimg.cc/L4rZJRPg/ne-xma-naw.jpg	night	t	Spicy Salad	Spicy Lime Beef Salad	\N	188
325	อาหาร	เมนูหลัก	ยำ	ยำรวมมิตร	\N	100	https://i.postimg.cc/6pK2h0Yn/rwmm-tr.jpg	night	t	Spicy Salad	Spicy Mixed Seafood/Meat Salad	\N	189
326	อาหาร	เมนูหลัก	ยำ	ยำสามกรอบ	\N	100	https://i.postimg.cc/L8SYVTN3/sam-krxb.jpg	night	t	Spicy Salad	Spicy Three Crispy Salad	\N	190
327	อาหาร	เมนูหลัก	ยำ	ยำปลาดุกฟู	\N	120	https://i.postimg.cc/pXbp2CNJ/Crispy-catfish-salad.jpg	night	t	Spicy Salad	Crispy Catfish Salad with Spicy Mango Dressing	\N	191
328	อาหาร	เมนูหลัก	ยำ	ยำขนมจีนปลาทู	\N	89	https://i.postimg.cc/28RVzGRR/khnmc-n-pla-th.jpg	night	t	Spicy Salad	Spicy Rice Noodles Salad with Mackerel	\N	192
329	อาหาร	เมนูหลัก	กับแกล้ม	พล่ากุ้ง	\N	120	https://i.postimg.cc/L6Lgf7kN/phl-ak-ng.jpg	night	t	Appetizers for Drinks	Spicy Shrimp Salad with Lemongrass (Pla Goong)	\N	193
330	อาหาร	เมนูหลัก	กับแกล้ม	กุ้งแช่น้ำปลา	\N	120	https://i.postimg.cc/kg7GS5gh/chae-n-apla.jpg	night	t	Appetizers for Drinks	Raw Shrimps in Fish Sauce	\N	194
332	อาหาร	เมนูหลัก	กับแกล้ม	ลาบ	เนื้อ	80	https://i.postimg.cc/rwT09JQ1/labm.jpg	night	t	Appetizers for Drinks	Larb (Spicy Thai Minced Meat Salad)	Beef	195
333	อาหาร	เมนูหลัก	กับแกล้ม	ลาบ	ไก่	90	https://i.postimg.cc/rwT09JQ1/labm.jpg	night	t	Appetizers for Drinks	Larb (Spicy Thai Minced Meat Salad)	Chicken	195
334	อาหาร	เมนูหลัก	กับแกล้ม	ลาบ	ทะเล	90	https://i.postimg.cc/rwT09JQ1/labm.jpg	night	t	Appetizers for Drinks	Larb (Spicy Thai Minced Meat Salad)	Seafood	195
335	อาหาร	เมนูหลัก	กับแกล้ม	น้ำตก	หมู	100	https://i.postimg.cc/zGpBF1yS/n-atk.jpg	night	t	Appetizers for Drinks	Nam Tok (Thai Spicy Grilled Meat Salad)	Pork	196
336	อาหาร	เมนูหลัก	กับแกล้ม	น้ำตก	เนื้อ	100	https://i.postimg.cc/zGpBF1yS/n-atk.jpg	night	t	Appetizers for Drinks	Nam Tok (Thai Spicy Grilled Meat Salad)	Beef	196
337	อาหาร	เมนูหลัก	กับแกล้ม	คอหมูย่าง	\N	120	https://i.postimg.cc/15hf9BhP/khxhm.jpg	night	t	Appetizers for Drinks	Grilled Pork Neck	\N	197
338	อาหาร	เมนูหลัก	กับแกล้ม	เสือร้องไห้	\N	90	https://i.postimg.cc/Sx42GrDG/se-xr-xng.jpg	night	t	Appetizers for Drinks	Crying Tiger (Grilled Beef Ribeye/Brisket)	\N	198
339	อาหาร	เมนูหลัก	กับแกล้ม	ผัดเผ็ดหมูป่า	\N	150	https://i.postimg.cc/13SnKHJH/hm-p-a.jpg	night	t	Appetizers for Drinks	Spicy Stir-Fried Wild Boar	\N	199
342	อาหาร	เมนูหลัก	กับแกล้ม	ผัดเผ็ดปลามิหลัง (ดุกทะเล)	\N	120	https://i.postimg.cc/m2C1Mq3X/m-hl-ng.jpg	night	t	Appetizers for Drinks	Spicy Stir-Fried Sea Catfish	\N	202
343	อาหาร	เมนูหลัก	กับแกล้ม	ผัดเผ็ดปลาไหล	\N	120	https://i.postimg.cc/dQ7yQDh2/pla-hil.jpg	night	t	Appetizers for Drinks	Spicy Stir-Fried Eel	\N	203
344	อาหาร	เมนูหลัก	ทานเล่น	ไก่ซอสครีมมะนาว	\N	89	https://i.postimg.cc/dtPLq6Mf/ki-krxb.jpg	night	t	Appetizers	Crispy Chicken with Lime Cream Sauce	\N	204
345	อาหาร	เมนูหลัก	ทานเล่น	กุ้งกรอบซอสครีมมะนาว	\N	89	https://i.postimg.cc/gkFnYsF9/k-ngma-naw.jpg	night	t	Appetizers	Crispy Shrimp with Lime Cream Sauce	\N	205
346	อาหาร	เมนูหลัก	ทานเล่น	เอ็นไก่	\N	89	https://i.postimg.cc/52JYm3np/xe-nki.jpg	night	t	Appetizers	Chicken Tendons	\N	206
347	อาหาร	เมนูหลัก	ทานเล่น	ไก่ป๊อป	\N	89	https://i.postimg.cc/9X47XzDy/p-xp.jpg	night	t	Appetizers	Chicken Pops	\N	207
348	อาหาร	เมนูหลัก	ทานเล่น	เฟรนฟราย	\N	89	https://i.postimg.cc/ncB975K3/fray.jpg	night	t	Appetizers	Fries	\N	208
349	อาหาร	เมนูหลัก	ทานเล่น	เฟรนฟรายซอสชีส	\N	89	https://i.postimg.cc/15wV6Tcy/f-ray-ch-s.jpg	night	t	Appetizers	Fries with Cheese Sauce	\N	209
350	อาหาร	เมนูหลัก	ทานเล่น	นักเก็ต	\N	89	https://i.postimg.cc/fTnJwC47/NUGGET.jpg	night	t	Appetizers	Chicken Nuggets	\N	210
351	อาหาร	เมนูหลัก	ทานเล่น	ไก่ป๊อปแท่ง	\N	89	https://i.postimg.cc/1RLN8PFw/p-xpthae-ng.jpg	night	t	Appetizers	Chicken Sticks	\N	211
352	อาหาร	เมนูหลัก	ทานเล่น	กรือโป๊ะ	\N	79	https://i.postimg.cc/jd0LscVc/kr-xxx.jpg	night	t	Appetizers	Keropok (Deep-Fried Fish Crackers)	\N	212
353	อาหาร	เมนูหลัก	ลวกจิ้ม	ปลากะพงลวกจิ้ม	\N	90	https://i.postimg.cc/Dyk826Vp/kaphng-lwk.webp	night	t	Scalded Dishes	Scalded Seabass with Dip	\N	213
354	อาหาร	เมนูหลัก	ลวกจิ้ม	ทะเลลวกจิ้ม	\N	120	https://i.postimg.cc/6pK2h0YC/lwk-thale.jpg	night	t	Scalded Dishes	Scalded Seafood with Dip	\N	214
355	อาหาร	เมนูหลัก	ลวกจิ้ม	หอยแครงลวก	\N	100	https://i.postimg.cc/SN6jj9kY/khaerng-lwk.jpg	night	t	Scalded Dishes	Scalded Cockles	\N	215
356	อาหาร	เมนูหลัก	ลวกจิ้ม	ลูกชิ้นปลาไต๋ก๋งลวกจิ้ม	\N	80	https://i.postimg.cc/RZvht0Zq/ch-nc-m.jpg	night	t	Scalded Dishes	Scalded Fish Balls with Dip	\N	216
32	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดพริกราดข้าว	เนื้อ	70	https://i.postimg.cc/rmypQJwM/ph-dphr-k.jpg	day	t	With Rice	Stir-Fried with Fresh Chili on Rice	Beef	5
331	อาหาร	เมนูหลัก	กับแกล้ม	ลาบ	หมู	70	https://i.postimg.cc/rwT09JQ1/labm.jpg	night	t	Appetizers for Drinks	Larb (Spicy Thai Minced Meat Salad)	Pork	195
437	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดผงกะหรี่ราดข้าว	หมู	50	https://i.postimg.cc/QtNM0bdD/ph-d-phng-kahr.jpg	day	t	With Rice	Stir-Fried with Curry Powder on Rice	Pork	3
438	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดผงกะหรี่ราดข้าว	ไก่	50	https://i.postimg.cc/QtNM0bdD/ph-d-phng-kahr.jpg	day	t	With Rice	Stir-Fried with Curry Powder on Rice	Chicken	3
439	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดผงกะหรี่ราดข้าว	หมูกรอบ	60	https://i.postimg.cc/QtNM0bdD/ph-d-phng-kahr.jpg	day	t	With Rice	Stir-Fried with Curry Powder on Rice	Crispy Pork	3
440	อาหาร	เมนูหลัก	เมนูราดข้าว	ผัดผงกะหรี่ราดข้าว	ทะเล	70	https://i.postimg.cc/QtNM0bdD/ph-d-phng-kahr.jpg	day	t	With Rice	Stir-Fried with Curry Powder on Rice	Seafood	3
340	อาหาร	เมนูหลัก	กับแกล้ม	กบทอดกระเทียมพริกไทย	\N	130	https://i.postimg.cc/8PQj148W/kb-thxd.jpg	night	t	Appetizers for Drinks	Fried Frog with Garlic and Pepper	\N	200
341	อาหาร	เมนูหลัก	กับแกล้ม	ผัดเผ็ดกบ	\N	150	https://i.postimg.cc/MZhjnxBg/phe-dkb.jpg	night	t	Appetizers for Drinks	Spicy Stir-Fried Frog	\N	201
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, no, invoice_no, table_no, status, shift, total, order_time, created_at, note, by_user, items, data, updated_at) FROM stdin;
\.


--
-- Data for Name: stock_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock_items (id, category, name, quantity, image_url) FROM stdin;
2	เครื่องดื่ม	เออดีนเจอร์ ดังเคิล	13	https://i.postimg.cc/RhmztGh7/Erdinger-Dunkle.jpg
21	เครื่องดื่ม	บ๊วยเลมอนโซดา	14	https://i.postimg.cc/WpmVVRYN/b-wy-lemxn.webp
22	เครื่องดื่ม	บัดไวเซอร์	21	https://i.postimg.cc/8cbgmWfq/b-d-wi-se-xr.jpg
23	เครื่องดื่ม	ช้าง เล็ก	26	https://i.postimg.cc/SRGbf8Y5/ch-ang.jpg
24	เครื่องดื่ม	ช้าง ใหญ่	23	https://i.postimg.cc/SRGbf8Y5/ch-ang.jpg
25	เครื่องดื่ม	ไฮเนเก้น เล็ก	38	https://i.postimg.cc/QCqZJ5KH/Heineken-Beer.jpg
26	เครื่องดื่ม	ไฮเนเก้น ใหญ่	35	https://i.postimg.cc/QCqZJ5KH/Heineken-Beer.jpg
27	เครื่องดื่ม	เมอริเดียน กลม	17	https://i.postimg.cc/dQRFFMNk/mexr-baen.jpg
28	เครื่องดื่ม	เมอริเดียน แบน	15	https://i.postimg.cc/dQRFFMNk/mexr-baen.jpg
29	เครื่องดื่ม	แม่โขง แบน	15	https://i.postimg.cc/sfPzzFHG/mae-khong.jpg
30	เครื่องดื่ม	รีเจนซี่ กลม	15	https://i.postimg.cc/sfPzzFH7/r-klm.jpg
31	เครื่องดื่ม	รีเจนซี่ แบน	15	https://i.postimg.cc/G3PRR0gy/r-baen.jpg
32	เครื่องดื่ม	ลีโอ เล็ก	25	https://i.postimg.cc/XNKWWM1k/l-xo.jpg
33	เครื่องดื่ม	ลีโอ ใหญ่	33	https://i.postimg.cc/XNKWWM1k/l-xo.jpg
34	เครื่องดื่ม	สิงห์ เล็ก	22	https://i.postimg.cc/j2hY4Nnz/Singha-Beer.jpg
35	เครื่องดื่ม	สิงห์ ใหญ่	20	https://i.postimg.cc/j2hY4Nnz/Singha-Beer.jpg
36	เครื่องดื่ม	แสงโสม กลม	14	https://i.postimg.cc/jq6TTV3H/saeng-klm.jpg
37	เครื่องดื่ม	แสงโสม แบน	21	https://i.postimg.cc/CMC00yr4/saeng-baen.webp
38	เครื่องดื่ม	หงส์ทอง กลม	17	https://i.postimg.cc/pVQvvNcC/hngk-lm.jpg
39	เครื่องดื่ม	หงส์ทอง แบน	19	https://i.postimg.cc/Y2N77cD8/hng-baen.jpg
40	เครื่องดื่ม	โฮการ์เดน วิทเบียร์	18	https://i.postimg.cc/Kc7bbXpJ/ho-kar-den-witbier.jpg
41	เครื่องดื่ม	โฮการ์เดน โรเซ่	20	https://i.postimg.cc/G3PRR0gX/ho-ro-se.jpg
43	ขนมขบเคี้ยว	โก๋แก่ ถั่วลิสงอบเกลือ	17	https://i.postimg.cc/26QnT8k1/ko-kae-th-wl-sng-xb-kel-x.jpg
45	ขนมขบเคี้ยว	โก๋แก่ เม็ดมะม่วงอบเกลือ	20	https://i.postimg.cc/JnNjK4rJ/ko-kae-me-dmam-wng-xb-kel-x.jpg
46	ขนมขบเคี้ยว	โก๋แก่ วาซาบิ	20	https://i.postimg.cc/Y96Q8qr3/ko-kae-wa-sab.jpg
52	ขนมขบเคี้ยว	เลย์ สาหร่าย	23	https://i.postimg.cc/FRy0Gsr6/ley-sahr-ay.jpg
50	ขนมขบเคี้ยว	เมล็ดทานตะวัน	22	https://i.postimg.cc/763SXYHB/mel-d-than-taw-n.jpg
51	ขนมขบเคี้ยว	เลย์ ร็อค กลิ่นเอ็กซ์ตร้าบาร์บีคิว	24	https://i.postimg.cc/Hxwb3sYR/ley-r-xkh-kl-nxe-ks-tr-abar-b-kh-w.jpg
54	ผ้าเย็น	ผ้าเย็นขนหนู 9*9	37	https://i.postimg.cc/2jdYYp9z/ph-aye-n.webp
1	เครื่องดื่ม	อาร์โคบรอว์ เฮลเลส	18	https://i.postimg.cc/hvnqmMvx/Arcobrau-Helles.jpg
20	เครื่องดื่ม	น้ำดื่มทิพย์	112	https://i.postimg.cc/VvFPWM02/n-ath-phy.jpg
49	ขนมขบเคี้ยว	เทสโต้ สาหร่าย	19	https://i.postimg.cc/qRs2QMJG/the-s-to-sahr-ay.jpg
44	ขนมขบเคี้ยว	โก๋แก่ บาบีคิว	20	https://i.postimg.cc/1tGDM5mn/ko-kae-bab-kh-w.jpg
48	ขนมขบเคี้ยว	เทสโต้ ปูอัด	10	https://i.postimg.cc/fLcY5Tzj/the-s-to-p-x-d.jpg
47	ขนมขบเคี้ยว	เทสโต้	9	https://i.postimg.cc/FRy0GsrG/the-s-to.jpg
42	ขนมขบเคี้ยว	โก๋แก่ ถั่วปากอ้าอบเกลือ	24	https://i.postimg.cc/zBZnnRrS/ko-kae-th-w-pa-kx-a-xb-kel-x.jpg
53	ขนมขบเคี้ยว	เลย์ร็อค Original	27	https://i.postimg.cc/NM6RbfsV/ley-r-xkh-Original.jpg
3	เครื่องดื่ม	แฟนต้าเขียว	36	https://i.postimg.cc/pVQvvNcV/faen-khe-yw.jpg
4	เครื่องดื่ม	แฟนต้าน้ำส้ม	29	https://i.postimg.cc/HW0mmGvJ/faens-m.jpg
5	เครื่องดื่ม	แฟนต้าแดง	35	https://i.postimg.cc/QNgDDLYM/faen-daeng.jpg
6	เครื่องดื่ม	แม็กเนอร์ส	16	https://i.postimg.cc/qqGHxn6C/magner.jpg
7	เครื่องดื่ม	มูสอินดี้ ซัมเมอร์	16	https://i.postimg.cc/QCqZJ5KT/Moose-Indie-Summer.jpg
8	เครื่องดื่ม	มูสไซเดอร์ ออริจินัล	17	https://i.postimg.cc/fyvQfXSX/Moose-Original.jpg
9	เครื่องดื่ม	มวยไทย โชคดี	18	https://i.postimg.cc/vTvwt9xf/Muai-Thai-chokhd.jpg
10	เครื่องดื่ม	สไปรต์	24	https://i.postimg.cc/hv0R1xQr/Sprite.jpg
11	เครื่องดื่ม	สปายบลูไลม์	16	https://i.postimg.cc/qqGHxn6j/Spy-Blue.jpg
12	เครื่องดื่ม	สปายคลาสสิค	25	https://i.postimg.cc/Kj5hDL39/spy-classic.jpg
13	เครื่องดื่ม	สปายมิกซ์เบอร์รี	19	https://i.postimg.cc/RhTxLfJb/spy-mixed.jpg
14	เครื่องดื่ม	สปายเรด	26	https://i.postimg.cc/MHYJmRfF/spy-red.jpg
15	เครื่องดื่ม	สปายแซ่บคิส	17	https://i.postimg.cc/T1cvJm5F/spy-zap.jpg
17	เครื่องดื่ม	โค้ก ซีโร่	13	https://i.postimg.cc/brPjnLrk/coke-zeor.jpg
18	เครื่องดื่ม	โซดา ร๊อค	17	https://i.postimg.cc/zvkYFWHw/soda-rock.jpg
19	เครื่องดื่ม	โซดา สิงห์	38	https://i.postimg.cc/mkSWyM1N/soda-sing.jpg
16	เครื่องดื่ม	โค้ก	39	https://i.postimg.cc/PJHkDKJm/coke.jpg
\.


--
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_items_id_seq', 448, true);


--
-- Name: stock_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_items_id_seq', 60, true);


--
-- Name: menu_items menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: stock_items stock_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_items
    ADD CONSTRAINT stock_items_pkey PRIMARY KEY (id);


--
-- Name: orders_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_created_at_idx ON public.orders USING btree (created_at);


--
-- Name: orders_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_status_idx ON public.orders USING btree (status);


--
-- PostgreSQL database dump complete
--

\unrestrict Frw14jcf0j9Nnw3UpBfzVFY7PeM74TnHxGlbW6aeMU7cSaGmmcCTCdMndkv6L7I


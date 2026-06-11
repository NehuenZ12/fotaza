--
-- PostgreSQL database dump
--

\restrict Ff2rkt0TnRSndVwloqI4etL2YtwdapOFf3sMJIy4bWef9c8hsLqV4tR2ZdKoFBa

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-06-11 06:33:36

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
-- TOC entry 246 (class 1259 OID 16690)
-- Name: ColeccionPublicacions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ColeccionPublicacions" (
    id integer NOT NULL,
    "coleccionId" integer NOT NULL,
    "publicacionId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 245 (class 1259 OID 16689)
-- Name: ColeccionPublicacions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ColeccionPublicacions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5155 (class 0 OID 0)
-- Dependencies: 245
-- Name: ColeccionPublicacions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ColeccionPublicacions_id_seq" OWNED BY public."ColeccionPublicacions".id;


--
-- TOC entry 244 (class 1259 OID 16678)
-- Name: Coleccions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Coleccions" (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    "usuarioId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 243 (class 1259 OID 16677)
-- Name: Coleccions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Coleccions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5156 (class 0 OID 0)
-- Dependencies: 243
-- Name: Coleccions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Coleccions_id_seq" OWNED BY public."Coleccions".id;


--
-- TOC entry 230 (class 1259 OID 16571)
-- Name: Comentarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Comentarios" (
    id integer NOT NULL,
    texto text NOT NULL,
    "usuarioId" integer NOT NULL,
    "publicacionId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 16570)
-- Name: Comentarios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Comentarios_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5157 (class 0 OID 0)
-- Dependencies: 229
-- Name: Comentarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Comentarios_id_seq" OWNED BY public."Comentarios".id;


--
-- TOC entry 238 (class 1259 OID 16625)
-- Name: Denuncia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Denuncia" (
    id integer NOT NULL,
    motivo character varying(255) NOT NULL,
    descripcion text NOT NULL,
    "usuarioId" integer NOT NULL,
    "imagenId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 16644)
-- Name: DenunciaComentarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."DenunciaComentarios" (
    id integer NOT NULL,
    motivo character varying(255) NOT NULL,
    descripcion text NOT NULL,
    "usuarioId" integer NOT NULL,
    "comentarioId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 16643)
-- Name: DenunciaComentarios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."DenunciaComentarios_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5158 (class 0 OID 0)
-- Dependencies: 239
-- Name: DenunciaComentarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."DenunciaComentarios_id_seq" OWNED BY public."DenunciaComentarios".id;


--
-- TOC entry 237 (class 1259 OID 16624)
-- Name: Denuncia_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Denuncia_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5159 (class 0 OID 0)
-- Dependencies: 237
-- Name: Denuncia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Denuncia_id_seq" OWNED BY public."Denuncia".id;


--
-- TOC entry 226 (class 1259 OID 16548)
-- Name: Etiqueta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Etiqueta" (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 16547)
-- Name: Etiqueta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Etiqueta_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5160 (class 0 OID 0)
-- Dependencies: 225
-- Name: Etiqueta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Etiqueta_id_seq" OWNED BY public."Etiqueta".id;


--
-- TOC entry 224 (class 1259 OID 16536)
-- Name: Imagens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Imagens" (
    id integer NOT NULL,
    ruta character varying(255) NOT NULL,
    "publicacionId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    licencia character varying(50),
    marcaagua character varying(255)
);


--
-- TOC entry 223 (class 1259 OID 16535)
-- Name: Imagens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Imagens_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5161 (class 0 OID 0)
-- Dependencies: 223
-- Name: Imagens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Imagens_id_seq" OWNED BY public."Imagens".id;


--
-- TOC entry 242 (class 1259 OID 16662)
-- Name: Mensajes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Mensajes" (
    id integer NOT NULL,
    texto text NOT NULL,
    "remitenteId" integer NOT NULL,
    "destinatarioId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 16661)
-- Name: Mensajes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Mensajes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5162 (class 0 OID 0)
-- Dependencies: 241
-- Name: Mensajes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Mensajes_id_seq" OWNED BY public."Mensajes".id;


--
-- TOC entry 236 (class 1259 OID 16611)
-- Name: Notificacions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Notificacions" (
    id integer NOT NULL,
    mensaje character varying(255) NOT NULL,
    "usuarioId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    leida boolean DEFAULT false,
    "usuarioInteresadoId" integer
);


--
-- TOC entry 235 (class 1259 OID 16610)
-- Name: Notificacions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Notificacions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5163 (class 0 OID 0)
-- Dependencies: 235
-- Name: Notificacions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Notificacions_id_seq" OWNED BY public."Notificacions".id;


--
-- TOC entry 228 (class 1259 OID 16559)
-- Name: PublicacionEtiqueta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."PublicacionEtiqueta" (
    id integer NOT NULL,
    "publicacionId" integer NOT NULL,
    "etiquetaId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 16558)
-- Name: PublicacionEtiqueta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."PublicacionEtiqueta_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5164 (class 0 OID 0)
-- Dependencies: 227
-- Name: PublicacionEtiqueta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."PublicacionEtiqueta_id_seq" OWNED BY public."PublicacionEtiqueta".id;


--
-- TOC entry 222 (class 1259 OID 16522)
-- Name: Publicacions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Publicacions" (
    id integer NOT NULL,
    titulo character varying(255) NOT NULL,
    descripcion text,
    "usuarioId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "comentariosAbiertos" boolean DEFAULT true,
    "enRevision" boolean DEFAULT false,
    activa boolean DEFAULT true
);


--
-- TOC entry 221 (class 1259 OID 16521)
-- Name: Publicacions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Publicacions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5165 (class 0 OID 0)
-- Dependencies: 221
-- Name: Publicacions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Publicacions_id_seq" OWNED BY public."Publicacions".id;


--
-- TOC entry 234 (class 1259 OID 16599)
-- Name: Seguimientos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Seguimientos" (
    id integer NOT NULL,
    "seguidorId" integer NOT NULL,
    "seguidoId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 16598)
-- Name: Seguimientos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Seguimientos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5166 (class 0 OID 0)
-- Dependencies: 233
-- Name: Seguimientos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Seguimientos_id_seq" OWNED BY public."Seguimientos".id;


--
-- TOC entry 220 (class 1259 OID 16505)
-- Name: Usuarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Usuarios" (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    activo boolean DEFAULT true,
    rol character varying(20) DEFAULT 'USUARIO'::character varying
);


--
-- TOC entry 219 (class 1259 OID 16504)
-- Name: Usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Usuarios_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5167 (class 0 OID 0)
-- Dependencies: 219
-- Name: Usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Usuarios_id_seq" OWNED BY public."Usuarios".id;


--
-- TOC entry 232 (class 1259 OID 16586)
-- Name: Valoracions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Valoracions" (
    id integer NOT NULL,
    puntaje integer NOT NULL,
    "usuarioId" integer NOT NULL,
    "publicacionId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 16585)
-- Name: Valoracions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Valoracions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5168 (class 0 OID 0)
-- Dependencies: 231
-- Name: Valoracions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Valoracions_id_seq" OWNED BY public."Valoracions".id;


--
-- TOC entry 4942 (class 2604 OID 16693)
-- Name: ColeccionPublicacions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ColeccionPublicacions" ALTER COLUMN id SET DEFAULT nextval('public."ColeccionPublicacions_id_seq"'::regclass);


--
-- TOC entry 4939 (class 2604 OID 16681)
-- Name: Coleccions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Coleccions" ALTER COLUMN id SET DEFAULT nextval('public."Coleccions_id_seq"'::regclass);


--
-- TOC entry 4931 (class 2604 OID 16574)
-- Name: Comentarios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Comentarios" ALTER COLUMN id SET DEFAULT nextval('public."Comentarios_id_seq"'::regclass);


--
-- TOC entry 4936 (class 2604 OID 16628)
-- Name: Denuncia id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Denuncia" ALTER COLUMN id SET DEFAULT nextval('public."Denuncia_id_seq"'::regclass);


--
-- TOC entry 4937 (class 2604 OID 16647)
-- Name: DenunciaComentarios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."DenunciaComentarios" ALTER COLUMN id SET DEFAULT nextval('public."DenunciaComentarios_id_seq"'::regclass);


--
-- TOC entry 4929 (class 2604 OID 16551)
-- Name: Etiqueta id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Etiqueta" ALTER COLUMN id SET DEFAULT nextval('public."Etiqueta_id_seq"'::regclass);


--
-- TOC entry 4928 (class 2604 OID 16539)
-- Name: Imagens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Imagens" ALTER COLUMN id SET DEFAULT nextval('public."Imagens_id_seq"'::regclass);


--
-- TOC entry 4938 (class 2604 OID 16665)
-- Name: Mensajes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Mensajes" ALTER COLUMN id SET DEFAULT nextval('public."Mensajes_id_seq"'::regclass);


--
-- TOC entry 4934 (class 2604 OID 16614)
-- Name: Notificacions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Notificacions" ALTER COLUMN id SET DEFAULT nextval('public."Notificacions_id_seq"'::regclass);


--
-- TOC entry 4930 (class 2604 OID 16562)
-- Name: PublicacionEtiqueta id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."PublicacionEtiqueta" ALTER COLUMN id SET DEFAULT nextval('public."PublicacionEtiqueta_id_seq"'::regclass);


--
-- TOC entry 4924 (class 2604 OID 16525)
-- Name: Publicacions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Publicacions" ALTER COLUMN id SET DEFAULT nextval('public."Publicacions_id_seq"'::regclass);


--
-- TOC entry 4933 (class 2604 OID 16602)
-- Name: Seguimientos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Seguimientos" ALTER COLUMN id SET DEFAULT nextval('public."Seguimientos_id_seq"'::regclass);


--
-- TOC entry 4921 (class 2604 OID 16508)
-- Name: Usuarios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Usuarios" ALTER COLUMN id SET DEFAULT nextval('public."Usuarios_id_seq"'::regclass);


--
-- TOC entry 4932 (class 2604 OID 16589)
-- Name: Valoracions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Valoracions" ALTER COLUMN id SET DEFAULT nextval('public."Valoracions_id_seq"'::regclass);


--
-- TOC entry 5149 (class 0 OID 16690)
-- Dependencies: 246
-- Data for Name: ColeccionPublicacions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."ColeccionPublicacions" VALUES (1, 4, 12, '2026-06-04 04:17:35.081', '2026-06-04 04:17:35.081');
INSERT INTO public."ColeccionPublicacions" VALUES (2, 5, 15, '2026-06-09 22:31:59.141', '2026-06-09 22:31:59.141');


--
-- TOC entry 5147 (class 0 OID 16678)
-- Dependencies: 244
-- Data for Name: Coleccions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Coleccions" VALUES (1, 'Paisajes', 1, '2026-06-04 02:06:34.716', '2026-06-04 02:06:34.716');
INSERT INTO public."Coleccions" VALUES (2, 'Ideas ', 1, '2026-06-04 02:06:38.884', '2026-06-04 02:06:38.884');
INSERT INTO public."Coleccions" VALUES (3, 'Inspiracion', 1, '2026-06-04 02:07:10.134', '2026-06-04 02:07:10.134');
INSERT INTO public."Coleccions" VALUES (4, 'Anime', 1, '2026-06-04 04:17:26.143', '2026-06-04 04:17:26.143');
INSERT INTO public."Coleccions" VALUES (5, 'SIMPSON', 8, '2026-06-09 22:31:44.627', '2026-06-09 22:31:44.627');
INSERT INTO public."Coleccions" VALUES (6, 'MIS FAVORITAS', 2, '2026-06-10 20:55:27.144', '2026-06-10 20:55:27.144');


--
-- TOC entry 5133 (class 0 OID 16571)
-- Dependencies: 230
-- Data for Name: Comentarios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Comentarios" VALUES (1, 'Hermoso arbol y foto de calidad', 2, 4, '2026-05-31 01:58:09.144-03', '2026-05-31 01:58:09.144-03');
INSERT INTO public."Comentarios" VALUES (2, 'Fua que biena banda', 2, 5, '2026-05-31 01:58:18.4-03', '2026-05-31 01:58:18.4-03');
INSERT INTO public."Comentarios" VALUES (3, 'Esta para un cafacito', 2, 3, '2026-05-31 01:58:37.586-03', '2026-05-31 01:58:37.586-03');
INSERT INTO public."Comentarios" VALUES (4, 'y eso que lo que es?', 2, 2, '2026-05-31 01:58:48.715-03', '2026-05-31 01:58:48.715-03');
INSERT INTO public."Comentarios" VALUES (5, 'muy buena ', 2, 5, '2026-05-31 18:10:07.473-03', '2026-05-31 18:10:07.473-03');
INSERT INTO public."Comentarios" VALUES (7, 'que buena guitarra!', 3, 6, '2026-06-01 02:03:25.605-03', '2026-06-01 02:03:25.605-03');
INSERT INTO public."Comentarios" VALUES (8, 'muy bueno', 2, 7, '2026-06-01 19:32:48.851-03', '2026-06-01 19:32:48.851-03');
INSERT INTO public."Comentarios" VALUES (11, 'MUY BUENO!', 2, 13, '2026-06-09 03:25:10.319-03', '2026-06-09 03:25:10.319-03');
INSERT INTO public."Comentarios" VALUES (12, 'muy bueno, no?', 2, 15, '2026-06-09 03:42:41.891-03', '2026-06-09 03:42:41.891-03');
INSERT INTO public."Comentarios" VALUES (13, 'jajajaja', 2, 16, '2026-06-10 16:33:38.763-03', '2026-06-10 16:33:38.763-03');
INSERT INTO public."Comentarios" VALUES (14, 'me encanta esta foto!', 1, 12, '2026-06-10 19:09:55.402-03', '2026-06-10 19:09:55.402-03');
INSERT INTO public."Comentarios" VALUES (15, 'muy bueno jajaj', 1, 16, '2026-06-10 21:42:57.757-03', '2026-06-10 21:42:57.757-03');
INSERT INTO public."Comentarios" VALUES (16, 'que linda foto!', 1, 14, '2026-06-10 21:43:18.58-03', '2026-06-10 21:43:18.58-03');
INSERT INTO public."Comentarios" VALUES (17, 'jajajaja', 8, 15, '2026-06-10 22:47:12.009-03', '2026-06-10 22:47:12.009-03');
INSERT INTO public."Comentarios" VALUES (18, 'QUE BUENO QUE ESTA!', 3, 13, '2026-06-11 02:40:31.14-03', '2026-06-11 02:40:31.14-03');


--
-- TOC entry 5141 (class 0 OID 16625)
-- Dependencies: 238
-- Data for Name: Denuncia; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Denuncia" VALUES (4, 'Contenido ofensivo', 'repetido', 3, 10, '2026-06-01 17:09:47.601-03', '2026-06-01 17:09:47.601-03');
INSERT INTO public."Denuncia" VALUES (5, 'Spam', 'spm', 3, 11, '2026-06-01 17:10:00.497-03', '2026-06-01 17:10:00.497-03');
INSERT INTO public."Denuncia" VALUES (6, 'Spam', 'spm', 3, 12, '2026-06-01 17:10:10.973-03', '2026-06-01 17:10:10.973-03');
INSERT INTO public."Denuncia" VALUES (7, 'Spam', 'asd', 2, 10, '2026-06-01 17:11:07.608-03', '2026-06-01 17:11:07.608-03');
INSERT INTO public."Denuncia" VALUES (8, 'Violencia', 'asdaq', 2, 11, '2026-06-01 17:11:16.364-03', '2026-06-01 17:11:16.364-03');
INSERT INTO public."Denuncia" VALUES (9, 'Contenido ofensivo', 'aqwe', 2, 12, '2026-06-01 17:11:26.835-03', '2026-06-01 17:11:26.835-03');
INSERT INTO public."Denuncia" VALUES (10, 'Spam', 'ret', 1, 10, '2026-06-01 17:12:28.623-03', '2026-06-01 17:12:28.623-03');
INSERT INTO public."Denuncia" VALUES (11, 'Violencia', '123q', 1, 11, '2026-06-01 17:12:51.1-03', '2026-06-01 17:12:51.1-03');
INSERT INTO public."Denuncia" VALUES (12, 'Contenido inapropiado', 'ggggg', 1, 12, '2026-06-01 17:13:01.153-03', '2026-06-01 17:13:01.153-03');
INSERT INTO public."Denuncia" VALUES (13, 'Contenido ofensivo', 'estafa', 3, 13, '2026-06-08 20:59:27.143-03', '2026-06-08 20:59:27.143-03');
INSERT INTO public."Denuncia" VALUES (14, 'Violencia', 'no me gusta', 1, 13, '2026-06-08 20:59:49.751-03', '2026-06-08 20:59:49.751-03');
INSERT INTO public."Denuncia" VALUES (15, 'Contenido inapropiado', 'mala atencion ', 2, 13, '2026-06-08 21:00:10.355-03', '2026-06-08 21:00:10.355-03');
INSERT INTO public."Denuncia" VALUES (16, 'Contenido ofensivo', 'tenebroso', 8, 6, '2026-06-10 22:09:23.986-03', '2026-06-10 22:09:23.986-03');
INSERT INTO public."Denuncia" VALUES (17, 'Violencia', 'no me gusta', 7, 6, '2026-06-10 22:09:48.971-03', '2026-06-10 22:09:48.971-03');
INSERT INTO public."Denuncia" VALUES (18, 'Violencia', 'mala calidad', 3, 6, '2026-06-10 22:10:22.674-03', '2026-06-10 22:10:22.674-03');
INSERT INTO public."Denuncia" VALUES (19, 'Contenido inapropiado', 'no me gusta', 4, 5, '2026-06-11 05:54:33.298-03', '2026-06-11 05:54:33.298-03');
INSERT INTO public."Denuncia" VALUES (20, 'Contenido inapropiado', 'falso', 6, 5, '2026-06-11 05:56:41.138-03', '2026-06-11 05:56:41.138-03');
INSERT INTO public."Denuncia" VALUES (21, 'Spam', 'repet', 1, 5, '2026-06-11 05:57:22.746-03', '2026-06-11 05:57:22.746-03');


--
-- TOC entry 5143 (class 0 OID 16644)
-- Dependencies: 240
-- Data for Name: DenunciaComentarios; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5129 (class 0 OID 16548)
-- Dependencies: 226
-- Data for Name: Etiqueta; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Etiqueta" VALUES (1, 'naturaleza', '2026-05-31 01:28:08.471-03', '2026-05-31 01:28:08.471-03');
INSERT INTO public."Etiqueta" VALUES (2, 'Musica', '2026-05-31 01:43:31.397-03', '2026-05-31 01:43:31.397-03');
INSERT INTO public."Etiqueta" VALUES (3, 'musica', '2026-05-31 22:15:10.355-03', '2026-05-31 22:15:10.355-03');
INSERT INTO public."Etiqueta" VALUES (4, 'paisaje', '2026-05-31 22:22:50.957-03', '2026-05-31 22:22:50.957-03');
INSERT INTO public."Etiqueta" VALUES (5, 'futbol', '2026-06-01 14:35:22.825-03', '2026-06-01 14:35:22.825-03');
INSERT INTO public."Etiqueta" VALUES (6, 'veremos', '2026-06-01 17:16:38.484-03', '2026-06-01 17:16:38.484-03');
INSERT INTO public."Etiqueta" VALUES (7, 'Anime', '2026-06-01 22:47:49.658-03', '2026-06-01 22:47:49.658-03');
INSERT INTO public."Etiqueta" VALUES (8, 'caricatura', '2026-06-08 23:30:20.052-03', '2026-06-08 23:30:20.052-03');
INSERT INTO public."Etiqueta" VALUES (9, 'Los Simpson', '2026-06-09 01:53:03.61-03', '2026-06-09 01:53:03.61-03');
INSERT INTO public."Etiqueta" VALUES (10, 'random', '2026-06-09 02:02:38.944-03', '2026-06-09 02:02:38.944-03');


--
-- TOC entry 5127 (class 0 OID 16536)
-- Dependencies: 224
-- Data for Name: Imagens; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Imagens" VALUES (1, '1780200562685.png', 2, '2026-05-31 01:09:22.738-03', '2026-05-31 01:09:22.738-03', NULL, NULL);
INSERT INTO public."Imagens" VALUES (2, '1780201114207.png', 3, '2026-05-31 01:18:34.259-03', '2026-05-31 01:18:34.259-03', NULL, NULL);
INSERT INTO public."Imagens" VALUES (3, '1780201688405.jpeg', 4, '2026-05-31 01:28:08.465-03', '2026-05-31 01:28:08.465-03', NULL, NULL);
INSERT INTO public."Imagens" VALUES (4, '1780202611324.jpg', 5, '2026-05-31 01:43:31.391-03', '2026-05-31 01:43:31.391-03', NULL, NULL);
INSERT INTO public."Imagens" VALUES (5, '1780276510276.png', 6, '2026-05-31 22:15:10.348-03', '2026-05-31 22:15:10.348-03', NULL, NULL);
INSERT INTO public."Imagens" VALUES (6, '1780276970832.jpg', 7, '2026-05-31 22:22:50.95-03', '2026-05-31 22:22:50.95-03', NULL, NULL);
INSERT INTO public."Imagens" VALUES (7, '1780335322687.png', 8, '2026-06-01 14:35:22.81-03', '2026-06-01 14:35:22.81-03', NULL, NULL);
INSERT INTO public."Imagens" VALUES (8, '1780335322746.jpg', 8, '2026-06-01 14:35:22.815-03', '2026-06-01 14:35:22.815-03', NULL, NULL);
INSERT INTO public."Imagens" VALUES (9, '1780335322750.jpg', 8, '2026-06-01 14:35:22.817-03', '2026-06-01 14:35:22.817-03', NULL, NULL);
INSERT INTO public."Imagens" VALUES (10, '1780344514393.png', 9, '2026-06-01 17:08:34.507-03', '2026-06-01 17:08:34.507-03', NULL, NULL);
INSERT INTO public."Imagens" VALUES (11, '1780344514454.jpg', 9, '2026-06-01 17:08:34.51-03', '2026-06-01 17:08:34.51-03', NULL, NULL);
INSERT INTO public."Imagens" VALUES (12, '1780344514458.jpg', 9, '2026-06-01 17:08:34.511-03', '2026-06-01 17:08:34.511-03', NULL, NULL);
INSERT INTO public."Imagens" VALUES (13, '1780344998416.png', 10, '2026-06-01 17:16:38.478-03', '2026-06-01 17:16:38.478-03', NULL, NULL);
INSERT INTO public."Imagens" VALUES (14, '1780363859151.png', 11, '2026-06-01 22:30:59.255-03', '2026-06-01 22:30:59.255-03', 'copyright', NULL);
INSERT INTO public."Imagens" VALUES (15, '1780364869593.jpg', 12, '2026-06-01 22:47:49.651-03', '2026-06-01 22:47:49.651-03', 'copyright', 'Sr. Javier 2026');
INSERT INTO public."Imagens" VALUES (16, '1780972219970.gif', 13, '2026-06-08 23:30:20.043-03', '2026-06-08 23:30:20.043-03', 'copyright', 'validator');
INSERT INTO public."Imagens" VALUES (17, '1780978412969.gif', 14, '2026-06-09 01:13:33.018-03', '2026-06-09 01:13:33.018-03', 'copyright', 'Melisa');
INSERT INTO public."Imagens" VALUES (18, '1780980783530.gif', 15, '2026-06-09 01:53:03.602-03', '2026-06-09 01:53:03.602-03', 'copyright', 'Nehuen');
INSERT INTO public."Imagens" VALUES (19, '1780981358882.gif', 16, '2026-06-09 02:02:38.937-03', '2026-06-09 02:02:38.937-03', 'libre', '');


--
-- TOC entry 5145 (class 0 OID 16662)
-- Dependencies: 242
-- Data for Name: Mensajes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Mensajes" VALUES (1, 'Hola, me gustaría contactarme contigo.', 2, 1, '2026-06-02 01:24:58.936-03', '2026-06-02 01:24:58.936-03');
INSERT INTO public."Mensajes" VALUES (2, 'Hola, me gustaría contactarme contigo.', 2, 1, '2026-06-02 01:25:30.285-03', '2026-06-02 01:25:30.285-03');
INSERT INTO public."Mensajes" VALUES (3, 'Hola, me gustaría contactarme contigo.', 7, 1, '2026-06-02 02:33:39.564-03', '2026-06-02 02:33:39.564-03');
INSERT INTO public."Mensajes" VALUES (4, 'Hola, me gustaría contactarme contigo.', 7, 2, '2026-06-02 02:33:55.829-03', '2026-06-02 02:33:55.829-03');
INSERT INTO public."Mensajes" VALUES (5, 'Hola, me gustaría contactarme contigo.', 7, 1, '2026-06-02 02:35:14.86-03', '2026-06-02 02:35:14.86-03');
INSERT INTO public."Mensajes" VALUES (6, 'Hola, me gustaría contactarme contigo.', 7, 3, '2026-06-02 02:39:09.799-03', '2026-06-02 02:39:09.799-03');
INSERT INTO public."Mensajes" VALUES (7, 'Hola, me gustaría contactarme contigo.', 7, 2, '2026-06-02 02:46:58.874-03', '2026-06-02 02:46:58.874-03');
INSERT INTO public."Mensajes" VALUES (8, 'Hola, me gustaría contactarme contigo.', 7, 2, '2026-06-02 02:53:35.258-03', '2026-06-02 02:53:35.258-03');
INSERT INTO public."Mensajes" VALUES (9, 'Hola, me gustaría contactarme contigo.', 7, 1, '2026-06-02 03:05:56.443-03', '2026-06-02 03:05:56.443-03');
INSERT INTO public."Mensajes" VALUES (10, 'Hola, me gustaría contactarme contigo.', 7, 2, '2026-06-02 03:09:09.305-03', '2026-06-02 03:09:09.305-03');
INSERT INTO public."Mensajes" VALUES (11, 'Hola, me gustaría contactarme contigo.', 7, 2, '2026-06-02 03:13:54.192-03', '2026-06-02 03:13:54.192-03');
INSERT INTO public."Mensajes" VALUES (12, 'Hola, me gustaría contactarme contigo.', 7, 2, '2026-06-02 03:25:34.747-03', '2026-06-02 03:25:34.747-03');
INSERT INTO public."Mensajes" VALUES (13, 'Hola javier como estas? que buena tu foto', 7, 7, '2026-06-02 03:27:15.704-03', '2026-06-02 03:27:15.704-03');
INSERT INTO public."Mensajes" VALUES (14, 'Hola, me gustaría contactarme contigo.', 1, 4, '2026-06-02 03:28:00.098-03', '2026-06-02 03:28:00.098-03');
INSERT INTO public."Mensajes" VALUES (15, 'Hola javier si, decime que necesitas 
', 1, 2, '2026-06-02 03:28:17.65-03', '2026-06-02 03:28:17.65-03');
INSERT INTO public."Mensajes" VALUES (16, 'Hola, me gustaría contactarme contigo.', 7, 1, '2026-06-02 03:28:56.672-03', '2026-06-02 03:28:56.672-03');
INSERT INTO public."Mensajes" VALUES (17, 'Hola, me gustaría contactarme contigo.', 7, 2, '2026-06-02 03:29:54.433-03', '2026-06-02 03:29:54.433-03');
INSERT INTO public."Mensajes" VALUES (18, 'hola amigo ', 7, 7, '2026-06-02 03:30:05.692-03', '2026-06-02 03:30:05.692-03');
INSERT INTO public."Mensajes" VALUES (19, 'Hola, me gustaría contactarme contigo.', 2, 7, '2026-06-02 03:31:23.305-03', '2026-06-02 03:31:23.305-03');
INSERT INTO public."Mensajes" VALUES (20, 'Hola, me gustaría contactarme contigo.', 2, 1, '2026-06-02 03:31:56.554-03', '2026-06-02 03:31:56.554-03');
INSERT INTO public."Mensajes" VALUES (21, 'hola javier ', 2, 2, '2026-06-02 03:32:09.885-03', '2026-06-02 03:32:09.885-03');
INSERT INTO public."Mensajes" VALUES (22, 'hola javier ', 2, 2, '2026-06-02 03:32:17.226-03', '2026-06-02 03:32:17.226-03');
INSERT INTO public."Mensajes" VALUES (23, 'Hola, me gustaría contactarme contigo.', 1, 2, '2026-06-02 03:33:10.962-03', '2026-06-02 03:33:10.962-03');
INSERT INTO public."Mensajes" VALUES (24, 'Hola, me gustaría contactarme contigo.', 1, 2, '2026-06-02 03:36:22.859-03', '2026-06-02 03:36:22.859-03');
INSERT INTO public."Mensajes" VALUES (25, 'que paso?', 1, 2, '2026-06-02 03:36:54.521-03', '2026-06-02 03:36:54.521-03');
INSERT INTO public."Mensajes" VALUES (26, 'Hola, me gustaría contactarme contigo.', 1, 2, '2026-06-03 04:46:34.819-03', '2026-06-03 04:46:34.819-03');
INSERT INTO public."Mensajes" VALUES (27, 'Hola, me gustaría contactarme contigo.', 1, 2, '2026-06-03 04:46:55.756-03', '2026-06-03 04:46:55.756-03');
INSERT INTO public."Mensajes" VALUES (28, 'Hola, me gustaría contactarme contigo.', 1, 2, '2026-06-03 04:47:20.497-03', '2026-06-03 04:47:20.497-03');
INSERT INTO public."Mensajes" VALUES (29, 'Hola, me gustaría contactarme contigo.', 1, 2, '2026-06-03 04:51:44.434-03', '2026-06-03 04:51:44.434-03');
INSERT INTO public."Mensajes" VALUES (30, 'Hola, me gustaría contactarme contigo.', 1, 2, '2026-06-03 04:51:49.439-03', '2026-06-03 04:51:49.439-03');
INSERT INTO public."Mensajes" VALUES (31, 'Hola, me gustaría contactarme contigo.', 1, 2, '2026-06-03 21:07:57.757-03', '2026-06-03 21:07:57.757-03');
INSERT INTO public."Mensajes" VALUES (32, 'Hola, me gustaría contactarme contigo.', 1, 2, '2026-06-07 21:13:09.427-03', '2026-06-07 21:13:09.427-03');
INSERT INTO public."Mensajes" VALUES (33, 'Hola, me gustaría contactarme contigo.', 1, 2, '2026-06-07 21:58:15.608-03', '2026-06-07 21:58:15.608-03');
INSERT INTO public."Mensajes" VALUES (34, 'Hola, me gustaría contactarme contigo.', 1, 2, '2026-06-07 22:03:12.779-03', '2026-06-07 22:03:12.779-03');
INSERT INTO public."Mensajes" VALUES (35, 'Hola, me gustaría contactarme contigo.', 1, 3, '2026-06-07 22:03:20.419-03', '2026-06-07 22:03:20.419-03');
INSERT INTO public."Mensajes" VALUES (36, 'Hola si que necesitarias 
', 1, 2, '2026-06-07 22:06:37.69-03', '2026-06-07 22:06:37.69-03');
INSERT INTO public."Mensajes" VALUES (37, 'Si, que paso, que publicacion de interesa?', 1, 2, '2026-06-07 22:10:14.938-03', '2026-06-07 22:10:14.938-03');
INSERT INTO public."Mensajes" VALUES (38, 'si, decime ', 1, 2, '2026-06-07 22:10:29.842-03', '2026-06-07 22:10:29.842-03');
INSERT INTO public."Mensajes" VALUES (39, 'aver?', 1, 7, '2026-06-07 22:10:41.889-03', '2026-06-07 22:10:41.889-03');
INSERT INTO public."Mensajes" VALUES (40, 'Hola, me gustaría contactarme contigo.', 1, 2, '2026-06-07 22:34:01.332-03', '2026-06-07 22:34:01.332-03');
INSERT INTO public."Mensajes" VALUES (41, 'Hola, me gustaría contactarme contigo.', 1, 3, '2026-06-07 22:40:41.625-03', '2026-06-07 22:40:41.625-03');
INSERT INTO public."Mensajes" VALUES (42, 'Hola, me gustaría contactarme contigo.', 1, 3, '2026-06-07 22:41:49.378-03', '2026-06-07 22:41:49.378-03');
INSERT INTO public."Mensajes" VALUES (43, 'HOLA MELI COMO ESTAS, TE INTERESA ALGUNA PUBLICACION?', 1, 3, '2026-06-07 22:48:30.722-03', '2026-06-07 22:48:30.722-03');
INSERT INTO public."Mensajes" VALUES (44, 'HOLA TODO BIEN SI, ME GUSTO LA PRIMERA PUBLCIACION', 3, 1, '2026-06-07 22:53:41.356-03', '2026-06-07 22:53:41.356-03');
INSERT INTO public."Mensajes" VALUES (45, 'HOLA JAVIER! VI QUE TE INTERESA MI PUBLICACION
', 8, 1, '2026-06-09 04:39:29.792-03', '2026-06-09 04:39:29.792-03');
INSERT INTO public."Mensajes" VALUES (46, 'HOLA NEHUEN ESTAS DISPONIBLE PARA NEGOCIAR?', 1, 2, '2026-06-09 07:48:12.055-03', '2026-06-09 07:48:12.055-03');
INSERT INTO public."Mensajes" VALUES (47, 'HOLA MELI', 1, 3, '2026-06-10 20:56:14.936-03', '2026-06-10 20:56:14.936-03');
INSERT INTO public."Mensajes" VALUES (48, 'HOLA VI QUE TE INTERESA MI PUBLICACION', 8, 3, '2026-06-11 02:41:55.727-03', '2026-06-11 02:41:55.727-03');
INSERT INTO public."Mensajes" VALUES (49, 'HOLA SISI, LA ESTUVE VIENDO Y ESTA MUY BUENA!', 3, 8, '2026-06-11 02:43:24.25-03', '2026-06-11 02:43:24.25-03');


--
-- TOC entry 5139 (class 0 OID 16611)
-- Dependencies: 236
-- Data for Name: Notificacions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Notificacions" VALUES (1, 'Nehuen comenzó a seguirte', 3, '2026-06-01 01:51:49.833-03', '2026-06-01 01:51:49.833-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (2, 'Nehuen comenzó a seguirte', 1, '2026-06-01 01:51:52.041-03', '2026-06-01 01:51:52.041-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (3, 'melisa comentó tu publicación', 2, '2026-06-01 02:03:25.663-03', '2026-06-01 02:03:25.663-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (4, 'pedro valoró tu publicación', 2, '2026-06-01 02:08:47.907-03', '2026-06-01 02:08:47.907-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (5, 'Nehuen comentó tu publicación', 1, '2026-06-01 19:32:48.87-03', '2026-06-01 19:32:48.87-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (6, 'Nehuen comentó tu publicación', 4, '2026-06-01 19:34:28.232-03', '2026-06-01 19:34:28.232-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (7, 'Javier está interesado en una de tus imágenes', 2, '2026-06-02 00:32:08.898-03', '2026-06-02 00:32:08.898-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (8, 'Nehuen valoró tu publicación', 1, '2026-06-02 01:39:07.014-03', '2026-06-02 01:39:07.014-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (9, 'Nehuen valoró tu publicación', 1, '2026-06-02 01:39:35.008-03', '2026-06-02 01:39:35.008-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (10, 'roberto valoró tu publicación', 1, '2026-06-02 01:40:10.414-03', '2026-06-02 01:40:10.414-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (11, 'melisa valoró tu publicación', 6, '2026-06-02 01:42:45.631-03', '2026-06-02 01:42:45.631-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (12, 'kevin valoró tu publicación', 6, '2026-06-02 01:44:06.476-03', '2026-06-02 01:44:06.476-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (15, 'Javier comenzó a seguirte', 7, '2026-06-02 03:27:57.806-03', '2026-06-02 03:27:57.806-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (16, 'Javier comenzó a seguirte', 2, '2026-06-03 02:05:37.208-03', '2026-06-03 02:05:37.208-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (17, 'Javier comenzó a seguirte', 3, '2026-06-03 02:16:42.835-03', '2026-06-03 02:16:42.835-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (18, 'Javier comenzó a seguirte', 4, '2026-06-03 02:16:53.256-03', '2026-06-03 02:16:53.256-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (19, 'Javier comenzó a seguirte', 5, '2026-06-03 02:16:59.194-03', '2026-06-03 02:16:59.194-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (20, 'Javier comenzó a seguirte', 6, '2026-06-03 02:17:03.16-03', '2026-06-03 02:17:03.16-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (21, 'Javier comenzó a seguirte', 2, '2026-06-03 02:17:14.763-03', '2026-06-03 02:17:14.763-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (14, 'kevin está interesado en una de tus imágenes', 1, '2026-06-02 02:49:22.756-03', '2026-06-03 19:28:18.242-03', true, NULL);
INSERT INTO public."Notificacions" VALUES (13, 'kevin comenzó a seguirte', 1, '2026-06-02 02:31:17.113-03', '2026-06-03 19:47:42.541-03', true, NULL);
INSERT INTO public."Notificacions" VALUES (22, 'Javier comenzó a seguirte', 2, '2026-06-03 19:47:58.995-03', '2026-06-03 19:47:58.995-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (23, 'melisa valoró tu publicación', 8, '2026-06-08 23:37:58.829-03', '2026-06-08 23:37:58.829-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (24, 'melisa está interesado en una de tus imágenes', 8, '2026-06-08 23:38:21.223-03', '2026-06-08 23:38:21.223-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (25, 'melisa comenzó a seguirte', 8, '2026-06-09 01:07:53.025-03', '2026-06-09 01:07:53.025-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (26, 'melisa comentó tu publicación', 8, '2026-06-09 01:16:21.176-03', '2026-06-09 01:16:21.176-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (27, 'Validador valoró tu publicación', 3, '2026-06-09 01:19:21.898-03', '2026-06-09 01:19:21.898-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (28, 'Nehuen comentó tu publicación', 8, '2026-06-09 03:25:10.339-03', '2026-06-09 03:25:10.339-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (29, 'Nehuen está interesado en una de tus imágenes', 8, '2026-06-09 03:53:17.902-03', '2026-06-09 03:53:17.902-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (30, 'Javier está interesado en una de tus imágenes', 8, '2026-06-09 04:37:37.658-03', '2026-06-09 04:37:37.658-03', false, 1);
INSERT INTO public."Notificacions" VALUES (31, 'Validador está interesado en una de tus imágenes', 1, '2026-06-09 07:34:20.041-03', '2026-06-09 07:34:20.041-03', false, 8);
INSERT INTO public."Notificacions" VALUES (32, 'Validador comenzó a seguirte', 1, '2026-06-09 22:58:09.853-03', '2026-06-09 22:58:09.853-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (33, 'Validador comenzó a seguirte', 2, '2026-06-09 22:58:11.369-03', '2026-06-09 22:58:11.369-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (34, 'Validador comenzó a seguirte', 3, '2026-06-09 22:58:13.266-03', '2026-06-09 22:58:13.266-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (35, 'Nehuen comentó tu publicación', 1, '2026-06-10 16:33:38.783-03', '2026-06-10 16:33:38.783-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (36, 'Nehuen valoró tu publicación', 1, '2026-06-10 17:07:37.791-03', '2026-06-10 17:07:37.791-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (37, 'Javier comentó tu publicación', 3, '2026-06-10 21:43:18.586-03', '2026-06-10 21:43:18.586-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (38, 'Validador comentó tu publicación', 2, '2026-06-10 22:47:12.029-03', '2026-06-10 22:47:12.029-03', false, NULL);
INSERT INTO public."Notificacions" VALUES (39, 'melisa está interesado en una de tus imágenes', 8, '2026-06-11 02:40:01.143-03', '2026-06-11 02:40:01.143-03', false, 3);
INSERT INTO public."Notificacions" VALUES (40, 'melisa comentó tu publicación', 8, '2026-06-11 02:40:31.147-03', '2026-06-11 02:40:31.147-03', false, NULL);


--
-- TOC entry 5131 (class 0 OID 16559)
-- Dependencies: 228
-- Data for Name: PublicacionEtiqueta; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."PublicacionEtiqueta" VALUES (1, 4, 1, '2026-05-31 01:28:08.474-03', '2026-05-31 01:28:08.474-03');
INSERT INTO public."PublicacionEtiqueta" VALUES (2, 5, 2, '2026-05-31 01:43:31.399-03', '2026-05-31 01:43:31.399-03');
INSERT INTO public."PublicacionEtiqueta" VALUES (3, 6, 3, '2026-05-31 22:15:10.357-03', '2026-05-31 22:15:10.357-03');
INSERT INTO public."PublicacionEtiqueta" VALUES (4, 7, 4, '2026-05-31 22:22:50.96-03', '2026-05-31 22:22:50.96-03');
INSERT INTO public."PublicacionEtiqueta" VALUES (5, 8, 5, '2026-06-01 14:35:22.829-03', '2026-06-01 14:35:22.829-03');
INSERT INTO public."PublicacionEtiqueta" VALUES (6, 9, 5, '2026-06-01 17:08:34.519-03', '2026-06-01 17:08:34.519-03');
INSERT INTO public."PublicacionEtiqueta" VALUES (7, 10, 6, '2026-06-01 17:16:38.485-03', '2026-06-01 17:16:38.485-03');
INSERT INTO public."PublicacionEtiqueta" VALUES (8, 11, 4, '2026-06-01 22:30:59.262-03', '2026-06-01 22:30:59.262-03');
INSERT INTO public."PublicacionEtiqueta" VALUES (9, 12, 7, '2026-06-01 22:47:49.661-03', '2026-06-01 22:47:49.661-03');
INSERT INTO public."PublicacionEtiqueta" VALUES (10, 13, 8, '2026-06-08 23:30:20.055-03', '2026-06-08 23:30:20.055-03');
INSERT INTO public."PublicacionEtiqueta" VALUES (11, 14, 8, '2026-06-09 01:13:33.025-03', '2026-06-09 01:13:33.025-03');
INSERT INTO public."PublicacionEtiqueta" VALUES (12, 15, 9, '2026-06-09 01:53:03.612-03', '2026-06-09 01:53:03.612-03');
INSERT INTO public."PublicacionEtiqueta" VALUES (13, 16, 10, '2026-06-09 02:02:38.945-03', '2026-06-09 02:02:38.945-03');


--
-- TOC entry 5125 (class 0 OID 16522)
-- Dependencies: 222
-- Data for Name: Publicacions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Publicacions" VALUES (1, 'Riber', 'Se fue a la b', 1, '2026-05-31 00:43:42.516-03', '2026-05-31 00:43:42.516-03', true, false, true);
INSERT INTO public."Publicacions" VALUES (2, 'El Diablo', 'Que maldito teni', 2, '2026-05-31 01:09:22.696-03', '2026-05-31 01:09:22.696-03', true, false, true);
INSERT INTO public."Publicacions" VALUES (3, 'Fifa', 'Chiqui tapia', 3, '2026-05-31 01:18:34.212-03', '2026-05-31 01:18:34.212-03', true, false, true);
INSERT INTO public."Publicacions" VALUES (4, 'Foto linda', 'mucha selva ', 3, '2026-05-31 01:28:08.415-03', '2026-05-31 01:28:08.415-03', true, false, true);
INSERT INTO public."Publicacions" VALUES (5, 'Pink floyd', 'banda de rock', 2, '2026-05-31 01:43:31.348-03', '2026-05-31 01:43:31.348-03', true, false, true);
INSERT INTO public."Publicacions" VALUES (8, 'Maradona ', 'Mundial', 4, '2026-06-01 14:35:22.753-03', '2026-06-01 16:53:53.886-03', true, false, true);
INSERT INTO public."Publicacions" VALUES (9, 'maradona', 'si señor', 6, '2026-06-01 17:08:34.461-03', '2026-06-01 17:14:30.658-03', true, false, false);
INSERT INTO public."Publicacions" VALUES (11, 'homer', 'cansado', 1, '2026-06-01 22:30:59.196-03', '2026-06-01 22:31:08.742-03', false, false, true);
INSERT INTO public."Publicacions" VALUES (12, 'dbz', 'Sheng long', 1, '2026-06-01 22:47:49.601-03', '2026-06-01 22:47:49.601-03', true, false, true);
INSERT INTO public."Publicacions" VALUES (10, 'asdasd', '11', 6, '2026-06-01 17:16:38.44-03', '2026-06-08 21:00:30.831-03', true, false, false);
INSERT INTO public."Publicacions" VALUES (13, 'GIF HOMERO', 'saltarin', 8, '2026-06-08 23:30:19.981-03', '2026-06-08 23:30:19.981-03', true, false, true);
INSERT INTO public."Publicacions" VALUES (14, 'Niña', 'feliz', 3, '2026-06-09 01:13:32.974-03', '2026-06-09 01:13:32.974-03', true, false, true);
INSERT INTO public."Publicacions" VALUES (15, 'Homero', 'Homero desaparece', 2, '2026-06-09 01:53:03.541-03', '2026-06-09 01:53:03.541-03', true, false, true);
INSERT INTO public."Publicacions" VALUES (16, 'El abuelo', '', 1, '2026-06-09 02:02:38.889-03', '2026-06-09 02:02:38.889-03', true, false, true);
INSERT INTO public."Publicacions" VALUES (7, 'Postal', 'Atardecer oscuro ', 1, '2026-05-31 22:22:50.905-03', '2026-06-10 22:10:22.695-03', false, true, true);
INSERT INTO public."Publicacions" VALUES (6, 'mesa', 'con guitarra', 2, '2026-05-31 22:15:10.296-03', '2026-06-11 05:57:22.758-03', true, true, true);


--
-- TOC entry 5137 (class 0 OID 16599)
-- Dependencies: 234
-- Data for Name: Seguimientos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Seguimientos" VALUES (1, 3, 1, '2026-05-31 23:01:33.765-03', '2026-05-31 23:01:33.765-03');
INSERT INTO public."Seguimientos" VALUES (2, 3, 2, '2026-05-31 23:01:35.212-03', '2026-05-31 23:01:35.212-03');
INSERT INTO public."Seguimientos" VALUES (3, 2, 3, '2026-06-01 01:51:49.82-03', '2026-06-01 01:51:49.82-03');
INSERT INTO public."Seguimientos" VALUES (4, 2, 1, '2026-06-01 01:51:52.037-03', '2026-06-01 01:51:52.037-03');
INSERT INTO public."Seguimientos" VALUES (5, 7, 1, '2026-06-02 02:31:17.096-03', '2026-06-02 02:31:17.096-03');
INSERT INTO public."Seguimientos" VALUES (6, 1, 7, '2026-06-02 03:27:57.797-03', '2026-06-02 03:27:57.797-03');
INSERT INTO public."Seguimientos" VALUES (8, 1, 3, '2026-06-03 02:16:42.809-03', '2026-06-03 02:16:42.809-03');
INSERT INTO public."Seguimientos" VALUES (9, 1, 4, '2026-06-03 02:16:53.245-03', '2026-06-03 02:16:53.245-03');
INSERT INTO public."Seguimientos" VALUES (10, 1, 5, '2026-06-03 02:16:59.188-03', '2026-06-03 02:16:59.188-03');
INSERT INTO public."Seguimientos" VALUES (11, 1, 6, '2026-06-03 02:17:03.155-03', '2026-06-03 02:17:03.155-03');
INSERT INTO public."Seguimientos" VALUES (13, 1, 2, '2026-06-03 19:47:58.984-03', '2026-06-03 19:47:58.984-03');
INSERT INTO public."Seguimientos" VALUES (14, 3, 8, '2026-06-09 01:07:53.014-03', '2026-06-09 01:07:53.014-03');
INSERT INTO public."Seguimientos" VALUES (15, 8, 1, '2026-06-09 22:58:09.834-03', '2026-06-09 22:58:09.834-03');
INSERT INTO public."Seguimientos" VALUES (16, 8, 2, '2026-06-09 22:58:11.366-03', '2026-06-09 22:58:11.366-03');
INSERT INTO public."Seguimientos" VALUES (17, 8, 3, '2026-06-09 22:58:13.263-03', '2026-06-09 22:58:13.263-03');


--
-- TOC entry 5123 (class 0 OID 16505)
-- Dependencies: 220
-- Data for Name: Usuarios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Usuarios" VALUES (1, 'Javier', 'javi@gmail.com', '$2b$10$KIX3g1xcql05cRlf4wrPqunGKG3oCAucSR/X7/lRtoQTf3dBF0nwW', '2026-05-31 00:40:59.466-03', '2026-05-31 00:40:59.466-03', true, 'USUARIO');
INSERT INTO public."Usuarios" VALUES (2, 'Nehuen', 'nehuen@test.com', '$2b$10$VFfO0ZeQq7GvF30PzFfYLOVPFDbxWYsriAlXtNMboSMFUZ2qjbOFC', '2026-05-31 01:07:21.181-03', '2026-05-31 01:07:21.181-03', true, 'USUARIO');
INSERT INTO public."Usuarios" VALUES (3, 'melisa', 'melisa@test.com', '$2b$10$Hkn0kZXRtvgckPprOFjXsureHfkHICPX2RuMZW1HEJtieJwnEXaWK', '2026-05-31 01:17:12.456-03', '2026-05-31 01:17:12.456-03', true, 'USUARIO');
INSERT INTO public."Usuarios" VALUES (4, 'pedro', 'pedro@test.com', '$2b$10$.gTDeibIyzzXs0Pr8o5S.OBnW97jU3IOMVs4OUJmtXpHUlkT66Ily', '2026-06-01 02:07:16.106-03', '2026-06-01 02:07:16.106-03', true, 'USUARIO');
INSERT INTO public."Usuarios" VALUES (5, 'jose', 'jose@test.com', '$2b$10$jKEGVqw2thjorUas9sciU.UXCpCvhvT8NsviYwXRH9K90fdCIFLnG', '2026-06-01 16:32:24.676-03', '2026-06-01 16:32:24.676-03', true, 'USUARIO');
INSERT INTO public."Usuarios" VALUES (6, 'roberto', 'roberto@test.com', '$2b$10$jCQutufw.iXW3J2TmmFzg.xovezLxmzXUeKR/ty/oeYy6LgizLAL.', '2026-06-01 17:07:13.937-03', '2026-06-01 17:07:13.937-03', true, 'USUARIO');
INSERT INTO public."Usuarios" VALUES (7, 'kevin', 'kevin@test.com', '$2b$10$4Zsx.cnv5WMh5dU6ELk1ceyrcFTFzSzvPIi5p1UImYY0uEQSF4c52', '2026-06-02 01:43:28.42-03', '2026-06-02 01:43:28.42-03', true, 'USUARIO');
INSERT INTO public."Usuarios" VALUES (8, 'Validador', 'validador@gmail.com', '$2b$10$qqlqyYE.L/GWxmY/XlDWme2hXmWQkoVtVgBUhrsSu/07mmTA2/NCe', '2026-06-08 20:30:54.286-03', '2026-06-08 20:30:54.286-03', true, 'VALIDADOR');


--
-- TOC entry 5135 (class 0 OID 16586)
-- Dependencies: 232
-- Data for Name: Valoracions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Valoracions" VALUES (1, 3, 2, 5, '2026-05-31 02:13:01.613-03', '2026-05-31 02:13:01.613-03');
INSERT INTO public."Valoracions" VALUES (2, 4, 2, 4, '2026-05-31 02:13:18.221-03', '2026-05-31 02:13:18.221-03');
INSERT INTO public."Valoracions" VALUES (3, 4, 2, 3, '2026-05-31 22:16:31.563-03', '2026-05-31 22:16:31.563-03');
INSERT INTO public."Valoracions" VALUES (4, 4, 2, 1, '2026-05-31 22:17:11.724-03', '2026-05-31 22:17:11.724-03');
INSERT INTO public."Valoracions" VALUES (5, 5, 3, 6, '2026-05-31 22:17:49.318-03', '2026-05-31 22:17:49.318-03');
INSERT INTO public."Valoracions" VALUES (6, 5, 2, 7, '2026-05-31 22:24:13.427-03', '2026-05-31 22:24:13.427-03');
INSERT INTO public."Valoracions" VALUES (7, 5, 4, 5, '2026-06-01 02:08:47.901-03', '2026-06-01 02:08:47.901-03');
INSERT INTO public."Valoracions" VALUES (8, 5, 2, 12, '2026-06-02 01:39:06.997-03', '2026-06-02 01:39:06.997-03');
INSERT INTO public."Valoracions" VALUES (9, 5, 2, 11, '2026-06-02 01:39:34.997-03', '2026-06-02 01:39:34.997-03');
INSERT INTO public."Valoracions" VALUES (10, 1, 6, 11, '2026-06-02 01:40:10.408-03', '2026-06-02 01:40:10.408-03');
INSERT INTO public."Valoracions" VALUES (11, 5, 3, 10, '2026-06-02 01:42:45.623-03', '2026-06-02 01:42:45.623-03');
INSERT INTO public."Valoracions" VALUES (12, 5, 7, 10, '2026-06-02 01:44:06.468-03', '2026-06-02 01:44:06.468-03');
INSERT INTO public."Valoracions" VALUES (13, 5, 3, 13, '2026-06-08 23:37:58.822-03', '2026-06-08 23:37:58.822-03');
INSERT INTO public."Valoracions" VALUES (14, 5, 8, 14, '2026-06-09 01:19:21.892-03', '2026-06-09 01:19:21.892-03');
INSERT INTO public."Valoracions" VALUES (15, 5, 2, 16, '2026-06-10 17:07:37.772-03', '2026-06-10 17:07:37.772-03');


--
-- TOC entry 5169 (class 0 OID 0)
-- Dependencies: 245
-- Name: ColeccionPublicacions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ColeccionPublicacions_id_seq"', 2, true);


--
-- TOC entry 5170 (class 0 OID 0)
-- Dependencies: 243
-- Name: Coleccions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Coleccions_id_seq"', 6, true);


--
-- TOC entry 5171 (class 0 OID 0)
-- Dependencies: 229
-- Name: Comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Comentarios_id_seq"', 18, true);


--
-- TOC entry 5172 (class 0 OID 0)
-- Dependencies: 239
-- Name: DenunciaComentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."DenunciaComentarios_id_seq"', 1, true);


--
-- TOC entry 5173 (class 0 OID 0)
-- Dependencies: 237
-- Name: Denuncia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Denuncia_id_seq"', 21, true);


--
-- TOC entry 5174 (class 0 OID 0)
-- Dependencies: 225
-- Name: Etiqueta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Etiqueta_id_seq"', 10, true);


--
-- TOC entry 5175 (class 0 OID 0)
-- Dependencies: 223
-- Name: Imagens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Imagens_id_seq"', 19, true);


--
-- TOC entry 5176 (class 0 OID 0)
-- Dependencies: 241
-- Name: Mensajes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Mensajes_id_seq"', 49, true);


--
-- TOC entry 5177 (class 0 OID 0)
-- Dependencies: 235
-- Name: Notificacions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Notificacions_id_seq"', 40, true);


--
-- TOC entry 5178 (class 0 OID 0)
-- Dependencies: 227
-- Name: PublicacionEtiqueta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."PublicacionEtiqueta_id_seq"', 13, true);


--
-- TOC entry 5179 (class 0 OID 0)
-- Dependencies: 221
-- Name: Publicacions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Publicacions_id_seq"', 16, true);


--
-- TOC entry 5180 (class 0 OID 0)
-- Dependencies: 233
-- Name: Seguimientos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Seguimientos_id_seq"', 17, true);


--
-- TOC entry 5181 (class 0 OID 0)
-- Dependencies: 219
-- Name: Usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Usuarios_id_seq"', 8, true);


--
-- TOC entry 5182 (class 0 OID 0)
-- Dependencies: 231
-- Name: Valoracions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Valoracions_id_seq"', 15, true);


--
-- TOC entry 4974 (class 2606 OID 16700)
-- Name: ColeccionPublicacions ColeccionPublicacions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ColeccionPublicacions"
    ADD CONSTRAINT "ColeccionPublicacions_pkey" PRIMARY KEY (id);


--
-- TOC entry 4972 (class 2606 OID 16688)
-- Name: Coleccions Coleccions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Coleccions"
    ADD CONSTRAINT "Coleccions_pkey" PRIMARY KEY (id);


--
-- TOC entry 4958 (class 2606 OID 16584)
-- Name: Comentarios Comentarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Comentarios"
    ADD CONSTRAINT "Comentarios_pkey" PRIMARY KEY (id);


--
-- TOC entry 4968 (class 2606 OID 16658)
-- Name: DenunciaComentarios DenunciaComentarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."DenunciaComentarios"
    ADD CONSTRAINT "DenunciaComentarios_pkey" PRIMARY KEY (id);


--
-- TOC entry 4966 (class 2606 OID 16639)
-- Name: Denuncia Denuncia_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Denuncia"
    ADD CONSTRAINT "Denuncia_pkey" PRIMARY KEY (id);


--
-- TOC entry 4954 (class 2606 OID 16557)
-- Name: Etiqueta Etiqueta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Etiqueta"
    ADD CONSTRAINT "Etiqueta_pkey" PRIMARY KEY (id);


--
-- TOC entry 4952 (class 2606 OID 16546)
-- Name: Imagens Imagens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Imagens"
    ADD CONSTRAINT "Imagens_pkey" PRIMARY KEY (id);


--
-- TOC entry 4970 (class 2606 OID 16675)
-- Name: Mensajes Mensajes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Mensajes"
    ADD CONSTRAINT "Mensajes_pkey" PRIMARY KEY (id);


--
-- TOC entry 4964 (class 2606 OID 16621)
-- Name: Notificacions Notificacions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Notificacions"
    ADD CONSTRAINT "Notificacions_pkey" PRIMARY KEY (id);


--
-- TOC entry 4956 (class 2606 OID 16569)
-- Name: PublicacionEtiqueta PublicacionEtiqueta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."PublicacionEtiqueta"
    ADD CONSTRAINT "PublicacionEtiqueta_pkey" PRIMARY KEY (id);


--
-- TOC entry 4950 (class 2606 OID 16534)
-- Name: Publicacions Publicacions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Publicacions"
    ADD CONSTRAINT "Publicacions_pkey" PRIMARY KEY (id);


--
-- TOC entry 4962 (class 2606 OID 16609)
-- Name: Seguimientos Seguimientos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Seguimientos"
    ADD CONSTRAINT "Seguimientos_pkey" PRIMARY KEY (id);


--
-- TOC entry 4946 (class 2606 OID 16520)
-- Name: Usuarios Usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT "Usuarios_email_key" UNIQUE (email);


--
-- TOC entry 4948 (class 2606 OID 16518)
-- Name: Usuarios Usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT "Usuarios_pkey" PRIMARY KEY (id);


--
-- TOC entry 4960 (class 2606 OID 16597)
-- Name: Valoracions Valoracions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Valoracions"
    ADD CONSTRAINT "Valoracions_pkey" PRIMARY KEY (id);


-- Completed on 2026-06-11 06:33:36

--
-- PostgreSQL database dump complete
--

\unrestrict Ff2rkt0TnRSndVwloqI4etL2YtwdapOFf3sMJIy4bWef9c8hsLqV4tR2ZdKoFBa


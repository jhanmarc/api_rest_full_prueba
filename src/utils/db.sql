PGDMP     %    5            
    x         
   db_smiledu    12.5    13.0 ,    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16386 
   db_smiledu    DATABASE     _   CREATE DATABASE db_smiledu WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE db_smiledu;
                postgres    false            �            1255    16475 U   spperson(character varying, character varying, character varying, bigint, date, text) 	   PROCEDURE     r  CREATE PROCEDURE public.spperson(p_nom character varying, "p_apeP" character varying, "p_apeM" character varying, "p_nidG" bigint, "p_fecN" date, "p_fotR" text)
    LANGUAGE sql
    AS $$
INSERT INTO public.personas(nom_persona, ape_pate_persona, ape_mate_persona, nid_grado, fecha_naci, foto_ruta)
	VALUES (p_nom, "p_apeP", "p_apeM", "p_nidG", "p_fecN", "p_fotR");
$$;
 �   DROP PROCEDURE public.spperson(p_nom character varying, "p_apeP" character varying, "p_apeM" character varying, "p_nidG" bigint, "p_fecN" date, "p_fotR" text);
       public          postgres    false            �            1259    16408 
   cronograma    TABLE     Y   CREATE TABLE public.cronograma (
    id_cronograma integer NOT NULL,
    year integer
);
    DROP TABLE public.cronograma;
       public         heap    postgres    false            �            1259    16406    cronograma_id_cronograma_seq    SEQUENCE     �   CREATE SEQUENCE public.cronograma_id_cronograma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.cronograma_id_cronograma_seq;
       public          postgres    false    207            �           0    0    cronograma_id_cronograma_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.cronograma_id_cronograma_seq OWNED BY public.cronograma.id_cronograma;
          public          postgres    false    206            �            1259    16416    detalle_cronograma    TABLE     �   CREATE TABLE public.detalle_cronograma (
    id_detalle_cronograma integer NOT NULL,
    id_cronograma integer,
    desc_pension character varying(50),
    monto numeric,
    fecha_venci date
);
 &   DROP TABLE public.detalle_cronograma;
       public         heap    postgres    false            �            1259    16414 ,   detalle_cronograma_id_detalle_cronograma_seq    SEQUENCE     �   CREATE SEQUENCE public.detalle_cronograma_id_detalle_cronograma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.detalle_cronograma_id_detalle_cronograma_seq;
       public          postgres    false    209            �           0    0 ,   detalle_cronograma_id_detalle_cronograma_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.detalle_cronograma_id_detalle_cronograma_seq OWNED BY public.detalle_cronograma.id_detalle_cronograma;
          public          postgres    false    208            �            1259    16389    grados    TABLE     �   CREATE TABLE public.grados (
    nid_grado integer NOT NULL,
    desc_grado character varying(30),
    nivel character varying(4)
);
    DROP TABLE public.grados;
       public         heap    postgres    false            �            1259    16397    personas    TABLE       CREATE TABLE public.personas (
    nid_persona integer NOT NULL,
    nom_persona character varying(50),
    ape_pate_persona character varying(50),
    ape_mate_persona character varying(50),
    nid_grado integer,
    fecha_naci date,
    foto_ruta text
);
    DROP TABLE public.personas;
       public         heap    postgres    false            �            1259    16485    getpersonas    VIEW     M  CREATE VIEW public.getpersonas AS
 SELECT p.nid_persona,
    p.nom_persona,
    p.ape_pate_persona,
    p.ape_mate_persona,
    p.nid_grado,
    g.desc_grado AS grado,
    g.nivel,
    p.fecha_naci,
    p.foto_ruta
   FROM (public.personas p
     JOIN public.grados g ON ((p.nid_grado = g.nid_grado)))
  ORDER BY p.nid_persona DESC;
    DROP VIEW public.getpersonas;
       public          postgres    false    203    205    205    205    205    205    203    205    203    205            �            1259    16387    grados_nid_grado_seq    SEQUENCE     �   CREATE SEQUENCE public.grados_nid_grado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.grados_nid_grado_seq;
       public          postgres    false    203            �           0    0    grados_nid_grado_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.grados_nid_grado_seq OWNED BY public.grados.nid_grado;
          public          postgres    false    202            �            1259    16460 
   movimiento    TABLE     &  CREATE TABLE public.movimiento (
    id_movimiento integer NOT NULL,
    tipo_movimiento character varying(20),
    monto numeric,
    estado character varying(20),
    fecha_pago timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    nid_persona integer,
    id_detalle_cronograma integer
);
    DROP TABLE public.movimiento;
       public         heap    postgres    false            �            1259    16458    movimiento_id_movimiento_seq    SEQUENCE     �   CREATE SEQUENCE public.movimiento_id_movimiento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.movimiento_id_movimiento_seq;
       public          postgres    false    211            �           0    0    movimiento_id_movimiento_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.movimiento_id_movimiento_seq OWNED BY public.movimiento.id_movimiento;
          public          postgres    false    210            �            1259    16395    personas_nid_persona_seq    SEQUENCE     �   CREATE SEQUENCE public.personas_nid_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.personas_nid_persona_seq;
       public          postgres    false    205            �           0    0    personas_nid_persona_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.personas_nid_persona_seq OWNED BY public.personas.nid_persona;
          public          postgres    false    204                       2604    16411    cronograma id_cronograma    DEFAULT     �   ALTER TABLE ONLY public.cronograma ALTER COLUMN id_cronograma SET DEFAULT nextval('public.cronograma_id_cronograma_seq'::regclass);
 G   ALTER TABLE public.cronograma ALTER COLUMN id_cronograma DROP DEFAULT;
       public          postgres    false    207    206    207                       2604    16419 (   detalle_cronograma id_detalle_cronograma    DEFAULT     �   ALTER TABLE ONLY public.detalle_cronograma ALTER COLUMN id_detalle_cronograma SET DEFAULT nextval('public.detalle_cronograma_id_detalle_cronograma_seq'::regclass);
 W   ALTER TABLE public.detalle_cronograma ALTER COLUMN id_detalle_cronograma DROP DEFAULT;
       public          postgres    false    209    208    209                       2604    16392    grados nid_grado    DEFAULT     t   ALTER TABLE ONLY public.grados ALTER COLUMN nid_grado SET DEFAULT nextval('public.grados_nid_grado_seq'::regclass);
 ?   ALTER TABLE public.grados ALTER COLUMN nid_grado DROP DEFAULT;
       public          postgres    false    203    202    203                       2604    16463    movimiento id_movimiento    DEFAULT     �   ALTER TABLE ONLY public.movimiento ALTER COLUMN id_movimiento SET DEFAULT nextval('public.movimiento_id_movimiento_seq'::regclass);
 G   ALTER TABLE public.movimiento ALTER COLUMN id_movimiento DROP DEFAULT;
       public          postgres    false    210    211    211                       2604    16400    personas nid_persona    DEFAULT     |   ALTER TABLE ONLY public.personas ALTER COLUMN nid_persona SET DEFAULT nextval('public.personas_nid_persona_seq'::regclass);
 C   ALTER TABLE public.personas ALTER COLUMN nid_persona DROP DEFAULT;
       public          postgres    false    205    204    205            �          0    16408 
   cronograma 
   TABLE DATA           9   COPY public.cronograma (id_cronograma, year) FROM stdin;
    public          postgres    false    207   �6       �          0    16416    detalle_cronograma 
   TABLE DATA           t   COPY public.detalle_cronograma (id_detalle_cronograma, id_cronograma, desc_pension, monto, fecha_venci) FROM stdin;
    public          postgres    false    209   �6       �          0    16389    grados 
   TABLE DATA           >   COPY public.grados (nid_grado, desc_grado, nivel) FROM stdin;
    public          postgres    false    203   7       �          0    16460 
   movimiento 
   TABLE DATA           �   COPY public.movimiento (id_movimiento, tipo_movimiento, monto, estado, fecha_pago, nid_persona, id_detalle_cronograma) FROM stdin;
    public          postgres    false    211   �7       �          0    16397    personas 
   TABLE DATA           �   COPY public.personas (nid_persona, nom_persona, ape_pate_persona, ape_mate_persona, nid_grado, fecha_naci, foto_ruta) FROM stdin;
    public          postgres    false    205   �7       �           0    0    cronograma_id_cronograma_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.cronograma_id_cronograma_seq', 1, false);
          public          postgres    false    206            �           0    0 ,   detalle_cronograma_id_detalle_cronograma_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.detalle_cronograma_id_detalle_cronograma_seq', 1, false);
          public          postgres    false    208            �           0    0    grados_nid_grado_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.grados_nid_grado_seq', 1, false);
          public          postgres    false    202            �           0    0    movimiento_id_movimiento_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.movimiento_id_movimiento_seq', 1, false);
          public          postgres    false    210            �           0    0    personas_nid_persona_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.personas_nid_persona_seq', 11, true);
          public          postgres    false    204                       2606    16413    cronograma cronograma_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.cronograma
    ADD CONSTRAINT cronograma_pkey PRIMARY KEY (id_cronograma);
 D   ALTER TABLE ONLY public.cronograma DROP CONSTRAINT cronograma_pkey;
       public            postgres    false    207                        2606    16424 *   detalle_cronograma detalle_cronograma_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.detalle_cronograma
    ADD CONSTRAINT detalle_cronograma_pkey PRIMARY KEY (id_detalle_cronograma);
 T   ALTER TABLE ONLY public.detalle_cronograma DROP CONSTRAINT detalle_cronograma_pkey;
       public            postgres    false    209                       2606    16394    grados grados_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.grados
    ADD CONSTRAINT grados_pkey PRIMARY KEY (nid_grado);
 <   ALTER TABLE ONLY public.grados DROP CONSTRAINT grados_pkey;
       public            postgres    false    203            #           2606    16469    movimiento movimiento_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.movimiento
    ADD CONSTRAINT movimiento_pkey PRIMARY KEY (id_movimiento);
 D   ALTER TABLE ONLY public.movimiento DROP CONSTRAINT movimiento_pkey;
       public            postgres    false    211                       2606    16405    personas personas_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (nid_persona);
 @   ALTER TABLE ONLY public.personas DROP CONSTRAINT personas_pkey;
       public            postgres    false    205            !           1259    16457    fki_cronograma_fkey    INDEX     [   CREATE INDEX fki_cronograma_fkey ON public.detalle_cronograma USING btree (id_cronograma);
 '   DROP INDEX public.fki_cronograma_fkey;
       public            postgres    false    209            %           2606    16452 "   detalle_cronograma cronograma_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_cronograma
    ADD CONSTRAINT cronograma_fkey FOREIGN KEY (id_cronograma) REFERENCES public.cronograma(id_cronograma) NOT VALID;
 L   ALTER TABLE ONLY public.detalle_cronograma DROP CONSTRAINT cronograma_fkey;
       public          postgres    false    209    207    3102            $           2606    16436    personas nid_grado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personas
    ADD CONSTRAINT nid_grado_fkey FOREIGN KEY (nid_grado) REFERENCES public.grados(nid_grado) NOT VALID;
 A   ALTER TABLE ONLY public.personas DROP CONSTRAINT nid_grado_fkey;
       public          postgres    false    205    203    3098            �      x������ � �      �      x������ � �      �   �   x�3�4Rp<�1���/3�ˈ��g�i��3�4E��q:��%B�朆`)ϐ3�(37�(�385���H���@�Ɯ!�E�pY�1�E%P�)g`if�g
7Ds���s��怹0s�<K�9`��Pk����� �I�      �      x������ � �      �   �  x���͊�0��)��H�,��^�>@/��-,ӡa�g&-�P0D9��e����o�˽���l�6�����ͱc�Ā�Q@��8�2T!W��G��1	��o������������:�����A���˨�X��Ŵ<q���_���ǵÓ�� ��ɢbN�%U_3��+�N�R�)�������̪wk�Ws茻�	0�[�A2A�g�.*��aۑ�$������ՠMu��O�b���C��������q�zj�<ǝ��K�Z�i�3q��d�Ќ�<#,Ҟ�'��wB�K|t�G�Q e�Fl(���'E�{�E�'��GΏZ�� '������2�`�e���9��9������K:�h�m� &�q^�d�`��9ρ:�:�c+�v��ݮ�H6�|�UY���4�6�c�8�!��X�^.�O�\�G     
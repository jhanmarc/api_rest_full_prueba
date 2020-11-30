CREATE DATABASE db_smiledu;

CREATE TABLE grados(
    nid_grado SERIAL PRIMARY KEY,
    desc_grado VARCHAR(30),
    nivel VARCHAR(3)
)

CREATE TABLE personas(
    nid_persona SERIAL PRIMARY KEY,
    nom_persona VARCHAR(50),
    ape_pate_persona VARCHAR(50),
    ape_mate_persona VARCHAR(50),
    nid_grado INTEGER,
    fecha_naci DATE,
    foto_ruta TEXT
)

CREATE TABLE cronograma(
    id_cronograma SERIAL PRIMARY KEY,
    year INTEGER
)

CREATE TABLE detalle_cronograma(
    id_detalle_cronograma SERIAL PRIMARY KEY,
    id_cronograma INTEGER,
    desc_pension VARCHAR(50),
    monto DECIMAL,
    fecha_venci DATE
)

CREATE TABLE movimiento(
    id_movimiento SERIAL PRIMARY KEY,
    tipo_movimiento VARCHAR(20),
    monto DECIMAL,
    estado VARCHAR(20),
    fecha_pago TIMESTAMP,
    id_persona INTEGER,
    id_detalle_cronograma INTEGER
)



INSERT INTO public.grados(
	nid_grado, desc_grado, nivel)
	VALUES (1, '2 Años', '1'),
	 (2, '3 Años', '1'),
	 (3, '4 Años', '1'),
	 (4, '5 Años', '1'),
	 (5, 'Primero', '2'),
	 (6, 'Segundo', '2'),
	 (7, 'Tercero', '2'),
	 (8, 'Cuarto', '2'),
	 (9, 'Quinto', '2'),
	 (9, 'Quinto', '2'),
	 (10, 'Sexto', '3'),
	 (11, 'Primero', '3'),
	 (12, 'Segundo', '3'),
	 (13, 'Tercero', '3'),
	 (14, 'Cuarto', '3'),
	 (15, 'Quinto', '3'),
	 (16, 'Cuna', '1'),
	 (17, '1 Año', '1');




CREATE OR REPLACE PROCEDURE public."spperson"(IN p_id bigint, IN p_nom character varying, IN "p_apeP" character varying, IN "p_apeM" character varying, IN "p_nidG" bigint, IN "p_fecN" date, IN "p_fotR" text)
LANGUAGE 'sql'
AS $BODY$
INSERT INTO public.personas(nom_persona, ape_pate_persona, ape_mate_persona, nid_grado, fecha_naci, foto_ruta)
	VALUES (p_nom, p_apeP, p_apeM, p_nidG, p_fecN, p_fotR);
$BODY$;


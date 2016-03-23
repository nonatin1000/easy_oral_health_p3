--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.11
-- Dumped by pg_dump version 9.3.11
-- Started on 2016-03-23 09:54:03 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2157 (class 0 OID 51692)
-- Dependencies: 182
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$24000$Mo9PtRmGU0R5$nkmMZMsPHiuZ8IerkC/9i6CC1gr4oDuVP8psN6mMK/E=', '2016-03-23 09:29:18-03', true, 'nonato', 'Nonato', 'Sales', 'nrdesales@hotmail.com', true, true, '2016-02-04 19:58:29-03');
INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (2, 'pbkdf2_sha256$24000$oHgeojektMla$VRLLsV46JkG5vHuik4PM/WlLwAqIgRs4/kpN1lVAabk=', '2016-03-23 09:30:44.472009-03', false, 'anavirginia', 'Ana Virginia', 'Castro', 'anavnc@yahoo.com.br', false, true, '2016-02-05 14:02:40-03');


--
-- TOC entry 2159 (class 0 OID 51702)
-- Dependencies: 184
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2197 (class 0 OID 0)
-- Dependencies: 183
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 181
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, false);


--
-- TOC entry 2161 (class 0 OID 51710)
-- Dependencies: 186
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 185
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2163 (class 0 OID 51818)
-- Dependencies: 194
-- Data for Name: odontology_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_course (id, created_on, updated_on, name, description) VALUES (1, '2016-01-13 20:10:38.031372-03', '2016-01-13 20:10:38.031438-03', 'Sistema de informação', 'Bacharelado em Sistema de Informação');
INSERT INTO odontology_course (id, created_on, updated_on, name, description) VALUES (2, '2016-01-26 18:39:15.722774-03', '2016-01-26 18:39:15.722925-03', 'Enfermagem', 'Bacharelado em Enfermagem');
INSERT INTO odontology_course (id, created_on, updated_on, name, description) VALUES (3, '2016-01-26 18:39:47.45683-03', '2016-01-26 18:39:47.456985-03', 'Nutrição', 'Bacharelado em Nutrição');
INSERT INTO odontology_course (id, created_on, updated_on, name, description) VALUES (4, '2016-01-26 18:40:50.045785-03', '2016-01-26 18:40:50.045853-03', 'Matemática', 'Licenciatura em Matemática');
INSERT INTO odontology_course (id, created_on, updated_on, name, description) VALUES (5, '2016-01-26 18:41:20.581881-03', '2016-01-26 18:41:20.581956-03', 'História', 'Licenciatura em História');
INSERT INTO odontology_course (id, created_on, updated_on, name, description) VALUES (6, '2016-01-26 18:41:42.342667-03', '2016-01-26 18:41:42.342737-03', 'Biologia', 'Bacharelado em Biologia');
INSERT INTO odontology_course (id, created_on, updated_on, name, description) VALUES (7, '2016-01-26 18:42:03.160515-03', '2016-01-26 18:42:28.413691-03', 'Administração', 'Bacharelado em Administração');
INSERT INTO odontology_course (id, created_on, updated_on, name, description) VALUES (8, '2016-01-26 18:42:03.160515-03', '2016-01-26 18:42:28.413691-03', 'Medicina', 'Bacharelado em Medicina');
INSERT INTO odontology_course (id, created_on, updated_on, name, description) VALUES (9, '2016-03-23 09:26:56.986291-03', '2016-03-23 09:28:15.219926-03', 'Pedagogia', 'Licenciatura em Pedagogia');
INSERT INTO odontology_course (id, created_on, updated_on, name, description) VALUES (10, '2016-03-23 09:28:41.588307-03', '2016-03-23 09:28:41.588337-03', 'Letras', 'Licenciatura em Letras Português');


--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 193
-- Name: odontology_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_course_id_seq', 10, true);


--
-- TOC entry 2164 (class 0 OID 51824)
-- Dependencies: 195
-- Data for Name: odontology_dentist; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_dentist (user_ptr_id, created_on, updated_on, sex, marital_status, birth_date, cro, phone) VALUES (2, '2016-02-05 14:02:40.795842-03', '2016-02-05 14:02:40.79586-03', 'F', 'CASADO', '1989-02-25', 'PI8541', '(89)34225214');


--
-- TOC entry 2180 (class 0 OID 52100)
-- Dependencies: 216
-- Data for Name: odontology_exams; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_exams (id, created_on, updated_on, name, description) VALUES (2, '2016-03-22 08:48:55.635303-03', '2016-03-23 09:14:41.967152-03', 'RX periapical', 'RX periapical');
INSERT INTO odontology_exams (id, created_on, updated_on, name, description) VALUES (1, '2016-03-22 08:46:38.931513-03', '2016-03-23 09:15:20.300245-03', 'RX interproximal', 'RX interproximal');
INSERT INTO odontology_exams (id, created_on, updated_on, name, description) VALUES (3, '2016-03-23 09:15:34.36525-03', '2016-03-23 09:15:34.365278-03', 'RX oclusal', 'RX oclusal');
INSERT INTO odontology_exams (id, created_on, updated_on, name, description) VALUES (4, '2016-03-23 09:15:45.265736-03', '2016-03-23 09:15:45.265764-03', 'RX panorâmico', 'RX panorâmico');
INSERT INTO odontology_exams (id, created_on, updated_on, name, description) VALUES (5, '2016-03-23 09:16:02.180043-03', '2016-03-23 09:16:02.180072-03', 'RX lateral', 'RX lateral');
INSERT INTO odontology_exams (id, created_on, updated_on, name, description) VALUES (6, '2016-03-23 09:16:15.290023-03', '2016-03-23 09:16:15.290051-03', 'RX lateral oblíqua', 'RX lateral oblíqua');
INSERT INTO odontology_exams (id, created_on, updated_on, name, description) VALUES (7, '2016-03-23 09:17:30.490244-03', '2016-03-23 09:17:30.490276-03', 'RX de Waters', 'RX de Waters');
INSERT INTO odontology_exams (id, created_on, updated_on, name, description) VALUES (8, '2016-03-23 09:17:39.164601-03', '2016-03-23 09:17:39.164627-03', 'RX de Towne', 'RX de Towne');
INSERT INTO odontology_exams (id, created_on, updated_on, name, description) VALUES (9, '2016-03-23 09:17:48.176604-03', '2016-03-23 09:17:48.176638-03', 'RX de Towne modificada', 'RX de Towne modificada');
INSERT INTO odontology_exams (id, created_on, updated_on, name, description) VALUES (10, '2016-03-23 09:17:58.079521-03', '2016-03-23 09:17:58.079554-03', 'RX telerradiográfico', 'RX telerradiográfico');
INSERT INTO odontology_exams (id, created_on, updated_on, name, description) VALUES (11, '2016-03-23 09:21:06.026597-03', '2016-03-23 09:21:06.026624-03', 'Hemograma Completo', 'Hemograma Completo');
INSERT INTO odontology_exams (id, created_on, updated_on, name, description) VALUES (12, '2016-03-23 09:22:04.587226-03', '2016-03-23 09:22:04.587257-03', 'Coagulograma', 'Coagulograma');
INSERT INTO odontology_exams (id, created_on, updated_on, name, description) VALUES (13, '2016-03-23 09:22:28.30804-03', '2016-03-23 09:22:28.308071-03', 'Glicemia em jejum', 'Glicemia em jejum');


--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 215
-- Name: odontology_exams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_exams_id_seq', 13, true);


--
-- TOC entry 2166 (class 0 OID 51839)
-- Dependencies: 199
-- Data for Name: odontology_oralprocedure; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_oralprocedure (id, created_on, updated_on, name, description) VALUES (1, '2016-01-28 17:53:46.933597-03', '2016-03-21 11:36:59.382571-03', 'Tartarectomia', 'Tartarectomia');
INSERT INTO odontology_oralprocedure (id, created_on, updated_on, name, description) VALUES (3, '2016-01-28 17:54:16.756242-03', '2016-03-21 11:37:17.70468-03', 'Profilaxia', 'Profilaxia');
INSERT INTO odontology_oralprocedure (id, created_on, updated_on, name, description) VALUES (2, '2016-01-28 17:53:59.713144-03', '2016-03-21 11:37:34.285014-03', 'Fluor', 'Fluor');
INSERT INTO odontology_oralprocedure (id, created_on, updated_on, name, description) VALUES (4, '2016-03-21 11:39:22.188073-03', '2016-03-21 11:39:22.188099-03', 'Remoção de Pontos', 'Remoção de Pontos');
INSERT INTO odontology_oralprocedure (id, created_on, updated_on, name, description) VALUES (5, '2016-03-21 11:40:47.231869-03', '2016-03-21 11:40:47.231896-03', 'Drenagem de Absesso', 'Drenagem de Absesso');
INSERT INTO odontology_oralprocedure (id, created_on, updated_on, name, description) VALUES (6, '2016-03-23 09:12:54.17725-03', '2016-03-23 09:12:54.177284-03', 'Instrução de Higiene Oral', 'Instrução de Higiene Oral');


--
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 198
-- Name: odontology_oralprocedure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_oralprocedure_id_seq', 6, true);


--
-- TOC entry 2168 (class 0 OID 51847)
-- Dependencies: 201
-- Data for Name: odontology_patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_patient (id, created_on, updated_on, name, sex, marital_status, birth_date, father, mother, phone, types, email, course_id) VALUES (4, '2016-03-21 11:12:41.747551-03', '2016-03-21 11:12:41.747578-03', 'Nonato Rodrigues de Sales Carvalho', 'M', 'CASADO', '1985-06-02', 'Raimundo Nonato Rodrigues', 'Antonio Maria de Sales Rodrigues', '(89) 9 9930-5127', 'Técnico Administrativo', 'nrdesales@hotmail.com', NULL);
INSERT INTO odontology_patient (id, created_on, updated_on, name, sex, marital_status, birth_date, father, mother, phone, types, email, course_id) VALUES (5, '2016-03-23 09:46:16.677939-03', '2016-03-23 09:46:16.677966-03', 'Micael Araujo Basto', 'M', 'SOLTEIRO', '1993-01-19', '', '', '(89) 9 8852-1478', 'Estudante', 'micaelbasto@hotmail.com', 1);
INSERT INTO odontology_patient (id, created_on, updated_on, name, sex, marital_status, birth_date, father, mother, phone, types, email, course_id) VALUES (6, '2016-03-23 09:46:57.26507-03', '2016-03-23 09:46:57.67157-03', 'Esdras Carvalho Rodrigues', 'M', 'SOLTEIRO', NULL, NULL, NULL, '(89) 9 9988-3685', 'Dependente', 'esdras.rodrigues@gmail.com', NULL);


--
-- TOC entry 2170 (class 0 OID 51858)
-- Dependencies: 203
-- Data for Name: odontology_patient_dependents; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_patient_dependents (id, from_patient_id, to_patient_id) VALUES (1, 4, 6);


--
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 202
-- Name: odontology_patient_dependents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_patient_dependents_id_seq', 1, true);


--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 200
-- Name: odontology_patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_patient_id_seq', 6, true);


--
-- TOC entry 2172 (class 0 OID 51874)
-- Dependencies: 207
-- Data for Name: odontology_patienttooth; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (65, '2016-03-21 11:12:41.809591-03', '2016-03-21 11:12:41.809624-03', 4, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (66, '2016-03-21 11:12:41.866514-03', '2016-03-21 11:12:41.866559-03', 4, 2);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (67, '2016-03-21 11:12:41.908124-03', '2016-03-21 11:12:41.908159-03', 4, 3);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (68, '2016-03-21 11:12:41.916368-03', '2016-03-21 11:12:41.916399-03', 4, 4);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (69, '2016-03-21 11:12:41.924687-03', '2016-03-21 11:12:41.924717-03', 4, 5);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (70, '2016-03-21 11:12:41.933005-03', '2016-03-21 11:12:41.933033-03', 4, 6);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (71, '2016-03-21 11:12:41.94129-03', '2016-03-21 11:12:41.941317-03', 4, 7);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (72, '2016-03-21 11:12:41.949705-03', '2016-03-21 11:12:41.949739-03', 4, 8);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (73, '2016-03-21 11:12:41.957985-03', '2016-03-21 11:12:41.958014-03', 4, 9);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (74, '2016-03-21 11:12:41.96634-03', '2016-03-21 11:12:41.966371-03', 4, 10);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (75, '2016-03-21 11:12:41.974692-03', '2016-03-21 11:12:41.974721-03', 4, 11);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (76, '2016-03-21 11:12:41.983054-03', '2016-03-21 11:12:41.983085-03', 4, 12);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (77, '2016-03-21 11:12:41.991425-03', '2016-03-21 11:12:41.991454-03', 4, 13);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (78, '2016-03-21 11:12:41.999711-03', '2016-03-21 11:12:41.999736-03', 4, 14);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (79, '2016-03-21 11:12:42.008023-03', '2016-03-21 11:12:42.008052-03', 4, 15);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (80, '2016-03-21 11:12:42.016317-03', '2016-03-21 11:12:42.016341-03', 4, 16);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (81, '2016-03-21 11:12:42.024638-03', '2016-03-21 11:12:42.024663-03', 4, 17);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (82, '2016-03-21 11:12:42.032999-03', '2016-03-21 11:12:42.033023-03', 4, 18);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (83, '2016-03-21 11:12:42.041475-03', '2016-03-21 11:12:42.041508-03', 4, 19);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (84, '2016-03-21 11:12:42.049687-03', '2016-03-21 11:12:42.049713-03', 4, 20);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (85, '2016-03-21 11:12:42.058-03', '2016-03-21 11:12:42.058024-03', 4, 21);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (86, '2016-03-21 11:12:42.06632-03', '2016-03-21 11:12:42.066344-03', 4, 22);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (87, '2016-03-21 11:12:42.074691-03', '2016-03-21 11:12:42.074723-03', 4, 23);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (88, '2016-03-21 11:12:42.083011-03', '2016-03-21 11:12:42.083039-03', 4, 24);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (89, '2016-03-21 11:12:42.091305-03', '2016-03-21 11:12:42.091328-03', 4, 25);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (90, '2016-03-21 11:12:42.099726-03', '2016-03-21 11:12:42.09976-03', 4, 26);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (91, '2016-03-21 11:12:42.107997-03', '2016-03-21 11:12:42.108025-03', 4, 27);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (92, '2016-03-21 11:12:42.116335-03', '2016-03-21 11:12:42.11636-03', 4, 28);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (93, '2016-03-21 11:12:42.124676-03', '2016-03-21 11:12:42.124699-03', 4, 29);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (94, '2016-03-21 11:12:42.133033-03', '2016-03-21 11:12:42.133062-03', 4, 30);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (95, '2016-03-21 11:12:42.141383-03', '2016-03-21 11:12:42.14141-03', 4, 31);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (96, '2016-03-21 11:12:42.149692-03', '2016-03-21 11:12:42.149718-03', 4, 32);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (97, '2016-03-23 09:46:16.708873-03', '2016-03-23 09:46:16.708918-03', 5, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (98, '2016-03-23 09:46:16.764735-03', '2016-03-23 09:46:16.764767-03', 5, 2);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (99, '2016-03-23 09:46:16.806511-03', '2016-03-23 09:46:16.806541-03', 5, 3);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (100, '2016-03-23 09:46:16.814648-03', '2016-03-23 09:46:16.814676-03', 5, 4);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (101, '2016-03-23 09:46:16.822825-03', '2016-03-23 09:46:16.822846-03', 5, 5);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (102, '2016-03-23 09:46:16.831329-03', '2016-03-23 09:46:16.83136-03', 5, 6);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (103, '2016-03-23 09:46:16.839597-03', '2016-03-23 09:46:16.839625-03', 5, 7);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (104, '2016-03-23 09:46:16.847921-03', '2016-03-23 09:46:16.84795-03', 5, 8);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (105, '2016-03-23 09:46:16.856156-03', '2016-03-23 09:46:16.85618-03', 5, 9);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (106, '2016-03-23 09:46:16.864633-03', '2016-03-23 09:46:16.864663-03', 5, 10);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (107, '2016-03-23 09:46:16.872994-03', '2016-03-23 09:46:16.873026-03', 5, 11);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (108, '2016-03-23 09:46:16.881219-03', '2016-03-23 09:46:16.881246-03', 5, 12);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (109, '2016-03-23 09:46:16.889498-03', '2016-03-23 09:46:16.889522-03', 5, 13);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (110, '2016-03-23 09:46:16.897976-03', '2016-03-23 09:46:16.898009-03', 5, 14);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (111, '2016-03-23 09:46:16.906251-03', '2016-03-23 09:46:16.906281-03', 5, 15);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (112, '2016-03-23 09:46:16.914611-03', '2016-03-23 09:46:16.914643-03', 5, 16);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (113, '2016-03-23 09:46:16.923017-03', '2016-03-23 09:46:16.923047-03', 5, 17);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (114, '2016-03-23 09:46:16.931305-03', '2016-03-23 09:46:16.931335-03', 5, 18);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (115, '2016-03-23 09:46:16.939662-03', '2016-03-23 09:46:16.939692-03', 5, 19);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (116, '2016-03-23 09:46:16.948027-03', '2016-03-23 09:46:16.948057-03', 5, 20);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (117, '2016-03-23 09:46:16.956335-03', '2016-03-23 09:46:16.956365-03', 5, 21);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (118, '2016-03-23 09:46:16.964544-03', '2016-03-23 09:46:16.964567-03', 5, 22);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (119, '2016-03-23 09:46:16.972992-03', '2016-03-23 09:46:16.973021-03', 5, 23);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (120, '2016-03-23 09:46:16.981325-03', '2016-03-23 09:46:16.981355-03', 5, 24);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (121, '2016-03-23 09:46:16.989562-03', '2016-03-23 09:46:16.989586-03', 5, 25);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (122, '2016-03-23 09:46:16.997999-03', '2016-03-23 09:46:16.998032-03', 5, 26);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (123, '2016-03-23 09:46:17.006325-03', '2016-03-23 09:46:17.006356-03', 5, 27);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (124, '2016-03-23 09:46:17.01469-03', '2016-03-23 09:46:17.014722-03', 5, 28);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (125, '2016-03-23 09:46:17.022951-03', '2016-03-23 09:46:17.022978-03', 5, 29);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (126, '2016-03-23 09:46:17.031323-03', '2016-03-23 09:46:17.031354-03', 5, 30);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (127, '2016-03-23 09:46:17.03962-03', '2016-03-23 09:46:17.039647-03', 5, 31);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (128, '2016-03-23 09:46:17.048024-03', '2016-03-23 09:46:17.048054-03', 5, 32);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (129, '2016-03-23 09:46:57.317012-03', '2016-03-23 09:46:57.317044-03', 6, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (130, '2016-03-23 09:46:57.390121-03', '2016-03-23 09:46:57.390153-03', 6, 2);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (131, '2016-03-23 09:46:57.413495-03', '2016-03-23 09:46:57.413533-03', 6, 3);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (132, '2016-03-23 09:46:57.421659-03', '2016-03-23 09:46:57.42169-03', 6, 4);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (133, '2016-03-23 09:46:57.429916-03', '2016-03-23 09:46:57.429942-03', 6, 5);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (134, '2016-03-23 09:46:57.438243-03', '2016-03-23 09:46:57.438267-03', 6, 6);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (135, '2016-03-23 09:46:57.446716-03', '2016-03-23 09:46:57.446761-03', 6, 7);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (136, '2016-03-23 09:46:57.454953-03', '2016-03-23 09:46:57.45498-03', 6, 8);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (137, '2016-03-23 09:46:57.463273-03', '2016-03-23 09:46:57.463302-03', 6, 9);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (138, '2016-03-23 09:46:57.471572-03', '2016-03-23 09:46:57.471596-03', 6, 10);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (139, '2016-03-23 09:46:57.480001-03', '2016-03-23 09:46:57.480031-03', 6, 11);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (140, '2016-03-23 09:46:57.488299-03', '2016-03-23 09:46:57.488328-03', 6, 12);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (141, '2016-03-23 09:46:57.496616-03', '2016-03-23 09:46:57.496645-03', 6, 13);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (142, '2016-03-23 09:46:57.504926-03', '2016-03-23 09:46:57.504951-03', 6, 14);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (143, '2016-03-23 09:46:57.513332-03', '2016-03-23 09:46:57.513362-03', 6, 15);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (144, '2016-03-23 09:46:57.521618-03', '2016-03-23 09:46:57.521647-03', 6, 16);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (145, '2016-03-23 09:46:57.530093-03', '2016-03-23 09:46:57.530128-03', 6, 17);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (146, '2016-03-23 09:46:57.538317-03', '2016-03-23 09:46:57.538343-03', 6, 18);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (147, '2016-03-23 09:46:57.546607-03', '2016-03-23 09:46:57.54663-03', 6, 19);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (148, '2016-03-23 09:46:57.55495-03', '2016-03-23 09:46:57.554972-03', 6, 20);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (149, '2016-03-23 09:46:57.563442-03', '2016-03-23 09:46:57.563479-03', 6, 21);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (150, '2016-03-23 09:46:57.571691-03', '2016-03-23 09:46:57.571719-03', 6, 22);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (151, '2016-03-23 09:46:57.579961-03', '2016-03-23 09:46:57.579987-03', 6, 23);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (152, '2016-03-23 09:46:57.588351-03', '2016-03-23 09:46:57.588379-03', 6, 24);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (153, '2016-03-23 09:46:57.596708-03', '2016-03-23 09:46:57.596739-03', 6, 25);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (154, '2016-03-23 09:46:57.60495-03', '2016-03-23 09:46:57.604975-03', 6, 26);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (155, '2016-03-23 09:46:57.613393-03', '2016-03-23 09:46:57.613426-03', 6, 27);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (156, '2016-03-23 09:46:57.621694-03', '2016-03-23 09:46:57.621724-03', 6, 28);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (157, '2016-03-23 09:46:57.630039-03', '2016-03-23 09:46:57.630071-03', 6, 29);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (158, '2016-03-23 09:46:57.638284-03', '2016-03-23 09:46:57.638308-03', 6, 30);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (159, '2016-03-23 09:46:57.646702-03', '2016-03-23 09:46:57.646733-03', 6, 31);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (160, '2016-03-23 09:46:57.65499-03', '2016-03-23 09:46:57.655016-03', 6, 32);


--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 206
-- Name: odontology_patienttooth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_patienttooth_id_seq', 160, true);


--
-- TOC entry 2174 (class 0 OID 51882)
-- Dependencies: 209
-- Data for Name: odontology_proceduredental; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_proceduredental (id, created_on, updated_on, name, description) VALUES (1, '2016-01-28 17:52:58.717679-03', '2016-01-28 17:52:58.717758-03', 'Restauração Resina', 'Restauração Resina');
INSERT INTO odontology_proceduredental (id, created_on, updated_on, name, description) VALUES (2, '2016-01-28 17:52:58.717679-03', '2016-01-28 17:52:58.717758-03', 'Restauração Amalgama', 'Restauração Amalgama');
INSERT INTO odontology_proceduredental (id, created_on, updated_on, name, description) VALUES (3, '2016-01-28 17:52:58.717679-03', '2016-01-28 17:52:58.717758-03', 'Restauração Ionômero', 'Restauração Ionômero');
INSERT INTO odontology_proceduredental (id, created_on, updated_on, name, description) VALUES (4, '2016-01-28 17:52:58.717679-03', '2016-01-28 17:52:58.717758-03', 'Restauração Provisória', 'Restauração Provisória');
INSERT INTO odontology_proceduredental (id, created_on, updated_on, name, description) VALUES (5, '2016-01-28 17:53:12.066113-03', '2016-01-28 17:53:12.066198-03', 'Cariado', 'Cariado');
INSERT INTO odontology_proceduredental (id, created_on, updated_on, name, description) VALUES (6, '2016-01-28 17:53:12.066113-03', '2016-01-28 17:53:12.066198-03', 'Restauração a ser feita', 'Restauração a ser feita');
INSERT INTO odontology_proceduredental (id, created_on, updated_on, name, description) VALUES (7, '2016-01-28 17:53:12.066113-03', '2016-01-28 17:53:12.066198-03', 'Indicado para extração', 'Indicado para extração');
INSERT INTO odontology_proceduredental (id, created_on, updated_on, name, description) VALUES (8, '2016-01-28 17:53:12.066113-03', '2016-01-28 17:53:12.066198-03', 'Extraído ou ausente', 'Extraído ou ausente');
INSERT INTO odontology_proceduredental (id, created_on, updated_on, name, description) VALUES (9, '2016-01-28 17:53:12.066113-03', '2016-01-28 17:53:12.066198-03', 'Protese Fixa', 'Protese Fixa');


--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 208
-- Name: odontology_proceduredental_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_proceduredental_id_seq', 1, false);


--
-- TOC entry 2176 (class 0 OID 51890)
-- Dependencies: 211
-- Data for Name: odontology_tooth; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (1, '2016-01-29 18:03:34.746955-03', '2016-01-29 18:03:34.747035-03', '18', 'Terceiro Molar Superior Direito');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (2, '2016-01-29 18:03:14.255897-03', '2016-01-29 18:03:14.256015-03', '17', 'Segundo Molar Superior Direito');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (3, '2016-01-29 18:03:04.261134-03', '2016-01-29 18:03:04.261197-03', '16', 'Primeiro Molar Superior Direito');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (4, '2016-01-29 18:02:52.641729-03', '2016-01-29 18:02:52.641804-03', '15', 'Segundo Premolar Superior Direito');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (5, '2016-01-29 18:02:41.941764-03', '2016-01-29 18:02:41.941869-03', '14', 'Primeiro Premolar Superior Direito');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (6, '2016-01-29 18:02:30.325633-03', '2016-01-29 18:02:30.325716-03', '13', 'Canino Superior Direito');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (7, '2016-01-29 18:02:18.637506-03', '2016-01-29 18:02:18.637569-03', '12', 'Incisivo Lateral Superior Direito');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (8, '2016-01-29 18:02:00.440239-03', '2016-01-29 18:02:00.440303-03', '11', 'Incisivo Central Superior Direito');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (9, '2016-01-29 18:03:48.37578-03', '2016-01-29 18:03:48.375838-03', '21', 'Incisivo Central Superior Esquerdo');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (10, '2016-01-29 18:03:59.596345-03', '2016-01-29 18:03:59.596403-03', '22', 'Incisivo Lateral Superior Esquerdo');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (11, '2016-01-29 18:04:13.641297-03', '2016-01-29 18:04:13.641402-03', '23', 'Canino Superior Esquerdo');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (12, '2016-01-29 18:04:26.182262-03', '2016-01-29 18:04:26.182367-03', '24', 'Primeiro Premolar Superior Esquerdo');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (13, '2016-01-29 18:04:37.745593-03', '2016-01-29 18:04:37.745674-03', '25', 'Segundo Premolar Superior Esquerdo');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (14, '2016-01-29 18:04:51.702953-03', '2016-01-29 18:04:51.703039-03', '26', 'Primeiro Molar Superior Esquerdo');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (15, '2016-01-29 18:05:04.192263-03', '2016-01-29 18:05:04.193093-03', '27', 'Segundo Molar Superior Esquerdo');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (16, '2016-01-29 18:05:14.319032-03', '2016-01-29 18:05:14.319264-03', '28', 'Terceiro Molar Superior Esquerdo');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (17, '2016-01-29 18:07:34.281075-03', '2016-01-29 18:07:34.281187-03', '48', 'Terceiro Molar Inferior Direito');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (18, '2016-01-29 18:08:02.10103-03', '2016-01-29 18:08:02.101101-03', '47', 'Segundo Molar Inferior Direito');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (19, '2016-01-29 18:08:13.192213-03', '2016-01-29 18:08:13.192307-03', '46', 'Primeiro Molar Inferior Direito');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (20, '2016-01-29 18:08:31.999807-03', '2016-01-29 18:08:31.999887-03', '45', 'Segundo Premolar Inferior Direito');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (21, '2016-01-29 18:08:46.281773-03', '2016-01-29 18:08:46.281848-03', '44', 'Primeiro Premolar Inferior Direito');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (22, '2016-01-29 18:08:58.282245-03', '2016-01-29 18:08:58.282315-03', '43', 'Canino Inferior Direito');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (23, '2016-01-29 18:09:10.697683-03', '2016-01-29 18:09:10.697751-03', '42', 'Incisivo Lateral Inferior Direito');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (24, '2016-01-29 18:09:27.157258-03', '2016-01-29 18:09:27.157338-03', '41', 'Incisivo Central Inferior Direito');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (25, '2016-01-29 18:07:25.010744-03', '2016-01-29 18:07:25.010838-03', '31', 'Incisivo Central Inferior Esquerdo');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (26, '2016-01-29 18:07:16.186359-03', '2016-01-29 18:07:16.186451-03', '32', 'Incisivo Lateral Inferior Esquerdo');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (27, '2016-01-29 18:07:07.132428-03', '2016-01-29 18:07:07.132502-03', '33', 'Canino Inferior Esquerdo');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (28, '2016-01-29 18:06:40.920186-03', '2016-01-29 18:06:40.920265-03', '34', 'Primeiro Premolar Inferior Esquerdo');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (29, '2016-01-29 18:06:21.881086-03', '2016-01-29 18:06:21.881155-03', '35', 'Segundo Premolar Inferior Esquerdo');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (30, '2016-01-29 18:06:12.491253-03', '2016-01-29 18:06:12.491351-03', '36', 'Primeiro Molar Inferior Esquerdo');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (31, '2016-01-29 18:06:01.094343-03', '2016-01-29 18:06:01.094425-03', '37', 'Segundo  Molar Inferior Esquerdo');
INSERT INTO odontology_tooth (id, created_on, updated_on, name, description) VALUES (32, '2016-01-29 18:05:25.328478-03', '2016-01-29 18:05:25.328628-03', '38', 'Terceiro Molar Inferior Esquerdo');


--
-- TOC entry 2207 (class 0 OID 0)
-- Dependencies: 210
-- Name: odontology_tooth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_tooth_id_seq', 1, false);


--
-- TOC entry 2178 (class 0 OID 51898)
-- Dependencies: 213
-- Data for Name: odontology_toothdivision; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_toothdivision (id, created_on, updated_on, name, description) VALUES (1, '2016-01-28 18:30:42.655875-03', '2016-01-28 18:30:42.655982-03', 'FP/FL', 'Face Palatal/Face Lingual');
INSERT INTO odontology_toothdivision (id, created_on, updated_on, name, description) VALUES (2, '2016-01-28 18:30:58.536623-03', '2016-01-28 18:30:58.536716-03', 'FV', 'Face Vestibular');
INSERT INTO odontology_toothdivision (id, created_on, updated_on, name, description) VALUES (3, '2016-01-28 18:31:13.079119-03', '2016-01-28 18:31:13.0792-03', 'FM', 'Face Mesial');
INSERT INTO odontology_toothdivision (id, created_on, updated_on, name, description) VALUES (4, '2016-01-28 18:31:27.32252-03', '2016-01-28 18:31:27.322609-03', 'FD', 'Face Distal');
INSERT INTO odontology_toothdivision (id, created_on, updated_on, name, description) VALUES (5, '2016-01-28 18:31:39.784917-03', '2016-01-28 18:31:39.785039-03', 'FO', 'Face Oclusal');
INSERT INTO odontology_toothdivision (id, created_on, updated_on, name, description) VALUES (6, '2016-01-28 18:31:39.784917-03', '2016-02-05 13:52:40.198341-03', 'DC', 'Dente Completo');


--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 212
-- Name: odontology_toothdivision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_toothdivision_id_seq', 1, false);


SET default_tablespace = '';

--
-- TOC entry 2003 (class 2606 OID 51707)
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2005 (class 2606 OID 51751)
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 1996 (class 2606 OID 51697)
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2009 (class 2606 OID 51715)
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2011 (class 2606 OID 51765)
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 1999 (class 2606 OID 51699)
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2013 (class 2606 OID 51823)
-- Name: odontology_course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY odontology_course
    ADD CONSTRAINT odontology_course_pkey PRIMARY KEY (id);


--
-- TOC entry 2015 (class 2606 OID 51828)
-- Name: odontology_dentist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY odontology_dentist
    ADD CONSTRAINT odontology_dentist_pkey PRIMARY KEY (user_ptr_id);


--
-- TOC entry 2038 (class 2606 OID 52108)
-- Name: odontology_exams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY odontology_exams
    ADD CONSTRAINT odontology_exams_pkey PRIMARY KEY (id);


--
-- TOC entry 2017 (class 2606 OID 51844)
-- Name: odontology_oralprocedure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY odontology_oralprocedure
    ADD CONSTRAINT odontology_oralprocedure_pkey PRIMARY KEY (id);


--
-- TOC entry 2024 (class 2606 OID 51945)
-- Name: odontology_patient_dependents_from_patient_id_5885a21d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY odontology_patient_dependents
    ADD CONSTRAINT odontology_patient_dependents_from_patient_id_5885a21d_uniq UNIQUE (from_patient_id, to_patient_id);


--
-- TOC entry 2026 (class 2606 OID 51863)
-- Name: odontology_patient_dependents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY odontology_patient_dependents
    ADD CONSTRAINT odontology_patient_dependents_pkey PRIMARY KEY (id);


--
-- TOC entry 2020 (class 2606 OID 51855)
-- Name: odontology_patient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY odontology_patient
    ADD CONSTRAINT odontology_patient_pkey PRIMARY KEY (id);


--
-- TOC entry 2030 (class 2606 OID 51879)
-- Name: odontology_patienttooth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY odontology_patienttooth
    ADD CONSTRAINT odontology_patienttooth_pkey PRIMARY KEY (id);


--
-- TOC entry 2032 (class 2606 OID 51887)
-- Name: odontology_proceduredental_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY odontology_proceduredental
    ADD CONSTRAINT odontology_proceduredental_pkey PRIMARY KEY (id);


--
-- TOC entry 2034 (class 2606 OID 51895)
-- Name: odontology_tooth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY odontology_tooth
    ADD CONSTRAINT odontology_tooth_pkey PRIMARY KEY (id);


--
-- TOC entry 2036 (class 2606 OID 51903)
-- Name: odontology_toothdivision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY odontology_toothdivision
    ADD CONSTRAINT odontology_toothdivision_pkey PRIMARY KEY (id);


--
-- TOC entry 2000 (class 1259 OID 51753)
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- TOC entry 2001 (class 1259 OID 51752)
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- TOC entry 2006 (class 1259 OID 51767)
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2007 (class 1259 OID 51766)
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 1997 (class 1259 OID 51739)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2021 (class 1259 OID 51946)
-- Name: odontology_patient_dependents_8f9d5c8f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX odontology_patient_dependents_8f9d5c8f ON odontology_patient_dependents USING btree (from_patient_id);


--
-- TOC entry 2022 (class 1259 OID 51947)
-- Name: odontology_patient_dependents_d74f5f2d; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX odontology_patient_dependents_d74f5f2d ON odontology_patient_dependents USING btree (to_patient_id);


--
-- TOC entry 2018 (class 1259 OID 51933)
-- Name: odontology_patient_ea134da7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX odontology_patient_ea134da7 ON odontology_patient USING btree (course_id);


--
-- TOC entry 2027 (class 1259 OID 51966)
-- Name: odontology_patienttooth_7d660e60; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX odontology_patienttooth_7d660e60 ON odontology_patienttooth USING btree (tooth_id);


--
-- TOC entry 2028 (class 1259 OID 51965)
-- Name: odontology_patienttooth_9f065c57; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX odontology_patienttooth_9f065c57 ON odontology_patienttooth USING btree (patient_id);


--
-- TOC entry 2040 (class 2606 OID 51745)
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2039 (class 2606 OID 51740)
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2042 (class 2606 OID 51759)
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2041 (class 2606 OID 51754)
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2043 (class 2606 OID 51911)
-- Name: odontology_dentist_user_ptr_id_1edeba75_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY odontology_dentist
    ADD CONSTRAINT odontology_dentist_user_ptr_id_1edeba75_fk_auth_user_id FOREIGN KEY (user_ptr_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2045 (class 2606 OID 51934)
-- Name: odontology_pa_from_patient_id_4d6ca1c8_fk_odontology_patient_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY odontology_patient_dependents
    ADD CONSTRAINT odontology_pa_from_patient_id_4d6ca1c8_fk_odontology_patient_id FOREIGN KEY (from_patient_id) REFERENCES odontology_patient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2046 (class 2606 OID 51939)
-- Name: odontology_pati_to_patient_id_16e61396_fk_odontology_patient_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY odontology_patient_dependents
    ADD CONSTRAINT odontology_pati_to_patient_id_16e61396_fk_odontology_patient_id FOREIGN KEY (to_patient_id) REFERENCES odontology_patient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2044 (class 2606 OID 51928)
-- Name: odontology_patient_course_id_8d85956f_fk_odontology_course_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY odontology_patient
    ADD CONSTRAINT odontology_patient_course_id_8d85956f_fk_odontology_course_id FOREIGN KEY (course_id) REFERENCES odontology_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2047 (class 2606 OID 51960)
-- Name: odontology_patient_patient_id_a1029b6f_fk_odontology_patient_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY odontology_patienttooth
    ADD CONSTRAINT odontology_patient_patient_id_a1029b6f_fk_odontology_patient_id FOREIGN KEY (patient_id) REFERENCES odontology_patient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2048 (class 2606 OID 51967)
-- Name: odontology_patienttoot_tooth_id_90a66ab6_fk_odontology_tooth_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY odontology_patienttooth
    ADD CONSTRAINT odontology_patienttoot_tooth_id_90a66ab6_fk_odontology_tooth_id FOREIGN KEY (tooth_id) REFERENCES odontology_tooth(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2016-03-23 09:54:03 BRT

--
-- PostgreSQL database dump complete
--


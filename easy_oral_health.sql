--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.11
-- Dumped by pg_dump version 9.3.11
-- Started on 2016-02-12 18:53:22 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2234 (class 0 OID 35251)
-- Dependencies: 178
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 177
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 2236 (class 0 OID 35261)
-- Dependencies: 180
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 179
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2232 (class 0 OID 35243)
-- Dependencies: 176
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can add user', 7, 'add_dentist');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can change user', 7, 'change_dentist');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can delete user', 7, 'delete_dentist');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can add course', 8, 'add_course');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can change course', 8, 'change_course');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can delete course', 8, 'delete_course');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add tooth', 9, 'add_tooth');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change tooth', 9, 'change_tooth');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete tooth', 9, 'delete_tooth');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can add tooth division', 10, 'add_toothdivision');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can change tooth division', 10, 'change_toothdivision');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can delete tooth division', 10, 'delete_toothdivision');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can add patient', 11, 'add_patient');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can change patient', 11, 'change_patient');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can delete patient', 11, 'delete_patient');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can add address', 12, 'add_address');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can change address', 12, 'change_address');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can delete address', 12, 'delete_address');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add patient tooth', 13, 'add_patienttooth');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change patient tooth', 13, 'change_patienttooth');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete patient tooth', 13, 'delete_patienttooth');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can add procedure dental', 14, 'add_proceduredental');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can change procedure dental', 14, 'change_proceduredental');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can delete procedure dental', 14, 'delete_proceduredental');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can add oral procedure', 15, 'add_oralprocedure');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can change oral procedure', 15, 'change_oralprocedure');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (45, 'Can delete oral procedure', 15, 'delete_oralprocedure');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can add patient dental procedure', 16, 'add_patientdentalprocedure');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can change patient dental procedure', 16, 'change_patientdentalprocedure');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can delete patient dental procedure', 16, 'delete_patientdentalprocedure');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add oral patient procedure', 17, 'add_oralpatientprocedure');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change oral patient procedure', 17, 'change_oralpatientprocedure');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete oral patient procedure', 17, 'delete_oralpatientprocedure');


--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 175
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 51, true);


--
-- TOC entry 2238 (class 0 OID 35269)
-- Dependencies: 182
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$24000$JCDyIe1QIOEJ$/EacqI6I7pAz9R8L+9RB/KV+RzR7r9Ayicb6eCaxug4=', '2016-02-12 18:40:17-03', true, 'nonato', 'Nonato', 'Sales', 'nrdesales@hotmail.com', true, true, '2016-02-12 18:33:37-03');
INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (2, 'pbkdf2_sha256$24000$OHDdxC4vW0yC$VBKiRStmbqMBp9JMxZFIt1cLcTJ8XmZ4sAuOiNK/UNE=', '2016-02-12 18:41:02.414148-03', false, 'anavirginha', 'Ana Virginha', 'Nogueiro', 'annaviriginha@gmail.com', false, true, '2016-02-12 18:36:10.739939-03');


--
-- TOC entry 2240 (class 0 OID 35279)
-- Dependencies: 184
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 183
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 181
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- TOC entry 2242 (class 0 OID 35287)
-- Dependencies: 186
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 185
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2244 (class 0 OID 35347)
-- Dependencies: 188
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (1, '2016-02-12 18:40:36.057647-03', '1', 'nonato', 2, 'Modificado first_name e last_name.', 4, 1);


--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 187
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, true);


--
-- TOC entry 2230 (class 0 OID 35233)
-- Dependencies: 174
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO django_content_type (id, app_label, model) VALUES (4, 'auth', 'user');
INSERT INTO django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO django_content_type (id, app_label, model) VALUES (7, 'odontology', 'dentist');
INSERT INTO django_content_type (id, app_label, model) VALUES (8, 'odontology', 'course');
INSERT INTO django_content_type (id, app_label, model) VALUES (9, 'odontology', 'tooth');
INSERT INTO django_content_type (id, app_label, model) VALUES (10, 'odontology', 'toothdivision');
INSERT INTO django_content_type (id, app_label, model) VALUES (11, 'odontology', 'patient');
INSERT INTO django_content_type (id, app_label, model) VALUES (12, 'odontology', 'address');
INSERT INTO django_content_type (id, app_label, model) VALUES (13, 'odontology', 'patienttooth');
INSERT INTO django_content_type (id, app_label, model) VALUES (14, 'odontology', 'proceduredental');
INSERT INTO django_content_type (id, app_label, model) VALUES (15, 'odontology', 'oralprocedure');
INSERT INTO django_content_type (id, app_label, model) VALUES (16, 'odontology', 'patientdentalprocedure');
INSERT INTO django_content_type (id, app_label, model) VALUES (17, 'odontology', 'oralpatientprocedure');


--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 173
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 17, true);


--
-- TOC entry 2228 (class 0 OID 35222)
-- Dependencies: 172
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2016-02-12 18:29:51.884395-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2016-02-12 18:29:52.619688-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2016-02-12 18:29:52.795121-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2016-02-12 18:29:52.827961-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2016-02-12 18:29:52.869854-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2016-02-12 18:29:52.89462-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (7, 'auth', '0003_alter_user_email_max_length', '2016-02-12 18:29:52.919589-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (8, 'auth', '0004_alter_user_username_opts', '2016-02-12 18:29:52.954877-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (9, 'auth', '0005_alter_user_last_login_null', '2016-02-12 18:29:52.977819-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (10, 'auth', '0006_require_contenttypes_0002', '2016-02-12 18:29:52.986286-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2016-02-12 18:29:53.002877-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (12, 'odontology', '0001_initial', '2016-02-12 18:29:54.181617-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (13, 'sessions', '0001_initial', '2016-02-12 18:29:54.330453-03');


--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 171
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 13, true);


--
-- TOC entry 2268 (class 0 OID 35556)
-- Dependencies: 212
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('e0gzay1ok73w7anqppyqyxzgkxvhmyi1', 'MzcwOTJhZTE2M2NiNWJhZjI4ZDM1ZjcwZWVkZTc1NGE4YzBiYzc4Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiI4OWMyYmI2ZDkxMDI3NmU3NWI5M2ZhODY1M2ZlMDIzMzg2NTVlOTc4In0=', '2016-02-26 18:41:02.422693-03');


--
-- TOC entry 2246 (class 0 OID 35372)
-- Dependencies: 190
-- Data for Name: odontology_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_address (id, created_on, updated_on, city, state, street, number, complement, zip_code, reference_point, neighborhood, country, object_id, content_type_id) VALUES (1, '2016-02-12 18:36:10.827056-03', '2016-02-12 18:36:10.827089-03', 'Picos', 'PI', 'Av Severo Eulalio', '1000', '', '64600-000', '', 'Canto da Varzea', 'Brasil', 2, 7);
INSERT INTO odontology_address (id, created_on, updated_on, city, state, street, number, complement, zip_code, reference_point, neighborhood, country, object_id, content_type_id) VALUES (2, '2016-02-12 18:37:10.549444-03', '2016-02-12 18:37:10.549474-03', 'Picos', 'PI', 'Av Eliseu Perire Bezerra', '451', '', '64600-430', '', 'Passagem das Pedras', 'Brasil', 1, 11);
INSERT INTO odontology_address (id, created_on, updated_on, city, state, street, number, complement, zip_code, reference_point, neighborhood, country, object_id, content_type_id) VALUES (3, '2016-02-12 18:38:36.620309-03', '2016-02-12 18:38:36.620334-03', 'São Raimundo Nonato', 'PI', 'Rua Projetada', '412', '', '64600-000', '', 'Centro', 'Brasil', 4, 11);
INSERT INTO odontology_address (id, created_on, updated_on, city, state, street, number, complement, zip_code, reference_point, neighborhood, country, object_id, content_type_id) VALUES (4, '2016-02-12 18:39:36.868216-03', '2016-02-12 18:39:36.868245-03', 'Dom Expedito Lopes', 'PI', 'Povoado Baixa Grande', 'S/N', '', '64600-000', '', 'Centro', 'Brasil', 5, 11);


--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 189
-- Name: odontology_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_address_id_seq', 4, true);


--
-- TOC entry 2248 (class 0 OID 35384)
-- Dependencies: 192
-- Data for Name: odontology_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_course (id, created_on, updated_on, name, description) VALUES (1, '2016-01-13 20:10:38.031372-03', '2016-01-13 20:10:38.031438-03', 'Sistema de informação', 'Bacharelado em Sistema de Informação');
INSERT INTO odontology_course (id, created_on, updated_on, name, description) VALUES (2, '2016-01-26 18:39:15.722774-03', '2016-01-26 18:39:15.722925-03', 'Enfermagem', 'Bacharelado em Enfermagem');
INSERT INTO odontology_course (id, created_on, updated_on, name, description) VALUES (3, '2016-01-26 18:39:47.45683-03', '2016-01-26 18:39:47.456985-03', 'Nutrição', 'Bacharelado em Nutrição');
INSERT INTO odontology_course (id, created_on, updated_on, name, description) VALUES (4, '2016-01-26 18:40:50.045785-03', '2016-01-26 18:40:50.045853-03', 'Matemática', 'Licenciatura em Matemática');
INSERT INTO odontology_course (id, created_on, updated_on, name, description) VALUES (5, '2016-01-26 18:41:20.581881-03', '2016-01-26 18:41:20.581956-03', 'História', 'Licenciatura em História');
INSERT INTO odontology_course (id, created_on, updated_on, name, description) VALUES (6, '2016-01-26 18:41:42.342667-03', '2016-01-26 18:41:42.342737-03', 'Biologia', 'Bacharelado em Biologia');
INSERT INTO odontology_course (id, created_on, updated_on, name, description) VALUES (7, '2016-01-26 18:42:03.160515-03', '2016-01-26 18:42:28.413691-03', 'Administração', 'Bacharelado em Administração');


--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 191
-- Name: odontology_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_course_id_seq', 1, false);


--
-- TOC entry 2249 (class 0 OID 35390)
-- Dependencies: 193
-- Data for Name: odontology_dentist; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_dentist (user_ptr_id, created_on, updated_on, sex, marital_status, birth_date, cro, phone) VALUES (2, '2016-02-12 18:36:10.77508-03', '2016-02-12 18:36:10.7751-03', 'F', 'CASADO', '1989-02-25', '1850PI', '(89)34225214');


--
-- TOC entry 2251 (class 0 OID 35397)
-- Dependencies: 195
-- Data for Name: odontology_oralpatientprocedure; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 194
-- Name: odontology_oralpatientprocedure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_oralpatientprocedure_id_seq', 1, false);


--
-- TOC entry 2253 (class 0 OID 35405)
-- Dependencies: 197
-- Data for Name: odontology_oralprocedure; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_oralprocedure (id, created_on, updated_on, name, description) VALUES (1, '2016-01-28 17:53:46.933597-03', '2016-01-28 17:53:46.93376-03', 'Raspagem', 'Raspagem');
INSERT INTO odontology_oralprocedure (id, created_on, updated_on, name, description) VALUES (2, '2016-01-28 17:53:59.713144-03', '2016-01-28 17:53:59.713198-03', 'Limpeza', 'Limpeza');
INSERT INTO odontology_oralprocedure (id, created_on, updated_on, name, description) VALUES (3, '2016-01-28 17:54:16.756242-03', '2016-01-28 17:54:16.756364-03', 'Banho de Fluor', 'Banho de Fluor');


--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 196
-- Name: odontology_oralprocedure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_oralprocedure_id_seq', 1, false);


--
-- TOC entry 2255 (class 0 OID 35413)
-- Dependencies: 199
-- Data for Name: odontology_patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_patient (id, created_on, updated_on, name, sex, marital_status, birth_date, father, mother, phone, types, email, course_id) VALUES (1, '2016-02-12 18:37:10.166168-03', '2016-02-12 18:37:10.166198-03', 'Nonato Rodrigues de Sales Carvalho', 'M', 'CASADO', '1985-06-02', 'Raimundo Nonato Rodrigues', 'Antonia Maria de Sales Rodrigues', '99930-5127', 'Funcionário', 'nrdesales@hotmail.com', NULL);
INSERT INTO odontology_patient (id, created_on, updated_on, name, sex, marital_status, birth_date, father, mother, phone, types, email, course_id) VALUES (2, '2016-02-12 18:37:25.460933-03', '2016-02-12 18:37:25.913461-03', 'Maria da Conceição', 'F', 'CASADO', NULL, NULL, NULL, '999978117', 'Dependente', 'mariacarvalhoadm@hotmail.com', NULL);
INSERT INTO odontology_patient (id, created_on, updated_on, name, sex, marital_status, birth_date, father, mother, phone, types, email, course_id) VALUES (3, '2016-02-12 18:37:40.964936-03', '2016-02-12 18:37:41.329481-03', 'Esdras Rodrigues', 'M', 'SOLTEIRO', NULL, NULL, NULL, '988132587', 'Dependente', 'esdras@gmail.com', NULL);
INSERT INTO odontology_patient (id, created_on, updated_on, name, sex, marital_status, birth_date, father, mother, phone, types, email, course_id) VALUES (4, '2016-02-12 18:38:36.254166-03', '2016-02-12 18:38:36.254192-03', 'Micael Araujo', 'M', 'SOLTEIRO', '1993-08-03', '', '', '98815-2014', 'Estudante', 'micael@hotmail.com', 1);
INSERT INTO odontology_patient (id, created_on, updated_on, name, sex, marital_status, birth_date, father, mother, phone, types, email, course_id) VALUES (5, '2016-02-12 18:39:36.507198-03', '2016-02-12 18:39:36.507233-03', 'Leandro Araujo', 'M', 'SOLTEIRO', '1992-02-15', '', '', '98801-9658', 'Estudante', 'leandro@hotmail.com', 1);


--
-- TOC entry 2257 (class 0 OID 35424)
-- Dependencies: 201
-- Data for Name: odontology_patient_dependents; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_patient_dependents (id, from_patient_id, to_patient_id) VALUES (1, 1, 2);
INSERT INTO odontology_patient_dependents (id, from_patient_id, to_patient_id) VALUES (2, 1, 3);


--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 200
-- Name: odontology_patient_dependents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_patient_dependents_id_seq', 2, true);


--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 198
-- Name: odontology_patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_patient_id_seq', 5, true);


--
-- TOC entry 2259 (class 0 OID 35432)
-- Dependencies: 203
-- Data for Name: odontology_patientdentalprocedure; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_patientdentalprocedure (id, created_on, updated_on, dentist_id, patient_tooth_id, procedure_dental_id, tooth_division_id) VALUES (1, '2016-02-12 18:41:18.789808-03', '2016-02-12 18:41:18.789837-03', 2, 16, 2, 2);
INSERT INTO odontology_patientdentalprocedure (id, created_on, updated_on, dentist_id, patient_tooth_id, procedure_dental_id, tooth_division_id) VALUES (2, '2016-02-12 18:41:34.221191-03', '2016-02-12 18:41:34.221218-03', 2, 30, 1, 5);
INSERT INTO odontology_patientdentalprocedure (id, created_on, updated_on, dentist_id, patient_tooth_id, procedure_dental_id, tooth_division_id) VALUES (3, '2016-02-12 18:42:13.417519-03', '2016-02-12 18:42:13.41755-03', 2, 13, 3, 3);
INSERT INTO odontology_patientdentalprocedure (id, created_on, updated_on, dentist_id, patient_tooth_id, procedure_dental_id, tooth_division_id) VALUES (4, '2016-02-12 18:42:42.349482-03', '2016-02-12 18:42:42.349513-03', 2, 9, 2, 5);
INSERT INTO odontology_patientdentalprocedure (id, created_on, updated_on, dentist_id, patient_tooth_id, procedure_dental_id, tooth_division_id) VALUES (5, '2016-02-12 18:42:54.889914-03', '2016-02-12 18:42:54.889942-03', 2, 7, 1, 4);
INSERT INTO odontology_patientdentalprocedure (id, created_on, updated_on, dentist_id, patient_tooth_id, procedure_dental_id, tooth_division_id) VALUES (6, '2016-02-12 18:43:06.327415-03', '2016-02-12 18:43:06.327446-03', 2, 5, 2, 3);


--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 202
-- Name: odontology_patientdentalprocedure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_patientdentalprocedure_id_seq', 6, true);


--
-- TOC entry 2261 (class 0 OID 35440)
-- Dependencies: 205
-- Data for Name: odontology_patienttooth; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (1, '2016-02-12 18:37:10.200298-03', '2016-02-12 18:37:10.20033-03', 1, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (2, '2016-02-12 18:37:10.271663-03', '2016-02-12 18:37:10.271707-03', 1, 2);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (3, '2016-02-12 18:37:10.297407-03', '2016-02-12 18:37:10.297445-03', 1, 3);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (4, '2016-02-12 18:37:10.305588-03', '2016-02-12 18:37:10.305618-03', 1, 4);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (5, '2016-02-12 18:37:10.314006-03', '2016-02-12 18:37:10.314043-03', 1, 5);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (6, '2016-02-12 18:37:10.322257-03', '2016-02-12 18:37:10.322285-03', 1, 6);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (7, '2016-02-12 18:37:10.330478-03', '2016-02-12 18:37:10.330501-03', 1, 7);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (8, '2016-02-12 18:37:10.338867-03', '2016-02-12 18:37:10.338895-03', 1, 8);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (9, '2016-02-12 18:37:10.347182-03', '2016-02-12 18:37:10.34721-03', 1, 9);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (10, '2016-02-12 18:37:10.355619-03', '2016-02-12 18:37:10.35565-03', 1, 10);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (11, '2016-02-12 18:37:10.363915-03', '2016-02-12 18:37:10.363949-03', 1, 11);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (12, '2016-02-12 18:37:10.372233-03', '2016-02-12 18:37:10.372259-03', 1, 12);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (13, '2016-02-12 18:37:10.380577-03', '2016-02-12 18:37:10.380602-03', 1, 13);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (14, '2016-02-12 18:37:10.388943-03', '2016-02-12 18:37:10.388972-03', 1, 14);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (15, '2016-02-12 18:37:10.397373-03', '2016-02-12 18:37:10.39741-03', 1, 15);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (16, '2016-02-12 18:37:10.405634-03', '2016-02-12 18:37:10.405664-03', 1, 16);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (17, '2016-02-12 18:37:10.41392-03', '2016-02-12 18:37:10.413947-03', 1, 17);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (18, '2016-02-12 18:37:10.422433-03', '2016-02-12 18:37:10.422476-03', 1, 18);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (19, '2016-02-12 18:37:10.430869-03', '2016-02-12 18:37:10.430927-03', 1, 19);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (20, '2016-02-12 18:37:10.439088-03', '2016-02-12 18:37:10.439133-03', 1, 20);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (21, '2016-02-12 18:37:10.447444-03', '2016-02-12 18:37:10.447489-03', 1, 21);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (22, '2016-02-12 18:37:10.455634-03', '2016-02-12 18:37:10.455667-03', 1, 22);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (23, '2016-02-12 18:37:10.463872-03', '2016-02-12 18:37:10.463897-03', 1, 23);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (24, '2016-02-12 18:37:10.472222-03', '2016-02-12 18:37:10.472247-03', 1, 24);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (25, '2016-02-12 18:37:10.480511-03', '2016-02-12 18:37:10.480533-03', 1, 25);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (26, '2016-02-12 18:37:10.488958-03', '2016-02-12 18:37:10.488987-03', 1, 26);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (27, '2016-02-12 18:37:10.497234-03', '2016-02-12 18:37:10.49726-03', 1, 27);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (28, '2016-02-12 18:37:10.505561-03', '2016-02-12 18:37:10.505586-03', 1, 28);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (29, '2016-02-12 18:37:10.513952-03', '2016-02-12 18:37:10.513979-03', 1, 29);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (30, '2016-02-12 18:37:10.522281-03', '2016-02-12 18:37:10.522308-03', 1, 30);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (31, '2016-02-12 18:37:10.530565-03', '2016-02-12 18:37:10.530592-03', 1, 31);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (32, '2016-02-12 18:37:10.538941-03', '2016-02-12 18:37:10.538966-03', 1, 32);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (33, '2016-02-12 18:37:25.519934-03', '2016-02-12 18:37:25.519963-03', 2, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (34, '2016-02-12 18:37:25.555316-03', '2016-02-12 18:37:25.555358-03', 2, 2);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (35, '2016-02-12 18:37:25.605362-03', '2016-02-12 18:37:25.605393-03', 2, 3);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (36, '2016-02-12 18:37:25.613427-03', '2016-02-12 18:37:25.613457-03', 2, 4);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (37, '2016-02-12 18:37:25.621776-03', '2016-02-12 18:37:25.621807-03', 2, 5);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (38, '2016-02-12 18:37:25.630109-03', '2016-02-12 18:37:25.63014-03', 2, 6);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (39, '2016-02-12 18:37:25.638467-03', '2016-02-12 18:37:25.638499-03', 2, 7);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (40, '2016-02-12 18:37:25.64672-03', '2016-02-12 18:37:25.64675-03', 2, 8);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (41, '2016-02-12 18:37:25.655156-03', '2016-02-12 18:37:25.655203-03', 2, 9);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (42, '2016-02-12 18:37:25.663445-03', '2016-02-12 18:37:25.663482-03', 2, 10);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (43, '2016-02-12 18:37:25.671695-03', '2016-02-12 18:37:25.671722-03', 2, 11);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (44, '2016-02-12 18:37:25.680055-03', '2016-02-12 18:37:25.680079-03', 2, 12);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (45, '2016-02-12 18:37:25.688375-03', '2016-02-12 18:37:25.688401-03', 2, 13);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (46, '2016-02-12 18:37:25.747059-03', '2016-02-12 18:37:25.747096-03', 2, 14);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (47, '2016-02-12 18:37:25.755195-03', '2016-02-12 18:37:25.755226-03', 2, 15);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (48, '2016-02-12 18:37:25.763448-03', '2016-02-12 18:37:25.763476-03', 2, 16);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (49, '2016-02-12 18:37:25.771733-03', '2016-02-12 18:37:25.771756-03', 2, 17);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (50, '2016-02-12 18:37:25.780183-03', '2016-02-12 18:37:25.780213-03', 2, 18);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (51, '2016-02-12 18:37:25.788411-03', '2016-02-12 18:37:25.788435-03', 2, 19);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (52, '2016-02-12 18:37:25.796709-03', '2016-02-12 18:37:25.796732-03', 2, 20);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (53, '2016-02-12 18:37:25.805028-03', '2016-02-12 18:37:25.80505-03', 2, 21);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (54, '2016-02-12 18:37:25.813438-03', '2016-02-12 18:37:25.813467-03', 2, 22);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (55, '2016-02-12 18:37:25.821721-03', '2016-02-12 18:37:25.821746-03', 2, 23);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (56, '2016-02-12 18:37:25.830064-03', '2016-02-12 18:37:25.83009-03', 2, 24);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (57, '2016-02-12 18:37:25.838428-03', '2016-02-12 18:37:25.838456-03', 2, 25);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (58, '2016-02-12 18:37:25.846816-03', '2016-02-12 18:37:25.846846-03', 2, 26);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (59, '2016-02-12 18:37:25.855119-03', '2016-02-12 18:37:25.855148-03', 2, 27);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (60, '2016-02-12 18:37:25.863453-03', '2016-02-12 18:37:25.863479-03', 2, 28);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (61, '2016-02-12 18:37:25.871829-03', '2016-02-12 18:37:25.87186-03', 2, 29);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (62, '2016-02-12 18:37:25.880352-03', '2016-02-12 18:37:25.880397-03', 2, 30);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (63, '2016-02-12 18:37:25.888445-03', '2016-02-12 18:37:25.888469-03', 2, 31);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (64, '2016-02-12 18:37:25.896767-03', '2016-02-12 18:37:25.896794-03', 2, 32);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (65, '2016-02-12 18:37:41.006949-03', '2016-02-12 18:37:41.006978-03', 3, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (66, '2016-02-12 18:37:41.045701-03', '2016-02-12 18:37:41.045737-03', 3, 2);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (67, '2016-02-12 18:37:41.071403-03', '2016-02-12 18:37:41.071435-03', 3, 3);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (68, '2016-02-12 18:37:41.079501-03', '2016-02-12 18:37:41.079528-03', 3, 4);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (69, '2016-02-12 18:37:41.087867-03', '2016-02-12 18:37:41.087893-03', 3, 5);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (70, '2016-02-12 18:37:41.096235-03', '2016-02-12 18:37:41.096263-03', 3, 6);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (71, '2016-02-12 18:37:41.104514-03', '2016-02-12 18:37:41.104538-03', 3, 7);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (72, '2016-02-12 18:37:41.112838-03', '2016-02-12 18:37:41.112862-03', 3, 8);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (73, '2016-02-12 18:37:41.121206-03', '2016-02-12 18:37:41.121232-03', 3, 9);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (74, '2016-02-12 18:37:41.129621-03', '2016-02-12 18:37:41.129651-03', 3, 10);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (75, '2016-02-12 18:37:41.13795-03', '2016-02-12 18:37:41.137978-03', 3, 11);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (76, '2016-02-12 18:37:41.146227-03', '2016-02-12 18:37:41.14625-03', 3, 12);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (77, '2016-02-12 18:37:41.154569-03', '2016-02-12 18:37:41.154595-03', 3, 13);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (78, '2016-02-12 18:37:41.162923-03', '2016-02-12 18:37:41.162951-03', 3, 14);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (79, '2016-02-12 18:37:41.171242-03', '2016-02-12 18:37:41.17127-03', 3, 15);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (80, '2016-02-12 18:37:41.179746-03', '2016-02-12 18:37:41.179788-03', 3, 16);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (81, '2016-02-12 18:37:41.187933-03', '2016-02-12 18:37:41.18796-03', 3, 17);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (82, '2016-02-12 18:37:41.19623-03', '2016-02-12 18:37:41.196256-03', 3, 18);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (83, '2016-02-12 18:37:41.204571-03', '2016-02-12 18:37:41.204594-03', 3, 19);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (84, '2016-02-12 18:37:41.212872-03', '2016-02-12 18:37:41.212895-03', 3, 20);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (85, '2016-02-12 18:37:41.221228-03', '2016-02-12 18:37:41.221254-03', 3, 21);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (86, '2016-02-12 18:37:41.229532-03', '2016-02-12 18:37:41.229554-03', 3, 22);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (87, '2016-02-12 18:37:41.237879-03', '2016-02-12 18:37:41.237903-03', 3, 23);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (88, '2016-02-12 18:37:41.246198-03', '2016-02-12 18:37:41.246222-03', 3, 24);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (89, '2016-02-12 18:37:41.254587-03', '2016-02-12 18:37:41.254615-03', 3, 25);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (90, '2016-02-12 18:37:41.262922-03', '2016-02-12 18:37:41.262947-03', 3, 26);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (91, '2016-02-12 18:37:41.271304-03', '2016-02-12 18:37:41.271331-03', 3, 27);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (92, '2016-02-12 18:37:41.279635-03', '2016-02-12 18:37:41.279664-03', 3, 28);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (93, '2016-02-12 18:37:41.287988-03', '2016-02-12 18:37:41.288018-03', 3, 29);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (94, '2016-02-12 18:37:41.296289-03', '2016-02-12 18:37:41.296318-03', 3, 30);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (95, '2016-02-12 18:37:41.304585-03', '2016-02-12 18:37:41.304608-03', 3, 31);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (96, '2016-02-12 18:37:41.312986-03', '2016-02-12 18:37:41.313016-03', 3, 32);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (97, '2016-02-12 18:38:36.297133-03', '2016-02-12 18:38:36.297165-03', 4, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (98, '2016-02-12 18:38:36.34128-03', '2016-02-12 18:38:36.341314-03', 4, 2);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (99, '2016-02-12 18:38:36.369535-03', '2016-02-12 18:38:36.36957-03', 4, 3);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (100, '2016-02-12 18:38:36.377685-03', '2016-02-12 18:38:36.377711-03', 4, 4);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (101, '2016-02-12 18:38:36.38603-03', '2016-02-12 18:38:36.386056-03', 4, 5);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (102, '2016-02-12 18:38:36.394404-03', '2016-02-12 18:38:36.394436-03', 4, 6);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (103, '2016-02-12 18:38:36.402717-03', '2016-02-12 18:38:36.402745-03', 4, 7);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (104, '2016-02-12 18:38:36.410941-03', '2016-02-12 18:38:36.410964-03', 4, 8);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (105, '2016-02-12 18:38:36.41934-03', '2016-02-12 18:38:36.419368-03', 4, 9);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (106, '2016-02-12 18:38:36.427616-03', '2016-02-12 18:38:36.42764-03', 4, 10);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (107, '2016-02-12 18:38:36.436096-03', '2016-02-12 18:38:36.436124-03', 4, 11);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (108, '2016-02-12 18:38:36.444352-03', '2016-02-12 18:38:36.444375-03', 4, 12);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (109, '2016-02-12 18:38:36.452752-03', '2016-02-12 18:38:36.45278-03', 4, 13);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (110, '2016-02-12 18:38:36.46101-03', '2016-02-12 18:38:36.461034-03', 4, 14);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (111, '2016-02-12 18:38:36.469469-03', '2016-02-12 18:38:36.469499-03', 4, 15);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (112, '2016-02-12 18:38:36.477661-03', '2016-02-12 18:38:36.477686-03', 4, 16);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (113, '2016-02-12 18:38:36.486093-03', '2016-02-12 18:38:36.486123-03', 4, 17);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (114, '2016-02-12 18:38:36.494393-03', '2016-02-12 18:38:36.49442-03', 4, 18);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (115, '2016-02-12 18:38:36.502749-03', '2016-02-12 18:38:36.502776-03', 4, 19);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (116, '2016-02-12 18:38:36.51107-03', '2016-02-12 18:38:36.511097-03', 4, 20);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (117, '2016-02-12 18:38:36.519384-03', '2016-02-12 18:38:36.519412-03', 4, 21);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (118, '2016-02-12 18:38:36.527664-03', '2016-02-12 18:38:36.527687-03', 4, 22);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (119, '2016-02-12 18:38:36.535985-03', '2016-02-12 18:38:36.536007-03', 4, 23);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (120, '2016-02-12 18:38:36.544322-03', '2016-02-12 18:38:36.544345-03', 4, 24);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (121, '2016-02-12 18:38:36.552724-03', '2016-02-12 18:38:36.552751-03', 4, 25);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (122, '2016-02-12 18:38:36.560987-03', '2016-02-12 18:38:36.561011-03', 4, 26);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (123, '2016-02-12 18:38:36.569463-03', '2016-02-12 18:38:36.569493-03', 4, 27);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (124, '2016-02-12 18:38:36.577768-03', '2016-02-12 18:38:36.577796-03', 4, 28);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (125, '2016-02-12 18:38:36.586186-03', '2016-02-12 18:38:36.586219-03', 4, 29);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (126, '2016-02-12 18:38:36.594487-03', '2016-02-12 18:38:36.594515-03', 4, 30);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (127, '2016-02-12 18:38:36.602837-03', '2016-02-12 18:38:36.602868-03', 4, 31);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (128, '2016-02-12 18:38:36.611187-03', '2016-02-12 18:38:36.61122-03', 4, 32);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (129, '2016-02-12 18:39:36.553184-03', '2016-02-12 18:39:36.553216-03', 5, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (130, '2016-02-12 18:39:36.59318-03', '2016-02-12 18:39:36.593215-03', 5, 2);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (131, '2016-02-12 18:39:36.617219-03', '2016-02-12 18:39:36.617253-03', 5, 3);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (132, '2016-02-12 18:39:36.625428-03', '2016-02-12 18:39:36.625454-03', 5, 4);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (133, '2016-02-12 18:39:36.633815-03', '2016-02-12 18:39:36.633843-03', 5, 5);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (134, '2016-02-12 18:39:36.64208-03', '2016-02-12 18:39:36.642104-03', 5, 6);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (135, '2016-02-12 18:39:36.65053-03', '2016-02-12 18:39:36.650559-03', 5, 7);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (136, '2016-02-12 18:39:36.658759-03', '2016-02-12 18:39:36.65878-03', 5, 8);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (137, '2016-02-12 18:39:36.667253-03', '2016-02-12 18:39:36.66729-03', 5, 9);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (138, '2016-02-12 18:39:36.675533-03', '2016-02-12 18:39:36.675563-03', 5, 10);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (139, '2016-02-12 18:39:36.683945-03', '2016-02-12 18:39:36.68398-03', 5, 11);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (140, '2016-02-12 18:39:36.692142-03', '2016-02-12 18:39:36.692169-03', 5, 12);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (141, '2016-02-12 18:39:36.700491-03', '2016-02-12 18:39:36.700519-03', 5, 13);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (142, '2016-02-12 18:39:36.708871-03', '2016-02-12 18:39:36.708902-03', 5, 14);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (143, '2016-02-12 18:39:36.717219-03', '2016-02-12 18:39:36.717252-03', 5, 15);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (144, '2016-02-12 18:39:36.725488-03', '2016-02-12 18:39:36.725516-03', 5, 16);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (145, '2016-02-12 18:39:36.733948-03', '2016-02-12 18:39:36.733993-03', 5, 17);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (146, '2016-02-12 18:39:36.742312-03', '2016-02-12 18:39:36.742357-03', 5, 18);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (147, '2016-02-12 18:39:36.750518-03', '2016-02-12 18:39:36.750546-03', 5, 19);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (148, '2016-02-12 18:39:36.75878-03', '2016-02-12 18:39:36.758804-03', 5, 20);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (149, '2016-02-12 18:39:36.767146-03', '2016-02-12 18:39:36.767189-03', 5, 21);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (150, '2016-02-12 18:39:36.775438-03', '2016-02-12 18:39:36.775461-03', 5, 22);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (151, '2016-02-12 18:39:36.783858-03', '2016-02-12 18:39:36.783887-03', 5, 23);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (152, '2016-02-12 18:39:36.792185-03', '2016-02-12 18:39:36.79221-03', 5, 24);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (153, '2016-02-12 18:39:36.800547-03', '2016-02-12 18:39:36.800578-03', 5, 25);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (154, '2016-02-12 18:39:36.808839-03', '2016-02-12 18:39:36.808863-03', 5, 26);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (155, '2016-02-12 18:39:36.817217-03', '2016-02-12 18:39:36.817248-03', 5, 27);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (156, '2016-02-12 18:39:36.825521-03', '2016-02-12 18:39:36.825549-03', 5, 28);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (157, '2016-02-12 18:39:36.833886-03', '2016-02-12 18:39:36.833918-03', 5, 29);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (158, '2016-02-12 18:39:36.842191-03', '2016-02-12 18:39:36.842218-03', 5, 30);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (159, '2016-02-12 18:39:36.85056-03', '2016-02-12 18:39:36.850588-03', 5, 31);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id) VALUES (160, '2016-02-12 18:39:36.85888-03', '2016-02-12 18:39:36.858908-03', 5, 32);


--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 204
-- Name: odontology_patienttooth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_patienttooth_id_seq', 160, true);


--
-- TOC entry 2263 (class 0 OID 35448)
-- Dependencies: 207
-- Data for Name: odontology_proceduredental; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_proceduredental (id, created_on, updated_on, name, description) VALUES (1, '2016-01-28 17:52:58.717679-03', '2016-01-28 17:52:58.717758-03', 'Restaurado', 'Restaurado');
INSERT INTO odontology_proceduredental (id, created_on, updated_on, name, description) VALUES (2, '2016-01-28 17:53:12.066113-03', '2016-01-28 17:53:12.066198-03', 'Cariado', 'Cariado');
INSERT INTO odontology_proceduredental (id, created_on, updated_on, name, description) VALUES (3, '2016-01-28 17:53:12.066113-03', '2016-01-28 17:53:12.066198-03', 'Restauração a ser feita', 'Restauração a ser feita');
INSERT INTO odontology_proceduredental (id, created_on, updated_on, name, description) VALUES (4, '2016-01-28 17:53:12.066113-03', '2016-01-28 17:53:12.066198-03', 'Indicado para extração', 'Indicado para extração');
INSERT INTO odontology_proceduredental (id, created_on, updated_on, name, description) VALUES (5, '2016-01-28 17:53:12.066113-03', '2016-01-28 17:53:12.066198-03', 'Extraído ou ausente', 'Extraído ou ausente');


--
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 206
-- Name: odontology_proceduredental_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_proceduredental_id_seq', 1, false);


--
-- TOC entry 2265 (class 0 OID 35456)
-- Dependencies: 209
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
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 208
-- Name: odontology_tooth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_tooth_id_seq', 1, false);


--
-- TOC entry 2267 (class 0 OID 35464)
-- Dependencies: 211
-- Data for Name: odontology_toothdivision; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_toothdivision (id, created_on, updated_on, name, description) VALUES (1, '2016-01-28 18:30:42.655875-03', '2016-01-28 18:30:42.655982-03', 'FP/FL', 'Face Palatal/Face Lingual');
INSERT INTO odontology_toothdivision (id, created_on, updated_on, name, description) VALUES (2, '2016-01-28 18:30:58.536623-03', '2016-01-28 18:30:58.536716-03', 'FV', 'Face Vestibular');
INSERT INTO odontology_toothdivision (id, created_on, updated_on, name, description) VALUES (3, '2016-01-28 18:31:13.079119-03', '2016-01-28 18:31:13.0792-03', 'FM', 'Face Mesial');
INSERT INTO odontology_toothdivision (id, created_on, updated_on, name, description) VALUES (4, '2016-01-28 18:31:27.32252-03', '2016-01-28 18:31:27.322609-03', 'FD', 'Face Distal');
INSERT INTO odontology_toothdivision (id, created_on, updated_on, name, description) VALUES (5, '2016-01-28 18:31:39.784917-03', '2016-01-28 18:31:39.785039-03', 'FO', 'Face Oclusal');
INSERT INTO odontology_toothdivision (id, created_on, updated_on, name, description) VALUES (6, '2016-01-28 18:31:39.784917-03', '2016-02-05 13:52:40.198341-03', 'DC', 'Dente Completo');


--
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 210
-- Name: odontology_toothdivision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_toothdivision_id_seq', 1, false);


-- Completed on 2016-02-12 18:53:22 BRT

--
-- PostgreSQL database dump complete
--


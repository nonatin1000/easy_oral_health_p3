--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-02-05 17:50:29 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2258 (class 0 OID 34854)
-- Dependencies: 177
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2327 (class 0 OID 0)
-- Dependencies: 176
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 2260 (class 0 OID 34864)
-- Dependencies: 179
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2328 (class 0 OID 0)
-- Dependencies: 178
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2256 (class 0 OID 34846)
-- Dependencies: 175
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
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can add tooth', 10, 'add_tooth');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can change tooth', 10, 'change_tooth');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can delete tooth', 10, 'delete_tooth');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can add tooth division', 11, 'add_toothdivision');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can change tooth division', 11, 'change_toothdivision');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can delete tooth division', 11, 'delete_toothdivision');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can add patient', 12, 'add_patient');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can change patient', 12, 'change_patient');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can delete patient', 12, 'delete_patient');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add address', 13, 'add_address');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change address', 13, 'change_address');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete address', 13, 'delete_address');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can add patient tooth', 14, 'add_patienttooth');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can change patient tooth', 14, 'change_patienttooth');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can delete patient tooth', 14, 'delete_patienttooth');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can add procedure dental', 16, 'add_proceduredental');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can change procedure dental', 16, 'change_proceduredental');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can delete procedure dental', 16, 'delete_proceduredental');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add oral procedure', 17, 'add_oralprocedure');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change oral procedure', 17, 'change_oralprocedure');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete oral procedure', 17, 'delete_oralprocedure');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (52, 'Can add patient dental procedure', 18, 'add_patientdentalprocedure');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (53, 'Can change patient dental procedure', 18, 'change_patientdentalprocedure');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (54, 'Can delete patient dental procedure', 18, 'delete_patientdentalprocedure');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (55, 'Can add oral patient procedure', 19, 'add_oralpatientprocedure');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (56, 'Can change oral patient procedure', 19, 'change_oralpatientprocedure');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (57, 'Can delete oral patient procedure', 19, 'delete_oralpatientprocedure');


--
-- TOC entry 2329 (class 0 OID 0)
-- Dependencies: 174
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 57, true);


--
-- TOC entry 2262 (class 0 OID 34872)
-- Dependencies: 181
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (2, 'pbkdf2_sha256$24000$oHgeojektMla$VRLLsV46JkG5vHuik4PM/WlLwAqIgRs4/kpN1lVAabk=', '2016-02-05 16:20:44.039669-03', false, 'anavirginha', 'Ana Virginha', 'Nogueiro', 'annaviriginha@gmail.com', false, true, '2016-02-05 14:02:40.729613-03');
INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$24000$Mo9PtRmGU0R5$nkmMZMsPHiuZ8IerkC/9i6CC1gr4oDuVP8psN6mMK/E=', '2016-02-05 17:44:15.945614-03', true, 'nonato', '', '', 'nrdesales@hotmail.com', true, true, '2016-02-04 19:58:29.854288-03');


--
-- TOC entry 2264 (class 0 OID 34882)
-- Dependencies: 183
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2330 (class 0 OID 0)
-- Dependencies: 182
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 2331 (class 0 OID 0)
-- Dependencies: 180
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- TOC entry 2266 (class 0 OID 34890)
-- Dependencies: 185
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2332 (class 0 OID 0)
-- Dependencies: 184
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2268 (class 0 OID 34950)
-- Dependencies: 187
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2333 (class 0 OID 0)
-- Dependencies: 186
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- TOC entry 2254 (class 0 OID 34836)
-- Dependencies: 173
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
INSERT INTO django_content_type (id, app_label, model) VALUES (10, 'odontology', 'tooth');
INSERT INTO django_content_type (id, app_label, model) VALUES (11, 'odontology', 'toothdivision');
INSERT INTO django_content_type (id, app_label, model) VALUES (12, 'odontology', 'patient');
INSERT INTO django_content_type (id, app_label, model) VALUES (13, 'odontology', 'address');
INSERT INTO django_content_type (id, app_label, model) VALUES (14, 'odontology', 'patienttooth');
INSERT INTO django_content_type (id, app_label, model) VALUES (16, 'odontology', 'proceduredental');
INSERT INTO django_content_type (id, app_label, model) VALUES (17, 'odontology', 'oralprocedure');
INSERT INTO django_content_type (id, app_label, model) VALUES (18, 'odontology', 'patientdentalprocedure');
INSERT INTO django_content_type (id, app_label, model) VALUES (19, 'odontology', 'oralpatientprocedure');


--
-- TOC entry 2334 (class 0 OID 0)
-- Dependencies: 172
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 19, true);


--
-- TOC entry 2252 (class 0 OID 34825)
-- Dependencies: 171
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2016-02-04 19:57:22.272992-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2016-02-04 19:57:22.958424-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2016-02-04 19:57:23.12542-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2016-02-04 19:57:23.150204-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2016-02-04 19:57:23.191375-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2016-02-04 19:57:23.216477-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (7, 'auth', '0003_alter_user_email_max_length', '2016-02-04 19:57:23.258209-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (8, 'auth', '0004_alter_user_username_opts', '2016-02-04 19:57:23.274115-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (9, 'auth', '0005_alter_user_last_login_null', '2016-02-04 19:57:23.29981-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (10, 'auth', '0006_require_contenttypes_0002', '2016-02-04 19:57:23.307952-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2016-02-04 19:57:23.324135-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (12, 'odontology', '0001_initial', '2016-02-04 19:57:24.737774-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (13, 'odontology', '0002_auto_20160204_1703', '2016-02-04 19:57:24.862245-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (14, 'odontology', '0003_auto_20160204_1957', '2016-02-04 19:57:24.920329-03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (15, 'sessions', '0001_initial', '2016-02-04 19:57:25.062513-03');


--
-- TOC entry 2335 (class 0 OID 0)
-- Dependencies: 170
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 15, true);


--
-- TOC entry 2296 (class 0 OID 35208)
-- Dependencies: 215
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('0mnsda266l1t5bq1fsx7a31dikestbfk', 'YTc3MDljZDNjNWI4YzcyMDdlYjg0YTRkZWRhNDNiZTM1YTBlNjdjYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZmNGRkYTY1MGI5MmY3ZDVlYzU5MGNjMmNlOGRhNmFmZTUyM2JlNTciLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-02-19 16:20:44.048556-03');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('fov7umljpmz918zoo7bqt1lzczhwhiii', 'MDc3OTMxZTNhZjBjZThkNzM4NzAyZmNjNDI1ZGU4OWM5ODgxZDE0ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTIwZWYxNzIxOTBiYzQxNDVkOTYxOTQwNDkzNzY5NGIzM2FhZGNlNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-02-19 17:44:15.954491-03');


--
-- TOC entry 2270 (class 0 OID 34975)
-- Dependencies: 189
-- Data for Name: odontology_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_address (id, created_on, updated_on, city, state, street, number, complement, zip_code, reference_point, neighborhood, country, object_id, content_type_id) VALUES (1, '2016-02-05 14:02:40.841835-03', '2016-02-05 14:02:40.841869-03', 'Picos', 'PI', 'Rua Padre Cicero', '55', 'casa', '64600-000', '', 'Canto da Varzea', 'Brasil', 2, 7);
INSERT INTO odontology_address (id, created_on, updated_on, city, state, street, number, complement, zip_code, reference_point, neighborhood, country, object_id, content_type_id) VALUES (2, '2016-02-05 14:03:27.934433-03', '2016-02-05 14:03:27.934458-03', 'Picos', 'PI', 'Av Eliseu Perire Bezerra', '451', '', '64600-430', '', 'Passagem das Pedras', 'Brasil', 1, 12);


--
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 188
-- Name: odontology_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_address_id_seq', 2, true);


--
-- TOC entry 2272 (class 0 OID 34987)
-- Dependencies: 191
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
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 190
-- Name: odontology_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_course_id_seq', 1, false);


--
-- TOC entry 2273 (class 0 OID 34993)
-- Dependencies: 192
-- Data for Name: odontology_dentist; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_dentist (user_ptr_id, created_on, updated_on, sex, marital_status, birth_date, cro, phone) VALUES (2, '2016-02-05 14:02:40.795842-03', '2016-02-05 14:02:40.79586-03', 'F', 'CASADO', '1989-02-25', 'PI8541', '(89)34225214');


--
-- TOC entry 2275 (class 0 OID 35000)
-- Dependencies: 194
-- Data for Name: odontology_oralpatientprocedure; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 193
-- Name: odontology_oralpatientprocedure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_oralpatientprocedure_id_seq', 1, false);


--
-- TOC entry 2277 (class 0 OID 35008)
-- Dependencies: 196
-- Data for Name: odontology_oralprocedure; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_oralprocedure (id, created_on, updated_on, name, description) VALUES (1, '2016-01-28 17:53:46.933597-03', '2016-01-28 17:53:46.93376-03', 'Raspagem', 'Raspagem');
INSERT INTO odontology_oralprocedure (id, created_on, updated_on, name, description) VALUES (2, '2016-01-28 17:53:59.713144-03', '2016-01-28 17:53:59.713198-03', 'Limpeza', 'Limpeza');
INSERT INTO odontology_oralprocedure (id, created_on, updated_on, name, description) VALUES (3, '2016-01-28 17:54:16.756242-03', '2016-01-28 17:54:16.756364-03', 'Banho de Fluor', 'Banho de Fluor');


--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 195
-- Name: odontology_oralprocedure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_oralprocedure_id_seq', 1, false);


--
-- TOC entry 2279 (class 0 OID 35016)
-- Dependencies: 198
-- Data for Name: odontology_patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_patient (id, created_on, updated_on, name, sex, marital_status, birth_date, father, mother, phone, types, email, course_id) VALUES (1, '2016-02-05 14:03:27.568664-03', '2016-02-05 14:03:27.568688-03', 'Nonato Rodrigues de Sales Carvalho', 'M', 'CASADO', '1985-06-02', 'Raimundo Nonato Rodrigues', 'Antonia Maria de Sales Rodrigues', '(89)99930-5127', 'Funcionário', 'nrdesales@hotmail.com', NULL);


--
-- TOC entry 2281 (class 0 OID 35027)
-- Dependencies: 200
-- Data for Name: odontology_patient_dependents; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 199
-- Name: odontology_patient_dependents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_patient_dependents_id_seq', 1, false);


--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 197
-- Name: odontology_patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_patient_id_seq', 1, true);


--
-- TOC entry 2283 (class 0 OID 35035)
-- Dependencies: 202
-- Data for Name: odontology_patientdentalprocedure; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_patientdentalprocedure (id, created_on, updated_on, dentist_id, patient_tooth_id, procedure_dental_id, procedure_status_id, tooth_division_id) VALUES (1, '2016-02-05 14:05:05.757952-03', '2016-02-05 14:05:05.757995-03', 2, 8, 2, 1, 1);
INSERT INTO odontology_patientdentalprocedure (id, created_on, updated_on, dentist_id, patient_tooth_id, procedure_dental_id, procedure_status_id, tooth_division_id) VALUES (2, '2016-02-05 14:05:19.088153-03', '2016-02-05 14:05:19.08818-03', 2, 8, 1, 3, 2);
INSERT INTO odontology_patientdentalprocedure (id, created_on, updated_on, dentist_id, patient_tooth_id, procedure_dental_id, procedure_status_id, tooth_division_id) VALUES (3, '2016-02-05 14:05:41.898815-03', '2016-02-05 14:05:41.898843-03', 2, 1, 3, 1, 3);
INSERT INTO odontology_patientdentalprocedure (id, created_on, updated_on, dentist_id, patient_tooth_id, procedure_dental_id, procedure_status_id, tooth_division_id) VALUES (4, '2016-02-05 14:06:02.210901-03', '2016-02-05 14:06:02.210932-03', 2, 2, 4, 1, 6);
INSERT INTO odontology_patientdentalprocedure (id, created_on, updated_on, dentist_id, patient_tooth_id, procedure_dental_id, procedure_status_id, tooth_division_id) VALUES (6, '2016-02-05 14:06:44.166642-03', '2016-02-05 14:06:44.166676-03', 2, 4, 2, 3, 5);
INSERT INTO odontology_patientdentalprocedure (id, created_on, updated_on, dentist_id, patient_tooth_id, procedure_dental_id, procedure_status_id, tooth_division_id) VALUES (7, '2016-02-05 14:07:06.719595-03', '2016-02-05 14:07:06.719621-03', 2, 3, 3, 1, 4);
INSERT INTO odontology_patientdentalprocedure (id, created_on, updated_on, dentist_id, patient_tooth_id, procedure_dental_id, procedure_status_id, tooth_division_id) VALUES (8, '2016-02-05 16:23:12.536261-03', '2016-02-05 16:23:12.536289-03', 2, 31, 1, 3, 5);
INSERT INTO odontology_patientdentalprocedure (id, created_on, updated_on, dentist_id, patient_tooth_id, procedure_dental_id, procedure_status_id, tooth_division_id) VALUES (9, '2016-02-05 16:54:27.267988-03', '2016-02-05 16:54:27.268018-03', 2, 28, 2, 1, 4);
INSERT INTO odontology_patientdentalprocedure (id, created_on, updated_on, dentist_id, patient_tooth_id, procedure_dental_id, procedure_status_id, tooth_division_id) VALUES (10, '2016-02-05 16:56:01.572997-03', '2016-02-05 16:56:01.573032-03', 2, 17, 1, 3, 3);
INSERT INTO odontology_patientdentalprocedure (id, created_on, updated_on, dentist_id, patient_tooth_id, procedure_dental_id, procedure_status_id, tooth_division_id) VALUES (5, '2016-02-05 14:06:24.286096-03', '2016-02-05 17:13:08.785635-03', 2, 16, 5, 3, 6);


--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 201
-- Name: odontology_patientdentalprocedure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_patientdentalprocedure_id_seq', 10, true);


--
-- TOC entry 2285 (class 0 OID 35043)
-- Dependencies: 204
-- Data for Name: odontology_patienttooth; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (1, '2016-02-05 14:03:27.602417-03', '2016-02-05 14:03:27.602442-03', 1, 1, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (2, '2016-02-05 14:03:27.641809-03', '2016-02-05 14:03:27.641844-03', 1, 2, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (3, '2016-02-05 14:03:27.682753-03', '2016-02-05 14:03:27.682783-03', 1, 3, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (4, '2016-02-05 14:03:27.690715-03', '2016-02-05 14:03:27.690736-03', 1, 4, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (5, '2016-02-05 14:03:27.699047-03', '2016-02-05 14:03:27.699068-03', 1, 5, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (6, '2016-02-05 14:03:27.707411-03', '2016-02-05 14:03:27.707434-03', 1, 6, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (7, '2016-02-05 14:03:27.715825-03', '2016-02-05 14:03:27.715852-03', 1, 7, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (8, '2016-02-05 14:03:27.724064-03', '2016-02-05 14:03:27.724086-03', 1, 8, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (9, '2016-02-05 14:03:27.732466-03', '2016-02-05 14:03:27.732492-03', 1, 9, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (10, '2016-02-05 14:03:27.740921-03', '2016-02-05 14:03:27.74095-03', 1, 10, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (11, '2016-02-05 14:03:27.749281-03', '2016-02-05 14:03:27.749312-03', 1, 11, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (12, '2016-02-05 14:03:27.757483-03', '2016-02-05 14:03:27.757508-03', 1, 12, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (13, '2016-02-05 14:03:27.765815-03', '2016-02-05 14:03:27.765841-03', 1, 13, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (14, '2016-02-05 14:03:27.774255-03', '2016-02-05 14:03:27.774285-03', 1, 14, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (15, '2016-02-05 14:03:27.782498-03', '2016-02-05 14:03:27.782521-03', 1, 15, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (16, '2016-02-05 14:03:27.790768-03', '2016-02-05 14:03:27.790788-03', 1, 16, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (17, '2016-02-05 14:03:27.799192-03', '2016-02-05 14:03:27.799219-03', 1, 17, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (18, '2016-02-05 14:03:27.807442-03', '2016-02-05 14:03:27.807462-03', 1, 18, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (19, '2016-02-05 14:03:27.815829-03', '2016-02-05 14:03:27.815852-03', 1, 19, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (20, '2016-02-05 14:03:27.824118-03', '2016-02-05 14:03:27.824138-03', 1, 20, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (21, '2016-02-05 14:03:27.83254-03', '2016-02-05 14:03:27.832567-03', 1, 21, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (22, '2016-02-05 14:03:27.84078-03', '2016-02-05 14:03:27.840801-03', 1, 22, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (23, '2016-02-05 14:03:27.84924-03', '2016-02-05 14:03:27.849266-03', 1, 23, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (24, '2016-02-05 14:03:27.857523-03', '2016-02-05 14:03:27.857546-03', 1, 24, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (25, '2016-02-05 14:03:27.865948-03', '2016-02-05 14:03:27.865996-03', 1, 25, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (26, '2016-02-05 14:03:27.874218-03', '2016-02-05 14:03:27.874242-03', 1, 26, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (27, '2016-02-05 14:03:27.882535-03', '2016-02-05 14:03:27.882556-03', 1, 27, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (28, '2016-02-05 14:03:27.890922-03', '2016-02-05 14:03:27.890948-03', 1, 28, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (29, '2016-02-05 14:03:27.899214-03', '2016-02-05 14:03:27.899237-03', 1, 29, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (30, '2016-02-05 14:03:27.907499-03', '2016-02-05 14:03:27.90752-03', 1, 30, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (31, '2016-02-05 14:03:27.915827-03', '2016-02-05 14:03:27.915847-03', 1, 31, 1);
INSERT INTO odontology_patienttooth (id, created_on, updated_on, patient_id, tooth_id, tooth_status_id) VALUES (32, '2016-02-05 14:03:27.924163-03', '2016-02-05 14:03:27.924186-03', 1, 32, 1);


--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 203
-- Name: odontology_patienttooth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_patienttooth_id_seq', 32, true);


--
-- TOC entry 2287 (class 0 OID 35051)
-- Dependencies: 206
-- Data for Name: odontology_proceduredental; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_proceduredental (id, created_on, updated_on, name, description) VALUES (1, '2016-01-28 17:52:58.717679-03', '2016-01-28 17:52:58.717758-03', 'Restaurado', 'Restaurado');
INSERT INTO odontology_proceduredental (id, created_on, updated_on, name, description) VALUES (2, '2016-01-28 17:53:12.066113-03', '2016-01-28 17:53:12.066198-03', 'Cariado', 'Cariado');
INSERT INTO odontology_proceduredental (id, created_on, updated_on, name, description) VALUES (3, '2016-01-28 17:53:12.066113-03', '2016-01-28 17:53:12.066198-03', 'Restauração a ser feita', 'Restauração a ser feita');
INSERT INTO odontology_proceduredental (id, created_on, updated_on, name, description) VALUES (4, '2016-01-28 17:53:12.066113-03', '2016-01-28 17:53:12.066198-03', 'Indicado para extração', 'Indicado para extração');
INSERT INTO odontology_proceduredental (id, created_on, updated_on, name, description) VALUES (5, '2016-01-28 17:53:12.066113-03', '2016-01-28 17:53:12.066198-03', 'Extraído ou ausente', 'Extraído ou ausente');


--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 205
-- Name: odontology_proceduredental_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_proceduredental_id_seq', 1, false);


--
-- TOC entry 2289 (class 0 OID 35059)
-- Dependencies: 208
-- Data for Name: odontology_procedurestatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_procedurestatus (id, created_on, updated_on, name, description) VALUES (1, '2016-01-28 17:51:46.350361-03', '2016-01-28 17:51:46.350424-03', 'A fazer', 'A fazer');
INSERT INTO odontology_procedurestatus (id, created_on, updated_on, name, description) VALUES (2, '2016-01-28 17:52:10.507016-03', '2016-01-28 17:52:10.507115-03', 'Em Andamento', 'Em Andamento');
INSERT INTO odontology_procedurestatus (id, created_on, updated_on, name, description) VALUES (3, '2016-01-28 17:52:19.753971-03', '2016-01-28 17:52:19.754048-03', 'Feito', 'Feito');


--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 207
-- Name: odontology_procedurestatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_procedurestatus_id_seq', 1, false);


--
-- TOC entry 2291 (class 0 OID 35067)
-- Dependencies: 210
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
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 209
-- Name: odontology_tooth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_tooth_id_seq', 1, false);


--
-- TOC entry 2293 (class 0 OID 35075)
-- Dependencies: 212
-- Data for Name: odontology_toothdivision; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_toothdivision (id, created_on, updated_on, name, description) VALUES (1, '2016-01-28 18:30:42.655875-03', '2016-01-28 18:30:42.655982-03', 'FP/FL', 'Face Palatal/Face Lingual');
INSERT INTO odontology_toothdivision (id, created_on, updated_on, name, description) VALUES (2, '2016-01-28 18:30:58.536623-03', '2016-01-28 18:30:58.536716-03', 'FV', 'Face Vestibular');
INSERT INTO odontology_toothdivision (id, created_on, updated_on, name, description) VALUES (3, '2016-01-28 18:31:13.079119-03', '2016-01-28 18:31:13.0792-03', 'FM', 'Face Mesial');
INSERT INTO odontology_toothdivision (id, created_on, updated_on, name, description) VALUES (4, '2016-01-28 18:31:27.32252-03', '2016-01-28 18:31:27.322609-03', 'FD', 'Face Distal');
INSERT INTO odontology_toothdivision (id, created_on, updated_on, name, description) VALUES (5, '2016-01-28 18:31:39.784917-03', '2016-01-28 18:31:39.785039-03', 'FO', 'Face Oclusal');
INSERT INTO odontology_toothdivision (id, created_on, updated_on, name, description) VALUES (6, '2016-01-28 18:31:39.784917-03', '2016-02-05 13:52:40.198341-03', 'DC', 'Dente Completo');


--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 211
-- Name: odontology_toothdivision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_toothdivision_id_seq', 1, false);


--
-- TOC entry 2295 (class 0 OID 35083)
-- Dependencies: 214
-- Data for Name: odontology_toothstatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO odontology_toothstatus (id, created_on, updated_on, name, description) VALUES (1, '2016-01-29 10:28:43.795758-03', '2016-01-29 10:28:43.795825-03', 'Ausente', '');
INSERT INTO odontology_toothstatus (id, created_on, updated_on, name, description) VALUES (2, '2016-01-29 10:28:51.003681-03', '2016-01-29 10:28:51.003761-03', 'Presente', '');


--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 213
-- Name: odontology_toothstatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontology_toothstatus_id_seq', 1, false);


-- Completed on 2016-02-05 17:50:29 BRT

--
-- PostgreSQL database dump complete
--


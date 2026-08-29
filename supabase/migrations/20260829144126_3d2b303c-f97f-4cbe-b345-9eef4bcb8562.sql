INSERT INTO public.levels (id, name, code, "position", created_at, updated_at) VALUES
('c72155c6-4a88-437a-81a5-be7d423c260e','السنة الأولى ثانوي جذع مشترك علوم و تكنولوجيا','1ASS',1,'2026-08-29 08:25:06.067247+00','2026-08-29 08:25:06.067247+00'),
('0ba2ce1f-d3ca-401c-98fa-dae727c4f467','السنة الأولى ثانوي جذع مشترك آداب','1ASL',2,'2026-08-29 08:26:30.014043+00','2026-08-29 08:26:30.014043+00'),
('b43b093d-668e-4e98-a334-f76761f548ba','السنة الثانية ثانوي شعب تسيير آداب و لغات','2ASL',3,'2026-08-29 08:31:13.038555+00','2026-08-29 08:37:07.761972+00'),
('de3b38fd-8654-45c0-aadc-ecdf83bc2a21','السنة الثانية ثانوي شعب علمي و رياضي','2ASS',4,'2026-08-29 08:39:25.998395+00','2026-08-29 08:39:25.998395+00'),
('5e2f95b4-d1fe-4c2c-ac45-726932c571bf','السنة الثالثة من التعليم الثانوي شعب علمي و رياضي','3ASS',5,'2026-08-29 08:29:17.276796+00','2026-08-29 08:37:40.218424+00'),
('fc05b399-430b-48a0-b1e0-08a4c04d8d74','السنة الثالثة ثانوي شعب آداب و لغات','3ASL',6,'2026-08-29 08:33:08.249508+00','2026-08-29 08:37:54.298577+00'),
('4f1ff455-82a9-4ce9-96e3-b3bd936dbac0','السنة الثالثة ثانوي شعب تسيير و إقتصاد','3ASG',7,'2026-08-29 08:36:12.079094+00','2026-08-29 08:38:04.345115+00')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.classes (id, name, code, level_id, capacity, created_at, updated_at) VALUES
('43ab7b73-9f1c-410f-baf2-d751d19981e9','1أ1',NULL,'c72155c6-4a88-437a-81a5-be7d423c260e',1,'2026-08-29 08:40:34.054397+00','2026-08-29 08:40:34.054397+00'),
('26ccaad0-8ede-4f48-91de-e5324219be5a','1ل1',NULL,'0ba2ce1f-d3ca-401c-98fa-dae727c4f467',4,'2026-08-29 08:42:20.644167+00','2026-08-29 08:42:20.644167+00'),
('14d5f05a-ba92-46c7-af70-a59ec8a85dca','2أ1',NULL,'de3b38fd-8654-45c0-aadc-ecdf83bc2a21',2,'2026-08-29 08:41:26.245743+00','2026-08-29 08:44:27.719532+00'),
('a68ff757-9449-4195-b07d-78d3e284d1a8','3أ1',NULL,'5e2f95b4-d1fe-4c2c-ac45-726932c571bf',3,'2026-08-29 08:41:49.370093+00','2026-08-29 08:44:45.622235+00'),
('a353d2ae-9889-49d6-87ff-1a5f0e27fce5','3ت إ1',NULL,'4f1ff455-82a9-4ce9-96e3-b3bd936dbac0',7,'2026-08-29 08:43:49.291381+00','2026-08-29 08:45:00.164865+00'),
('62265b10-a4fc-47c9-ae0c-a259ddf4fc0f','2ل1',NULL,'b43b093d-668e-4e98-a334-f76761f548ba',5,'2026-08-29 08:42:45.224812+00','2026-08-29 08:45:15.021124+00'),
('90458272-66e5-464d-b48a-66f548ff8ff2','3ل1',NULL,'fc05b399-430b-48a0-b1e0-08a4c04d8d74',6,'2026-08-29 08:43:07.18208+00','2026-08-29 08:46:20.194296+00')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.profiles (id, email, space, status, created_at, reviewed_at, full_name, level_id, class_id, updated_at) VALUES
('83161343-9788-4afa-ac87-60793798689f','admanmanel@gmail.com','admin','approved','2026-08-28 17:26:05.24838+00','2026-08-28 17:26:05.24838+00',NULL,NULL,NULL,'2026-08-29 07:59:06.317579+00'),
('abfe0cdf-e97c-4201-a147-9f47c88222c4','admanmanel@zohomail.com','taleem','approved','2026-08-28 17:44:46.801772+00','2026-08-28 18:06:01.253+00',NULL,NULL,NULL,'2026-08-29 07:59:06.317579+00'),
('9c122300-e73c-4f97-821b-d60d1c0a19a1','admanmanel@hotmail.com','talameed','approved','2026-08-28 18:27:39.67506+00','2026-08-29 08:48:02.978+00','Adman','5e2f95b4-d1fe-4c2c-ac45-726932c571bf','a68ff757-9449-4195-b07d-78d3e284d1a8','2026-08-29 08:47:10.522396+00')
ON CONFLICT (id) DO UPDATE SET
  email = EXCLUDED.email,
  space = EXCLUDED.space,
  status = EXCLUDED.status,
  reviewed_at = EXCLUDED.reviewed_at,
  full_name = EXCLUDED.full_name,
  level_id = EXCLUDED.level_id,
  class_id = EXCLUDED.class_id;

INSERT INTO public.user_roles (id, user_id, role) VALUES
('32d16fa6-ec95-4db3-9b39-f1603248dea5','83161343-9788-4afa-ac87-60793798689f','super_admin')
ON CONFLICT DO NOTHING;
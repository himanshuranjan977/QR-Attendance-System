BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "FacultyView_branch" (
	"id"	integer NOT NULL,
	"branch"	varchar(10) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "FacultyView_section" (
	"id"	integer NOT NULL,
	"section"	varchar(2) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "FacultyView_student" (
	"s_roll"	varchar(20) NOT NULL,
	"s_branch_id"	bigint NOT NULL,
	"s_section_id"	bigint NOT NULL,
	"s_fname"	varchar(20) NOT NULL,
	"s_lname"	varchar(20) NOT NULL,
	"s_year_id"	bigint NOT NULL,
	PRIMARY KEY("s_roll"),
	FOREIGN KEY("s_branch_id") REFERENCES "FacultyView_branch"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("s_section_id") REFERENCES "FacultyView_section"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("s_year_id") REFERENCES "FacultyView_year"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "FacultyView_year" (
	"id"	integer NOT NULL,
	"year"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
INSERT INTO "FacultyView_branch" VALUES (1,'CSE');
INSERT INTO "FacultyView_branch" VALUES (2,'DS');
INSERT INTO "FacultyView_section" VALUES (1,'A');
INSERT INTO "FacultyView_section" VALUES (2,'B');
INSERT INTO "FacultyView_student" VALUES ('10300320070',1,2,'Himanshu','Ranjan',3);
INSERT INTO "FacultyView_student" VALUES ('2100300100119',2,1,'Nishant','Mishra',4);
INSERT INTO "FacultyView_student" VALUES ('10300320089',1,1,'Mrinal','kumar',2);
INSERT INTO "FacultyView_student" VALUES ('10300320137',1,2,'sanjeev','Ranjan',3);
INSERT INTO "FacultyView_student" VALUES ('10300320121',2,2,'Ravi','Ranjan',1);
INSERT INTO "FacultyView_year" VALUES (1,1);
INSERT INTO "FacultyView_year" VALUES (2,2);
INSERT INTO "FacultyView_year" VALUES (3,3);
INSERT INTO "FacultyView_year" VALUES (4,4);
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_student','Can add student');
INSERT INTO "auth_permission" VALUES (26,7,'change_student','Can change student');
INSERT INTO "auth_permission" VALUES (27,7,'delete_student','Can delete student');
INSERT INTO "auth_permission" VALUES (28,7,'view_student','Can view student');
INSERT INTO "auth_permission" VALUES (29,8,'add_branch','Can add branch');
INSERT INTO "auth_permission" VALUES (30,8,'change_branch','Can change branch');
INSERT INTO "auth_permission" VALUES (31,8,'delete_branch','Can delete branch');
INSERT INTO "auth_permission" VALUES (32,8,'view_branch','Can view branch');
INSERT INTO "auth_permission" VALUES (33,9,'add_section','Can add section');
INSERT INTO "auth_permission" VALUES (34,9,'change_section','Can change section');
INSERT INTO "auth_permission" VALUES (35,9,'delete_section','Can delete section');
INSERT INTO "auth_permission" VALUES (36,9,'view_section','Can view section');
INSERT INTO "auth_permission" VALUES (37,10,'add_year','Can add year');
INSERT INTO "auth_permission" VALUES (38,10,'change_year','Can change year');
INSERT INTO "auth_permission" VALUES (39,10,'delete_year','Can delete year');
INSERT INTO "auth_permission" VALUES (40,10,'view_year','Can view year');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$600000$0eESuSexGvZn6gXeCO0Set$HvNG/45VfDPz7eVr1D8FveS9lTBkzzxYnP0e1zhWPIg=','2023-11-12 08:06:25.812194',1,'test','','test@test.com',1,1,'2023-11-12 08:06:01.355248','');
INSERT INTO "django_admin_log" VALUES (1,'1','CSE',1,'[{"added": {}}]',8,1,'2023-11-12 08:07:12.118073');
INSERT INTO "django_admin_log" VALUES (2,'1','A',1,'[{"added": {}}]',9,1,'2023-11-12 08:07:17.346878');
INSERT INTO "django_admin_log" VALUES (3,'2','B',1,'[{"added": {}}]',9,1,'2023-11-12 08:07:20.629841');
INSERT INTO "django_admin_log" VALUES (4,'2','DS',1,'[{"added": {}}]',8,1,'2023-11-12 08:07:24.956421');
INSERT INTO "django_admin_log" VALUES (5,'1','1',1,'[{"added": {}}]',10,1,'2023-11-12 08:08:06.280778');
INSERT INTO "django_admin_log" VALUES (6,'2','2',1,'[{"added": {}}]',10,1,'2023-11-12 08:08:08.988245');
INSERT INTO "django_admin_log" VALUES (7,'3','3',1,'[{"added": {}}]',10,1,'2023-11-12 08:08:12.199078');
INSERT INTO "django_admin_log" VALUES (8,'4','4',1,'[{"added": {}}]',10,1,'2023-11-12 08:08:14.261592');
INSERT INTO "django_admin_log" VALUES (9,'2100300100111','Mohd Aqib Farooqi - 2100300100111 - CSE(3B)',1,'[{"added": {}}]',7,1,'2023-11-12 08:08:25.969666');
INSERT INTO "django_admin_log" VALUES (10,'2100300100111','Mohd Aqib Farooqi - 2100300100111 - CSE(3B)',2,'[]',7,1,'2023-11-12 08:08:34.497459');
INSERT INTO "django_admin_log" VALUES (11,'2100300100119','Shantanu Pant - 2100300100119 - DS(4A)',1,'[{"added": {}}]',7,1,'2023-11-12 08:08:45.703668');
INSERT INTO "django_admin_log" VALUES (12,'2100300100117','Amit Kunwar - 2100300100117 - CSE(2A)',1,'[{"added": {}}]',7,1,'2023-11-12 08:08:58.887551');
INSERT INTO "django_admin_log" VALUES (13,'2100300100110','Mohd Azeem - 2100300100110 - CSE(3B)',1,'[{"added": {}}]',7,1,'2023-11-12 08:09:12.623824');
INSERT INTO "django_admin_log" VALUES (14,'2100300100120','Dheeraj Jha - 2100300100120 - DS(1B)',1,'[{"added": {}}]',7,1,'2023-11-12 08:09:33.169766');
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'FacultyView','student');
INSERT INTO "django_content_type" VALUES (8,'FacultyView','branch');
INSERT INTO "django_content_type" VALUES (9,'FacultyView','section');
INSERT INTO "django_content_type" VALUES (10,'FacultyView','year');
INSERT INTO "django_migrations" VALUES (1,'FacultyView','0001_initial','2023-11-12 08:04:59.051547');
INSERT INTO "django_migrations" VALUES (2,'FacultyView','0002_remove_student_s_name_student_s_fname_and_more','2023-11-12 08:04:59.064607');
INSERT INTO "django_migrations" VALUES (3,'FacultyView','0003_student_s_year','2023-11-12 08:04:59.072709');
INSERT INTO "django_migrations" VALUES (4,'FacultyView','0004_branch_section_year_alter_student_s_branch_and_more','2023-11-12 08:04:59.089259');
INSERT INTO "django_migrations" VALUES (5,'contenttypes','0001_initial','2023-11-12 08:04:59.097901');
INSERT INTO "django_migrations" VALUES (6,'auth','0001_initial','2023-11-12 08:04:59.116873');
INSERT INTO "django_migrations" VALUES (7,'admin','0001_initial','2023-11-12 08:04:59.131275');
INSERT INTO "django_migrations" VALUES (8,'admin','0002_logentry_remove_auto_add','2023-11-12 08:04:59.145493');
INSERT INTO "django_migrations" VALUES (9,'admin','0003_logentry_add_action_flag_choices','2023-11-12 08:04:59.154262');
INSERT INTO "django_migrations" VALUES (10,'contenttypes','0002_remove_content_type_name','2023-11-12 08:04:59.170455');
INSERT INTO "django_migrations" VALUES (11,'auth','0002_alter_permission_name_max_length','2023-11-12 08:04:59.183794');
INSERT INTO "django_migrations" VALUES (12,'auth','0003_alter_user_email_max_length','2023-11-12 08:04:59.195603');
INSERT INTO "django_migrations" VALUES (13,'auth','0004_alter_user_username_opts','2023-11-12 08:04:59.204618');
INSERT INTO "django_migrations" VALUES (14,'auth','0005_alter_user_last_login_null','2023-11-12 08:04:59.215602');
INSERT INTO "django_migrations" VALUES (15,'auth','0006_require_contenttypes_0002','2023-11-12 08:04:59.221957');
INSERT INTO "django_migrations" VALUES (16,'auth','0007_alter_validators_add_error_messages','2023-11-12 08:04:59.233066');
INSERT INTO "django_migrations" VALUES (17,'auth','0008_alter_user_username_max_length','2023-11-12 08:04:59.243860');
INSERT INTO "django_migrations" VALUES (18,'auth','0009_alter_user_last_name_max_length','2023-11-12 08:04:59.253408');
INSERT INTO "django_migrations" VALUES (19,'auth','0010_alter_group_name_max_length','2023-11-12 08:04:59.264406');
INSERT INTO "django_migrations" VALUES (20,'auth','0011_update_proxy_permissions','2023-11-12 08:04:59.272680');
INSERT INTO "django_migrations" VALUES (21,'auth','0012_alter_user_first_name_max_length','2023-11-12 08:04:59.283663');
INSERT INTO "django_migrations" VALUES (22,'sessions','0001_initial','2023-11-12 08:04:59.294041');
INSERT INTO "django_session" VALUES ('7qez46dygvnugu9da778x0cwftce78ub','.eJxVjDsOwyAQBe9CHSGw-aZM7zOgXRaCkwgkY1dR7h4huUjaNzPvzQIcewlHT1tYiV2ZZJffDSE-Ux2AHlDvjcdW921FPhR-0s6XRul1O92_gwK9jNpbnIGkyDhBJIveWKGVIkGGECO4jKS0l2a2TpnJOEizNSB09qgtss8X_iU4OA:1r25U9:CCB_Rr6lm6Ni8TwzC7icNSb0Vy3v9wbC7WshFe0YSjU','2023-11-26 08:06:25.817545');
CREATE INDEX IF NOT EXISTS "FacultyView_student_s_branch_id_6fcfb73b" ON "FacultyView_student" (
	"s_branch_id"
);
CREATE INDEX IF NOT EXISTS "FacultyView_student_s_section_id_da1d0e0d" ON "FacultyView_student" (
	"s_section_id"
);
CREATE INDEX IF NOT EXISTS "FacultyView_student_s_year_id_6e7d76ac" ON "FacultyView_student" (
	"s_year_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
COMMIT;

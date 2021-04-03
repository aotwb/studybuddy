CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "student_name" varchar,
  "username" varchar,
  "password" varchar,
  "email" varchar,
  "profile_picture" varbinary,
  "created_at" timestamp
);

CREATE TABLE "groups" (
  "id" int PRIMARY KEY,
  "leader_id" int,
  "group_name" varchar NOT NULL,
  "class" varchar,
  "status" enum
);

CREATE TABLE "classes" (
  "class_name" varchar,
  "crn" varchar PRIMARY KEY
);

CREATE TABLE "members" (
  "student_id" int,
  "group_id" int,
  "quantity" int DEFAULT 1,
  PRIMARY KEY ("student_id", "group_id")
);

CREATE TABLE "i_preferences" (
  "user_id" int PRIMARY KEY,
  "preferences" enum
);

CREATE TABLE "g_preferences" (
  "group_id" int PRIMARY KEY,
  "preferences" enum
);

ALTER TABLE "groups" ADD FOREIGN KEY ("leader_id") REFERENCES "members" ("student_id");

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "i_preferences" ("user_id");

ALTER TABLE "groups" ADD FOREIGN KEY ("id") REFERENCES "g_preferences" ("group_id");

ALTER TABLE "members" ADD FOREIGN KEY ("student_id") REFERENCES "users" ("id");

ALTER TABLE "members" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("id");

ALTER TABLE "classes" ADD FOREIGN KEY ("crn") REFERENCES "groups" ("class");


CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `student_name` varchar(255),
  `username` varchar(255),
  `password` varchar(255),
  `email` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `groups` (
  `id` int PRIMARY KEY,
  `group_name` varchar(255),
  `class` varchar(255),
  `status` enum
);

CREATE TABLE `classes` (
  `class_name` varchar(255),
  `crn` varchar(255)
);

CREATE TABLE `members` (
  `student_id` int,
  `group_id` int,
  `quantity` int DEFAULT 1
);

CREATE TABLE `i_preferences` (
  `user_id` int PRIMARY KEY,
  `preferences` enum
);

CREATE TABLE `g_preferences` (
  `group_id` int PRIMARY KEY,
  `preferences` enum
);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `i_preferences` (`user_id`);

ALTER TABLE `groups` ADD FOREIGN KEY (`id`) REFERENCES `g_preferences` (`group_id`);

ALTER TABLE `members` ADD FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

ALTER TABLE `members` ADD FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`);

ALTER TABLE `classes` ADD FOREIGN KEY (`crn`) REFERENCES `groups` (`class`);

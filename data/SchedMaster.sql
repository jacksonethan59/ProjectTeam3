DROP DATABASE IF EXISTS schedmaster;

CREATE DATABASE schedmaster;

USE schedmaster;

CREATE TABLE `courses` (
  `id` varchar(255) PRIMARY KEY,
  `title` varchar(255),
  `subject` varchar(255),
  `subject_abbr` varchar(255),
  `course_number` varchar(255),
  `credit_hours` int
);

CREATE TABLE `prerequisites` (
  `course_id` varchar(255),
  `prereq_id` varchar(255),
  `min_grade` varchar(255)
);

CREATE TABLE `sections` (
  `crn` int PRIMARY KEY,
  `course_id` varchar(255),
  `section_number` int,
  `instructor` varchar(255),
  `campus` varchar(255),
  `location` varchar(255),
  `meeting_time_start` time,
  `meeting_time_end` time,
  `section_begin_date` date,
  `section_end_date` date,
  `days` varchar(255),
  `section_capacity` int,
  `section_registered` int,
  `attributes` text
);

CREATE TABLE `students` (
  `id` varchar(255) PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `major` varchar(255),
  `required_hours` int
);

CREATE TABLE `course_registrations` (
  `student_id` varchar(255),
  `crn` int,
  `semester` varchar(255),
  `grade_received` float
);

CREATE TABLE `users` (
  `user_id` varchar(255) PRIMARY KEY,
  `password` varchar(255)
);

CREATE TABLE `majors` (
  `id` varchar(255) PRIMARY KEY,
  `subject` varchar(255)
);

CREATE TABLE `major_course_plans` (
  `major_id` varchar(255),
  `course_id` varchar(255),
  `min_grade` varchar(255)
);

ALTER TABLE `prerequisites` ADD FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

ALTER TABLE `prerequisites` ADD FOREIGN KEY (`prereq_id`) REFERENCES `courses` (`id`);

ALTER TABLE `sections` ADD FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

ALTER TABLE `students` ADD FOREIGN KEY (`id`) REFERENCES `users` (`user_id`);

ALTER TABLE `students` ADD FOREIGN KEY (`major`) REFERENCES `majors` (`id`);

ALTER TABLE `course_registrations` ADD FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

ALTER TABLE `course_registrations` ADD FOREIGN KEY (`crn`) REFERENCES `sections` (`crn`);

ALTER TABLE `major_course_plans` ADD FOREIGN KEY (`major_id`) REFERENCES `majors` (`id`);

ALTER TABLE `major_course_plans` ADD FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

-- Test user data
INSERT INTO `majors` VALUES ("CPSC", "Computer Science");
INSERT INTO `users` VALUES ("aaa111", "$2b$12$IMuOiATuMfeMgt6BQ3WYr.As27eE5NwHrOTHynJTTFaPOGv3aFBwO");
INSERT INTO `students` VALUES ("aaa111", "John", "Doe", "CPSC", 120);


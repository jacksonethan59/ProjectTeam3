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
  `prereq_id` varchar(255)
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

ALTER TABLE `prerequisites` ADD FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

ALTER TABLE `prerequisites` ADD FOREIGN KEY (`prereq_id`) REFERENCES `courses` (`id`);

ALTER TABLE `sections` ADD FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

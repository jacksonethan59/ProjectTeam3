
DROP TABLE IF EXISTS `student`;


CREATE TABLE `student` (
  `NAME` varchar(30) DEFAULT NULL,
  `StudentID` varchar(100) DEFAULT NULL,
  `Major` varchar(100) DEFAULT NULL,
  `Minor` varchar(100) DEFAULT NULL,
  `Completed Courses` varchar(100) DEFAULT NULL,
  `CompletedHours` int(200) DEFAULT NULL,
  `Remaining Hours` int(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



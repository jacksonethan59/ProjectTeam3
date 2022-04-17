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






SET AUTOCOMMIT=0;

INSERT INTO schedmaster.users (user_id,password) VALUES
('GAU407','LDIVNVINWF5664'),
('DGU283','PPQWULTNQF5967'),
('UHS646','VPOXZWEMKB9353'),
('HNQ259','PCWCMVMZHB4219'),
('WVH640','PEGHAPJPWS7307'),
('VUF221','IKHBOUUHGO4301'),
('UKY489','TDUGLMQBDZ7351'),
('YQN143','VHIOYLCHXM1641'),
('ARO779','RWWJZDQTUY8569'),
('DBY751','VWACUAKDVI8733'),
('UIZ628','UIKZSHACDY4032'),
('RAU803','ZGGPWNZZFX2256'),
('LYK163','UPRHYTLBTN5209'),
('UFJ848','BPBDYHPKVT7806'),
('PWE910','TRCWIGIMDU6606'),
('HPD240','AEVTHWDENS6201'),
('QHQ782','XBEAOMSZFG6133'),
('FEK152','YESSQRQLLW9123'),
('KFI198','TXCSJNDZKO6327'),
('ZFP852','KYXYGLYNIF9318'),
('LMG987','XCEUFGUESK7997'),
('MEF478','YFYRXJJKSP1649'),
('VOX724','VBGSJVUGFC4899'),
('CVQ598','EDVFBPTABN6757'),
('MKC136','VYCQFSNDPW2960'),
('FVG174','WDSYNYVQXB3780'),
('KAO433','TSKQTCCLHZ6886'),
('PML282','MNAPCBQZBS7925'),
('HXM987','LNDZETAGXH2503'),
('VRQ824','PSOSJXASWR4787'),
('VUR332','QVSVZILLTF3707'),
('GPF865','EPCRVZGNAN2647'),
('VAN280','UALPOMFOFM8108'),
('GFI193','GZFLQDKQUR8674'),
('YLG206','WYXETRXDTG9203'),
('TPV107','AOTPYIGJVY7087'),
('IAL910','VGOXCPIFAC3059'),
('JDD472','YFBRUDSBJF7142'),
('KAC376','VBPHKJQKQU4080'),
('ZID345','ILKFVSZQIA4418'),
('DTW697','RSRYRUVBMO1465'),
('XEX906','WTLTLUWCGC6478'),
('PGV156','YRCYXCWLFZ5042'),
('CAL322','QTCZXSZTDT4995'),
('AEP337','IQXTWOBHWF1288'),
('XSA752','VYACJCMIQF5858'),
('ESD197','UTITMWVATB1961'),
('JYI766','RZGNOOPNKI6616'),
('WMK767','EABDJEXUNR4371'),
('CMP414','HAHYFYTZTD5629'),
('QDO404','NSVHMQXGYB9065'),
('CYU737','OVVJELSXHB7487'),
('SUP729','FREBXYORXM9239'),
('WFW973','MWMHWIDUWX3210'),
('NGV591','VJTRFRTHDT6443'),
('QXC805','RCCRVDEUWE5443'),
('CZE889','HWGVKTCMOU3358'),
('OVU670','KCXRBRGXHW4582'),
('TRA175','STVPCEICYU9706'),
('EEH903','GYZEZSKHJV9806'),
('ZPH809','ELNZBRIQUK2645'),
('SXM712','ZPTMLKVVOK8715'),
('DHP885','UGVVZPHDOT1444'),
('NJP820','ZXUYEIRZSW3501'),
('PWG919','SEMJHMXFPU6442'),
('OER408','LSBWIZCFIS3538'),
('BVN318','ENMOFMDIEJ4493'),
('VNG359','HNKEPAFMXH9452'),
('JGT245','BQUTCBVNRJ6130'),
('YSJ937','UXJIUNVPCK8371'),
('LBI129','VOPLTXXBLY4530'),
('ZLS440','QBHYTPLDBN9451'),
('HRW465','CWKVTMYPBC6651'),
('SLT193','YAIMCQRPTL4096'),
('QRS729','FXIADNWAJR6347'),
('SPI182','PQHZEJCARY2324'),
('IEM139','QTRLLMXNQJ7171'),
('FXR502','EWHZFKQYOU8542'),
('LWC162','AAEUCIAWDH9327'),
('IYD985','LQDIFERDDR3157'),
('XKX863','FGZALDBNJL2487'),
('KDR718','UOIWKKVTEE3350'),
('MCJ704','CTDPEDDWQP6199'),
('PXS560','AIZPXFPBIJ8375'),
('VNI558','BWMAOONFZB3013'),
('XAI979','XVRISRFQDC4983'),
('ARD496','LCCHFHLAYO4600'),
('UZE404','WJFFBVRCSC6963'),
('GYQ190','XQBRLDTJOG2659'),
('RBV107','WTTZQMILQL6691'),
('NAI261','CJLWCHMZBI6283'),
('RFM971','FYUUXEFIBA6258'),
('KTF770','HJTHJMGCBB1367'),
('OJK973','LFXXWEMOXT1713'),
('GQY835','BZUAECHIMO1425'),
('FFM907','FRRSLLFRSS3446'),
('CPX207','LWQVOETRJG4869'),
('XEQ219','KVZBTXSROF1625'),
('ETQ254','EJYXNFPZWI2178'),
('NFH539','JKZOAXLCBU5083');

COMMIT;use schedmaster;

SET AUTOCOMMIT=0;

INSERT INTO schedmaster.students (id,first_name,last_name,major,required_hours) VALUES
('GAU407','Amanada','Gardiner','CPSC','120'),
('DGU283','Raymond','Gruber','CPSC','120'),
('UHS646','Joseph','Wofford','CPSC','120'),
('HNQ259','Fred','Swanson','CPSC','120'),
('WVH640','Roger','Smith','CPSC','120'),
('VUF221','Fred','Gardiner','CPSC','120'),
('UKY489','Erin','Olvera','CPSC','120'),
('YQN143','Conrad','Hannon','CPSC','120'),
('ARO779','Patricia','Gardiner','CPSC','120'),
('DBY751','Jessee','Shoemaker','CPSC','120'),
('UIZ628','Raymond','Oglesby','CPSC','120'),
('RAU803','Holly','Olvera','CPSC','120'),
('LYK163','Chris','Duggan','CPSC','120'),
('UFJ848','Joseph','Hannon','CPSC','120'),
('PWE910','David','Shoemaker','CPSC','120'),
('HPD240','James','Vest','CPSC','120'),
('QHQ782','Chris','Chisholm','CPSC','120'),
('FEK152','Claire','Smith','CPSC','120'),
('KFI198','Claire','Gardiner','CPSC','120'),
('ZFP852','Robert','McAlister','CPSC','120'),
('LMG987','Craig','Grey','CPSC','120'),
('MEF478','Sharon','McAlister','CPSC','120'),
('VOX724','Jean','Hannon','CPSC','120'),
('CVQ598','Sharon','Oglesby','CPSC','120'),
('MKC136','Samantha','Chisholm','CPSC','120'),
('FVG174','Sally','Lombardi','CPSC','120'),
('KAO433','Raymond','Smith','CPSC','120'),
('PML282','Leslie','Pitt','CPSC','120'),
('HXM987','Erin','Burleson','CPSC','120'),
('VRQ824','Joseph','Vest','CPSC','120'),
('VUR332','Sally','Larue','CPSC','120'),
('GPF865','Alicia','Chisholm','CPSC','120'),
('VAN280','Jean','Lombardi','CPSC','120'),
('GFI193','Holly','Oglesby','CPSC','120'),
('YLG206','Samantha','Wofford','CPSC','120'),
('TPV107','Alicia','Larue','CPSC','120'),
('IAL910','Jessee','Eggleston','CPSC','120'),
('JDD472','Patricia','Eggleston','CPSC','120'),
('KAC376','Holly','Swanson','CPSC','120'),
('ZID345','Robert','Gardiner','CPSC','120'),
('DTW697','Leslie','Lombardi','CPSC','120'),
('XEX906','Erin','Burleson','CPSC','120'),
('PGV156','Jessee','Pitt','CPSC','120'),
('CAL322','Raymond','Gafney','CPSC','120'),
('AEP337','David','Hannon','CPSC','120'),
('XSA752','Raymond','Shoemaker','CPSC','120'),
('ESD197','Alicia','Oglesby','CPSC','120'),
('JYI766','Sharon','Shoemaker','CPSC','120'),
('WMK767','Joseph','McCarter','CPSC','120'),
('CMP414','Erin','Hannon','CPSC','120'),
('QDO404','Allison','Oglesby','CPSC','120'),
('CYU737','Russell','Pitt','CPSC','120'),
('SUP729','Patricia','Cromwell','CPSC','120'),
('WFW973','Patricia','Pitt','CPSC','120'),
('NGV591','Russell','Olvera','CPSC','120'),
('QXC805','Robert','Smith','CPSC','120'),
('CZE889','Russell','Larue','CPSC','120'),
('OVU670','Leslie','Lombardi','CPSC','120'),
('TRA175','Allison','Eggleston','CPSC','120'),
('EEH903','Jessee','Larue','CPSC','120'),
('ZPH809','Robert','Gunderson','CPSC','120'),
('SXM712','Craig','Gardiner','CPSC','120'),
('DHP885','James','Swanson','CPSC','120'),
('NJP820','Sally','Gruber','CPSC','120'),
('PWG919','Conrad','Gruber','CPSC','120'),
('OER408','Craig','McAlister','CPSC','120'),
('BVN318','Sally','Burleson','CPSC','120'),
('VNG359','Leslie','McCarter','CPSC','120'),
('JGT245','Claire','Olvera','CPSC','120'),
('YSJ937','Erin','Banda','CPSC','120'),
('LBI129','Claire','McAlister','CPSC','120'),
('ZLS440','Sharon','Gruber','CPSC','120'),
('HRW465','James','Banda','CPSC','120'),
('SLT193','Russell','Duggan','CPSC','120'),
('QRS729','Amanada','Larue','CPSC','120'),
('SPI182','Craig','Larue','CPSC','120'),
('IEM139','Samantha','Eggleston','CPSC','120'),
('FXR502','Holly','Wofford','CPSC','120'),
('LWC162','Sally','Lumpkin','CPSC','120'),
('IYD985','Raymond','Banda','CPSC','120'),
('XKX863','Holly','Hannon','CPSC','120'),
('KDR718','James','Gafney','CPSC','120'),
('MCJ704','Amanada','Duggan','CPSC','120'),
('PXS560','Claire','Smith','CPSC','120'),
('VNI558','Patricia','Eggleston','CPSC','120'),
('XAI979','Allison','Gunderson','CPSC','120'),
('ARD496','Holly','Vest','CPSC','120'),
('UZE404','Robert','Pitt','CPSC','120'),
('GYQ190','Amanada','Olvera','CPSC','120'),
('RBV107','Jessee','Pitt','CPSC','120'),
('NAI261','Amanada','Gunderson','CPSC','120'),
('RFM971','Sharon','Oglesby','CPSC','120'),
('KTF770','David','Eggleston','CPSC','120'),
('OJK973','Patricia','Swanson','CPSC','120'),
('GQY835','Joseph','Burleson','CPSC','120'),
('FFM907','Joseph','Oglesby','CPSC','120'),
('CPX207','Jean','Wofford','CPSC','120'),
('XEQ219','Robert','Gardiner','CPSC','120'),
('ETQ254','Conrad','Vest','CPSC','120'),
('NFH539','Holly','McAlister','CPSC','120');

COMMIT;





use schedmaster;

SET AUTOCOMMIT=0;

INSERT INTO schedmaster.courses (id,title,subject,subject_abbr,course_number, credit_hours) VALUES
('CPSC1100','Introduction to Java','Computer Science','CPSC','1100',3),
('CPSC2100','Data Types and Algorithms','Computer Science','CPSC','2100',3),
('CPSC3200','Algorithm Analysis','Computer Science','CPSC','3200',3),
('CPSC3500','Data and Cybersecurity','Computer Science','CPSC','3500',3),
('CPSC4200','Survey of Programming Languages','Computer Science','CPSC','4200',3),
('CPSC4500','Senior Capstone','Computer Science','CPSC','4500',3);





COMMIT;




use schedmaster;

SET AUTOCOMMIT=0;

INSERT INTO schedmaster.prerequisites (course_id, prereq_id, min_grade) VALUES
('CPSC2100','CPSC1100','C'),

('CPSC3200','CPSC2100','C'),

('CPSC3500','CPSC2100','C'),

('CPSC4200','CPSC3200','C'),
('CPSC4200','CPSC3500','C'),

('CPSC4500','CPSC4200','C');





COMMIT;




use schedmaster;

SET AUTOCOMMIT=0;

INSERT INTO schedmaster.major_course_plans (major_id, course_id, min_grade) VALUES
('CPSC','CPSC1100','C'),
('CPSC','CPSC2100','C'),
('CPSC','CPSC3200','C'),
('CPSC','CPSC3500','C'),
('CPSC','CPSC4200','C'),
('CPSC','CPSC4500','C');





COMMIT;



use schedmaster;

SET AUTOCOMMIT=0;

INSERT INTO schedmaster.sections (crn, course_id, section_number, instructor, campus, location, meeting_time_start, meeting_time_end, section_begin_date, section_end_date, days, section_capacity, section_registered, attributes) VALUES

(2001,'CPSC1100','1','TBD','UTC', 'EMCS', '08:00:00.00','09:00:00.00','2022-08-10','2022-12-10', 'MWF', 30, 0, ''),

(2002,'CPSC2100','1','TBD','UTC', 'EMCS', '10:00:00.00','11:00:00.00','2022-08-10','2022-12-10', 'MWF', 30, 0, ''),

(2003,'CPSC3200','1','TBD','UTC', 'EMCS', '08:00:00.00','09:00:00.00','2022-08-10','2022-12-10', 'TR', 30, 0, ''),

(2004,'CPSC3500','1','TBD','UTC', 'EMCS', '12:00:00.00','13:00:00.00','2022-08-10','2022-12-10', 'MWF', 30, 0, ''),

(2005,'CPSC4200','1','TBD','UTC', 'EMCS', '12:00:00.00','13:00:00.00','2022-08-10','2022-12-10', 'TR', 30, 0, ''),

(2006,'CPSC4500','1','TBD','UTC', 'EMCS', '15:00:00.00','16:30:00.00','2022-08-10','2022-12-10', 'TR', 30, 0, '');




COMMIT;







use schedmaster;

SET AUTOCOMMIT=0;

INSERT INTO schedmaster.course_registrations (student_id, crn,semester,grade_received) VALUES
('AEP337',2001,'FALL2022',90),

('ARD496',2002,'FALL2022',95),

('JYI766',2003,'FALL2022',70),

('IYD985',2004,'SPRING2022',60),

('FVG174',2005,'FALL2022',80),

('MCJ704',2006,'FALL2021',91);


COMMIT;
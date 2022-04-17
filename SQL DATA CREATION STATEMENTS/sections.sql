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
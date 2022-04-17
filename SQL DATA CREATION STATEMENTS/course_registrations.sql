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
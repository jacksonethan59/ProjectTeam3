use schedmaster;

SET AUTOCOMMIT=0;

INSERT INTO schedmaster.course_registrations (student_id, crn,semester,grade_received) VALUES
('AEP337',20010,'FALL2022',90),

('ARD496',20020,'FALL2022',95),

('JYI766',20032,'FALL2022',70),

('IYD985',20040,'SPRING2022',60),

('FVG174',20053,'FALL2022',80),

('MCJ704',20060,'FALL2021',91);


COMMIT;

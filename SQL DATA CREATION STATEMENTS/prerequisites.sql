use schedmaster;

SET AUTOCOMMIT=0;

INSERT INTO schedmaster.prerequisites (course_id, prereq_id, min_grade) VALUES
('CPSC2100','CPSC1100','C'),

('CPSC3200','CPSC2100','C'),

('CPSC3600','CPSC2100','C'),

('CPSC4240','CPSC3200','C'),
('CPSC4240','CPSC3600','C'),

('CPSC4600','CPSC4240','C');





COMMIT;

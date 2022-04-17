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
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
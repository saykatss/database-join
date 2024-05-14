CREATE DATABASE joining;
USE DATABASE joining;
-- Sample tables
CREATE TABLE student(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(40),
    mobile VARCHAR(11)
);


INSERT INTO student (NAME,mobile) VALUES('AAAA','01222'),
('BBB','0133333'),
('CCCC','01444'),
('DDDD','01555'),
('EEEEEEEE','016666');

SELECT * FROM student;

CREATE TABLE student_info(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    st_id INT NOT NULL,
    address VARCHAR(40),
    batch VARCHAR(11),
    FOREIGN KEY (st_id) REFERENCES student(id)
);


INSERT INTO student_info (st_id,address,batch)
VALUES(1,'ADD1','56 A'),
(3,'ADD2','56 A'),
(5,'ADD3','56 B');

SELECT * FROM student_info;

SELECT * FROM  student,student_info  
WHERE student.id=student_info.st_id;

SELECT student.NAME,student_info.address FROM  
student,student_info  
WHERE student.id=student_info.st_id;


SELECT t1.NAME,t2.address FROM  
student AS t1,student_info AS t2  
WHERE t1.id=t2.st_id;


-- INNER JOIN

SELECT t1.*,t2.* FROM  
student AS t1 INNER JOIN student_info AS t2  
ON t1.id=t2.st_id;

-- LEFT JOIN

SELECT t1.*,t2.* FROM  
student AS t1 LEFT JOIN student_info AS t2  
ON t1.id=t2.st_id;


-- RIGHT JOIN

SELECT t1.*,t2.* FROM  
student AS t1 RIGHT JOIN student_info AS t2  
ON t1.id=t2.st_id;


SELECT t1.*,t2.* FROM  
student_info AS t2 RIGHT JOIN student AS t1  
ON t1.id=t2.st_id;


-- FULL JOIN

SELECT t1.*,t2.* FROM  
student AS t1 FULL OUTER JOIN student_info AS t2  
ON t1.id=t2.st_id WHERE t1.id < 3;


SELECT * FROM  student,student_info,table_3  
WHERE student.id=student_info.st_id
AND student.id=table_3.st_id;
CREATE TABLE student_names(
    student_id INT,
    name VARCHAR(50)
);

-- Insert the records
INSERT INTO student_names (student_id, name) VALUES
(1, 'RAM'),
(2, 'ROBERT'),
(3, 'ROHIM'),
(4, 'RAM'),
(5, 'ROBERT');


SELECT * FROM student_names

--Q: Get the count of distint student that are not unique 


SELECT name, COUNT(student_id)
FROM student_names
GROUP BY 1
HAVING(COUNT(student_id)) <=1 





CREATE TABLE employees2 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(255),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees2(emp_id)
);


-- Inserting records into the employees table
INSERT INTO employees2 (emp_id, emp_name, manager_id) VALUES
(1, 'John Doe', NULL),           -- John Doe is the manager
(2, 'Jane Smith', 1),            -- Jane Smith reports to John Doe
(3, 'Alice Johnson', 1),         -- Alice Johnson reports to John Doe
(4, 'Bob Williams', 2),          -- Bob Williams reports to Jane Smith
(5, 'Charlie Brown', 2),         -- Charlie Brown reports to Jane Smith
(6, 'David Lee', 3),             -- David Lee reports to Alice Johnson
(7, 'Emily Davis', 3),           -- Emily Davis reports to Alice Johnson
(8, 'Fiona Clark', 4),           -- Fiona Clark reports to Bob Williams
(9, 'George Turner', 4),         -- George Turner reports to Bob Williams
(10, 'Hannah Baker', 5),         -- Hannah Baker reports to Charlie Brown
(11, 'Isaac White', 5),          -- Isaac White reports to Charlie Brown
(12, 'Jessica Adams', 6),        -- Jessica Adams reports to David Lee
(13, 'Kevin Harris', 6);         -- Kevin Harris reports to David Lee

SELECT * FROM employees2

--Question: Write a SQL query to retrieve the emp_id, emp_name, and manager_name from the given employee table. 
--It's important to note that managers are also employees in the table.

--Will only give matching values 
SELECT e1.emp_id,
       e1.emp_name,
	   e1.manager_id,
	   e2.emp_name AS manager_name
FROM employees2 AS e1
CROSS JOIN employees2 AS e2
WHERE e1.manager_id = e2.emp_id

--Will give all values from LEFT table
SELECT e1.emp_id,
       e1.emp_name,
	   e1.manager_id,
	   e2.emp_name AS manager_name
FROM employees2 AS e1
LEFT JOIN employees2 AS e2
ON e1.manager_id = e2.emp_id
	   










CREATE TABLE Salaries (
emp_name VARCHAR(50),
department VARCHAR(50),
salary INT,
PRIMARY KEY (emp_name, department)
);

-- DML for Salaries table
INSERT INTO Salaries (emp_name, 
					  department, salary) VALUES
('Kathy', 'Engineering', 50000),
('Roy', 'Marketing', 30000),
('Charles', 'Engineering', 45000),
('Jack', 'Engineering', 85000),
('Benjamin', 'Marketing', 34000),
('Anthony', 'Marketing', 42000),
('Edward', 'Engineering', 102000),
('Terry', 'Engineering', 44000),
('Evelyn', 'Marketing', 53000),
('Arthur', 'Engineering', 32000);


--Write an SQL query to calculate the difference between the highest salaries in the marketing and engineering department. Output the absolute difference in salaries.
WITH engg_highest_sal
AS
(
SELECT salary AS engg_sal,
       RANK() OVER(ORDER BY salary DESC) AS rank
FROM SALARIES
WHERE department = 'Engineering'
LIMIT 1
),marketing_hightest_sal
AS
(
SELECT salary AS marketing_sal,
       RANK() OVER(ORDER BY salary DESC) AS rank
FROM SALARIES
WHERE department = 'Marketing'
LIMIT 1
)
SELECT e.engg_sal::numeric-m.marketing_sal::numeric AS Absolute_sal_difference
FROM engg_highest_sal AS e
INNER JOIN marketing_hightest_sal AS m
ON e.rank = m.rank

-- ALTERNATE SOLUTION
SELECT 
      MAX(CASE WHEN department = 'Engineering' THEN salary END)-
      MAX(CASE WHEN department = 'Marketing' THEN salary END) AS absolute_diff
FROM salaries









CREATE TABLE customers2 (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Inserting sample data into the customers table
INSERT INTO customers2 (customer_id, first_name, last_name, email) VALUES
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'jane.smith@example.com'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com'),
(4, 'Bob', 'Brown', 'bob.brown@example.com'),
(5, 'Emily', 'Davis', 'john.doe@example.com'),
(6, 'Michael', 'Williams', 'michael.w@example.com'),
(7, 'David', 'Wilson', 'jane.smith@example.com'),
(8, 'Sarah', 'Taylor', 'sarah.t@example.com'),
(9, 'James', 'Anderson', 'james.a@example.com'),
(10, 'Laura', 'Martinez', 'laura.m@example.com');


SELECT * FROM customers2;

--Consider a table named customers with the following columns: customer_id, first_name, last_name, and email. 
--Write an SQL query to find all the duplicate email addresses in the customers table.


SELECT customer_id, first_name,last_name
FROM customers2
WHERE email IN (
                  SELECT email 
				  FROM customers2
				  GROUP BY 1
				  HAVING(COUNT(email)) >= 2
)




CREATE TABLE orders3 (
    user_id INT,
    item_ordered VARCHAR(512)
);

-- Insert sample data into the orders table
INSERT INTO orders3 VALUES 
('1', 'Pizza'),
('1', 'Burger'),
('2', 'Cold Drink'),
('2', 'Burger'),
('3', 'Burger'),
('3', 'Cold Drink'),
('4', 'Pizza'),
('4', 'Cold Drink'),
('5', 'Cold Drink'),
('6', 'Burger'),
('6', 'Cold Drink'),
('7', 'Pizza'),
('8', 'Burger');

SELECT * FROM orders3;

-- Flipkart Data Analyst Interview Questions
-- Question: Write an SQL query to fetch user IDs that have only bought both 'Burger' and 'Cold Drink' items.
-- Expected Output Columns: user_id

WITH users_ordered_Burger
AS 
(
SELECT user_id,item_ordered
FROM orders3
WHERE item_ordered = 'Burger' 
GROUP BY 1,2
ORDER BY 1
),users_ordered_cold_drink
AS 
(
SELECT user_id,item_ordered
FROM orders3
WHERE item_ordered = 'Cold Drink' 
GROUP BY 1,2
ORDER BY 1
)

SELECT o.user_id
FROM users_ordered_Burger AS o
INNER JOIN users_ordered_cold_drink AS c
ON o.user_id = c.user_id


--Najir solution
SELECT 
	user_id
	-- COUNT(DISTINCT item_ordered)
FROM orders
GROUP BY user_id
HAVING COUNT(DISTINCT item_ordered) = 2
AND
	SUM(CASE WHEN item_ordered IN ('Burger', 'Cold Drink') 
		THEN 1
		ELSE 0
	END
	) = 2






CREATE TABLE orders2 (
    date DATE,
    product_id INT,
    product_name VARCHAR(255),
    revenue DECIMAL(10, 2)
);

-- Insert sample data into the orders table representing orders of iPhones
INSERT INTO orders2 (date, product_id, product_name, revenue) VALUES
('2024-01-01', 101, 'iPhone 13 Pro', 1000.00),
('2024-01-01', 102, 'iPhone 13 Pro Max', 1200.00),
('2024-01-02', 101, 'iPhone 13 Pro', 950.00),
('2024-01-02', 103, 'iPhone 12 Pro', 1100.00),
('2024-01-03', 102, 'iPhone 13 Pro Max', 1250.00),
('2024-01-03', 104, 'iPhone 11', 1400.00),
('2024-01-04', 101, 'iPhone 13 Pro', 800.00),
('2024-01-04', 102, 'iPhone 13 Pro Max', 1350.00),
('2024-01-05', 103, 'iPhone 12 Pro', 1000.00),
('2024-01-05', 104, 'iPhone 11', 700.00),
('2024-01-06', 101, 'iPhone 13 Pro', 600.00),
('2024-01-06', 102, 'iPhone 13 Pro Max', 550.00),
('2024-01-07', 101, 'iPhone 13 Pro', 400.00),
('2024-01-07', 103, 'iPhone 12 Pro', 250.00),
('2024-01-08', 102, 'iPhone 13 Pro Max', 200.00),
('2024-01-08', 104, 'iPhone 11', 150.00),
('2024-01-09', 101, 'iPhone 13 Pro', 100.00),
('2024-01-09', 102, 'iPhone 13 Pro Max', 50.00),
('2024-01-10', 101, 'iPhone 13 Pro', 1000.00),
('2024-01-10', 102, 'iPhone 13 Pro Max', 1200.00),
('2024-01-11', 101, 'iPhone 13 Pro', 950.00),
('2024-01-11', 103, 'iPhone 12 Pro', 1100.00),
('2024-01-12', 102, 'iPhone 13 Pro Max', 1250.00),
('2024-01-12', 104, 'iPhone 11', 1400.00);


SELECT * FROM orders2

-- Flipkart Business Analyst Interview Question

--Question: Write a SQL query to calculate the running total revenue for each combination of date and product ID.
--Expected Output Columns: date, product_id, product_name, revenue, running_total,ORDER BY product_id, date ascending
-- date, prod_id, prod_name, revenue, running_total

WITH prev_day_lag_func
AS
(
SELECT product_id, 
       date, 
	   product_name,
       SUM(revenue) as revenue_for_that_day,
	   LAG(SUM(revenue),1) OVER(PARTITION BY product_id ORDER BY product_id) AS prev_day_revenue
FROM orders2
GROUP BY 1,2,3
ORDER BY 1,2,3
), calculate_running_total
AS
(
SELECT product_id, 
       date,
	   product_name,
       revenue_for_that_day,
	   prev_day_revenue,
	   SUM(revenue_for_that_day+prev_day_revenue) OVER(PARTITION BY date,product_name) AS prev_plus_current_day
FROM prev_day_lag_func
ORDER BY 1,2,3
)
SELECT product_id, 
       date,
	   product_name,
       revenue_for_that_day,
	   prev_day_revenue,
	   prev_plus_current_day,
	   SUM(prev_plus_current_day+revenue_for_that_day) OVER(PARTITION BY date,product_name) AS running_total
FROM calculate_running_total
ORDER BY 1,2,3



SELECT 
	o1.date,
	o1.product_id,
	o1.product_name,
	o1.revenue,
	SUM(o2.revenue) as running_total
FROM orders2 as o1
JOIN
orders2 as o2
ON
	o1.product_id = o2.product_id
	AND
	o1.date >= o2.date
GROUP BY 
	o1.date,
	o1.product_id,
	o1.product_name,
	o1.revenue
ORDER BY 
	o1.product_id, o1.date



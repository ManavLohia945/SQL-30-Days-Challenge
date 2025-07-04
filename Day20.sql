CREATE TABLE zomato_orders(
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    price FLOAT,
    city VARCHAR(25)
);


-- Insert sample records into the zomato_orders table
INSERT INTO zomato_orders (order_id, customer_id, order_date, price, city) VALUES
(1, 101, '2023-11-01', 150.50, 'Mumbai'),
(2, 102, '2023-11-05', 200.75, 'Delhi'),
(3, 103, '2023-11-10', 180.25, 'Mumbai'),
(4, 104, '2023-11-15', 120.90, 'Delhi'),
(5, 105, '2023-11-20', 250.00, 'Mumbai'),
(6, 108, '2023-11-25', 180.75, 'Gurgoan'),
(7, 107, '2023-12-30', 300.25, 'Delhi'),
(8, 108, '2023-12-02', 220.50, 'Gurgoan'),
(9, 109, '2023-11-08', 170.00, 'Mumbai'),
(10, 110, '2023-10-12', 190.75, 'Delhi'),
(11, 108, '2023-10-18', 210.25, 'Gurgoan'),
(12, 112, '2023-11-24', 280.50, 'Mumbai'),
(13, 113, '2023-10-29', 150.00, 'Mumbai'),
(14, 103, '2023-11-03', 200.75, 'Mumbai'),
(15, 115, '2023-10-07', 230.90, 'Delhi'),
(16, 116, '2023-11-11', 260.00, 'Mumbai'),
(17, 117, '2023-11-16', 180.75, 'Mumbai'),
(18, 102, '2023-11-22', 320.25, 'Delhi'),
(19, 103, '2023-11-27', 170.50, 'Mumbai'),
(20, 102, '2023-11-05', 220.75, 'Delhi'),
(21, 103, '2023-11-09', 300.25, 'Mumbai'), 
(22, 101, '2023-11-15', 180.50, 'Mumbai'), 
(23, 104, '2023-11-18', 250.75, 'Delhi'), 
(24, 102, '2023-11-20', 280.25, 'Delhi'),
(25, 117, '2023-11-16', 180.75, 'Mumbai'),
(26, 117, '2023-11-16', 180.75, 'Mumbai'),
(27, 117, '2023-11-16', 180.75, 'Mumbai'),
(28, 117, '2023-11-16', 180.75, 'Mumbai');

SELECT * FROM zomato_orders;

-- Find city wise customers count who have placed more than three orders in November 2023.

SELECT city,  
       customer_id, 
	   COUNT(order_id)
FROM zomato_orders
WHERE EXTRACT (MONTH FROM order_date) = '11'
GROUP BY 1,2
HAVING(COUNT(order_id)) > 3;








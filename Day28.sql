CREATE TABLE orders4 (
    order_id INT PRIMARY KEY,
    seller_id INT,
    sale_amount DECIMAL(10, 2)
);


CREATE TABLE returns4 (
    return_id INT PRIMARY KEY,
    seller_id INT,
    return_quantity INT
);


INSERT INTO orders4 (order_id, seller_id, sale_amount) VALUES
(1, 101, 1500.00),
(2, 102, 2200.00),
(3, 103, 1800.00),
(4, 104, 2500.00),
(5, 107, 1900.00),
(6, 106, 2100.00),
(7, 107, 2400.00),
(8, 107, 1700.00),
(9, 108, 2000.00),
(10, 107, 2300.00),
(11, 103, 2600.00),
(12, 102, 2900.00),
(13, 101, 3100.00),
(14, 101, 2800.00),
(15, 101, 3300.00),
(16, 106, 2700.00),
(17, 101, 3000.00),
(18, 108, 3200.00),
(19, 107, 3400.00),
(20, 106, 3500.00),
(21, 101, 3600.00),
(22, 102, 3700.00),
(23, 103, 3800.00),
(24, 102, 3900.00),
(25, 105, 4000.00);

INSERT INTO returns4 (return_id, seller_id, return_quantity) VALUES
(1, 101, 10),
(2, 102, 5),
(3, 103, 8),
(4, 104, 3),
(5, 105, 12),
(6, 106, 6),
(7, 107, 4),
(8, 108, 9);

-- Given two tables, orders and return, containing sales and returns data for Amazon's 
--write a SQL query to find the top 3 sellers with the highest sales amount but the lowest lowest return qty.

WITH sales
AS 
(
SELECT o.seller_id, SUM(o.sale_amount) as total_sales 
FROM orders4 AS o
GROUP BY 1
), returns1
AS 
(
SELECT r.seller_id, SUM(r.return_quantity) AS retun_qty
FROM returns4 AS r
GROUP BY 1
)
SELECT s.seller_id, 
       s.total_sales, 
	   r.retun_qty
FROM sales as s
LEFT JOIN returns1 as r
ON s.seller_id = r.seller_id 
ORDER BY 2 DESC, 3 ASC






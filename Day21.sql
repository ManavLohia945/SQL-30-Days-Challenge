CREATE TABLE hotel_revenue (
    hotel_id INT,
    month VARCHAR(10),
    year INT,
    revenue DECIMAL(10, 2)
);


-- Insert sample records
INSERT INTO hotel_revenue (hotel_id, month, year, revenue) VALUES
(101, 'January', 2022, 15000.50),
(101, 'February', 2022, 18000.75),
(101, 'March', 2022, 20000.00),
(101, 'April', 2022, 20000.00),
(101, 'May', 2022, 20000.00),
(101, 'June', 2022, 20000.00),
(101, 'July', 2022, 26000.00),
(101, 'August', 2022, 28000.00),
(102, 'January', 2022, 12000.25),
(102, 'February', 2022, 14000.50),
(102, 'March', 2022, 16000.75),
(101, 'January', 2023, 17000.25),
(101, 'February', 2023, 19000.50),
(101, 'March', 2023, 21000.75),
(102, 'January', 2023, 13000.50),
(102, 'February', 2023, 15000.75),
(102, 'March', 2023, 17000.25),
(103, 'January', 2022, 11000.25),
(103, 'February', 2022, 13000.50),
(103, 'March', 2022, 15000.75),
(104, 'January', 2022, 14000.50),
(108, 'May', 2022, 31000.75),
(108, 'April', 2022, 28000.75),
(108, 'June', 2022, 16000.75),
(108, 'August', 2022, 16000.75),	
(104, 'March', 2022, 18000.25),
(103, 'January', 2023, 12000.50),
(103, 'February', 2023, 14000.75),
(103, 'March', 2023, 16000.25),
(104, 'January', 2023, 15000.75),
(107, 'February', 2023, 17000.25),
(106, 'March', 2023, 19000.50);


SELECT * FROM hotel_revenue;

--Find the top-performing two months by revenue for each hotel for each year. return hotel_id, year, month, revenue
WITH top_two_months
AS 
(
SELECT hotel_id, 
       month, 
	   year, 
	   SUM(revenue) as total_rev_each_month_each_yr,
	   DENSE_RANK() OVER(PARTITION BY hotel_id, year ORDER BY SUM(revenue) DESC) AS RANK
FROM hotel_revenue
GROUP BY 1,2,3
ORDER BY 1,3,total_rev_each_month_each_yr DESC
) SELECT hotel_id, year,month, total_rev_each_month_each_yr
FROM top_two_months
WHERE RANK <= 2;








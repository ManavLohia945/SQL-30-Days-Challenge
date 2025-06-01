CREATE TABLE tiktok (
					views INT
);


-- Insert records
-- Insert records into the tiktok table
INSERT INTO tiktok (views) 
VALUES 
	(100), (800), (350), 
	(150), (600), 
	(700), (700), (950);

--Q.1 Find the median within a series of numbers in SQL


-- MY SOLUTION WHICH WILL WORK IF WE HAVE EVEN NUMBERS 

WITH all_req
AS
(
SELECT *,
       SUM(COUNT(views)) OVER() AS total_values,
	   ROW_NUMBER() OVER(ORDER BY views ASC) AS row_num
FROM tiktok
GROUP BY views
ORDER BY views ASC
)
SELECT views 
FROM all_req
WHERE row_num = total_values/2

--SOLUTION THAT WORKS FOR ODD AND EVEN IS

WITH solution
AS
(
SELECT *,
	   ROW_NUMBER() OVER(ORDER BY views ASC) AS row_asc,
	   ROW_NUMBER() OVER(ORDER BY views DESC) AS row_desc
FROM tiktok
)
SELECT AVG(views)
FROM solution
WHERE row_desc - row_asc <=1;







CREATE TABLE product_revenue (
    product_name VARCHAR(255),
    year INTEGER,
    revenue DECIMAL(10, 2)
);

-- Insert sample records
INSERT INTO product_revenue (product_name, year, revenue) VALUES
('Product A', 2022, 10000.00),
('Product A', 2023, 9500.00),
('Product B', 2022, 15000.00),
('Product B', 2023, 14500.00),
('Product C', 2022, 8000.00),
('Product C', 2023, 8500.00),
('Product D', 2022, 12000.00),
('Product D', 2023, 12500.00),
('Product E', 2022, 20000.00),
('Product E', 2023, 19000.00),
('Product F', 2022, 7000.00),
('Product F', 2023, 7200.00),
('Product G', 2022, 18000.00),
('Product G', 2023, 17000.00),
('Product H', 2022, 3000.00),
('Product H', 2023, 3200.00),
('Product I', 2022, 9000.00),
('Product I', 2023, 9200.00),
('Product J', 2022, 6000.00),
('Product J', 2023, 5900.00);


--Find the top 5 products whose revenue has decreased in comparison to the previous year (both 2022 and 2023). Return the product name, 
--revenue for the previous year, revenue for the current year, revenue decreased, and the decreased ratio (percentage).

--1ST: FIND REVENUE FOR YR 20222
WITH prev_yr_records
AS
(
SELECT product_name, year as prev_yr, revenue as prev_yr_rev
FROM product_revenue
WHERE year = '2022'
ORDER BY 1
), current_yr_records
AS
(
SELECT product_name, year as current_yr, revenue as current_yr_rev
FROM product_revenue
WHERE year = '2023'
ORDER BY 1
)
SELECT p1.product_name, p1.prev_yr_rev,p2.current_yr_rev,p2.current_yr_rev-p1.prev_yr_rev as rev_decreased, ROUND(100*((p2.current_yr_rev-p1.prev_yr_rev)/p1.prev_yr_rev),2) AS decreased_percent
FROM prev_yr_records AS p1
INNER JOIN current_yr_records AS p2
ON p1.product_name = p2.product_name
ORDER BY 4 ASC
LIMIT 5;

-- ALTERNATE SOLUTION
WITH revenue_comparison AS (
    SELECT 
        product_name,
        year,
        revenue,
        LAG(revenue) OVER (PARTITION BY product_name ORDER BY year) AS prev_year_revenue
    FROM product_revenue
)
SELECT 
    product_name,
    prev_year_revenue AS previous_year_revenue,
    revenue AS current_year_revenue,
    (prev_year_revenue - revenue) AS revenue_decreased,
    ((prev_year_revenue - revenue) / prev_year_revenue) * 100 AS decreased_ratio_percentage
FROM revenue_comparison
WHERE prev_year_revenue IS NOT NULL
ORDER BY revenue_decreased DESC
LIMIT 5;
















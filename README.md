# SQL Interview Question Solve Challenge

Welcome to the SQL Interview Question Solve Challenge repository! In this repository, you'll find solutions to common SQL interview questions tailored for Data Analysts and Business Analysts. This repository is part of our YouTube series where we tackle one SQL interview question per day for 30 days.

## About the Series

Each day, we'll solve a different SQL interview question commonly asked by top tech companies like Amazon, Google, Facebook, and more. Our goal is to help aspiring data analysts and business analysts prepare for their interviews by providing detailed explanations and solutions to these questions.

## Getting Started

To get started with this repository, simply browse through the sections below to find solutions to specific interview questions. Each solution is accompanied by detailed SQL code snippets to help you understand the problem-solving process.

---

## Business Problems Solved

---

### 1️⃣ Find the top 5 products whose revenue has decreased in comparison to the previous year (both 2022 and 2023).
**Return the product name, revenue for the previous year, revenue for the current year, revenue decreased, and the decreased ratio (percentage).**

```sql
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
```

### 2️⃣ LinkedIn Data Analyst Interview Question
**Retrieve the count of companies that have posted duplicate job listings (same title and description).**

```sql 
SELECT *
FROM job_listings1 jl
WHERE EXISTS (
    SELECT 1
    FROM job_listings1 sub
    WHERE sub.company_id = jl.company_id
      AND sub.title = jl.title
      AND sub.description = jl.description
      AND sub.job_id <> jl.job_id
);
```

### 3️⃣ TikTok Data Analyst Interview Question
**Find the median within a series of numbers in SQL.**

```sql
WITH solution AS (
    SELECT *,
           ROW_NUMBER() OVER(ORDER BY views ASC) AS row_asc,
           ROW_NUMBER() OVER(ORDER BY views DESC) AS row_desc
    FROM tiktok
)
SELECT AVG(views)
FROM solution
WHERE row_desc - row_asc <= 1;
```

### 4️⃣ TCS Data Analyst Interview Question
**Retrieve the emp_id, emp_name, and manager_name from the employees table (managers are also employees).**

```sql
SELECT e1.emp_id,
       e1.emp_name,
       e1.manager_id,
       e2.emp_name AS manager_name
FROM employees2 AS e1
LEFT JOIN employees2 AS e2
ON e1.manager_id = e2.emp_id;
```

### 5️⃣ Flipkart Business Analyst Interview Question
**Write a SQL query to calculate the running total revenue for each combination of date and product ID.**

```sql
SELECT 
    date,
    product_id,
    product_name,
    revenue,
    SUM(revenue) OVER (PARTITION BY product_id ORDER BY date) AS running_total
FROM orders2
ORDER BY product_id, date ASC;
```

### 6️⃣ Top 5 Most Frequently Ordered Dishes by Customer
**Write a query to find the top 5 most frequently ordered dishes by customer called "Arjun Mehta" in the last 1 year.**

```sql
SELECT 
    customer_name,
    dishes,
    total_orders
FROM (
    SELECT 
        c.customer_id,
        c.customer_name,
        o.order_item AS dishes,
        COUNT(*) AS total_orders,
        DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS rank
    FROM orders AS o
    JOIN customers AS c
    ON c.customer_id = o.customer_id
    WHERE 
        o.order_date >= CURRENT_DATE - INTERVAL '1 Year'
        AND c.customer_name = 'Arjun Mehta'
    GROUP BY 1, 2, 3
    ORDER BY 1, 4 DESC
) AS t1
WHERE rank <= 5;
```


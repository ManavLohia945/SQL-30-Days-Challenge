CREATE TABLE pages (
    page_id INTEGER PRIMARY KEY,
    page_name VARCHAR(255)
);

-- Insert data into pages table
INSERT INTO pages (page_id, page_name) VALUES
(20001, 'SQL Solutions'),
(20045, 'Brain Exercises'),
(20701, 'Tips for Data Analysts');

-- Create page_likes table
CREATE TABLE page_likes (
    user_id INTEGER,
    page_id INTEGER,
    liked_date DATE,
    FOREIGN KEY (page_id) REFERENCES pages(page_id)
);

-- Insert data into page_likes table
INSERT INTO page_likes (user_id, page_id, liked_date) VALUES
(111, 20001, '2022-04-08 00:00:00'),
(121, 20045, '2022-03-12 00:00:00'),
(156, 20001, '2022-07-25 00:00:00');


SELECT * 
FROM PAGES AS p1
INNER JOIN page_likes as p2
ON p1.page_id = p2.page_id;

--Question 1:
--Write a SQL query to retrieve the IDs of the Facebook pages that have zero likes. 
--The output should be sorted in ascending order based on the page IDs.

SELECT p1.page_id
FROM PAGES AS p1
WHERE p1.page_id NOT IN (
				SELECT p1.page_id
				FROM PAGES AS p1
				INNER JOIN page_likes as p2
				ON p1.page_id = p2.page_id
				GROUP BY 1
				HAVING(COUNT(p2.user_id))>=0
)

--Question 2 App Click-through Rate (CTR) [Facebook SQL Interview Question]

CREATE TABLE events (
    app_id INTEGER,
    event_type VARCHAR(10),
    timestamp DATE
);

-- Insert records into the events table
INSERT INTO events (app_id, event_type, timestamp) VALUES
(123, 'impression', '2022-07-18 11:36:12'),
(123, 'impression', '2022-07-18 11:37:12'),
(123, 'click', '2022-07-18 11:37:42'),
(234, 'impression', '2022-07-18 14:15:12'),
(234, 'click', '2022-07-18 14:16:12');

SELECT * FROM EVENTS;

--Question 2: 
--Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.
--Definition and note:
--Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
--To avoid integer division, multiply the CTR by 100.0, not 100.
--Expected Output Columns: app_id, ctr

WITH count_impression
AS 
(
SELECT app_id, COUNT(event_type) AS impression
FROM EVENTS 
WHERE event_type = 'impression' AND EXTRACT(YEAR FROM timestamp) = '2022'
GROUP BY 1
),count_clicks
AS
(
SELECT app_id, COUNT(event_type) AS click
FROM EVENTS 
WHERE event_type = 'click' AND EXTRACT(YEAR FROM timestamp) = '2022'
GROUP BY 1
)

SELECT c1.app_id,
       ROUND(100.0*(c2.click::numeric/c1.impression::numeric),2) AS ctr
FROM count_impression AS c1
JOIN count_clicks AS c2
ON c1.app_id = c2.app_id

























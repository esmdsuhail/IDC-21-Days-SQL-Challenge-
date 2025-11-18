
USE hospital;


# 1. Find all weeks in services_weekly where no special event occurred.

SELECT
	week,
	event
FROM services_weekly
WHERE event = 'none'
	OR event = ' '
    OR event IS NULL;

# 2. Count how many records have null or empty event values.

SELECT
	COUNT(event) AS event_cnt
FROM services_weekly
WHERE event IS NULL 
    OR event = ' ';

# 3. List all services that had at least one week with a special event.

SELECT 	
	DISTINCT service AS services,
    COUNT(week) AS week_cnt
FROM services_weekly
WHERE event IS NOT NULL
	AND event != ' '
    AND event != 'none'
GROUP BY service
ORDER by week_cnt;


# Question: Analyze the event impact by comparing weeks with events vs weeks without events. 
#           Show: event status ('With Event' or 'No Event'), count of weeks, average patient satisfaction, 
#           and average staff morale. Order by average patient satisfaction descending.

SELECT
    COUNT(week) AS week_cnt,
    ROUND(AVG(patient_satisfaction),2) AS avg_satisfaction_score,
    ROUND(AVG(staff_morale),2) AS avg_staff_morale,
    CASE
		WHEN event = 'none' THEN 'No Event'
        WHEN event = ' ' THEN 'No Event'
        WHEN event IS NULL THEN 'No Event'
		ELSE 'With Event'
	END AS event_status
FROM services_weekly
GROUP BY event_status
ORDER BY avg_satisfaction_score DESC;















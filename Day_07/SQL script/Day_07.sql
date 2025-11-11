
# 1. Find services that have admitted more than 500 patients in total.

SELECT
	service,
    SUM(patients_admitted) AS total_patients_admitted
FROM services_weekly
GROUP BY service
HAVING total_patients_admitted > 500
ORDER BY total_patients_admitted DESC;

# 2. Show services where average patient satisfaction is below 75.
SELECT
	service,
    AVG(patient_satisfaction) AS avg_patient_satifaction_score
FROM services_weekly
GROUP BY service
HAVING avg_patient_satifaction_score < 75
ORDER BY avg_patient_satifaction_score;

# 3. List weeks where total staff presence across all services was less than 50.
SELECT 
	DISTINCT week,
    SUM(present) as total_staff
FROM staff_schedule
GROUP BY week
HAVING total_staff < 50
ORDER BY week;

# Question: Identify services that refused more than 100 patients in total and had an average patient 
#			satisfaction below 80. Show service name, total refused, and average satisfaction.

SELECT
	service,
    SUM(patients_refused) AS total_refused,
    ROUND(AVG(patient_satisfaction),2) AS avg_satisfaction_score
FROM services_weekly
GROUP BY service
HAVING total_refused >100 
AND avg_satisfaction_score < 80
ORDER BY total_refused DESC;








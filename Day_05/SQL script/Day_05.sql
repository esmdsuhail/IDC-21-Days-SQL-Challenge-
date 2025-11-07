use hospital ;

#1. Count the total number of patients in the hospital.

SELECT COUNT(*) FROM patients;


# 2. Calculate the average satisfaction score of all patients.

SELECT
	AVG(satisfaction) AS avg_satifaction_score
FROM patients;

# 3. Find the minimum and maximum age of patients.

SELECT
	MIN(age) AS min_age,
    MAX(age) AS max_age
FROM patients;


# Question : Calculate the total number of patients admitted, total patients refused, and the average patient
#			 satisfaction across all services and weeks. Round the average satisfaction to 2 decimal places.

SELECT
	SUM(patients_admitted) AS total_patients_admitted,
    SUM(patients_refused) AS total_patients_refused,
    ROUND(AVG(patient_satisfaction), 2) AS avg_patients_satisfaction
FROM services_weekly;



SELECT
	service,
	SUM(patients_admitted) AS total_patients_admitted,
    SUM(patients_refused) AS total_patients_refused,
    ROUND(AVG(patient_satisfaction), 2) AS avg_patients_satisfaction
FROM services_weekly
GROUP BY service
ORDER BY avg_patients_satisfaction DESC;

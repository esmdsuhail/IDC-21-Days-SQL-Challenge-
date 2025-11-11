use hospital;
# 1. Count the number of patients by each service.

SELECT 
	service,
	COUNT(patient_id)
FROM patients
GROUP BY service;

# 2. Calculate the average age of patients grouped by service.

SELECT
	service,
    AVG(age)
FROM patients
GROUP BY service;

# 3. Find the total number of staff members per role.

SELECT
	role,
    COUNT(staff_id)
FROM staff
GROUP BY role;


#Question: For each hospital service, calculate the total number of patients admitted, 
#          total patients refused, and the admission rate (percentage of requests that were admitted). 
#          Order by admission rate descending.
SELECT 
	DISTINCT service,
    sum(patients_admitted) AS total_patients_admitted,
    sum(patients_refused) AS total_patients_refused,
    sum(patients_admitted)/sum(patients_request) * 100 AS admission_rate
FROM services_weekly
group by service
order by admission_rate DESC;







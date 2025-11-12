
# 1. Extract the year from all patient arrival dates.

SELECT
	patient_id,
    name,
    date_format(arrival_date,'%Y') AS arival_year
FROM patients;


# 2. Calculate the length of stay for each patient (departure_date - arrival_date).

SELECT
	patient_id,
    name,
    service,
    datediff(departure_date, arrival_date) AS lenght_of_stay
FROM patients
ORDER BY lenght_of_stay DESC;


# 3. Find all patients who arrived in a specific month.

SELECT
	patient_id,
    name,
	date_format(arrival_date, '%M') AS arrival_month
FROM patients;

# Question: Calculate the average length of stay (in days) for each service, 
#           showing only services where the average stay is more than 7 days. 
#			Also show the count of patients and order by average stay descending.

SELECT 
    service,
    COUNT(patient_id) AS total_patients,
    ROUND(AVG(DATEDIFF(departure_date, arrival_date)), 2)AS avg_lenght_of_stay
FROM patients
GROUP BY service
HAVING avg_lenght_of_stay > 7
ORDER BY avg_lenght_of_stay DESC;









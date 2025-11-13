use hospital;

# 1. Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.

SELECT 
	Patient_id,
    name,
    satisfaction,
	CASE
		WHEN satisfaction >= 70 THEN 'High'
        WHEN satisfaction >= 40 THEN 'Medium'
        ELSE 'Low' 
	END AS Satisfaction
FROM patients;

# 2. Label staff roles as 'Medical' or 'Support' based on role type.

SELECT 
	Staff_id,
    staff_name,
    role,
    CASE
		WHEN role = 'doctor' THEN 'Medical'
        ELSE 'Support'
	END AS role_type
FROM staff;
	
    
# 3. Create age groups for patients (0-18, 19-40, 41-65, 65+).

SELECT
	patient_id,
    name,
    age,
    CASE 
		WHEN age BETWEEN 0 AND 18 THEN 'Child'
        WHEN age BETWEEN 19 AND 40 THEN 'Young_Adults'
		WHEN age BETWEEN 41 AND 65 THEN 'Middle_Aged_Adult'
		ELSE 'Oldage' 
	END AS age_group
FROM patients;

# Question: Create a service performance report showing service name, total patients admitted, and 
#           a performance category based on the following: 'Excellent' if avg satisfaction >= 85, 'Good' 
#           if >= 75, 'Fair' if >= 65, otherwise 'Needs Improvement'. Order by average satisfaction descending.
SELECT 
	UPPER(service) AS service,
    SUM(patients_admitted) AS total_admitted,
    ROUND(AVG(patient_satisfaction),2) AS avg_satisfaction_score,
    CASE 
		WHEN AVG(patient_satisfaction) >= 85 THEN 'Excellent'
        WHEN AVG(patient_satisfaction) >= 75 THEN 'Good'
        WHEN AVG(patient_satisfaction) >= 65 THEN 'Fair'
        ELSE 'Need Improvement'
	END AS Service_Performance
FROM services_weekly
GROUP BY service
ORDER BY AVG(patient_satisfaction) DESC;









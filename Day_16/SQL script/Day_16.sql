use hospital;
# 1. Find patients who are in services with above-average staff count.
SELECT 
    p.patient_id,
    p.name,
    p.service
FROM patients p
JOIN staff s
ON p.service = s.service
WHERE (SELECT COUNT(*) 
	   FROM staff s2
       WHERE s2.service = p.service
       GROUP BY s2.service) > (SELECT AVG(staff_count)
							   FROM (SELECT COUNT(*) AS staff_count
								     FROM staff
								     GROUP BY service) AS sub)
GROUP BY p.patient_id, p.name, p.service;

# 2. List staff who work in services that had any week with patient satisfaction below 70.

SELECT staff_id, staff_name, service
FROM staff
WHERE service IN (SELECT service
                  FROM services_weekly
                  WHERE patient_satisfaction < 70);

# 3. Show patients from services where total admitted patients exceed 1000.

SELECT patient_id,name as patient_name,service
FROM patients
WHERE service IN (SELECT service 
				  FROM services_weekly 
				  GROUP BY service 
                  HAVING SUM(patients_admitted) > 1000);
 
# Question: Find all patients who were admitted to services that had at least one week where patients were 
#           refused AND the average patient satisfaction for that service was below the overall hospital average 
#           satisfaction. Show patient_id, name, service, and their personal satisfaction score.
# patient refused week > 0
# avg_patient_satisfaction < averall _hopital_satisfaction
SELECT 
    p.patient_id, p.name, p.service, p.satisfaction
FROM patients p
WHERE p.service IN (
		SELECT sw.service
        FROM services_weekly sw
        WHERE sw.patients_refused > 0
        GROUP BY sw.service
        HAVING AVG(sw.patient_satisfaction) < (SELECT AVG(patient_satisfaction) FROM services_weekly)
);
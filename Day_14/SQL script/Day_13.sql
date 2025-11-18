use hospital;

# 1. Join patients and staff based on their common service field (show patient and staff who work in same service).

SELECT 
    p.name AS patient_name,
    s.staff_name,
    p.service
FROM patients AS p
INNER JOIN staff AS s
ON p.service = s.service;

# 2. Join services_weekly with staff to show weekly service data with staff information.

SELECT 
    s.staff_name,
    s.role,
    sw.service,
    sw.week
FROM services_weekly AS sw
INNER JOIN staff AS s
ON sw.service = s.service
ORDER BY week, role, service;
	
# 3. Create a report showing patient information along with staff assigned to their service.
SELECT 
	p.patient_id,
    p.name AS patient_name,
    p.service,
    s.staff_name,
    s.role,
    p.satisfaction
FROM patients AS p
INNER JOIN staff AS s
ON p.service = s.service
ORDER BY satisfaction DESC, service, role;


# Question: Create a comprehensive report showing patient_id, patient name, age, service, and the total number 
#           of staff members available in their service. Only include patients from services that have
#           more than 5 staff members. Order by number of staff descending, then by patient name.
SELECT 
	p.patient_id,
    p.name AS patient_name,
    p.age,
    p.service,
    COUNT(s.staff_id) AS total_staff
FROM patients AS p
INNER JOIN staff AS s
ON p.service = s.service
GROUP BY p.patient_id
HAVING total_staff > 5
ORDER BY total_staff DESC, patient_name;

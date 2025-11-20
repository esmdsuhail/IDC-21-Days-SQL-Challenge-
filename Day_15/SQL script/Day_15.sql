use hospital;

# 1. Join patients, staff, and staff_schedule to show patient service and staff availability.
SELECT 
    p.patient_id, p.name,
    p.service, s.staff_id,
    s.staff_name, s.role,
    ss.week, ss.present
FROM
    patients p
        LEFT JOIN
    staff s ON p.service = s.service
        LEFT JOIN
    staff_schedule ss ON s.staff_name = ss.staff_name
ORDER BY ss.week , p.patient_id , s.staff_name;
    
# 2. Combine services_weekly with staff and staff_schedule for comprehensive service analysis.

SELECT 
    sw.week, s.service,
    s.staff_id, s.staff_name,
    s.role, ss.present
FROM
    services_weekly sw
        LEFT JOIN
    staff s ON sw.service = s.service
        LEFT JOIN
    staff_schedule ss ON sw.service = ss.service;
    
# 3. Create a multi-table report showing patient admissions with staff information.

SELECT 
    s.staff_id, s.staff_name,
    s.role, sw.service, sw.patients_admitted,
    ss.present AS staff_present
FROM
    staff s
        LEFT JOIN
    services_weekly sw ON s.service = s.service
        LEFT JOIN
    staff_schedule ss ON s.service = ss.service;
    
# Question: Create a comprehensive service analysis report for week 20 showing: service name, total patients
#           admitted that week, total patients refused, average patient satisfaction, count of staff assigned
#           to service, and count of staff present that week. Order by patients admitted descending.

SELECT
    sw.week,
    sw.service,
    SUM(sw.patients_admitted) AS total_patient_admitted,
    SUM(sw.patients_refused) AS total_patient_refused,
    ROUND(AVG(sw.patient_satisfaction)) AS avg_satisfaction_score,
    COUNT(DISTINCT s.staff_id) AS total_staff,
    SUM(CASE WHEN ss.present = 1 THEN 1 ELSE 0 END) AS staff_present
FROM services_weekly sw
LEFT JOIN staff s
    ON sw.service = s.service
LEFT JOIN staff_schedule ss
    ON ss.staff_id = s.staff_id
    AND ss.service = sw.service
    AND ss.week = sw.week
WHERE sw.week = 20
GROUP BY sw.week, sw.service
ORDER BY total_patient_admitted DESC;
    











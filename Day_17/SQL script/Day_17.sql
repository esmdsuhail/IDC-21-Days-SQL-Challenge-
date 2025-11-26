### Practice Questions:

# 1. Show each patient with their service's average satisfaction as an additional column.

SELECT 
    p.patient_id,
    p.name AS pateint_name,
    p.service,
    p.satisfaction,
    (SELECT 
            AVG(p1.satisfaction)
        FROM
            patients p1
        WHERE
            p.service = p1.service) AS avg_satisfaction
FROM
    patients p;

# 2. Create a derived table of service statistics and query from it.
	
SELECT 
    service,
    total_admitted, total_refused, total_requested, admission_rate, avg_satisfaction
FROM (
    SELECT
        service,
        SUM(patients_admitted) AS total_admitted,
        SUM(patients_refused) AS total_refused,
        SUM(patients_request) AS total_requested,
        ROUND(AVG(patient_satisfaction),2) AS avg_satisfaction,
        AVG(staff_morale) AS avg_staff_morale,
        ROUND(SUM(patients_admitted)/SUM(patients_request),2) AS admission_rate
	FROM services_weekly
    GROUP BY service
	) AS service_stats;

# 3. Display staff with their service's total patient count as a calculated field.

SELECT 
    staff_id,
    staff_name,
    service,
    (SELECT 
            COUNT(patient_id)
        FROM
            patients p
        WHERE
            s.service = p.service) AS total_patient
FROM
    staff s;

### Daily Challenge:

# Question: Create a report showing each service with: service name, total patients admitted, the difference 
#           between their total admissions and the average admissions across all services, and a rank indicator 
#           ('Above Average', 'Average', 'Below Average'). Order by total patients admitted descending.

SELECT
	sub.service AS service_name,
    sub.total_admitted,
    sub.total_admitted - sub.s2 AS diff_admission,
    CASE 
		WHEN sub.total_admitted > sub.s2 THEN 'Above Average'
        WHEN sub.total_admitted = sub.s2 THEN 'Average' 
        ELSE 'Below Average' END AS rank_indicator
FROM (SELECT 
		service,
		SUM(patients_admitted) AS total_admitted,
        (SELECT AVG(total) FROM (SELECT SUM(patients_admitted) AS total FROM services_weekly GROUP BY service) as s1) as s2
        FROM services_weekly 
        GROUP BY service) AS sub 
ORDER BY total_admitted DESC;












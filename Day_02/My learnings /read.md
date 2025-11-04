# 🗓️ Day 2 – Filtering Data with WHERE Clause

---

## 📘 Topics Covered
- WHERE clause filters records based on conditions
- using Operators:  Comparison, Logical, and Pattern
- Use IN instead of multiple ORs  
- Strings need single quotes, numbers don’t
- Use parentheses with mixed AND/OR to avoid confusion  
- **Best practices:** returning only required rows to meet the criteria by the WHERE clause

---

## 💻 Practice Queries

- sql queries

`select * from patients 
where age > '60' ;`

`select * from staff
where service = 'emergency';`

`select week, service, patients_request as Total_patients
from services_weekly 
where patients_request >'100';`

---

## 🎯 Challenge

- Question: Find all patients admitted to the 'Surgery' service with a satisfaction score below 70, showing their patient_id, name, age, and satisfaction score.

`select patient_id, name, age, satisfaction 
from patients
where service = 'surgery' and satisfaction < '70';` 

---

## 💡 Thought Process

- We need to find rows only to match the criteria using operators.
- How to select the correct table to achieve the desired output in SQL.
- Required weekly analysis of the selected rows to extract the required insights


# 🗓️ Day 1 – Introduction to SQL & SELECT Statement

---

## 📘 Topics Covered
- Introduction to SQL and relational databases  
- `SELECT` statement basics  
- Viewing table data using `SELECT *`  
- Selecting specific columns  
- Using `AS` for column aliases  
- **Best practices:** Avoid `SELECT *`, use comments, and limit rows  

---

## 💻 Practice Queries

-sql queries
`SELECT * FROM patients;`

`SELECT patient_id, name, age 
FROM patients;`

`SELECT * 
FROM service_weekly 
LIMIT 10;`

---

## 🎯 Challenge

-Question: List all unique hospital services available in the hospital.

---

## 💡 Thought Process

-We need to find all distinct services — meaning no duplicates should appear in the results.
-The column service (inside the table services_weekly) stores the hospital service names.
-To remove duplicates, we use the DISTINCT keyword with the SELECT statement.

`DISTINCT service 
FROM services_weekly;`

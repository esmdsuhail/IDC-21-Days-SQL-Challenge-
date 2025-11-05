# 🗓️ Day 3 – Sorting Data with ORDER BY.

---

## 📘 Topics Covered
- ORDER BY, ASC/DESC, multiple column sorting
- You can order by columns not in SELECT
- Use DESC for “Top N” queries  
- ORDER BY is usually the last clause (except LIMIT)
- Use indexes on frequently sorted columns for better performance  
- **Best practices:** multiple column sorting, Top N” queries

---

## 💻 Practice Queries

- SQL queries

`select * from patients order by age desc;`

`select * from services_weekly 
order by week asc, patients_request desc;`

`select * from staff
order by staff_name asc;`

---

## 🎯 Challenge

- Question: Retrieve the top 5 weeks with the highest patient refusals across all services, showing week, service, patients_refused, and patients_request. Sort by patients_refused in descending order.

`select week, service, patients_refused, patients_request
from services_weekly
order by patients_refused desc 
limit 5;`

---

## 💡 Thought Process

- We can sort rows according to criteria using ORDER BY.
- How to select the correct table to achieve the desired output in SQL.
- Required weekly analysis of the selected rows, sorting multiple columns at a time.

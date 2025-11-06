# 🗓️ Day 4 –  LIMIT, OFFSET, pagination concepts.

---

## 📘 Topics Covered
- Restricts the number of rows returned
- skipping a specified number of rows before returning results
- Pagination in combination with order by 
- FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT
- **Best practices:** Pagianation of selected rows

---

## 💻 Practice Queries

#### SQL queries Practice Questions:
- 1. Display the first 5 patients from the patients table.

 `select * from patients LIMIT 5;`

- 2. Show patients 11-20 using OFFSET.

`select * from patients limit 10 offset 10;`

- 3. Get the 10 most recent patient admissions based on arrival_date.

 `select * from patients order by arrival_date desc limit 10 ;`

---

## 🎯 Challenge

- Question: Find the 3rd to 7th highest patient satisfaction scores from the patients table, showing patient_id, name, service, and satisfaction. Display only these 5 records.

---

## Query
  `select
         patient_id,
         name as patient_name,
         service,
         satisfaction as satisfaction_score
   from patients
   order by satisfaction desc
   limit 5 offset 2;`

## 💡 Execution Approach

- We need the 3rd to 7th highest satisfaction scores. We start by sorting the data by the `satisfaction` column in descending order so the highest scores come first.
- After sorting, the first two rows represent the 1st and 2nd highest scores, so we skip them using `OFFSET 2`.
- We then select the next five rows, because from 3rd to 7th means we need 5 results, so we apply `LIMIT 5`.
- To keep the output clean and meaningful, we select only the relevant columns instead of returning everything.




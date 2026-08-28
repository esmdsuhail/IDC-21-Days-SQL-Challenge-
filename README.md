# IDC 21-Day SQL Challenge

A 21-day SQL program by [Indian Data Club](https://www.indiandataclub.com/) — daily hands-on practice from fundamentals through advanced querying, capped by a multi-phase sales analysis project and a full SQL "murder mystery" capstone that ties together joins, subqueries, and investigative reasoning into one dataset.

![SQL](https://img.shields.io/badge/SQL-MySQL-4479A1?logo=mysql&logoColor=white)
![Challenge](https://img.shields.io/badge/Indian%20Data%20Club-21--Day%20Challenge-orange)
![Status](https://img.shields.io/badge/Status-21%2F21%20Days%20Complete-brightgreen)

## Table of Contents
- [Overview](#overview)
- [Flagship Project: The Technova Capstone (SQL Detective Case)](#flagship-project-the-technova-capstone-sql-detective-case)
- [Mini Project: Pizza Sales Analysis](#mini-project-pizza-sales-analysis)
- [21-Day Challenge Roadmap](#21-day-challenge-roadmap)
- [Skills Demonstrated](#skills-demonstrated)
- [About](#about)

---

## Overview

This repository documents all 21 days of Indian Data Club's SQL Challenge, completed in full — daily practice queries, self-written learnings, and output screenshots for each topic, progressing from `SELECT` basics to window functions and CTEs. Beyond the daily practice, the program included two larger deliverables that go beyond syntax drills into real applied analysis: a **Mini Project** analyzing pizza restaurant sales data, and a **Capstone Project** that reframes a full investigative case as a SQL exercise across five linked tables.

## Flagship Project: The Technova Capstone (SQL Detective Case)

![Project Poster](Capstone%20Project/Project%20Poster.png)

**The setup:** an incident occurred at Technova's office at a specific date and time. The only evidence available is company data — keycard access logs, phone call records, employee-submitted alibis, and physical evidence tagged by room. The task: use SQL alone to reconstruct the timeline, cross-check every employee's story against the actual data, and identify who was lying.

**Schema:** 5 linked tables — `employees`, `keycard_logs`, `calls`, `alibis`, `evidence`.

**Investigation steps (query by query):**
1. Identify where and when the incident occurred, from keycard entry/exit logs
2. Find every employee who accessed the relevant room around that time
3. Cross-check each employee's claimed alibi against their actual keycard movements
4. Surface suspicious phone calls placed in the surrounding window
5. Match physical evidence location against employee movement and claims
6. Combine every signal — location, timing, alibi contradiction, evidence — into one query that narrows the suspect list to a single name

Each step builds on the last using multi-table `JOIN`s across the full schema, turning a detective story into a genuine test of relational reasoning rather than a simple lookup. The full solution is in [`Capstone Project/Sql_script/Analysis.sql`](Capstone%20Project/Sql_script/Analysis.sql) — try solving it from the schema before checking the final query.

**Files:** [Database schema & setup](Capstone%20Project/Sql_script/Technova%20Database%20tables.sql) · [Investigation queries](Capstone%20Project/Sql_script/Analysis.sql) · [Output screenshots](Capstone%20Project/Output%20Images/)

## Mini Project: Pizza Sales Analysis

A three-phase SQL analysis of a pizza restaurant's order data (`pizzas`, `pizza_types`, `orders`, `order_details`), submitted as part of the challenge:

- **Phase 1 — Foundation & Inspection:** database setup, category exploration (`DISTINCT`), handling missing ingredient data (`COALESCE`), null-price checks
- **Phase 2 — Filtering & Exploration:** date/time filtering, sorting by price, size-based filtering, price-range queries, pattern matching (`LIKE`)
- **Phase 3 — Sales Performance:** total quantity sold per pizza and per category (`SUM`, `GROUP BY`), average price by size, total order value (`JOIN` + `GROUP BY`), top-selling categories (`HAVING`), pizzas that were never ordered (`LEFT JOIN`), and price differences across sizes of the same pizza using both a **self-join** and a **window function** (`LEAD() OVER`)

That last task is worth calling out — solving the same problem two ways (self-join vs. window function) shows a working understanding of when each approach fits, not just that one of them produces the right answer.

**Files:** [Submitted solution](Mini%20Project/Submitted_Project/Mini_Project.sql) · [Source data](Mini%20Project/CSV%20files/) · [Table setup scripts](Mini%20Project/SQL%20files/) · [Output screenshots](Mini%20Project/Output%20Images/)

---

## 21-Day Challenge Roadmap

| Day | Topic | Folder |
|-----|-------|--------|
| 1 | Introduction to SQL & SELECT | [Day_01](Day_01/) |
| 2 | Filtering Data with WHERE Clause | [Day_02](Day_02/) |
| 3 | Sorting Data with ORDER BY | [Day_03](Day_03/) |
| 4 | LIMIT, OFFSET, pagination concepts | [Day_04](Day_04/) |
| 5 | Aggregate Functions (COUNT, SUM, AVG, MIN, MAX) | [Day_05](Day_05/) |
| 6 | GROUP BY | [Day_06](Day_06/) |
| 7 | HAVING clause | [Day_07](Day_07/) |
| 8 | String Functions | [Day_08](Day_08/) |
| 9 | Date Functions | [Day_09](Day_09/) |
| 10 | CASE Statements | [Day_10](Day_10/) |
| 11 | DISTINCT and Handling Duplicates | [Day_11](Day_11/) |
| 12 | Conditional Logic (NULL Values, IS NULL/IS NOT NULL) | [Day_12](Day_12/) |
| 13 | Combining Tables (INNER JOIN) | [Day_13](Day_13/) |
| 14 | Combining Tables (LEFT JOIN and RIGHT JOIN) | [Day_14](Day_14/) |
| 15 | Multiple Joins | [Day_15](Day_15/) |
| — | **Mini Project: Pizza Sales Analysis** | [Mini Project](Mini%20Project/) |
| 16 | Subqueries (WHERE clause) | [Day_16](Day_16/) |
| 17 | Subqueries (SELECT and FROM clause) | [Day_17](Day_17/) |
| 18 | UNION and UNION ALL | [Day_18](Day_18/) |
| 19 | Window Functions — ROW_NUMBER, RANK, DENSE_RANK | [Day_19](Day_19/) |
| 20 | Window Functions — Aggregate Window Functions | [Day_20](Day_20/) |
| 21 | Common Table Expressions (CTEs) | [Day_21](Day_21/) |
| — | **Capstone: Technova SQL Detective Case** | [Capstone Project](Capstone%20Project/) |

Each day folder includes the practice SQL script, output screenshots, and (for the earlier days) a written learnings log covering the topic, practice queries, the day's challenge question, and the reasoning used to solve it.

---

## Skills Demonstrated

Core SQL: `SELECT`, filtering, sorting, pagination, aggregate functions, `GROUP BY`/`HAVING`, string and date functions, `CASE` logic, deduplication.
Relational reasoning: `INNER`/`LEFT`/`RIGHT JOIN`, multi-table joins across 5+ tables, self-joins.
Advanced querying: correlated and non-correlated subqueries, `UNION`/`UNION ALL`, window functions (`ROW_NUMBER`, `RANK`, `DENSE_RANK`, aggregate window functions, `LEAD`), Common Table Expressions (CTEs).
Applied analysis: translating a business question (or an investigation) into a sequence of queries that builds toward one answer, not just isolated syntax practice.

## About

Completed as part of [Indian Data Club](https://www.indiandataclub.com/)'s 21-Day SQL Challenge — all 21 days finished, plus the Mini Project and Capstone Project deliverables.

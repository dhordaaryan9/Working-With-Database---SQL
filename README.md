# Working-with-Databases Assignment

This repository contains my coursework and practical assignments on Database Management for the Data Science Career Program at Tops Technologies. It includes a comprehensive set of SQL queries, stored procedures, and theoretical documentation exploring core database architecture paradigms.

## 📂 Repository Contents

* **`Module3_SQL_Tasks.sql`**: Contains 20 distinct data extraction queries, including the advanced stored procedures.
* **`Database_Setup.sql`**: Contains the SQL scripts for creating the database schema (`hr_db`) and inserting the sample data.
* **`Theoretical_Assignments.pdf`**: A document breaking down strategic database design choices, comparing SQL vs. NoSQL, and explaining Normalization vs. Denormalization.

## 🛠️ Part 1: SQL Queries & Stored Procedures

The SQL portion of this assignment demonstrates proficiency in Data Definition Language (DDL) and Data Manipulation Language (DML).

**Schemas Evaluated:**
* `customer` & `salesman`
* `orders`
* Standard HR schemas (`employees`, `departments`, `locations`)
* `item_mast`

**Key Concepts Applied:**
* **Filtering & Logic:** Applied `WHERE`, `AND`, `OR`, and standard conditional handling.
* **Aggregations & Math:** Utilized `SUM()`, `AVG()`, `MAX()`, percentage calculations, and `GROUP BY` to generate specific insights.
* **Data Retrieval:** Executed multi-table `JOIN` operations and nested Subqueries to map relational data.
* **Stored Procedures:** Created reusable, parameterized routines (`IN` parameters) to automate tasks such as counting employees by department, promoting employees, deleting records, and reassigning managers.

## 📊 Part 2: Database Architecture Theory

The theoretical component of this assignment is packaged into a document that breaks down strategic database design choices.

**Topics Covered:**
* **SQL vs. NoSQL:** * Relational vs. Non-Relational structures.
  * Rigid schemas vs. Dynamic schemas.
  * Vertical vs. Horizontal scaling strategies.
* **Normalization vs. Denormalization:**
  * Optimizing for write accuracy and data integrity (Normalization).
  * Optimizing for massive read throughput and speed (Denormalization).
  * Trade-offs regarding storage, query complexity, and redundancy.

---
*Developed by Dhorda Aryan*
